<?php

include "../../connect.php";

$couponId = filterRequest("couponId");

$stmt = $con->prepare("DELETE FROM coupon WHERE coupon_id = ?");
$stmt->execute(array($couponId));
$count = $stmt->rowCount();
if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
