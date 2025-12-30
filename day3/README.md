
# *Day 3: Secure Root SSH Access*

This folder includes the **solution** for **Day 3: Secure Root SSH Access**, providing step-by-step explanations for each part of the task.

## Task Breakdown

The task has two main requirements:

1. **Update the SSH settings to block direct root login in all App Servers**  

If you want to jump directly to the solution, please go to the [Solution](#Solution) section below.

## What is SSH?

SSH stands for **Secure Shell**, and it’s a protocol that allows you to connect to a remote computer securely over an unsecured network. SSH provides a secure channel between two computers, ensuring that data transferred between them is encrypted and protected from attackers. In simple terms, SSH lets you log in to another computer (like a server) over the internet and control it just like you would if you were physically in front of it.

SSH is widely used by system administrators, developers, and network engineers to manage servers, transfer files, and run commands remotely, all while ensuring that sensitive information is kept private.

## Why Use SSH?

Here are a few key reasons why SSH is so popular:

- **Secure Communication:** Unlike older protocols like Telnet or FTP, SSH encrypts all the data transferred, making it almost impossible for attackers to intercept or read the information.

- **Remote Access:** You can control a server from anywhere in the world, whether you need to run updates, manage files, or troubleshoot problems.

- **File Transfer:** SSH supports secure file transfers via SCP (Secure Copy Protocol) and SFTP (Secure File Transfer Protocol).

- **Port Forwarding:** SSH can be used to tunnel other applications and services securely over the network.


## Types of Files in the Linux System

Linux categorizes files into different types based on their purpose, such as general data storage, system structure, or device representation.

- **General Files:**  
  Also called ordinary files. These may be images, videos, programs, or simple text files. They can be in ASCII or binary format and are the most commonly used files in Linux.

- **Directory Files:**  
  These files act as containers for other files and directories (subdirectories).

- **Device Files:**  
  Unlike Windows, where devices like CD-ROMs and hard drives are represented as drive letters (e.g., F:, G:), Linux represents devices as files. Examples include `/dev/sda1`, `/dev/sda2`.

---

### Common Top-level Directories

| Directory | Description                          |
|-----------|------------------------------------|
| `/bin`    | Binary or executable programs.     |
| `/etc`    | System configuration files.        |
| `/home`   | Home directories for users.        |
| `/opt`    | Optional or third-party software.  |
| `/tmp`    | Temporary space, typically cleared on reboot. |
| `/usr`    | User-related programs and data.    |
| `/var`    | Variable data like log files.      |

For more detailed information, see [Linux Directory Structure - GeeksforGeeks](https://www.geeksforgeeks.org/linux-directory-structure/).


## Important Files for This Configuration Change

The main file for this task is `/etc/ssh/sshd_config`. This file controls who can log in to the SSH server and how authentication works. The setting `PermitRootLogin` is found here.

Sometimes, this line is **commented out** (starts with `#`), like this:

```bash
#PermitRootLogin yes
```
In this task, if the line is commented, we will **remove the `#`** to activate it. If it says `yes`, we will change it to `no` to disable root login.

Be careful when editing this file because mistakes can stop the SSH service from working.

it will be: 

```bash
PermitRootLogin no
```


## Solution

Now that you understand the tasks and the differences between the user types and why we need expiration, let's jump into our solution.

1. You are currently on the jump server. For example, if the task requires adding a user on Server 2, and according to the diagram, Port 22 (SSH) is enabled, you can connect to Server 2 using the following command:

```bash
ssh username@hostname
```
Example:

```bash
ssh steve@stapp02.stratos.xfusioncorp.com
```

2. The server will ask you to verify the fingerprint; type yes to continue. Then, it will prompt you for Steve's password—enter it. Voilà! Now you are logged into Server 2.

3. Next, to gain root privileges, run:
```bash
sudo su
```
Enter Steve's password again to switch to the root user.

4. Open the `/etc/ssh` directory to view the SSH configuration files:

```bash
cd /etc/ssh
```

5. In my case, I will be using `vi` to edit the file. The command is:

```bash
sudo vi sshd_config
```
The file requires root privileges to open. Once opened, scroll down until you find the line containing PermitRootLogin.

If the line is commented out (starts with #), remove the # to uncomment it, and change the value to no to disable root login.
change this: 
```bash
#PermitRootLogin yes
```
to:
```bash
PermitRootLogin no
```

6. Restart the sshd service 
```bash
systemctl restart sshd
```
7. Repeat these same steps on App Server 1 and App Server 3

and,

🎉 Voilà! Third day task is done. 🎉