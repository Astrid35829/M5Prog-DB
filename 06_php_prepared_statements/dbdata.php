<?php
    $envSettings = []; //variable with array.
        if (file_exists(dirname(__FILE__).'/.env')) { //als deze file bestaat met .env erachter
            $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); //maak het dan de variable
        }

    $databaseServer = $envSettings['DB_HOST'];
    $user = $envSettings['DB_USER'];
    $pass = $envSettings['DB_PASSWORD'];
    $schema= $envSettings['DB_SCHEMA_NAME'];
?>