<?php

include "../../connect.php";

$id = filterRequest("id");
$imageName = filterRequest("imageName");

$stmt = $con->prepare("DELETE FROM items WHERE items_id = ?");
$stmt->execute(array($id));
$count = $stmt->rowCount();

if($count > 0){
    deleteFile(__DIR__ ."/../../upload/items/" ,$imageName);
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}

?>