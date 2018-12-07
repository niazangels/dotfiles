
# Set Editor
if which vim &>/dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nano"
fi

# Override default programs
alias cat='bat'
alias ping='~/bin/prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in Sublime
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(subl {})+abort'"


# Make some possibly destructive commands more interactive.

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

 
# Add some easy shortcuts for formatted directory listings and add a touch of color.

alias ll='ls -lFh --group-directories-first --color=auto'
alias la='ls -alF --group-directories-first --color=auto'
alias ls='ls -Fh --group-directories-first --color=auto'
alias ..="cd .."


# Faster apt-get

alias agi='sudo apt-get install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
 

# Colorspells

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# More human friendly aliases 

alias ..='cd ..'
alias ...='cd ../../'
alias cl="cd && ls"
alias df='df -h'
alias diff='colordiff'              # requires colordiff package
alias du='du -c -h'
alias free='free -m'                # show sizes in MB
alias grep='grep --color=tty -d skip'
alias more='less'

alias halt='sudo halt'
alias reboot='sudo reboot'

# Make grep more user friendly by highlighting matches
# and exclude grepping through .git folders.

alias grep='grep --color=auto --exclude-dir=\.git'


# Free Memory

alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'


# Better directory transversal with .. and autocorrect dir spelling

shopt -s autocd cdspell


# Set PS1

if [ `id -u` -eq 0 ]
	then seperator="#"
	else seperator="$"
fi


# Git branch and smiley ^_^ on success, O_O on fail

PS1="\`if [ \$? = 0 ]; then echo \[\e[93m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\e[31m\]\u\e[1;37m@\h\[$(tput sgr0)\] \e[0;34m\w\[\e[0m\] \`__git_ps1 ["%s"]\`\n\$seperator ";


# Auto install suggestions
# "The program x is not installed.  You can install it by typing sudo apt-get install x"
# Suggests "Do you want to install it now? (y/N)"

export COMMAND_NOT_FOUND_INSTALL_PROMPT=1


# Mkdir auto cd into directory

function mk
{
  command mkdir $1 && cd $1
}


# mkmv - creates a new directory and moves the file into it, in 1 step
# Usage: mkmv <file> <directory>

mkmv() {
  mkdir "$2"
  mv "$1" "$2"
}


# Extract Archives

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Compress files

compress() {
      if [[ -n "$1" ]]; then
        FILE=$1
        case $FILE in
        *.tar ) shift && tar cf $FILE $* ;;
    *.tar.bz2 ) shift && tar cjf $FILE $* ;;
     *.tar.gz ) shift && tar czf $FILE $* ;;
        *.tgz ) shift && tar czf $FILE $* ;;
        *.zip ) shift && zip $FILE $* ;;
        *.rar ) shift && rar $FILE $* ;;
        esac
      else
        echo "usage: compress <foo.tar.gz> ./foo ./bar"
      fi
    }


# Back Up a file. Usage "bu filename.txt"

backup() {
  cp $1 ${1}-`date +%Y%m%d%H%M`.backup;
}

alias jl='python -m jupyter lab'
alias jn='python -m jupyter notebook'

alias p="python"
alias g="git"
alias v="vim"
alias t="tmux"

alias ps="pipenv shell"
alias pi="pipenv install"
alias pis="pipenv install --skip-lock"

# Gitignore Python
alias gipy="wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -O .gitignore"

gitignore() {
  joe g $1 | tail -n+3 > .gitignore;
}


gitpleasemerge(){
  # TODO
  # https://stackoverflow.com/questions/173919/is-there-a-theirs-version-of-git-merge-s-ours
  # in case branchA is not our current branch
  git checkout branchA

  # make merge commit but without conflicts!!
  # the contents of 'ours' will be discarded later
  git merge -s ours branchB    

  # make temporary branch to merged commit
  git branch branchTEMP         

  # get contents of working tree and index to the one of branchB
  git reset --hard branchB

  # reset to our merged commit but 
  # keep contents of working tree and index
  git reset --soft branchTEMP

  # change the contents of the merged commit
  # with the contents of branchB
  git commit --amend

  # get rid off our temporary branch
  git branch -D branchTEMP

  # verify that the merge commit contains only contents of branchB
  git diff HEAD branchB
}


# bash completion for gitaliases

# For `git foo` completion bash calls `_git_foo` function;
# for `git foo bar` it calls `__git_foo_bar`.
# for `git foo-bar` it calls `_git_foo_bar`.

# fixup - do refs name completion
_git_fixup() { __gitcomp_nl "$(__git_refs)" ; }

# push-to-all-remotes - do branch name completion
_git_push_to_all_remotes() { __gitcomp_nl "$(__git_heads)" ; }
