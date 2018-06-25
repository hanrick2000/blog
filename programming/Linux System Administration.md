#### .bash_profile vs .bashrc
.bash_profile is only executed when login to shell, .bash_rc is executed every time when open a new terminal.\
Usually .bash_profile calls .bashrc.

#### Preserve bash history in multiple terminal windows
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries\
export HISTSIZE=100000                   # big big history\
export HISTFILESIZE=100000               # big big history\
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"\
yum repolist (installed|all|enabled|disabled)\
yum-config-manager --enable(disable) \\\*

sudo yum localinstall --nogpgcheck  http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum-config-manager --disable geo\*


rpm -i/-U(update)


