# Tmux one dark minimalist
A minimalist theme for tmux with the one dark colour scheme

<img width="1903" height="109" alt="Screenshot from 2026-01-30 01-11-23" src="https://github.com/user-attachments/assets/8bfe20a4-36f5-45da-ad8c-da9370ed73d9" />

## Installation
- [`tpm`](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#tmux-plugin-manager) needs to be installed
- Add this line to your `.tmux.conf`
```shell
set -g @plugin 'ADSmith-0/tmux-one-dark-minimalist'
```

## Features
### Truncation
With very long project or git branch names, they will be truncated past 30 characters so that the styling remains consistent

### Variables
You can change the colours you want with variables in your tmux config, you could theoretically make this apply to any theme that you want

In your `.tmux.conf`:
```shell
set -g @<variable> <value>
```

Variables
```shell
@tmux-one-dark-black # default #282c34
@tmux-one-dark-red # default #ef596f
@tmux-one-dark-green # default #89ca78
@tmux-one-dark-yellow # default #e5c07b
@tmux-one-dark-blue # default #61afef
@tmux-one-dark-magenta # default #d55fde
@tmux-one-dark-cyan # default #2bbac5
@tmux-one-dark-white # default #ffffff

@tmux-one-dark-selected-bg # default yellow
@tmux-one-dark-selected-fg # default black
@tmux-one-dark-flags # default red
@tmux-one-dark-unselected-fg # default white
@tmux-one-dark-git # default green
@tmux-one-dark-session # default cyan
```

In your `.tmux.conf`:
```shell
set -g @tmux-one-dark-selected-bg "red"
```

<img width="1903" height="109" alt="Screenshot from 2026-01-30 01-12-15" src="https://github.com/user-attachments/assets/1afc0962-19df-44a3-9e33-6bcf9b42653a" />
