<?php
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
if(isset($_GET['username'])) {
$usr_name = $_GET['username'];

}

if(isset($_GET['usersurname'])) {
$usr_surname = $_GET['usersurname'];

}

if(isset($_GET['password'])) {
$usr_pass = $_GET['password'];

}

/* new code 19.11.2018 */
if(isset($_GET['t_type'])) {
    $usr_type = "T";  
}

if(isset($_GET['p_type'])) {
    $usr_type = "P";  
}
/**********************/

//$usr_type = "P";  /*pupil*/ 

if(isset($_GET['n_email'])) {
$usr_mail = $_GET['n_email'];

}

// test code 19.11.2018
if(isset($_GET['tabel'])) {
  $usr_interactid = $_GET['tabel'];
}
//

$sql = "INSERT INTO users(name, surname, type, email, interactid, table_num, user_pass) 
VALUES (?,?,?,?,?,?,?)";

$stmt = $conn->prepare($sql);

// ssssiis - type of arguments
$stmt->bind_param('ssssiis',$usr_name,$usr_surname,$usr_type,$usr_mail,$usr_interactid,$usr_tabnum,$usr_pass);


$stmt->execute();

$conn->close();

// redirection to the main page
header("Location:main.html");
exit;

?>