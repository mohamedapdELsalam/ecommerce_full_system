<?php

include "../../connect.php";

$itemId = filterRequest("itemId");
$userId = filterRequest("userId");

$stmt = $con->prepare("INSERT INTO `cart` (`cart_itemid`, `cart_userid`) VALUES (?,?)");
$stmt->execute(array($itemId , $userId));
$count = $stmt->rowCount();

$stmt = $con->prepare("SELECT COUNT(cart.cart_id)  FROM `cart` WHERE cart_itemid = ? AND cart_userid =? AND cart_orders = 0");
$stmt->execute(array($itemId , $userId));
$data = $stmt->fetchColumn();
if($count > 0){
    echo Json_encode(array("status" => "success" , "count" => $data));
}else{
    echo Json_encode(array("status" => "fail","count" => $dataS));

}


?>