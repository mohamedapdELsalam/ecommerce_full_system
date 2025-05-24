<?php

include "../../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");

$stmt = $con->prepare("UPDATE users SET user_password = ? WHERE user_email = ?");
$stmt->execute(array($password, $email));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "fail"));
}
