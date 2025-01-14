#!/bin/bash

# Script to set up a custom Bash environment and Docker container for testing

# Step 1: Create .bashrc with custom aliases, functions, and prompt
cat << 'EOF' > ~/.bashrc
# Aliases for common commands
alias ll='ls -la'
alias cls='clear'
alias grep='grep --color=auto'
alias rm='rm -i'  # Confirm before deleting
alias cp='cp -i'  # Confirm before overwriting
alias mv='mv -i'  # Confirm before overwriting

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gpush='git push'
alias gpull='git pull'

# Function to create a directory and navigate into it
mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# Function to find files by name
findf() {
  find . -type f -name "$1"
}

# Load Git prompt utilities (if available)
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
  . /usr/lib/git-core/git-sh-prompt
elif [ -f /usr/share/git/completion/git-prompt.sh ]; then
  . /usr/share/git/completion/git-prompt.sh
fi

# Custom PS1 prompt with Git branch (if available)
export PS1="\n\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\] \[\033[1;33m\]\$(__git_ps1 '(%s)')\[\033[0m\]\n$ "

# Autocomplete and history enhancements
bind 'set completion-ignore-case on'
shopt -s histappend
export HISTSIZE=10000
# Display a welcome message
echo "Welcome to your custom Bash environment, $(whoami)!"

# Load .bashrc if it exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF

# Step 3: Create a Dockerfile for testing
cat << 'EOF' > Dockerfile
# Use a base image with Bash
FROM ubuntu:latest

# Install Bash and Git (for Git-related aliases)
RUN apt-get update && apt-get install -y bash git

# Copy your custom .bashrc and .bash_profile into the container
COPY .bashrc /root/.bashrc
COPY .bash_profile /root/.bash_profile

# Set the default shell to Bash
SHELL ["/bin/bash", "-c"]

# Start an interactive Bash shell
CMD ["bash"]
EOF

# Step 4: Copy .bashrc and .bash_profile to the current directory for Docker
cp ~/.bashrc .bashrc
cp ~/.bash_profile .bash_profile

# Step 5: Build and run the Docker container
echo "Building Docker image..."
docker build -t custom-bash .

echo "Running Docker container..."
docker run -it custom-bash