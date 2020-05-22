# Clamav Addon for Jelastic Cloud

**All Nodes that are based on either CentOS, Alpine, Ubuntu or Debian are supported**

This addon works by having a buttons on the interface once it's installed.

![Interface](images/interface.png?raw=true)

If you click the Button it will update the Clamav DB using freshclam and launch a full scan afterwards.

There is **NO** repeated automatic scanning!

The node will only be scanned once you click on scan now and the addon does nothing until then.

The scan command is  
```
clamscan --infected --recursive --remove --exclude-dir="^/sys" --exclude-dir="^/dev" --exclude-dir="^/proc" -l /var/log/clamav/clamav.log / > /dev/null 2>&1 &
```

It will remove all infected Files even if it is a false positive.

The Node will be severely loaded during the Scan!

Log Entries are saved into the file /var/log/clamav/clamav.log


# Installation

You can directly import this link by JPS import:
```
https://raw.githubusercontent.com/panslothda/Jelastic-Addon-Clamav-Antivirus/master/main.jps
```

Or you can copy paste the main.jps into the Import tab.

