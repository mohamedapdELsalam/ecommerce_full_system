<?php

include "../../connect.php";

$id = filterRequest("id");
$imageName = filterRequest("imageName");

$stmt = $con->prepare("DELETE FROM `categories` WHERE `categories_id`= ?");
$stmt->execute(array($id));
$count = $stmt->rowCount();

if($count > 0){
    deleteFile(__DIR__ . "/../../upload/categories/",$imageName);
    echo Json_encode(array("status" => "success"));
}else{
    echo Json_encode(array("status" => "fail"));

}


?>