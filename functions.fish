# Function to create .node-version file with current Node.js version
function create_node_version_file
    # Check if Node.js is installed
    if not type -q node
        echo "Error: Node.js is not installed. Please install Node.js to proceed."
        return 1
    end

    # Retrieve Node.js version and adjust based on version manager
    set NODE_VERSION (node --version | string replace -r '^v' '')

    # Write to .node-version file
    echo $NODE_VERSION > .node-version

    # Inform the user
    echo ".node-version file created with Node.js version $NODE_VERSION"
end

# Custom cd function to automatically run 'nvm use' if .node-version exists
function cd
    # Use the built-in cd to change directories
    builtin cd $argv

    # Check if .node-version exists in the new current directory
    if test -f .node-version
        # Execute 'nvm use'
        nvm use
    end
end

function gh
    set GIT_CONFIG ".git/config"

    if test -f $GIT_CONFIG
        set REMOTE_URL (grep 'url =' $GIT_CONFIG | grep 'github.com' | awk '{print $3}')

        if test -n "$REMOTE_URL"
            set REPO_PATH (string replace -r '^git@github\.com:' '' $REMOTE_URL | string replace -r '\.git$' '')
            set HTTPS_URL "https://github.com/$REPO_PATH"

            # Open the URL in the default browser
            open $HTTPS_URL

            # Also output the URL
            echo $HTTPS_URL
        else
            echo "No GitHub repository URL found in $GIT_CONFIG."
        end
    else
        echo "This directory is not a Git repository (no .git/config found)."
    end
end
