dotnet publish .\AdapterLib\ -c Release -o lib_publish
java -jar .\fitnesse-standalone.jar -d .\FitNesseRoot -f .\plugins.properties -p 8080 #-c "FrontPage.FirstLevelSuite?suite&format=text"