# 📂 Linux Shell Scripting and Command Implementation Assignment

## Project Overview

This repository contains the practical implementation files for the **Computer Science Fundamentals & Career Pathways** course assignment on Linux Basics and Open-Source Tools.

The project demonstrates proficiency in setting up a Linux environment, executing core command-line functions, and automating tasks using shell scripting. It utilizes Ubuntu (installed via **VirtualBox**) and involves developing three essential shell automation scripts.

## Scripts Description

This repository contains the following three functional shell scripts:

### 1. `backup_directory.sh`
* **Purpose:** This script copies a specified source directory to a designated backup folder.
* **Functionality:** It automatically appends a **timestamp** to the new backup folder name, ensuring unique and chronological backups.

### 2. `monitor_system.sh`
* **Purpose:** This script logs key system performance metrics.
* **Functionality:** It captures the current **CPU utilization (%)** and **Memory usage (MB)** at regular, defined intervals and writes the output to a specified log file.

### 3. `automated_download.sh`
* **Purpose:** This script automates the downloading of a file from the internet.
* **Functionality:** It uses the `wget` or `curl` command to fetch a file from a specified URL and saves it into a predefined local directory.

## Instructions for Running the Scripts

Follow these steps to set up and run the scripts in your Linux environment:

### Prerequisites
1.  Ensure you have a Linux environment set up (Ubuntu via WSL or VirtualBox).
2.  Clone this repository to your local Linux machine using the following command:
    ```bash
    git clone [https://github.com/lucky-KRMU/linux-shell-assignment-sem-1.git](https://github.com/lucky-KRMU/linux-shell-assignment-sem-1.git)
    cd linux-shell-assignment-sem-1
    ```

### Configuration and Execution

**Before running any script, you must grant it executable permissions:**
```bash
chmod +x *.sh