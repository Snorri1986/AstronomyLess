
:: installation file for Astronomy Lesson v.1.0.0
:: Author: Denys Shabelnyk
:: Date: 04.09.2018

echo Install XAMPP...

:: temporary folder. !!!! 

rem Choose drive c:\ on installation wizard as destination folder for XAMPP

rem Press any key when installation process is finished for continue...

start d:\install_package\xampp-win32-7.2.0-0-VC15-installer.exe
pause

echo copy files for apache web-server
:: move 'astronomy' folder to xampp\htdocs\...
mkdir c:\xampp\htdocs\astronomy
xcopy d:\install_package\astronomy c:\xampp\htdocs\astronomy 

echo copy configuration for database access
:: config.inc.php
::xcopy /-Y d:\install_package\config.inc.php c:\xampp\phpMyAdmin 
:: my.ini
::xcopy /-Y d:\install_package\my.ini C:\xampp\mysql\bin 

echo Enjoy:)

