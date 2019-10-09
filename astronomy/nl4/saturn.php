<?php
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");


$sql = "select mission_code,vehicle_name,flight_number,
                Launch_pad,start_date,landing_date,
                flight_duration,turns_count,distance,
                orbit_altitude from sts where mission_code = 'STS-88'";



if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "<b>Mission code:</b>" . " " . $row["mission_code"] . " " ."<br>";
      echo "<b>Vehicle name:</b>" . " " . $row["vehicle_name"] . "<br>";
      echo "<b>Flight number:</b>" . " " . $row["flight_number"] . "<br>";
      echo "<b>Launch pad:</b>" . " " . $row["Launch_pad"] ."<br>";
      echo "<b>Mission start date:</b>" . " " . $row["start_date"] . " " ."<br>";
      echo "<b>Mission landing date:</b>" . " " . $row["landing_date"] . "<br>";
      echo "<b>Mission flight duration:</b>" . " " . $row["flight_duration"] . " " . "<br>";
      echo "<b>Turns count:</b>" . " " . $row["turns_count"] . "<br>";
      echo "<b>Mission distance:</b>" . " " . $row["distance"] . " " . "km" . "<br>";
      echo "<b>Flight orbit altitude:</b>" . " " . $row["orbit_altitude"] . " " . "km" . "<br>";
  }
} else {
    echo "0 results";
}
mysqli_close($conn);
?>
