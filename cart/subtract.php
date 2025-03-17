<?php

include "../connect.php";

$userId = filterRequest("userId");
$itemId = filterRequest("itemId");

$stmt = $con->prepare("DELETE FROM `cart` WHERE cart_id = (SELECT `cart_id` FROM `cart` WHERE `cart_userid`= ? AND `cart_itemid` = ? AND `cart_orders` = 0 LIMIT 1) ");
$stmt->execute(array($userId , $itemId));
$count = $stmt->rowCount();

$stmt = $con->prepare("SELECT COUNT(cart.cart_id) FROM `cart` WHERE cart_itemid = ? AND cart_userid =? AND `cart_orders` = 0");
$stmt->execute(array($itemId , $userId));
$data = $stmt->fetchColumn();

if($count > 0){
    echo Json_encode(array("status" => "success","count" => $data));
}else{
    echo Json_encode(array("status" => "fail","count" => $data));

}


?>