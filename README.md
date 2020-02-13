# AstronomyLess

ASTRONOMY LESSON v.1.0.0
This project is the the first version of web-learning platform which helps modern pupils remote study astronomy.
This version consists of front-end part and MySQL DB.
This is only desktop version which works only Google Chrome browser.
Mobile version will be released after 2nd version.

STACK OF DEVELOPMENT: HTML5/CSS/Bootstrap, JavaScript, JQuery,PHP, MySQL

INSTALLATION GUIDE.
1. Save 'install_package.zip' on different drive (on d:\);
2. Run install.bat;
2a) Press any key after install XAMPP will be finished;
3. Start Apache and MySQL on XAMPP Control panel;
3a) set codepage is 'utf8_general_ci';
4. Click Admin on MySQL line. phpMyAdmin is being run;
5. Create new database with name - 'solarsystem';
6. Create new user with name 'spaceman' and pass 'mask';
6a) set hostname - localhost;
7. Give him all data privilages (left column);
7a) Choose 'solarsystem' database;
8. Import table data from sql-file on 'db' folder;
9. Run lection_cp.bat;
10. Enter http://localhost/main.html for start using system.

MANUAL.
1. Change text on txt-file in C:\xampp\mysql\data\solarsystem\<name_planet>.txt if you want to change text lection.
Evert txt-file should end with '@' symbol.


FEATURES ON ASTRONOMY LESSON v.2.0.0
1. Client-Server architecture
2. Full authorization for access roles
3. Ability to change images, text and questions
4. Emailing
5. Chat between pupils and teachers.

If you have any comments, questions or propositions about project feel free to write me on 
email: dionisiy1986@gmail.com

# Change Log
verison 1.22.0 - Improve survey form ||
version 1.23.0 - Add installer ||
version 1.23.1 - Fixed some bugs which found during Installer test on different laptop
