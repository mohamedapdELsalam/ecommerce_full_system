<?php
include "../../connect.php";

$email = filterRequest("email");

$stmt = $con->prepare("SELECT * FROM users WHERE user_email =?");
$stmt->execute(array($email));
$count = $stmt->rowCount();
if ($count > 0) {
    $otp = rand(100000, 999999);
    $stmt = $con->prepare("UPDATE users SET user_verifycode = ? WHERE user_email =? ");
    $stmt->execute(array($otp, $email));
    $count = $stmt->rowCount();
    if ($count > 0) {
        sendVerifyCode($email, "mohamed apdelsalam", $otp);
        echo json_encode(array("status" => "success", "verifyCode" => $otp));
    } else {
        echo json_encode(array("status" => "fail", "msg" => "error"));
    }
} else {
    echo json_encode(array("status" => "fail", "msg" => "this is email not found"));
}
