<?php
function FindLeerlingen($conn)
{
    $q = "select * from leerlingen;";
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result)
    {
        for($i=0; $i < $result->num_rows; $i++)
        {
            $row = $result->fetch_assoc();
            print_r($row);
            echo '<br>';
        }
    }
}

function FindLeerling($conn,$name)
{
    $q = "select * from leerlingen where naam = '$name';";
    $stmt = $conn->prepare($q);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result)
    {
        for($i=0; $i < $result->num_rows; $i++)
        {
            $row = $result->fetch_assoc();
            print_r($row);
            echo '<br>';
        }
    }
}

include_once 'dbdata.php';
$conn = new mysqli($databaseServer, $user, $pass, $schema);
if($conn->connect_error)
{
    die("error try again\r\n");
}

echo "connected to database\r\n";
echo '<br>';
$naam = "Kira";
$sql = "SELECT * FROM leerlingen WHERE naam=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $naam);
$stmt->execute();
$result = $stmt->get_result();
var_dump($result->fetch_all(MYSQLI_ASSOC));
$conn->close();