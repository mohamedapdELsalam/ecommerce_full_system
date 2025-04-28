
<?php

include "../../connect.php";

$orderId = filterRequest("orderId");
$userId = filterRequest("userId");
$adminId =filterRequest("adminId");
$stmt = $con->prepare("UPDATE orders SET orders_status = 4 WHERE orders_status = 3 AND orders_id = ?");
$stmt->execute(array($orderId));
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
    insertNotification("delivery done" ,"i,am reach the order :$orderId",$adminId,"admins$adminId","none");
    insertNotification("thanks !" ,"you have been recieved your order successfully",$userId,"users$userId","refreshOrders");
}else{
    echo json_encode(array("status" => "success"));
}