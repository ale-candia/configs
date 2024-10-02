set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR vim
set -gx NVM_DIR ~/Local/nvm

# homebrew bins
fish_add_path /opt/homebrew/bin

# cargo
fish_add_path $HOME/.cargo/bin

function fish_prompt
	set_color blue
	echo -n $USER
	if [ $PWD != $HOME ]
		set_color green
		echo -n ' :: '
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '> '
	set_color normal
end
