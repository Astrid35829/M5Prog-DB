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
FindLeerlingen($conn);
$search = $_GET["search"];
echo $search;
echo '<br>';
print_r($_GET);
echo '<br>';
FindLeerling($conn,$search);
$conn->close();



