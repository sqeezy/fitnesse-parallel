dotnet publish .\AdapterLib\ -c Release -r win-x86 -o lib_publish
java -jar .\fitnesse-standalone.jar -d .\FitNesseRoot -f .\plugins.properties