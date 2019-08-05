<?php
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");
$sql = "select Name,Weight,Capacity,Axis_period,Orbital_speed,Radius,Distance from planets where name = 'Mars'";
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Weight:" . " " . $row["Weight"] . " " . "kg" ."<br>";
        echo "Capasity:" . " " . $row["Capacity"] .  " " .  "km<sup>3</sup>" . "<br>";
        echo "Axis round period:" . " " . $row["Axis_period"] . " " . "days" . "<br>";
        echo "Orbital speed around Sun:" . " " . $row["Orbital_speed"] . " " . "km/sec" ."<br>";
        echo "Ecvator radius:" . " " . $row["Radius"] . " " . "km" ."<br>";
        echo "Distance to Earth: " . " " . $row["Distance"] . " " . "km" . "<br>";

    }
} else {
    echo "0 results";
}
mysqli_close($conn);
?>
