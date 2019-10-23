<?php
// Connect and fetch data from MySQL Database for Mercury-Redstone-3
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "select mission_code,team_count,members_name,start_mission,end_mission,vehicle_arrive,vehicle_departure from iss_missions where mission_code = 'ISS-1-6'";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {

        echo "<b>Missions code:</b>" . " " . $row["mission_code"] . " " ."<br>";
        echo "<b>Mission team count:</b>" . " " . $row["team_count"] .  " " . "<br>";
        echo "<b>Members:</b>" . " " . $row["members_name"] . " " . "<br>";
        echo "<b>Mission start date:</b>" . " " . $row["start_mission"] . " " . "<br>";
        echo "<b>Mission end date:</b>" . " " . $row["end_mission"] . " " ."<br>";
        echo "<b>Vehicle arrive to ISS:</b>" . " " . $row["vehicle_arrive"] . " " . "<br>";
        echo "<b>Vehicle departure from ISS:</b>" . " " . $row["vehicle_departure"] . " " . "<br>";
        
   }
} else {
    echo "0 results";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>
