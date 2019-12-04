FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


RUN cinst jdk8 -y

#RUN New-NetFirewallRule -DisplayName "Fitsharp" -Direction Inbound -Program "C:/work/fitsharp/lib/net452/Runner.exe" -Action Allow -LocalAddress Any -RemoteAddress Any -Authentication NotRequired -Protocol TCP


COPY ./fitnesse-standalone.jar /work/

COPY ./fitsharp.2.7.1/ ./work/fitsharp

#RUN netsh advfirewall firewall add rule name="Fitsharp" dir=in action=allow program="C:\\work\\fitsharp\\x64\\Release\\Runner.exe" enable=yes

COPY ./lib_publish /work/lib_publish

COPY ./container_plugins.properties /work/plugins.properties

VOLUME C:/work/Fitnesse_Wiki

WORKDIR /work

EXPOSE 80

ENTRYPOINT [ "java","-jar","./fitnesse-standalone.jar","-d","./Fitnesse_Wiki","-f","plugins.properties"]