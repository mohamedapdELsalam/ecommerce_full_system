<?php

include "../connect.php";

$coupon = filterRequest("coupon");
$currentDate = date("Y-m-d H:i:s");
getData(
 "coupon","coupon_code = ?
  AND  coupon_expired_date > ?
  AND coupon_count > 0" ,
  array($coupon,$currentDate));


?>