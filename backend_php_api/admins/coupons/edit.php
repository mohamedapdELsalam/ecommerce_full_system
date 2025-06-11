<?php

include "../../connect.php";

$code = filterRequest("code");
$discount = filterRequest("discount");
$couponCount = filterRequest("count");
$expiredDate = filterRequest("expiredDate");
$couponId = filterRequest("couponId");



$stmt = $con->prepare("UPDATE coupon SET coupon_code = ?, coupon_discount=?, coupon_count=?, coupon_expired_date=? WHERE coupon_id =?");
$stmt->execute(array($code,$discount,$couponCount,$expiredDate,$couponId));
$count = $stmt->rowCount();
if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
