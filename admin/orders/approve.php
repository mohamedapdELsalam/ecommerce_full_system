
<?php

include "../../connect.php";

$userId = filterRequest("userId");
$orderId = filterRequest("orderId");

$stmt = $con->prepare("UPDATE orders SET orders_status = 1 WHERE orders_id = ? AND orders_status = 0");
$stmt->execute(array($orderId));
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success") );
    insertNotification("done","your order is approved successfully",$userId,"users$userId","refreshOrders");
}else{
    echo json_encode(array("status" => "fail") );
}

?>