<?php

include "../connect.php";

$userId = filterRequest("userId");

$stmt = $con->prepare("SELECT * FROM `cart` WHERE  `cart_userid`= ?");
$stmt->execute(array($userId));
$count = $stmt->rowCount();
$data = $stmt->fetchAll(PDO ::FETCH_ASSOC);

if($count > 0){
    echo Json_encode(array("status" => "success", "data" => $data));
}else{
    echo Json_encode(array("status" => "fail"));

}


?>