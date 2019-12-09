FROM openjdk:14-windowsservercore-1809

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY ./fitnesse-standalone.jar /work/
COPY ./Fitsharp/x64/Release ./work/fitsharp
COPY ./lib_publish /work/lib_publish
COPY ./container_plugins.properties /work/plugins.properties

VOLUME C:/work/Fitnesse_Wiki

WORKDIR /work

ENTRYPOINT [ "java","-jar","./fitnesse-standalone.jar","-d","./Fitnesse_Wiki","-f","plugins.properties"]