# Clamav Addon for Jelastic Cloud

**All Nodes that are based on either CentOS, Alpine, Ubuntu or Debian are supported**

Currently this addon works by having 2 buttons on the interface once it's installed.

![Interface](images/interface.png?raw=true)

One is called freshclam which runs an update of the clamav DB and one is Scan now.

There is **NO** continous scanning!

The node will only be scanned once you click on scan now and the addon does nothing until then.

The scan command is  
```
clamscan --infected --recursive --remove --exclude-dir="^/sys" --exclude-dir="^/dev" --exclude-dir="^/proc" /
```

It will remove all infected Files even if false positive.

The Node will be severely loaded during the Scan!



# Installation

You can directly import this link by JPS import:
```
https://raw.githubusercontent.com/panslothda/Jelastic-Addon-Clamav-Antivirus/master/main.jps
```

Or you can copy paste the main.jps into the Import tab.

