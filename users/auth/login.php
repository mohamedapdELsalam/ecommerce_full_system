
<?php

include "../../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");


getData("users","user_email = ?  AND user_password = ? ",array($email,$password), "wrong email or password");


?>
