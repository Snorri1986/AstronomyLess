<?php

// 21.11.2018 in test 

$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

mysqli_query($conn,"SET NAMES 'utf8'");

//user attribs
/*if(isset($_GET['username'])) {
$usr_name = $_GET['username'];

}

if(isset($_GET['usersurname'])) {
$usr_surname = $_GET['usersurname'];

}

if(isset($_GET['n_email'])) {
$usr_mail = $_GET['n_email'];

}

if(isset($_GET['password'])) {
$usr_pass = $_GET['password'];

}*/

$usr_name = "Denys";
$usr_surname = "Shabelnyk";
$usr_mail = "dionisiy1986@gmail.com";
$usr_pass = "1234567890";



//$call = $mysqli->prepare('CALL GetUser(?, ?, ?, ?,@our_name,@our_surname)');
$call = mysqli_prepare($conn,"CALL GetUser(?, ?, ?, ?,@our_name,@our_surname)");
$call->bind_param('ssss',$usr_name,$usr_surname,$usr_mail,$usr_pass);
$call->execute();

// analyze result
//$select = $mysqli->query('SELECT @our_name, @our_surname');
$select = mysqli_query($conn,"SELECT @our_name, @our_surname");
$result = $select->fetch_assoc();

$fetched_name = $result['@our_name'];
$fetched_surname = $result['@our_surname'];

echo "Вітаємо," . " " . $fetched_name . " " . $fetched_surname . "<br>";

$conn->close();

// redirection to the main page test code 21.11.2018
//header("Location:main.html");
//exit;
?>