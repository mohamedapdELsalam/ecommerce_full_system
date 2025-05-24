<?php

include "../../connect.php";

$email = filterRequest("email");
$otp = filterRequest("otp");


$stmt = $con->prepare("SELECT * FROM users WHERE user_email = ? AND  user_verifycode = ? ");
$stmt->execute(array($email, $otp));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
    $stmt = $con->prepare("UPDATE users SET user_approve = 1  WHERE user_email  = ? ");
    $stmt->execute(array($email));
    $count = $stmt->rowCount();
} else {
    echo json_encode(array("status" => "fail"));
}
