
<?php

include "../../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");


getData("admins","admins_email = ?  AND admins_password = ? ",array($email,$password), "wrong email or password");


?>
