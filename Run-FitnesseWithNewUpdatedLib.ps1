dotnet publish .\AdapterLib\ -c Release -r win-x86 -o lib_publish
docker build -t fitnesse:latest .
"====================== In Container Run ======================"
docker run --rm -v "$(Resolve-Path ./FitNesseRoot):C:/work/Fitnesse_Wiki" fitnesse -c "FrontPage.FirstLevelSuite?suite&format=text"
"====================== Outside Run ==========================="
java -jar .\fitnesse-standalone.jar -d .\FitNesseRoot -f .\plugins.properties -c "FrontPage.FirstLevelSuite?suite&format=text"