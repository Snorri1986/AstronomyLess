<?php
// Connect and fetch data from MySQL Database for Mercury planet
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "DELETE FROM `pluto` WHERE 1;";
$sql .= "LOAD DATA INFILE 'pluto.txt'
         INTO TABLE solarsystem.pluto
         CHARACTER SET utf8
         LINES TERMINATED BY '@'";

mysqli_multi_query($conn,$sql);

// Close connection to MySQL Database
mysqli_close($conn);
?>