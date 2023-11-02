<?php

include_once 'dbdata.php';
$conn = new mysqli($databaseServer, $user, $pass, $schema);
if($conn->connect_error)
{
    die("error try again\r\n");
}

echo "connected to database\r\n";
echo '<br>';
$naam = "mario";
$leeftijd = "18";
$sql = "SELECT * FROM leerlingen WHERE naam=? or leeftijd=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $naam, $leeftijd);
$stmt->execute();
$result = $stmt->get_result();
var_dump($result->fetch_all(MYSQLI_ASSOC));
$conn->close();