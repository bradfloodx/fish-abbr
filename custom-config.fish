# Default Node version for NVM.fish
set -gx nvm_default_version 22

# Custom Abbreviations
if status is-interactive
	source ~/www/bradflood/fish-abbr/abbreviations.fish
end

# IntelliJ
set -gx PATH $PATH /Applications/IntelliJ\ IDEA.app/Contents/MacOS