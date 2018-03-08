#!/bin/bash
# bash Call
# sudo bash {PATH}/deploy.sh {JAR_PATH} 8080 spring-boot-jenkins

# Field

# JAR Path
JAR_PATH=$1
# Server Port
# Ex) 8080
SERVER_PORT=$2
# Service Name
# Ex) spring-boot-jenkins
PROJECT_NAME=$3

JAR_FILE=$JAR_PATH/$PROJECT_NAME-0.0.1-SNAPSHOT.jar
TMP_PATH_NAME=/tmp/$PROJECT_NAME-pid

# Function
function stop(){
    echo " "
    echo "Stoping process on port: $SERVER_PORT"
    fuser -n tcp -k $SERVER_PORT # tcp $serverPort에 해당하는 port를 Kill함.

    if [ -f $TMP_PATH_NAME ]; then
        rm $TMP_PATH_NAME
    fi

    echo " "
}

function start(){
    echo " "
    nohup java -jar -Dserver.port=$SERVER_PORT $JAR_FILE /tmp 2>> /dev/null >> /dev/null &
    echo "java -jar -Dserver.port=$SERVER_PORT $JAR_FILE /tmp 2>> /dev/null >> /dev/null &"

    echo $! > $TMP_PATH_NAME
    echo " "
}

# Function Call
stop

start