
<?php

include "../connect.php";

$userId = filterRequest("userId");



 


 getAllData("favorite","favorite_userid = $userId");



?>

