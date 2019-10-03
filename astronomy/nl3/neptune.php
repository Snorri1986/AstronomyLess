<?php
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");

$sql = "select rocket_name,height,diameter,mass,stages,payload,engines,thrust from vehicles where mission = 'Apollo 14&15'";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
      echo "<b>Rocket Name:</b>" . " " . $row["rocket_name"] . " " ."<br>";
      echo "<b>Height:</b>" . " " . $row["height"] .  " " .  "meters" . "<br>";
      echo "<b>Diameter:</b>" . " " . $row["diameter"] . " " . "meters" . "<br>";
      echo "<b>Mass:</b>" . " " . $row["mass"] . " " . "kg" ."<br>";
      echo "<b>Stages:</b>" . " " . $row["stages"] . " " ."<br>";
      echo "<b>Payload:</b>" . " " . $row["payload"] . " " . "kg" . "<br>";
      echo "<b>Engines:</b>" . " " . $row["engines"] . " " . "<br>";
      echo "<b>Thrust:</b>" . " " . $row["thrust"] . " " . "kN" . "<br>";

}
} else {
    echo "0 results";
}
mysqli_close($conn);
?>
