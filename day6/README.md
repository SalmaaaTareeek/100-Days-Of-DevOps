
# *Day 6: Create a Cron Job*

This folder includes the **solution** for **Day 6: Create a Cron Job**, providing step-by-step explanations for each part of the task.

## Task Breakdown

The task has two main requirements:

1. **Install cronie package and start the crond service.**  
2. **Create a cron job for the root user to run every 5 minutes: echo hello > /tmp/cron_text**

If you want to jump directly to the solution, please go to the [Solution](#Solution) section below.

# Automating Tasks with Cron Jobs

Cron jobs are a simple but powerful way to automate repetitive tasks — like running backups or sending alerts. In this task, we create a test job that writes “hello” to a file every 5 minutes. This helps verify that scheduling works before deploying real scripts.

---

## Key Concepts

- **Cron:**  
  A time-based job scheduler that runs in the background as a daemon called `crond`.

- **Crontab:**  
  A file that contains the schedule of cron jobs. Each user can have their own crontab file.

- **Cron Job:**  
  A specific task scheduled to run at a designated time.



## Checking OS Type and Installing Packages

Different Linux distributions use different package managers, so it’s important to know which OS you are working with before installing software.

To check the OS type, you can look at system information that tells you the Linux distribution in use.

For installing the Cron package:

- On CentOS and other Red Hat-based systems, the package manager `yum` is used.
- On Debian, Ubuntu, and other Debian-based systems, the package manager `apt` is used.

Knowing which package manager to use ensures you install the correct software for your system.

## Common Crontab Command Options

- `crontab -l`  
  Lists the current user's cron jobs.

- `crontab -e`  
  Opens the current user's crontab file in the default text editor for editing.

- `crontab -r`  
  Removes the current user's crontab file (deletes all scheduled cron jobs).

- `crontab -u username -l`  
  Lists the cron jobs for the specified user (requires root privileges).

- `crontab -u username -e`  
  Edits the crontab for the specified user (requires root privileges).

---

## Solution

Now that you understand the tasks .

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

4. Confirm the Linux distribution since package managers differ between distributions:

```bash
cat /etc/os-release
```

5. Install the Cron package using the appropriate package manager for your Linux distribution:

```bash
# For CentOS and Red Hat-based systems
yum install cronie -y

# For Debian and Ubuntu-based systems
apt install cron -y
```
6. Start and enable the `crond` service to ensure it runs on boot and is currently active:

```bash
systemctl start crond
systemctl enable crond
```
7. Open the crontab editor for the root user:

```bash
crontab -e
```
and add 

```bash
*/5 * * * * echo hello > /tmp/cron_text
```
8. Save and verify the cron job

- After adding the cron job, save and exit the crontab editor.
- Verify the scheduled cron jobs by running:

```bash
crontab -l
```
The output should display the scheduled task you just added.

9. Repeat these same steps on App Server 1 and App Server 3

## Debugging

Waited for a little over 5 minutes, then ran:

```bash
cat /tmp/cron_text
```
Expected output:

hello
-------------------------------------------------------------------------
and,

🎉 Voilà! Six day task is done. 🎉