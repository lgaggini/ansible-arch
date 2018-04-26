#!/bin/sh
#https://cyprio.net/wtf/2012-08-13-using-newsbeuter-with-tmux-and-w3m-to-read-news.html
W3M='/usr/bin/w3m'

# If the window has only one pane, create one by splitting.
pane_count=`tmux list-panes -F '#{line}' | wc -l`
if [ $pane_count -lt 2 ]; then
    tmux split-window -h
fi

# Start my reader if it ain't running already, and send it the URL to
# open.
w3m_process_count=`ps auxw | grep "$W3M" | grep -cv grep`
if [ $w3m_process_count = '1' ];then
    tmux send-keys -t 1 "U" "C-u" "$1"
    tmux send-keys -t 1 Enter
    tmux select-pane -t 1
else
    tmux send-keys -t 1 "$W3M '$1'"
    tmux send-keys -t 1 Enter
    tmux select-pane -t 1
fi
# Done! :)
