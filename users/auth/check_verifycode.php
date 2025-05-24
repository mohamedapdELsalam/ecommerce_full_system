<?php

include "../../connect.php";

$email = filterRequest("email");
$otp = filterRequest("otp");


$stmt = $con->prepare("SELECT * FROM users WHERE user_email = ? AND  user_verifycode = ? ");
$stmt->execute(array($email, $otp));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
    
} else {
    echo json_encode(array("status" => "fail"));
}
