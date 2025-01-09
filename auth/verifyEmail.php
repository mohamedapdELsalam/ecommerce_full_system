
<?php

include "../connect.php";

$email = filterRequest("email");
$title ="hi";
$body = "hello iam mohamed";
$header ="From:mohamed@gmail.com";
mail($email,$title,$body,$header);


?>