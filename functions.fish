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
