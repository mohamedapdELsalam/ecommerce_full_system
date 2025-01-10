<?php
$dsn = "mysql:host=sql111.infinityfree.com;dbname=if0_37990508_mohamedNoteApp";
$user = "if0_37990508";
$pass = "LzPG0nekOufB0hZ";
$option = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);

try {
    $con = new PDO($dsn, $user, $pass, $option);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";


header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");

    include "functions.php";
    // checkAuthenticate();
} catch (PDOException $e) {
    echo $e->getMessage();
}
