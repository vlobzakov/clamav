# Clamav Addon for Jelastic Cloud

**All Nodes that are based on either CentOS, Alpine, Ubuntu or Debian are supported**

This addon works by having a buttons on the interface once it's installed.

![Interface](images/interface.png?raw=true)

If you click the Button it will update the Clamav DB using freshclam and offer different scanning options.

There is **NO** repeated automatic scanning!

The node will only be scanned once you click on scan now and the addon does nothing until then.

The default scan command is  
```
clamscan --infected --recursive --exclude-dir="^/sys" --exclude-dir="^/dev" --exclude-dir="^/proc" -l /var/log/clamav/clamav.log --move=/opt/clamav_quarantined / > /dev/null 2>&1
```

It will quarantine all files into the directory /opt/clamav_quarantined.

The Node will be severely loaded during the Scan and requires 12 reserved Cloudlets to have enough RAM available for Clamav!

Log Entries are saved into the file /var/log/clamav/clamav.log


# Installation

You can directly import this link by JPS import:
```
https://raw.githubusercontent.com/panslothda/Jelastic-Addon-Clamav-Antivirus/master/main.jps
```

Or you can copy paste the main.jps into the Import tab.

