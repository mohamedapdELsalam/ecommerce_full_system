
<?php

include "../../connect.php";
 
$itemId = filterRequest("itemId");
 $userId = filterRequest("userId");

 $stmt = $con->prepare("SELECT COUNT(cart_id) FROM cart WHERE cart_itemid = ? AND cart_userid = ?");
 $stmt->execute(array($itemId,$userId));
 $count = $stmt->rowCount();
 $data = $stmt->fetchColumn();

 if($count > 0 ){
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    echo json_encode(array("status" => "fail" , "data" => $data));
}


?>