# EAS-generator

The Emergency Alert Service message generator

## Background

EAS is a US government system designed to inform the public about emergencies.  It replaced the EBS system in the 1990s.  At that time they decided it was a good idea to remove any authentication that EBS had.  To this day authentication does not exist.

This script is an attempt to create a technically valid emergency alert generator to demonstrate that it is trivial and that it should be fixed.  This has been an issue for a long time and nothing is being done about it.  DHS was contacted 10 years ago when I wrote a similar program (now lost in time, but probably was more accurate than this).



## Prerequisites

You will need both sox and minimodem
```
sudo apt install -y sox minimodem
```

## Usage

Dont.  Just dont.  But if you must edit the message in the script and run it.  Running it by itself will do nothing.  If it is transmitted by radio on the right frequency, with the right data, and the right modulation it could possibly trigger stations to run an alert causing "war of the worlds" type panic.

## Caveat

Unlike my program 10 years ago I did not test this.  I am uncertain if it actually works (I do not know if minimodem correctly generates tones but have no reason to doubt).  This was written to illustrate the problem not to let people do fake zombie alerts.