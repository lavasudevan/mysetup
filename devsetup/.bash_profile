# .bash_profile

. ~/.bash_alias
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# User specific environment and startup programs
GITHOME=/x/githome

ORACLE_HOME=/x/home/oracle/product/11.2.0.2
MYSQL_HOME=/usr/local/mysql/

GOROOT=/usr/local/go
#export GOHOME=/x/githome/tools/go
#export GOPATH=$GOHOME
#vln uncomment here after code is checked in export GOPATH=/Users/lavasudevan/go
export GOPATH=~/go

LD_LIBRARY_PATH=$ORACLE_HOME/lib64:$LD_LIBRARY_PATH:$MYSQL_HOME/lib

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


PATH=$PATH:$ORACLE_HOME/bin:$HOME/bin:$MYSQL_HOME/bin:$GOROOT/bin:$GOPATH/bin
export TNS_ADMIN=/etc
export LD_LIBRARY_PATH
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/x/tools/google-cloud-sdk/path.bash.inc' ]; then source '/x/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/x/tools/google-cloud-sdk/completion.bash.inc' ]; then source '/x/tools/google-cloud-sdk/completion.bash.inc'; fi
eval "$(jenv init -)"
