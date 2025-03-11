<?php

include "../connect.php";

$addressName = filterRequest("addressName");
$userid = filterRequest("userid");
$goverId = filterRequest("goverId");
$cityID = filterRequest("cityId");
$street = filterRequest("street");
$lat = filterRequest("lat");
$long = filterRequest("long");

$stmt = $con->prepare("INSERT INTO `address` 
(address_name , address_userid, address_gover , address_city, address_street  ,address_lat ,address_long)
VALUES (?,?,?,?,?,?,?)" );
$stmt->execute(array($addressName, $userid, $goverId , $cityID ,$street,$lat,$long ));

$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));

}

?>