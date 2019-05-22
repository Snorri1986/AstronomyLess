<?php
// Connect and fetch data from MySQL Database for Mercury planet
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "DELETE FROM `venus` WHERE 1;";
$sql .= "LOAD DATA INFILE 'venus.txt'
         INTO TABLE solarsystem.venus
         CHARACTER SET utf8
         LINES TERMINATED BY '@'";

mysqli_multi_query($conn,$sql);

// Close connection to MySQL Database
mysqli_close($conn);
?>