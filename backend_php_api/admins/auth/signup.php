<?php

include "../../connect.php";

$adminName = filterRequest("adminName");
$email = filterRequest("email");
$phone = filterRequest("phone");
$password = filterRequest("password");

global $error;

$stmt = $con->prepare("SELECT * FROM `admins` WHERE `admins_email` = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();
if($count > 0){
    $error[]= "this email is already existed";
}
$stmt = $con->prepare("SELECT * FROM `admins` WHERE `admins_phone` = ?");
$stmt->execute(array($phone));

$count = $stmt->rowCount();
if($count > 0){
    $error[]= "this phone is already existed";
}

if(!empty($error)){
    echo json_encode(array("status" => "fail" , "message" => $error));
    return;
}

$stmt = $con->prepare("INSERT INTO `admins` (admins_name,admins_email,admins_phone,admins_password) VALUES (?,?,?,?) ");
$stmt->execute(array($adminName,$email,$phone,$password));
$count = $stmt->rowCount();

if($count > 0 ){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
exit;


?>