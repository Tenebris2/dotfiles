
# === PATH ===
set -x PATH $PATH /opt/gradle/gradle-8.9/bin
set -x PATH $PATH /home/tenebris/.fzf/bin
set -x PATH $PATH /usr/local/lib/node_modules/node/bin
set -x PATH $PATH /usr/local/lib/node_modules/.bin
set -x PATH $PATH /home/tenebris/.spicetify
set -x PATH $PATH /home/tenebris/Disk/goland/GoLand/bin
set -x PATH $PATH (go env GOPATH)/bin
set -x PATH $PATH $HOME/Disk/Android/Sdk/emulator
set -x PATH $PATH $HOME/Disk/Android/Sdk/platform-tools

# === Environment Variables ===
set -x NEOVIM_BIN "/usr/local/bin/nvim"
set -x AURORA_GIT_DIR "/home/tenebris/Documents/RootCauseAnalysisPruning/aurora"
set -x EVAL_DIR "/home/tenebris/Documents/RootCauseAnalysisPruning/evaluation/"
set -x AFL_DIR "/home/tenebris/Disk/AFLplusplus/"
set -x AFL_WORKDIR "/home/tenebris/Documents/RootCauseAnalysisPruning/evaluation/afl-workdir/"
set -x METHOD_DIR "/home/tenebris/Documents/RootCauseAnalysisPruning/AuroraTracer"
set -x PIN_ROOT "/home/tenebris/Documents/RootCauseAnalysisPruning/evaluation/pin-3.15-98253-gb56e429b1-gcc-linux/"
set -x KITTY_CONFIG_DIRECTORY $HOME/.config/kitty
set -x LS_COLORS "di=34"
set -x ANDROID_HOME $HOME/Disk/Android/Sdk
set -x AWS_CONFIG_FILE $HOME/.aws/credentials
set -x AWS_PROFiLE daibangtini

# === Aliases ===
alias neovide="neovide"
alias ls="eza"
alias cat="bat"
alias vi="nvim"
alias tree="ls --tree"
alias npvi="vi --noplugin"
alias obsidian="/bin/Obsidian-1.8.10.AppImage --no-sandbox"
alias android="$HOME/Disk/android-studio/bin/studio.sh"
alias webstorm="$HOME/Disk/WebStorm-243.26053.12/bin/webstorm.sh"

zoxide init fish | source

functions --erase cd 2>/dev/null

function cd
    if count $argv > /dev/null
        z $argv
    else
        builtin cd
    end
end
# === Functions ===
function ghidra
    nohup "$HOME/Tools/ghidra_11.1.2_PUBLIC/ghidraRun" > /dev/null 2>&1 &
end

function analyzeHeadless
    nohup "$HOME/Tools/ghidra_11.1.2_PUBLIC/support/analyzeHeadless" > /dev/null 2>&1 &
end

function tor
    nohup "$HOME/.local/share/tor-browser/start-tor-browser.desktop" > /dev/null 2>&1 &
end


# === FZF (Fish version) ===
# (No need to source .fzf.zsh — use a plugin instead if needed)
# You can install fzf plugin for Fish:
# fisher install PatrickF1/fzf.fish

# === Interactive session hook ===
if status is-interactive
    # Commands for interactive sessions can go here
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

