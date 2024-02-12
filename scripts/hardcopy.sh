#!/bin/bash

if [[ $1 = help || $# = 0 ]]
then
	echo -e "Usage: takes 1 argument, fileName; requires 2 global variables, SUBJ and CODE\nFinds School Documents/SUBJ/CODE/fileName and creates hardlink to tex/SUBJ/CODE/fileName"
	exit 0
fi

ln "../../OneDrive - McGill University/School Documents/$SUBJ/$CODE/$1"  "../tex/$SUBJ/$CODE/$1"

exit 0
