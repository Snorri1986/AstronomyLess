<?php
// Connect and fetch data from MySQL Database for Mercury planet
$user = 'root';
$pass = 'DL05092015';
$db = 'solarSystem';

// Establish connection
$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");
$sql = "select Name,Weight,Capacity,Axis_period,Orbital_speed,Radius,Distance from planets where name = 'Mercury'";
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result = $conn->query($sql);

// Display data
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Масса:" . " " . $row["Weight"] . " " . "kg" ."<br>";
        echo "Oб'єм:" . " " . $row["Capacity"] .  " " .  "km<sup>3</sup>" . "<br>";
        echo "Період обертання навколо осі:" . " " . $row["Axis_period"] . " " . "days" . "<br>";
        echo "Орбітальна швидкість обернення навколо Сонця:" . " " . $row["Orbital_speed"] . " " . "km/sec" ."<br>";
        echo "Екваторіальний радіус:" . " " . $row["Radius"] . " " . "km" ."<br>";
        echo "Відстань від Землі: " . " " . $row["Distance"] . " " . "km" . "<br>";

    }
} else {
    echo "0 results";
}
// Close connection to MySQL Database
mysqli_close($conn);
?>