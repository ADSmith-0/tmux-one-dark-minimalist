# Tmux one dark minimalist
A minimalist theme for tmux using the one dark colour scheme

<img width="1903" height="109" alt="Screenshot showing the theme" src="https://github.com/user-attachments/assets/8bfe20a4-36f5-45da-ad8c-da9370ed73d9" />

## Installation
- [`tpm`](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#tmux-plugin-manager) needs to be installed
- Add this line to your `.tmux.conf`
```shell
set -g @plugin 'ADSmith-0/tmux-one-dark-minimalist'
```

## Features
### Truncation
With very long project or git branch names, they will be truncated past 30 characters so that the styling remains consistent

<img width="1916" height="40" alt="Screenshot showing truncation" src="https://github.com/user-attachments/assets/8644b49b-4a29-43be-96a0-450816dc8fb2" />

### Variables
You can change the colours with variables in your tmux config, you could theoretically make this apply to any theme that you want

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

<img width="1903" height="109" alt="Screenshot showing a different colour" src="https://github.com/user-attachments/assets/1afc0962-19df-44a3-9e33-6bcf9b42653a" />
