
<?php

include "../../connect.php";

$userId = filterRequest("userId");



$stmt = $con->prepare(
"SELECT * FROM `items_view` WHERE `items_id` IN (SELECT favorite.favorite_itemid FROM `favorite` WHERE favorite.favorite_userid = ?)"
);


$stmt->execute(array($userId));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success" , "data" => $data) );
}else{

    echo json_encode(array("status" => "fail") );
}



?>








