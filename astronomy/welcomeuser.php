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

if(isset($_GET['n_email'])) { 
$usr_mail = $_GET['n_email']; 
} 

if(isset($_GET['password'])) { 
$usr_pass = $_GET['password']; 
}


/* Added new value @our_type 03.12.2018 */
$call = mysqli_prepare($conn,"CALL GetUser(?, ?, ?, ?,@our_name,@our_surname,@our_type)");
$call->bind_param('ssss',$usr_name,$usr_surname,$usr_mail,$usr_pass);
$call->execute();

/* Added new value @our_type 03.12.2018 */
$select = mysqli_query($conn,"SELECT @our_name, @our_surname, @our_type");
$result = $select->fetch_assoc();


$fetched_type = $result['@our_type']; // new 03.12.2018
$fetched_name = $result['@our_name'];
$fetched_surname = $result['@our_surname'];

echo $fetched_type." ".$fetched_name." ".$fetched_surname; // new code 04.12.2018

$conn->close();
?>