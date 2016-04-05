# Patch for check_lsi_raid

Patch for check_lsi_raid from Thomas Krenn Software
to use this check as a local check in Check_MK Monitoring

The original check has bbu check enabled and will report
a critical state if there is no bbu or a failed bbu. (bbu is 
short hand for "battery backup unit" or "cache vault"). The
patch disables the bbu check, so a nonexistent bbu does not
cause the check to report a critical state. If you want to have
the bbu check enabled, change line 1185 in check_lsi_raid
to:

    $bbu = 1;


## Installation

### Check the system requirements

Have the following packages installed at your local workstation:

* make
* patch
* wget
* git

### Download the repository

    git clone https://github.com/megabert/check_lsi_raid_patch

### Run make

    cd check_lsi_raid_patch
    make

### Copy the Files

Copy the one or two files as the Makefile output tells you

### Update your server inventory

Now go to the WATO Webinterface, update the list of available services.
A new check lsi_raid should show up.

