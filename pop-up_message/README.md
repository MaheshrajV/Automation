Daily Popup Notification Script (Bash)

This Bash script automates a daily popup notification showing the current local date, time, and timezone. It runs automatically at a scheduled time via cron and only triggers
when a GUI user session is active.

⚙️ Features
Detects whether the current user is logged in to a GUI session.
Displays a desktop notification using notify-send.
Shows the local timezone and time (using timedatectl and date).
Compatible with GNOME, KDE, and other Linux desktop environments.
Can be automated through crontab or systemd.

🪜 Setup Steps
1. Save the Script
Save the above code as:
/home/mahesh/Documents/automate.sh
2. Make it Executable
chmod +x /home/mahesh/Documents/automate.sh
3. Test It Manually

Run:
/home/mahesh/Documents/automate.sh
If you see a popup notification, it’s working.

⏰ Automating with Cron
To schedule this script, use your user crontab:
crontab -e

Add this line to trigger every day at 9:00 AM:
0 9 * * * /home/mahesh/Documents/automate.sh >> /home/mahesh/Documents/automate.log 2>&1
Then save and exit.

Validate Cron
List your cron jobs:
crontab -l

Check logs (to confirm cron is executing):
grep CRON /var/log/syslog | tail -10

🧠 Understanding Key Variables
Variable	                                                                 Purpose
DISPLAY=:0 - Tells the script which X display (desktop session) to use for GUI apps. Usually :0 for the first user.
XAUTHORITY=/home/mahesh/.Xauthority - Grants access to the running X session for notify-send.
DBUS_SESSION_BUS_ADDRESS - Connects to your desktop’s notification system.
loginctl list-sessions - Lists all active user sessions; used to confirm that a GUI user is logged in.
timedatectl show -p Timezone --value - Extracts system timezone.
date '+%Y-%m-%d %H:%M:%S' - Prints formatted local date and time.
notify-send - Sends a notification to the desktop.

🔍 Troubleshooting
Issue	Possible Cause	Fix
No popup appears when run by cron	Missing GUI environment variables	Ensure DISPLAY, XAUTHORITY, and DBUS_SESSION_BUS_ADDRESS are correct. 
Run echo $DISPLAY and echo $DBUS_SESSION_BUS_ADDRESS inside your desktop terminal to confirm.
Script works manually but not via cron	Cron lacks GUI context	Export environment variables explicitly as shown in the script.
“Permission denied”	Script not executable	Run chmod +x /home/mahesh/Documents/automate.sh.
Wrong time or timezone	System timezone misconfigured	Run timedatectl set-timezone <Region/City>.
