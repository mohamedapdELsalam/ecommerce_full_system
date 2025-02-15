<?php

include "../connect.php";

$itemId = filterRequest("itemId");
$userId = filterRequest("userId");

$stmt = $con->prepare("INSERT INTO `cart` (`cart_itemid`, `cart_userid`) VALUES (?,?)");
$stmt->execute(array($itemId , $userId));
$count = $stmt->rowCount();

if($count > 0){
    echo Json_encode(array("status" => "success"));
}else{
    echo Json_encode(array("status" => "fail"));

}


?>