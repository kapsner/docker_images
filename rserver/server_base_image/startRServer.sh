#!/bin/bash

RSTUDIO_USERS=${RSTUDIO_USERS:-""}

#if new users add them

users=$(echo $RSTUDIO_USERS | tr ";" "\n")
for user in $users
do
    #curuser=$(echo $user | tr "," "\n")
    IFS=', ' read -r -a curuser <<< "$user"
    newUser="${curuser[0]}"
    newPw="${curuser[1]}"

    if ! id "$1" >/dev/null 2>&1; then
        echo "creating new user $newUser as it does not yet exist"
        useradd -ms /bin/bash $newUser
    fi

    echo $newUser:$newPw | chpasswd 

    mkdir -p /home/$newUser/.rstudio/monitored/user-settings/
    cp /root/user-settings /home/$newUser/.rstudio/monitored/user-settings/
    chown -R $newUser:$newUser /home/$newUser/.rstudio
    chmod 644 /home/$newUser/.rstudio/monitored/user-settings/user-settings

done

rstudio-server start
tail -f /dev/null
