# raspi-dashcam

Build a dashcam and throw in some algos that can't be loaded 
on a pre-purchased one.

### Table of Contents 

TODO 

### Installation 

TODO

#### Additional Instatllation Notes 

Use of `cron` to execute scripts on boot. Make sure root has 
`+x` permissions, otherwise root may not be able to execute.

```
$ sudo crontab -e # Add execution to root cron

# Sample of permissions on record.sh
-rwxr-xr-x 1 pi pi 518 Mar 18 07:44 record.sh

```

