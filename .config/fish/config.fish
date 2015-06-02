#set -x TERM xterm-256color
# Base16 Shell
eval sh $HOME/.config/base16-shell/base16-solarized.dark.sh
#set -x MC_SKIN $HOME/.mc/lib/mc-solarized/solarized.ini
status --is-login; and status --is-interactive; and exec byobu-launcher
