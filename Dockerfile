FROM openjdk:14-windowsservercore-1809

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco feature enable -n allowglobalconfirmation
RUN cinst dotnet-desktopruntime

COPY ./fitnesse-standalone.jar /work/
COPY ./Fitsharp ./work/fitsharp
COPY ./suiteconfig.xml ./work/fitsharp/suiteconfig.xml
COPY ./lib_publish /work/lib_publish
COPY ./container_plugins.properties /work/plugins.properties

VOLUME C:/work/Fitnesse_Wiki

WORKDIR /work

ENTRYPOINT [ "java","-jar","./fitnesse-standalone.jar","-d","./Fitnesse_Wiki","-f","plugins.properties"]