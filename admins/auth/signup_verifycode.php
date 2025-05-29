<?php

include "../../connect.php";

$email = filterRequest("email");
$otp = filterRequest("otp");


$stmt = $con->prepare("SELECT * FROM admins WHERE admins_email = ? AND  admins_verifycode = ? ");
$stmt->execute(array($email, $otp));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
    $stmt = $con->prepare("UPDATE admins SET admins_approve = 1  WHERE admins_email  = ? ");
    $stmt->execute(array($email));
    $count = $stmt->rowCount();
} else {
    echo json_encode(array("status" => "fail"));
}
