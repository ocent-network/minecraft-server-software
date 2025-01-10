#!/bin/bash

cd fabric-install

array=(
  "1.21.1"
  "1.21"
  "1.20.1"
  "1.20.2"
  "1.19.4"
  "1.19.3"
  "1.19.2"
  "1.18.2"
  "1.18.1"
  "1.16.5"
)

for i in "${!array[@]}";   
do 

if [[ ! -d fabric-${array[$i]} ]]; then
  # 删除forge-build
  mkdir fabric-${array[$i]}

  cd fabric-${array[$i]}

  cp ../../fabric-build/fabric-server-mc.${array[$i]}.jar ./server.jar

  java -jar server.jar

  # 修改fabric核心名为 fabric.jar
  # find ./ -maxdepth 1 -name "*.jar" ! -name "*fabric-server-mc*.jar" -exec mv {} ./server.jar \;

  # 打包
  zip -r fabric.zip ./

  mv ./fabric.zip ../../fabric-list/fabric-${array[$i]}.zip

  cd ..
fi

done
