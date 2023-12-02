use crossterm::{
    event::{self, Event, KeyCode, KeyEventKind},
    execute,
    terminal::{disable_raw_mode, enable_raw_mode, EnterAlternateScreen, LeaveAlternateScreen},
};
use nc8::{
    change_offset,
    helper::{byte_to_printable, str_to_int},
    Instr, Machine, Reg, MAX_MEMORY_SIZE,
};
use ratatui::{
    layout::{Alignment, Constraint, Direction, Layout},
    prelude::{CrosstermBackend, Terminal},
    text::{Line, Span},
    widgets::{Block, Borders, Paragraph, Row, Table},
    Frame,
};
use std::{
    collections::HashSet,
    env::args,
    fs,
    io::{stdout, Result},
    panic,
};

struct App {
    machine: Machine,
    input: Option<String>,
    last_command: Option<String>,
    view_addr: u16,
    breakpoints: HashSet<u16>,
    original_binary: Vec<u8>,
    original_input: Vec<u8>,
}

fn get_arg_path() -> String {
    let mut args = args();
    args.next();
    args.next().expect("Please pass in the path of the binary.")
}

fn main() -> Result<()> {
    initialize_panic_handler();
    startup()?;

    let mut terminal = Terminal::new(CrosstermBackend::new(stdout()))?;
    terminal.clear()?;

    let binary_path = get_arg_path();

    let binary: Vec<u8> = fs::read(&binary_path).expect("Can not read binary.");

    // TODO: Ok this is ridiculous
    let mut input = fs::read("data/input").expect("Input file not found at data/input.");
    input.retain(|&byte| byte != b'\r');

    let mut app = App {
        machine: Machine::new(&binary, input.clone()),
        input: None,
        last_command: None,
        view_addr: 0,
        breakpoints: HashSet::new(),
        original_binary: binary,
        original_input: input,
    };

    // Main loop
    loop {
        terminal.draw(|frame| ui(frame, &app))?;

        if update(&mut app)? {
            break;
        }
    }

    shutdown()?;
    Ok(())
}

fn ui(frame: &mut Frame, app: &App) {
    let layout = Layout::default()
        .direction(Direction::Horizontal)
        .constraints([Constraint::Percentage(75), Constraint::Percentage(25)])
        .split(frame.size());

    let left_layout = Layout::default()
        .direction(Direction::Vertical)
        .constraints([
            Constraint::Min(3),
            Constraint::Min(3),
            Constraint::Percentage(70),
            Constraint::Min(6),
            Constraint::Min(1),
        ])
        .split(layout[0]);

    {
        let reg_text = |i: u8| {
            format!(
                "{}: 0x{:04X}",
                Into::<&str>::into(Reg::from(i)),
                app.machine.regs[i as usize]
            )
        };

        let table = Table::new(vec![
            Row::new((0..8).map(reg_text)),
            Row::new((8..16).map(reg_text)),
        ])
        .widths(&[Constraint::Ratio(1, 8); 8])
        .block(
            Block::new()
                .borders(Borders::ALL ^ Borders::BOTTOM)
                .title("Registers"),
        );

        frame.render_widget(table, left_layout[0]);
    }

    {
        let mut spans = Vec::new();
        for i in (app.machine.sp().0..u16::min(app.machine.sp().0 + 20, MAX_MEMORY_SIZE as u16))
            .step_by(2)
        {
            let val = app.machine.get_double(i);
            spans.push(Span::from(format!("{:4X}: 0x{:04X}  ", i, val)));
        }

        frame.render_widget(
            Paragraph::new(Line::from(spans)).block(
                Block::new()
                    .borders(Borders::ALL ^ Borders::BOTTOM)
                    .title("Stack"),
            ),
            left_layout[1],
        );
    }

    {
        let hex_dump = app.machine.memory
            [app.view_addr as usize..usize::min(app.view_addr as usize + 0x1000, MAX_MEMORY_SIZE)]
            .chunks(32)
            .enumerate()
            .map(|(i, chunk)| {
                let i = i + (app.view_addr as usize) / 32;
                format!(
                    "0x{:04X}: {}   {}",
                    i * 32,
                    chunk
                        .chunks_exact(2)
                        .map(|bytes| format!("{:02X}{:02X} ", bytes[0], bytes[1]))
                        .collect::<String>(),
                    chunk
                        .iter()
                        .map(|byte| format!("{}", byte_to_printable(*byte)))
                        .collect::<String>()
                )
            })
            .collect::<Vec<String>>()
            .join("\n");

        frame.render_widget(
            Paragraph::new(hex_dump).block(
                Block::new()
                    .borders(Borders::ALL ^ Borders::BOTTOM)
                    .title("Memory"),
            ),
            left_layout[2],
        );
    }

    {
        frame.render_widget(
            Paragraph::new(String::from_utf8_lossy(&app.machine.output))
                .block(Block::new().borders(Borders::ALL).title("Output")),
            left_layout[3],
        );
    }

    {
        if let Some(input) = &app.input {
            frame.render_widget(
                Paragraph::new(input.to_string())
                    .block(Block::new().borders(Borders::LEFT | Borders::RIGHT)),
                left_layout[4],
            );
        }
    }

    let right_layout = Layout::default()
        .direction(Direction::Vertical)
        .constraints([Constraint::Min(1), Constraint::Max(1)])
        .split(layout[1]);

    {
        let mut lines = Vec::new();
        for i in (app.machine.pc().0 as i16 - 10)..=(app.machine.pc().0 as i16 + 10) {
            let out_str = if i < 0 || i as usize >= MAX_MEMORY_SIZE {
                String::new()
            } else {
                let instr = Instr::from(app.machine.memory[i as usize]);
                let mut asm_instr = instr.to_string();

                match instr {
                    Instr::Jz(rel) | Instr::Jnz(rel) | Instr::Jmp(rel) | Instr::PushP(rel) => {
                        asm_instr
                            .push_str(&format!("   (0x{:04X})", i + 1 + change_offset(rel) as i16));
                    }
                    _ => {}
                }

                format!(
                    "{} {} 0x{i:04X}: {}",
                    if app.breakpoints.contains(&(i as u16)) {
                        "*"
                    } else {
                        " "
                    },
                    if i as u16 == app.machine.pc().0 {
                        "->"
                    } else {
                        "  "
                    },
                    asm_instr,
                )
            };

            lines.push(Line::from(out_str));
        }

        frame.render_widget(
            Paragraph::new(lines).block(Block::new().borders(Borders::ALL).title("Assembly")),
            right_layout[0],
        );
    }

    {
        frame.render_widget(
            Paragraph::new(" Press '/' for console.").alignment(Alignment::Left),
            right_layout[1],
        );
        frame.render_widget(
            Paragraph::new(format!("Steps: {} ", app.machine.steps)).alignment(Alignment::Right),
            right_layout[1],
        );
    }
}

fn process_input(app: &mut App, input: &str) -> Option<()> {
    // TODO: Make this better

    let mut iter = input.split(' ');

    match iter.next()? {
        "step" => {
            let step_count = match iter.next() {
                Some(val) => val.parse::<usize>().ok()?,
                None => 1,
            };

            for _ in 0..step_count {
                if app.machine.exited {
                    break;
                }
                app.machine.step();
            }
        }
        "set" => {
            let reg: Reg = iter.next()?.try_into().ok()?;

            let val = str_to_int(iter.next()?).ok()?;

            app.machine.regs[reg as usize].0 = val;
        }
        "c" => {
            while !app.machine.exited {
                app.machine.step();

                if app.breakpoints.contains(&app.machine.pc().0) {
                    break;
                }
            }
        }
        "break" => {
            let action = iter.next()?;
            let val: u16 = str_to_int(iter.next()?).ok()?;
            match action {
                "add" => {
                    app.breakpoints.insert(val);
                }
                "remove" => {
                    app.breakpoints.remove(&val);
                }
                _ => {}
            }
        }
        "view" => {
            app.view_addr = str_to_int(iter.next()?).ok()?;
        }
        "reset" => {
            app.machine = Machine::new(&app.original_binary, app.original_input.clone());
            app.breakpoints.clear();
        }
        "memdump" => {
            // TODO: Change path
            fs::write("data/memdump", *app.machine.memory)
                .expect("Memory dump can not write to file.");
        }
        _ => return None,
    }

    Some(())
}

fn update(app: &mut App) -> Result<bool> {
    if !event::poll(std::time::Duration::from_millis(33))? {
        return Ok(false);
    }

    let Event::Key(key) = event::read()? else {
        return Ok(false);
    };

    if key.kind != KeyEventKind::Press {
        return Ok(false);
    }

    if let Some(input) = &mut app.input {
        match key.code {
            KeyCode::Char(c) => {
                input.push(c);
            }
            KeyCode::Backspace => {
                input.pop();
            }
            KeyCode::Esc => {
                app.input = None;
            }
            KeyCode::Enter => {
                if !input.is_empty() {
                    app.last_command = Some(input.clone());
                    input.clear();
                }

                if let Some(last_command) = &app.last_command {
                    process_input(app, &last_command.clone());
                }
            }
            _ => {}
        };
        return Ok(false);
    }

    match key.code {
        KeyCode::Char('q') => return Ok(true),
        KeyCode::Char('/') => {
            app.input = Some(String::new());
        }
        _ => {}
    }

    Ok(false)
}

fn startup() -> Result<()> {
    execute!(stdout(), EnterAlternateScreen)?;
    enable_raw_mode()
}

fn shutdown() -> Result<()> {
    execute!(stdout(), LeaveAlternateScreen)?;
    disable_raw_mode()
}

fn initialize_panic_handler() {
    let original_hook = panic::take_hook();

    panic::set_hook(Box::new(move |panic_info| {
        shutdown().unwrap();

        original_hook(panic_info);
    }));
}
