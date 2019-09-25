<?php
// Get 15st question for default lesson

$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");
mysqli_query($conn,"SET NAMES 'utf8'");
$sql = "select text from questions where id = 15 and lesson_num = 1"; 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["text"];
    }
} else {
    echo "0 results";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>
