<?php
// Connect and fetch data from MySQL Database for name of button

$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "select name from lections_b where button_number = 2 and lesson_number = 3";


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["name"];
    }
} else {
    echo "0 results";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>
