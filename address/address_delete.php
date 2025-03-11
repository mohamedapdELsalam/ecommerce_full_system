<?php

include "../connect.php";

$address_id = filterRequest("address_id");

$stmt = $con->prepare("DELETE FROM `address` WHERE `address_id`= ? ");
$stmt->execute(array($address_id));
$count = $stmt->rowCount();

if($count > 0){
    echo Json_encode(array("status" => "success"));
}else{
    echo Json_encode(array("status" => "fail"));

}


?>