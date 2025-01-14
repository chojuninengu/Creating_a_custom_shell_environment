# QUESTIONS 2


| N/A | MEMBERS |
| --- | --- |
| 1 | LUOIZY |
| 2 | DESMOND |
| 3 | JU-NINE |


# Custom Bash Environment and Docker Setup Script

This script helps you create a **custom Bash environment** (the terminal you use to type commands) and a **Docker container** (a lightweight virtual machine) to test it. It’s like setting up your own personalized command-line workspace!

---

## What Does the Script Do?

### Step 1: Create a Custom `.bashrc` File
The `.bashrc` file is like a settings file for your terminal. This script creates a new `.bashrc` file with:

1. **Shortcuts (Aliases)**:
   - `ll`: Lists all files in a folder, including hidden ones.
   - `cls`: Clears the terminal screen.
   - `grep`: Makes search results colorful.
   - `rm`, `cp`, `mv`: Asks for confirmation before deleting, copying, or moving files.
   - Git shortcuts like `gs` for `git status`, `ga` for `git add`, etc.

2. **Custom Functions**:
   - `mkcd`: Creates a folder and moves into it in one command.
   - `findf`: Finds files by name in the current folder.

3. **Custom Prompt**:
   - The terminal prompt is customized to show:
     - Your username, computer name, and current folder.
     - The Git branch you’re working on (if you’re in a Git project).

4. **Welcome Message**:
   - When you open the terminal, it says, "Welcome to your custom Bash environment, [your username]!"

---

### Step 2: Create a Dockerfile
A Dockerfile is like a recipe for creating a virtual machine. This script creates a Dockerfile that:

1. Uses **Ubuntu** (a popular operating system) as the base.
2. Installs **Bash** (the terminal) and **Git** (a tool for managing code).
3. Copies your custom `.bashrc` file into the virtual machine.
4. Sets up the virtual machine to start an interactive Bash terminal when it runs.

---

### Step 3: Copy `.bashrc` for Docker
The script copies your custom `.bashrc` file to the current folder so Docker can use it to set up the virtual machine.

---

### Step 4: Build and Run the Docker Container
1. **Build the Docker Image**:
   - The script creates a Docker image (like a snapshot of the virtual machine) named `custom-bash`.

2. **Run the Docker Container**:
   - The script starts the virtual machine and opens an interactive terminal with your custom Bash environment.

---

## How to Use the Script
1. Copy the script into a file (e.g., `setup.sh`).
2. Open a terminal and run the script:
   ```bash
   bash setup.sh