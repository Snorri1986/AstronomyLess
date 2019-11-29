<?php
// Connect and fetch data from MySQL Database for name of button
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");
$sql = "select event_date from events where solarsystem.getCurrentDate() = substring(event_date,6,6)"; 
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["event_date"];
    }
} else {
    echo "No information";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>
