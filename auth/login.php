
<?php

include "../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");

$stmt = $con->prepare("SELECT * FROM `users` WHERE `user_email` =?  AND `user_password` =? ");
$stmt->execute(array($email,$password));
$userData = $stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0 ){
    echo json_encode(array("status" => "success" , "userData" => $userData));
}else{
    echo json_encode(array("status" => "fail" , "message" => "wrong email or password"));
}



?>
