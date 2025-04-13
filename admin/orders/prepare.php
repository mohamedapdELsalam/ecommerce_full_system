
<?php

 include "../../connect.php";

 $orderId = filterRequest("orderId");
 $userId = filterRequest("userId");
 $deliveryType = filterRequest("deliveryType");
 $orderStatus;
 if($deliveryType == 0){
     $orderStatus = 2;
 }else{
    $orderStatus = 4;
 }

 $stmt = $con->prepare("UPDATE orders SET orders_status = $orderStatus WHERE orders_id = ? AND orders_status = 1");
 $stmt->execute(array($orderId));
 $count = $stmt->rowCount();

 if($count > 0){
    echo json_encode(array("status" => "success"));
    // notification for user
    insertNotification("done","your order is prepared",$userId,"users$userId","refreshOrders");
    // notification for delivery man
    sendNotification("welcome","there an order awaiting you","delivery","none");
}else{
     echo json_encode(array("status" => "fail"));
 }

?>