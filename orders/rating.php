<?php
 
 include "../connect.php";

 $orderId = filterRequest("orderId");
 $rating = filterRequest("rating");
 $note = filterRequest("note");

 $stmt = $con->prepare("UPDATE orders  SET orders_rating  = ? , orders_note_rating = ? WHERE orders_id = ?");
 $stmt->execute(array($rating,$note,$orderId));
 $count = $stmt->rowCount();

 if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
 }


?>