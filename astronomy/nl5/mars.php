<?php
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "select code,start_date,end_date,
                staff,init_vehicle,time_duration,distance
                from skylab where code = 'SL-4'";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row

    while($row = $result->fetch_assoc()) {
      echo "<b>Mission code:</b>" . " " . $row["code"] . " " ."<br>";
      echo "<b>Mission start date:</b>" . " " . $row["start_date"] . " " ."<br>";
      echo "<b>Mission landing date:</b>" . " " . $row["end_date"] . "<br>";
      echo "<b>Crew members:</b>" . " " . $row["staff"] . "<br>";
      echo "<b>Vehicle name:</b>" . " " . $row["init_vehicle"] . "<br>";
      echo "<b>Mission flight duration:</b>" . " " . $row["time_duration"] . " " . "<br>";
      echo "<b>Mission distance:</b>" . " " . $row["distance"] . " " . "km" . "<br>";
    
      }
} else {
    echo "0 results";
}
mysqli_close($conn);
?>
