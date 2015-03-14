# Huge credits go to https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
#shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Prefer US English and use UTF-8
export lc_all="en_us.utf-8"
export lang="en_us"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Colorful diffing in Mercurial.
export LESS="FRSXQ"

# Colorful man pages.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Default editor.
export EDITOR="vim"
export VISUAL=$EDITOR

# My specific machine stuff.
if [ `hostname -s` == "Eldar" ]; then
    # Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

    PATH="/usr/local/Cellar/ruby/HEAD/bin:$PATH"  # Ruby
    PATH="/usr/local/bin:/usr/local/sbin:$PATH"   # Give priority to Homebrew's bin & sbin dirs on top of the system's dirs.
    PATH="/usr/local/share/python:$PATH"          # Add Homebrew's Python to $PATH, before the system's Python.
    PATH="$HOME/.cabal/bin:$PATH"  # Haskell
    PATH="/usr/local/share/npm/bin:$PATH"  # Node/npm
    export PATH
fi

##
# Your previous /Users/eldardamari/.bash_profile file was backed up as /Users/eldardamari/.bash_profile.macports-saved_2014-03-08_at_21:31:45
##

# MacPorts Installer addition on 2014-03-08_at_21:31:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH
export PATH=/usr/local/Cellar/ruby/HEAD/bin:$PATH  # Ruby
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/usr/local/sbin
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/eldardamari/.bash_profile file was backed up as /Users/eldardamari/.bash_profile.macports-saved_2014-05-24_at_12:41:32
##

# MacPorts Installer addition on 2014-05-24_at_12:41:32: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

#when installed - To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export JAVA_OPTS="-Xms2048m -Xmx4096m"

# postgres lang support
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

export JAVA_HOME=$(/usr/libexec/java_home)
export JDK_HOME=$(/usr/libexec/java_home)

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
