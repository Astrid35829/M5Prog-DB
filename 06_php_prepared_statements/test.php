<?php

include 'gehacked.php';

function ConnectToDatabase($DB_HOST, $SB_USER, $DB_PASSWORD, $SCHEMA_NAME)
{
    $conn = new mysqli($DB_HOST, $SB_USER, $DB_PASSWORD, $SCHEMA_NAME);
    if($conn->connect_error)
    {
        echo "error try again\r\n";
    }
    echo "connected to database\r\n";
    return $conn;
}

$conn = ConnectToDatabase($DB_HOST, $SB_USER, $DB_PASSWORD, $SCHEMA_NAME);
try{
    $students = GetAllStudents($conn);
    print_r($students);
    $students = GetAllStudentsByNaam($conn)
}

?>