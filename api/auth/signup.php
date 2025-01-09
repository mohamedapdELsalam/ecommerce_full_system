<?php

include "../connect.php";

$userName = filterRequest("userName");
$email = filterRequest("email");
$phone = filterRequest("phone");
$password = filterRequest("password");

global $error;

$stmt = $con->prepare("SELECT * FROM `users` WHERE `user_email` = ?");
$stmt->execute(array($email));
$count = $stmt->rowCount();
if($count > 0){
    $error[]= "this email is already existed";
}
$stmt = $con->prepare("SELECT * FROM `users` WHERE `user_phone` = ?");
$stmt->execute(array($phone));

$count = $stmt->rowCount();
if($count > 0){
    $error[]= "this phone is already existed";
}

if(!empty($error)){
    echo json_encode(array("status" => "fail" , "message" => $error));
    return;
}

$stmt = $con->prepare("INSERT INTO `users` (user_name,user_email,user_phone,user_password) VALUES (?,?,?,?) ");
$stmt->execute(array($userName,$email,$phone,$password));
$count = $stmt->rowCount();

if($count > 0 ){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
exit;


?>