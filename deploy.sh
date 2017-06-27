#!/bin/bash
# bash Call
# sudo bash {PATH}/deploy.sh 8080 spring-boot-jenkins

# Field

# Server Port
# Ex) 8080
SERVER_PORT=$1
# Service Name
# Ex) spring-boot-jenkins
PROJECT_NAME=$2

PROJECT_PATH=/var/lib/jenkins/workspace/$PROJECT_NAME/build/libs
JAR_FILE=$PROJECT_PATH/$PROJECT_NAME-0.0.1-SNAPSHOT.jar
TMP_PATH_NAME=/tmp/$PROJECT_NAME-pid

# Function
function stop(){
    sudo echo " "
    sudo echo "Stoping process on port: $SERVER_PORT"
    sudo fuser -n tcp -k $SERVER_PORT # tcp $serverPort에 해당하는 port를 Kill함.

    if test -e
    then rm $TMP_PATH_NAME
    fi

    sudo echo " "
}

function start(){
    sudo echo " "
    sudo nohup java -jar -Dserver.port=$SERVER_PORT $JAR_FILE /tmp 2>> /dev/null >> /dev/null &
    sudo echo "java -jar -Dserver.port=$SERVER_PORT $JAR_FILE /tmp 2>> /dev/null >> /dev/null &"

    sudo echo $! > $TMP_PATH_NAME
    sudo echo " "
}

# Function Call
stop

start