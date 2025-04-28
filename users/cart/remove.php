<?php

include "../../connect.php";

$userId = filterRequest("userId");
$itemId = filterRequest("itemId");

$stmt = $con->prepare("DELETE FROM `cart` WHERE `cart_userid`= ? AND `cart_itemid` = ?  ");
$stmt->execute(array($userId , $itemId));
$count = $stmt->rowCount();

if($count > 0){
    echo Json_encode(array("status" => "success"));
}else{
    echo Json_encode(array("status" => "fail"));

}


?>