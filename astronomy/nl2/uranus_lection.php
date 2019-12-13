<?php
// Connect and fetch data from MySQL Database for Mercury planet

$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

mysqli_query($conn,"SET NAMES 'utf8'");

$sql = "SELECT `lection_txt` FROM `lections` WHERE `buttonnum` = 25";
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysqli_set_charset($conn,"utf8");

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["lection_txt"];
    }
} else {
    echo "0 results";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>
