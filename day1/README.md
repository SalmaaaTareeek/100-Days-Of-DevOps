
# *Day 1: Linux User Setup with Non-Interactive Shell*

This folder includes the solution for Day 1, covering Linux user setup with a non-interactive shell, and provides explanations for each step taken.

## Task Breakdown

The task has two main requirements:

1. **Create a system user:**  
2. **Assign a non-interactive shell:**  

If you want to jump directly to the solution, please go to the [Solution](#Solution) section below.

## What is a User?

First, let’s take a moment to think about what a **user** actually is in the context of Linux. Simply put, a user is an entity—whether a person or a system process—that can access and interact with the Linux system through an account.
## What are Users in Linux System Administration?

In Linux system administration, a **user** is an individual or system entity that can log in and access the system. Users are managed through unique accounts with assigned User IDs (UIDs), permissions, and roles.

### Types of Users in Linux

- **Root User (Administrator):**  
  The superuser with full control over the system, identified by UID 0.

- **Regular Users:**  
  Non-administrative users created for daily operations, each assigned a unique UID.

- **System Users:**  
  Users created by the system to run services such as databases, web servers, and other background processes.

## What is a Shell?

A **shell** is a command-line interface that allows users to interact with the operating system by executing commands.

## Types of Shells: Interactive vs Non-Interactive

- **Interactive Shell:**  
  This shell allows users to interact directly with the system by typing commands and receiving immediate feedback. It typically provides features like command history, prompts, and job control. For example, when you open a terminal window and type commands, you are using an interactive shell.

- **Non-Interactive Shell:**  
  This shell runs commands without user interaction, usually executing scripts or automated tasks. It does not provide prompts or wait for user input. Non-interactive shells are commonly used for background jobs, system services, or automated scripts.

Understanding the difference is important when setting up users or running scripts, especially when you want to restrict login capabilities or automate tasks.
Example in Linux: /usr/sbin/nologin

## Comparison: adduser vs useradd

| Aspect                    | adduser                                  | useradd                                  |
|---------------------------|-----------------------------------------|------------------------------------------|
| Intended for              | Linux users (interactive use)           | System use (scripts and automation)      |
| Interface type            | High-level, user-friendly, interactive  | Low-level, requires explicit parameters  |
| Updates and compatibility | Frequently updated, flexible             | Less frequently updated, backward compatible |
| Usage                     | Easier for manual user creation          | Preferred for scripting and system tasks |
| Functionality             | Performs same basic functions as useradd | Performs same basic functions as adduser |
| Consistency across distros| May vary between distributions           | More consistent across Linux distros     |
| Typical users             | Average Linux users                       | Developers and system administrators      |

---

### Summary

- **adduser** is recommended for everyday user creation because of its simplicity and interactive prompts.
- **useradd** is preferred for scripting and system-level tasks due to its stability and backward compatibility.

## What is a UID in Linux?

**UID** stands for **User Identifier**. It is a unique number assigned to each user on a Linux system. The UID is used by the operating system to manage permissions and ownership of files and processes.

- The **root** user always has UID `0`.
- **System users** typically have UIDs below `1000`.
- **Regular users** usually have UIDs starting from `1000` or higher.

## Why is Mark’s UID 900 - you can Check in the solution?

Mark’s UID is `900` because he was created as a **system user**. System users are assigned UIDs below `1000` to distinguish them from regular users. These accounts are generally used for running system services and do not have interactive login privileges.





