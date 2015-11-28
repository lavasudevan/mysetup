# .bash_profile

. ~/.bash_alias
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# User specific environment and startup programs
GITHOME=/x/local/lavasudevan/githome

ORACLE_HOME=/x/home/oracle/product/11.2.0.2

LD_LIBRARY_PATH=$ORACLE_HOME/lib64:$LD_LIBRARY_PATH


PATH=$PATH:$ORACLE_HOME/bin:$HOME/bin
export TNS_ADMIN=/etc
export LD_LIBRARY_PATH
export PATH
