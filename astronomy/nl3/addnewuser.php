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

if(isset($_GET['n_email'])) {
$usr_mail = $_GET['n_email'];

}

// new code 19.11.2018
if(isset($_GET['tabel'])) {
  $usr_tabnum = $_GET['tabel'];
}
//


// new code 19.11.2018
if($usr_type == 'T' && $usr_tabnum == NULL) {
	$conn->close();
	header("Location:main.html");
	exit;
}
//

$sql = "INSERT INTO users(name, surname, type, email, interactid, table_num, user_pass) 
VALUES (?,?,?,?,?,?,?)";

$stmt = $conn->prepare($sql);

// ssssiis - type of arguments
$stmt->bind_param('ssssiis',$usr_name,$usr_surname,$usr_type,$usr_mail,$usr_interactid,$usr_tabnum,$usr_pass);


$stmt->execute();

$conn->close();

// redirection to the main page new code 19.11.2018
header("Location:main.html");
exit;

?>