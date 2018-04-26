#! /bin/bash
# Author: Lorenzo Gaggini
# Version: 0.1
#
# Create a naughty awesome wm notification by title
# and message on secondary (big) screen

# check input
if [ "$#" -ne 2 ]; then
    echo "usage: naughty-send title message"
    exit 1
fi

# parse input
TITLE=$1
MSG=$2

# init naughty
/usr/bin/echo "naughty = require(\"naughty\")" | /usr/bin/awesome-client

# feed awesome-client
/usr/bin/echo "naughty.notify({title = \"$TITLE\", text = \"$MSG\", screen =  screens, timeout = 0})" | /usr/bin/awesome-client
