Auto Shutdown Script — auto.sh

This Bash script automatically powers off the system if there has been no keyboard or mouse activity for 15 minutes.
It uses xprintidle to check user inactivity and shuts down safely after exceeding the threshold.

⚙️ How It Works

The script checks for user idle time (in milliseconds) using xprintidle.

If the system has been idle for more than 15 minutes, it executes a shutdown command (sudo poweroff).

The loop runs every 60 seconds to monitor inactivity continuously.

🧩 Requirements

Ensure these dependencies are installed:

sudo apt install xprintidle


You’ll also need sudo privileges for the shutdown command.

🛠️ Installation

Copy the script to /usr/local/bin/:

sudo cp auto.sh /usr/local/bin/auto.sh


Make it executable:

sudo chmod +x /usr/local/bin/auto.sh


(Optional) Allow shutdown without password for automation:

sudo visudo


Add the following line at the end (replace username with your actual user):

username ALL=(ALL) NOPASSWD: /sbin/poweroff

🚀 Usage

Run it manually:

/usr/local/bin/auto.sh


Or let it run automatically on system startup using crontab:

crontab -e


Add this line:

@reboot /usr/local/bin/auto.sh &


This ensures the script runs in the background after every reboot.

⚙️ Customization

You can change the idle timeout by editing this line in the script:

THRESHOLD=$((15 * 60 * 1000))


Example for 30 minutes:

THRESHOLD=$((30 * 60 * 1000))
