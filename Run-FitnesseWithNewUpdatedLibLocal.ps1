dotnet publish .\AdapterLib\ -c Release -f net5.0-windows -o lib_publish
java -jar .\fitnesse-standalone.jar -d .\FitNesseRoot -f .\plugins.properties -v