#!/usr/bin/env python3
import datetime
import time
import os
import pytz
from plyer import notification

# --- CONFIGURATION ---
TARGET_HOUR = 9      # 24-hour format (e.g., 9 = 9AM)
TARGET_MINUTE = 0
TIMEZONE = time.tzname[0]  # Uses system local timezone

def user_logged_in():
    """Return True if user is logged in (for Windows this is always true when Task Scheduler runs in session)."""
    return os.getlogin() != ""

def show_popup():
    current_time = datetime.datetime.now()
    msg = f"Local time ({TIMEZONE}): {current_time.strftime('%Y-%m-%d %H:%M:%S')}"
    notification.notify(
        title=f"Hello, {os.getlogin()}!",
        message=msg,
        timeout=10  # popup stays visible for 10 seconds
    )

if __name__ == "__main__":
    if user_logged_in():
        now = datetime.datetime.now()
        if now.hour == TARGET_HOUR and now.minute == TARGET_MINUTE:
            show_popup()
