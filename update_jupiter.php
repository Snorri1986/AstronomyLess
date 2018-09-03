<?php
// Connect and fetch data from MySQL Database for Mercury planet
$user = 'root';
$pass = 'DL05092015';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "DELETE FROM `jupiter` WHERE 1;";
$sql .= "LOAD DATA INFILE 'jupiter.txt'
         INTO TABLE solarsystem.jupiter
         CHARACTER SET utf8
         LINES TERMINATED BY '@'";

mysqli_multi_query($conn,$sql);

// Close connection to MySQL Database
mysqli_close($conn);
?>