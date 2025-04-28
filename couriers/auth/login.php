
<?php

include "../../connect.php";

$email = filterRequest("email");
$password = filterRequest("password");


getData("couriers","couriers_email = ?  AND couriers_password = ? ",array($email,$password), "wrong email or password");


?>
