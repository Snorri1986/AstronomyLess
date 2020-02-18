0. You must disable UAC(User account control) and restart you PC
1. Download XAMPP and move file to the folder where you unziped archive.
Application's file must be inside only one folder.Example: archive\files
I suggest to use latest version: xampp-windows-x64-7.4.2-0-VC15-installer
2. If name of file is not equal as "xampp-win32-7.2.0-0-VC15-installer.exe" you must open 
in text editor file "data.properties" and change parameter value "xampp_file_name" and save data.properties file.
3. Open powershell console. Go to the folder where you extract archive and write command:
java -jar Installer.jar, press Enter and follow by instractions. If you don't have JRE installed - do it right now.
If you get error - run powershell with administration priviliges.
If during installation your PC wants to reboot. Do it. It's normal. Then repeat step 3 and skip xampp installation.
3a. XAMPP must be installed on the same drive where stored the archive.
4.After succesfull XAMPP instalattion and configuration - run xampp and start Apache,MySQL,Tomcat
After all parts loaded, click on Admin button on MySQL part
5.Create new database with name "solarsystem"
Import database file to new DB. Go to the folder where you unziped archive. And import sql file from "db" folder.
6.Create new database user. It must have login "spaceman" and password  = "mask". Get it all on select,insert,update,delete,file
7.Write http://localhost/astronomy/login.html to get main page
8.For use application you must create account. Press Register button and fill all fields.
Thank you!