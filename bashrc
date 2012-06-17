# Here is my bashrc.  Lots of stuff here, can't guarantee it is the cleanest

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad

# Java and friends
export JAVA_HOME=/Library/Java/Home
export M2_HOME="${HOME}/opt/maven"
export MAVEN_OPTS="-Xmx512m -Xms256m -XX:PermSize=128m -XX:MaxPermSize=256m"
export MAVEN_OPTS_DEBUG="${MAVEN_OPTS} -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8781,server=y,suspend=n"
export JAVA_OPTS="${MAVEN_OPTS} -Duser.timezone=UTC -Djava.awt.headless=true -d32"
export M2="$M2_HOME/bin"
export ANT_HOME="${HOME}/opt/ant"
export GROOVY_HOME=/Library/Groovy/Home
export GRAILS_HOME=/Library/Grails/Home
export GANT_HOME=/Library/Gant/Home
export GRADLE_HOME=/Library/Gradle/Home
export LEIN_HOME=~/opt/lein

# Servers
export JETTY_HOME=${HOME}/opt/jetty
export JBOSS_HOME=${HOME}/opt/jboss
export APPENGINE_HOME=/Library/GoogleAppEngine/Home
export MONGO_HOME=${HOME}/opt/mongo

# Node
# export NODE_PATH=$HOME/local/node
# export NODE_BIN=/usr/local/share/npm/bin
# . ~/.nvm/nvm.sh

# docbook
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# mactex
export MACTEXT_HOME="/usr/local/texlive/2011/bin/x86_64-darwin"
export PATH="${PATH}:${MACTEXT_HOME}"

# ruby
[[ -r /Users/mwall/.rvm/scripts/completion ]] && . /Users/mwall/.rvm/scripts/completion
if [[ -s /Users/mwall/.rvm/scripts/rvm ]] ; then source /Users/mwall/.rvm/scripts/rvm ; fi
#echo 'eval "$(rbenv init -)"'

# editors
export EDITOR=ec
export ALTERNATE_EDITOR=em
alias emacs="~/bin/ec"

# git
source ~/.bash_completion.d/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_EDITOR=ew #like ec but waits
export PS1='\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\n\$'

# from http://jonisalonen.com/2012/your-bash-prompt-needs-this/
export PS1="\[\033[G\]$PS1"

# other completion scripts
source ~/.bash_completion.d/mvn-completion.bash
source ~/.bash_completion.d/svn-completion.bash

export PATH="${HOME}/bin:/usr/local/bin:$LEIN_HOME/bin:$ANT_HOME/bin:$GRAILS_HOME/bin:$M2:$NODE_PATH/bin:$MONGO_HOME/bin:$PATH:/usr/local/sbin"

alias gvim=mvim
alias gview="mvim -R"
alias sshaddme='ssh-add ~/.ssh/id_*sa.1'
alias ..="cd .."
alias work="screen -c ~/.work-screen"
alias tar="COPYFILE_DISABLE=true tar" # we don't need ._ files everywhere on a mac, see http://www.commandlinefu.com/commands/view/5965/create-.tar-file-on-mac-os-x-leopard-snow-leopard-without-._-files

#history stuff
shopt -s histappend
PROMPT_COMMAND='history -a'
shopt -s cdspell
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"
shopt -s cmdhist


# gpg agent
export GPG_TTY='tty'
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  # export SSH_AUTH_SOCK
else
  echo "Starting gpg-agent"
fi

# accumulo stuff
#ulimit -n 2048
#source /opt/cloud/bin/cloud-env

# start up screen if it is not running
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" ]
then
  STARTED_SCREEN=1 ; export STARTED_SCREEN
  sleep 1
  screen -RR && exit 0
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi

# Below is for reference only on the color codes
# original colors with ls -G or CLICOLORS = ExFxCxDxBxegedabagacad
#
#Hx directory
#Fx symbolic link
#Cx socket
#Dx pipe
#Bx executable
#eg block special
#ed character special
#ab executable with setuid bit set
#ag executable with setgid bit set
#ac directory writable to others, with sticky bit
#ad directory writable to others, without sticky bit
#
#a  black
#b  red
#c  green
#d  brown
#e  blue
#f  magenta
#c  cyan
#h  light grey
#A  block black, usually shows up as dark grey
#B  bold red
#C  bold green
#D  bold brown, usually shows up as yellow
#E  bold blue
#F  bold magenta
#G  bold cyan
#H  bold light grey; looks like bright white
#x  default foreground or background
