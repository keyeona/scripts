#!/bin/bash


echo "$1" 
# store the current dir
CUR_DIR=$(pwd)
USAGE=$(cat <<EOL

Use this script to update a set of repos in a directory. Place this script in the parent directory that contains the  git repositories. 


    git-all argument

    ######## arguments ########

     pull-origin  : fetch from origin on all repos in Dir 
     status       : Get the status of all repos in Dir 
     reset        : runs git reset hard origin/master on all repos in Dir 
EOL
)

git_pull_origin_master()
{
    # Let the person running the script know what's going on.
    echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

    # Find all git repositories and update it to the master latest revision
    for i in $(find . -name ".git" | cut -c 3-); do
        echo "";
        echo -e "\033[33m"+$i+"\033[0m";
    
        # We have to go to the .git parent directory to call the pull command
        cd "$i";
        cd ..;
    
        # finally pull
        git pull origin master;
       
        # lets get back to the CUR_DIR
        cd $CUR_DIR
    done

    echo -e "\n\033[32mComplete!\033[0m\n"
}

git_status () {
   # Let the person running the script know what's going on.
    echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

    # Find all git repositories and update it to the master latest revision
    for i in $(find . -name ".git" | cut -c 3-); do
        echo "";
        echo -e "\033[33m"+$i+"\033[0m";

        # We have to go to the .git parent directory to call the pull command
        cd "$i";
        cd ..;

        # ok git status 
        git status

        # lets get back to the CUR_DIR
        cd $CUR_DIR
    done

    echo -e "\n\033[32mComplete!\033[0m\n"
}

got_reset_hard_origin_master()
{
   # Let the person running the script know what's going on.
    echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

    # Find all git repositories and update it to the master latest revision
    for i in $(find . -name ".git" | cut -c 3-); do
        echo "";
        echo -e "\033[33m"+$i+"\033[0m";

        # We have to go to the .git parent directory to call the pull command
        cd "$i";
        cd ..;

        # finally hard reset
        git reset hard origin/master

        # lets get back to the CUR_DIR
        cd $CUR_DIR
    done

    echo -e "\n\033[32mComplete!\033[0m\n"
}

if [ "$1" == "pull" ]; then
    git_pull_origin_master
elif [ "$1" == "status" ]; then
    git_status
elif [ "$1" == "reset" ]; then
    git_reset_hard_origin_master
else
    echo "$USAGE"

fi


