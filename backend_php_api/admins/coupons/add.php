<?php

include "../../connect.php";

$code = filterRequest("code");
$discount = filterRequest("discount");
$count = filterRequest("count");
$expiredDate = filterRequest("expiredDate");

$count = getAllData("coupon","coupon_code =?",array($code),"",false);
if($count >0){
    echo json_encode(array("status"=>"fail" ,"msg" => "this code is already existed"));
    return;
}


$stmt = $con->prepare("INSERT INTO coupon (coupon_code, coupon_discount, coupon_count, coupon_expired_date) VALUES (?,?,?,?)");
$stmt->execute(array($code,$discount,$count,$expiredDate));
$count = $stmt->rowCount();
if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
