<?php

include "../connect.php";
$address_id = filterRequest("address_id");
$city = filterRequest("city");
$street = filterRequest("street");
$long = filterRequest("long");
$lat = filterRequest("lat");

$stmt = $con->prepare("UPDATE `address` 
SET address_city = ? , address_street  =?, address_long =? ,address_lat =? 
WHERE `address_id` = ? " );
$stmt->execute(array($city,$street,$long,$lat ,$address_id));

$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));

}

?>