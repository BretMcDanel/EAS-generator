#!/bin/bash
## Requires: minimodem sox
### sudo apt install -y minimodem sox

# check for dependencies
hash minimodem 2>/dev/null || { echo >&2 "I require minimodem but it's not installed.  Aborting."; exit 1; }
hash play 2>/dev/null || { echo >&2 "I require sox but it's not installed.  Aborting."; exit 1; }


## For valid Originator Codes, Event Codes, and Location Codes see 47 CFR § 11.31
## https://www.law.cornell.edu/cfr/text/47/11.31
PREAMBLE='\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB\xAB'
ORIGINATOR=PEP
EVENT=EAN
LOCATION=000000
DURATION=2400
PARTICIPANT_ID=00000000
# Go time is "now"
STARTTIME=$(TZ=UTC date +%j%H%M)


echo -n -e "${PREAMBLE}ZCZC-${ORIGINATOR}-${EVENT} + ${DURATION}-${STARTTIME}-${PARTICIPANT_ID}-" | minimodem --tx same
sleep 1
echo -n -e "${PREAMBLE}ZCZC-${ORIGINATOR}-${EVENT} + ${DURATION}p${STARTTIME}-${PARTICIPANT_ID}-" | minimodem --tx same
sleep 1
echo -n -e "${PREAMBLE}ZCZC-${ORIGINATOR}-${EVENT} + ${DURATION}-${STARTTIME}-${PARTICIPANT_ID}-" | minimodem --tx same
sleep 1


# 8-25 second attention signal  853+960 Hz
play -n synth 10 sin 853 sin 960 remix -
sleep 1

# transmission of audio, video or text message
echo -n -e "Some message should go here" | minimodem --tx same
sleep 1

for i in {1..3}; do
    echo -n -e "${PREAMBLE}NNNN" | minimodem --tx same
    sleep 1
done

