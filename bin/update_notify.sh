#!/bin/bash

bkr() {
    (nohup "$@" &>/dev/null &)
}

bkr /home/ed/bin/sys_update.sh
bkr /home/ed/bin/notifyme.sh
