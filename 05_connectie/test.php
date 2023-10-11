<?php

include 'dbdata.php';
$mysqli = mysqli_connect($DB_HOST, $DB_USER, $DB_PASSWORD, $DB_NAME);
$result = mysqli_query($mysqli, "SELECT * FROM test");
$row = mysqli_fetch_assoc($result);
print_r($row["idtest"]);