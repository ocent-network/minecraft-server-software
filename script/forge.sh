#!/bin/bash

cd forge-build

array=(
  "1.21.1-52.0.2"
  "1.21.1-52.0.16"
  "1.21-51.0.33"
  "1.20.6-50.1.19"
  "1.20.4-49.1.10"
  "1.20.3-49.0.2"
  "1.20.2-48.1.0"
  "1.20.1-47.3.10"
  "1.20-46.0.14"
  "1.19.4-45.3.6"
  "1.19.3-44.1.23"
  "1.19.2-43.4.4"
  "1.19.1-42.0.9"
  "1.19-41.1.0"
  "1.18.2-40.2.21"
  "1.18.1-39.1.2"
  "1.18-38.0.17"
  "1.17.1-37.1.1"
  "1.16.5-36.2.42"
  "1.16.4-35.1.37"
  "1.16.3-34.1.42"
  "1.16.2-33.0.61"
  "1.16.1-32.0.108"
  "1.15.2-31.2.57"
  "1.15.1-30.0.51"
  "1.15-29.0.4"
  "1.14.4-28.2.26"
  "1.14.3-27.0.60"
  "1.14.2-26.0.63"
  "1.13.2-5.0.223"
  "1.12.2-14.23.5.2860"
  "1.12.1-14.22.1.2485"
  "1.12-14.21.1.2443"
  "1.11.2-13.20.1.2588"
  "1.11-13.19.1.2199"
  "1.10.2-12.18.3.2511"
  "1.10-12.18.0.2000"
  "1.9.4-12.17.0.2317"
  "1.9-12.16.1.1938"
  "1.8.9-11.15.1.2318"
  "1.8.8-11.15.0.1655"
  "1.8-11.14.4.1577"
)

for i in "${!array[@]}";   
do 

# 删除forge-build
mkdir forge-${array[$i]}

cd forge-${array[$i]}

echo "https://maven.minecraftforge.net/net/minecraftforge/forge/${array[$i]}/forge-${array[$i]}-installer.jar"

curl -o installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/${array[$i]}/forge-${array[$i]}-installer.jar

# https://maven.minecraftforge.net/net/minecraftforge/forge/1.21-51.0.32/forge-1.21-51.0.32-installer.jar
# 构建服务端
java -jar installer.jar nogui --installServer

# 删除无用文件
rm installer.jar
# rm installer.jar.log
# rm README.txt
# rm run.bat
# rm run.sh

# 修改forge核心名为 forge.jar
find ./ -name "*.jar" -exec mv {} ./forge.jar \;

# 打包

zip -r forge.zip ./


mv ./forge.zip ../../forge-list/forge-${array[$i]}.zip

cd ..

done
