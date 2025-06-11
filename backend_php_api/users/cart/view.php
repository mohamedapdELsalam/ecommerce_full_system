<?php

include "../../connect.php";

ob_start();
$userId = filterRequest("userId");

$data = getAllData("cartView","cart_userid= ? AND cartview.cart_orders = 0",array($userId),"none",false );



$data = getAllData("cartView","cart_userid= ?",array($userId),"none",false );

$stmt = $con->prepare("SELECT Sum(cartview.count) AS amount, Sum(cartview.totalPrice) AS cartTotalPrice FROM `cartview` 
WHERE cartview.cart_userid = ?
GROUP BY cartview.cart_userid;");

$stmt->execute(array($userId));
$count = $stmt->rowCount();
$countAndPrice = $stmt->fetch(PDO::FETCH_ASSOC);

$allData = array();
$allData["status"] = "success";
$allData["data"] = $data;
$allData["countAndPrice"] = $countAndPrice;
ob_end_clean(); 
echo json_encode($allData);


?>