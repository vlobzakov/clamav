# Initial Release

Currently this addon works by having 2 buttons once installed.

One is called freshclam which runs an update of the clamav DB and one is Scan now.

There is *NO* continous scanning!

The node will only be scanned once you click on scan now and the addon does nothing until then.

The scan command is  '''   clamscan --infected --recursive --remove --exclude-dir="^/sys" /  '''


It will remove all infected Files even if false positive.

The Node will be severely loaded during the Scan.

