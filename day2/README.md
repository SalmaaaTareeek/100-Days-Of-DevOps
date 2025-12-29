
# *Day 2: Temporary User Setup with Expiry*

This folder includes the **solution** for **Day 2: Temporary User Setup with Expiry**, providing step-by-step explanations for each part of the task.

## Task Breakdown

The task has two main requirements:

1. **Create a system user**  
2. **Set an expiry date for the user account to make it temporary**  

If you want to jump directly to the solution, please go to the [Solution](#Solution) section below.

## What is a User in Linux System Administration? 
please see the [Day 1 folder](../day1/) in this repository.

## Why Set an Expiry on a User?

Setting an expiry date on a user account ensures that the account is automatically disabled after a certain period. This is important for:

- **Security:** Temporary accounts reduce the risk of unauthorized access if the account is no longer needed.
- **Access Control:** It helps enforce policies where users should only have access for a limited time, such as contractors or temporary employees.
- **Account Management:** Automatically disabling unused or temporary accounts helps keep the system clean and reduces administrative overhead.

## Comparison: adduser vs useradd

please see the [Day 1 folder](../day1/) in this repository.







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

4. Add a new user named **Mark** with the following command:

  ```bash
adduser mark -e 2024-02-17 
```


### Debugging: Check if user 'mark' exists

Before adding the user, run:

```bash
id mark
```
Expected result if user does not exist:

```bash
id: ‘mark’: no such user
```
After adding ther user, run:
```bash
id mark
```
Expected result if user does not exist:

```bash
uid=900(mark) gid=900(mark) groups=900(mark)
```
and,

🎉 Voilà! Second day task is done. 🎉