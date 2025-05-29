<?php

include "../../connect.php";

$code = filterRequest("code");
$discount = filterRequest("discount");
$count = filterRequest("count");
$expiredDate = filterRequest("expiredDate");

$stmt = $con->prepare("INSERT INTO coupon (coupon_code, coupon_discount, coupon_count, coupon_expired_date) VALUES (?,?,?,?)");
$stmt->execute(array($code,$discount,$count,$expiredDate));
$count = $stmt->rowCount();
if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
