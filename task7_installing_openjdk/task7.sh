#!/bin/bash
curl -O -s https://download.java.net/java/GA/jdk12.0.2/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-12.0.2_linux-x64_bin.tar.gz
mkdir -p /opt/java
tar -xvzf ./openjdk-12.0.2_linux-x64_bin.tar.gz -C /opt/java
export JAVA_HOME="/opt/java/jdk-12.0.2/"
export PATH="$PATH:${JAVA_HOME}/bin"
java -version
