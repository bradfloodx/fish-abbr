# Default Node version for NVM.fish
set -gx nvm_default_version 22

if status is-interactive
	source ~/www/bradflood/fish-abbr/abbreviations.fish
	source ~/www/bradflood/fish-abbr/functions.fish

	# IntelliJ
	set -gx PATH $PATH /Applications/IntelliJ\ IDEA.app/Contents/MacOS

end

