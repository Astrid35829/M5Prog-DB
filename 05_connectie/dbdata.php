<?php
    $envSettings = []; //variable with array.
        if (file_exists(dirname(__FILE__).'/.env')) { //als deze file bestaat met .env erachter
            $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); //maak het dan de variable
        }

    $DB_NAME = $envSettings['DB_NAME'];
    $DB_USER = $envSettings['DB_USER'];
    $DB_PASSWORD = $envSettings['DB_PASSWORD'];
    $DB_HOST = $envSettings['DB_HOST'];
?>