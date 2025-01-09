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

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
    header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
    include "functions.php";
    // checkAuthenticate();
} catch (PDOException $e) {
    echo $e->getMessage();
}
