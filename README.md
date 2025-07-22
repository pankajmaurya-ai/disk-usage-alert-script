# disk-usage-alert-script
A bash script to monitor disk space and log alerts if usage excedes 80%
# Disk Usage Alert Script

This Bash script checks the disk usage of the root (/) partition and logs an alert if usage exceeds 80%.

## 🔧 Features

- Checks disk usage using `df`, `awk`, and `if` conditions
- Logs alert to `/var/log/disk_alert.log` if usage > 80%
- Clean and readable output
- (Optional) Schedule using `cron` for regular health checks

## 📜 Script

```bash
#!/bin/bash

USAGE=$(df / | awk 'NR==2 {gsub("%", "", $5); print $5}')

if [ "$USAGE" -ge 80 ]; then
    echo "$(date): Disk usage is above 80% (Current: $USAGE%)" >> /var/log/disk_alert.log
else
    echo "$(date): Disk usage is normal (Current: $USAGE%)"
fi
🕒 Cron Job Example
Run this script every hour:

bash
Copy
Edit
0 * * * * /absolute/path/to/check_disk.sh
🚀 How to Use
Save the script as check_disk.sh

Make it executable:

bash
Copy
Edit
chmod +x check_disk.sh
Run manually or add to cron for automation
