# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH

P=(
    $HOME/bin
	# $HOME/git/gcc-arm-none-eabi-5_4-2016q2/bin
	# $HOME/perl5/bin
	$HOME/catkin_ws/bin
	/opt/ros/melodic/bin
	/usr/local/bin
	/usr/bin
	/bin
	# /usr/local/games
	# /usr/games
	# $HOME/rakudo/rakudo-star-2017.07/install/bin/
	# $HOME/rakudo/rakudo-star-2017.07/install/share/perl6/site/bin
	# $PYENV_ROOT/bin
	$VIMCONFIG/pack/bundle/start/fzf/bin
	# $HOME/gems/bin
)

PATH=$(IFS=:; echo "${P[*]}")
export PATH
