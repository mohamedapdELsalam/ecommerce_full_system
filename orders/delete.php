<?php
 
 include "../connect.php";

 $orderId = filterRequest("orderId");

 $stmt = $con->prepare("DELETE FROM orders WHERE orders_id = ? AND orders_status = 0");
 $stmt->execute(array($orderId));
 $count = $stmt->rowCount();

 if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
 }


?>