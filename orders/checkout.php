<?php

include "../connect.php";

$userId = filterRequest("userId");
$totalPrice = filterRequest("totalPrice");
$deliveryPrice = filterRequest("deliveryPrice");
$couponId = filterRequest("couponId");
$paymentMethod = filterRequest("paymentMethod");
$deliveryType = filterRequest("deliveryType");
$addressId = filterRequest("addressId");

<<<<<<< HEAD
if($deliveryType == "1"){
  $deliveryPrice = 0 ;
}


$stmt = $con->prepare("INSERT INTO orders 
(orders_userid,orders_totalPrice,orders_deliveryPrice,orders_coupon,orders_paymentMethod,orders_deliveryType,orders_addressId)
VALUES(?,?+$deliveryPrice,?,?,?,?,?) ");
=======

$stmt = $con->prepare("INSERT INTO orders 
(orders_userid,orders_totalPrice,orders_deliveryPrice,orders_coupon,orders_paymentMethod,orders_deliveryType,orders_addressId)
VALUES(?,?,?,?,?,?,?) ");
>>>>>>> 89aa7d24cb52dc80b0180d71eb63034ac8d5f839
$stmt->execute(array($userId,$totalPrice,$deliveryPrice,$couponId,$paymentMethod,$deliveryType,$addressId));
$count = $stmt->rowCount();

if($count > 0){

  $stmt = $con->prepare("SELECT MAX(orders_id) FROM orders");
  $stmt->execute();
  $orderId = $stmt->fetchColumn();
  $count = $stmt->rowCount();
  if($count > 0){
<<<<<<< HEAD
    $stmt = $con->prepare("UPDATE cart SET cart_orders = ? Where cart_userid = ? AND cart_orders = 0;
     UPDATE coupon SET coupon_count =  coupon_count -1 WHERE coupon_id = ?");
    $stmt->execute(array($orderId,$userId,$couponId));
=======
    $stmt = $con->prepare("UPDATE cart SET cart_orders = ? Where cart_userid = ? AND cart_orders = 0");
    $stmt->execute(array($orderId,$userId));
>>>>>>> 89aa7d24cb52dc80b0180d71eb63034ac8d5f839
    $count = $stmt->rowCount();
    if($count > 0 ){
        echo json_encode(array("status" => "success"));
    }else{
        echo json_encode(array("status" => "fail" , "msg" => "fail in sub query"));
    }

  }else{
    echo json_encode(array("status" => "fail" ,"msg" => "fail main query"));
  }

   
}else{
    echo json_encode(array("status" => "fail" ,"msg" => "fail main query"));
}

?>