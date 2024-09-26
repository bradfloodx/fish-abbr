# Default Node version for NVM.fish
set -gx nvm_default_version 22

if status is-interactive
	source ~/www/bradflood/fish-abbr/abbreviations.fish
	source ~/www/bradflood/fish-abbr/functions.fish

	set -gx PATH $PATH /Applications/IntelliJ\ IDEA.app/Contents/MacOS
	set -gx PATH $PATH /Applications/Sourcetree.app/Contents/Resources

	set -Ux ANDROID_HOME /Users/bradflood/Library/Android/sdk
	set -g PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools
end

