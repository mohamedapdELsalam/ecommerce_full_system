
<?php

include "../connect.php";

$userId = filterRequest("userId");
$itemId = filterRequest("itemId");


    $stmt = $con->prepare("INSERT INTO `favorite` (favorite_userid,favorite_itemId) VALUES (? ,?) ");
    $stmt->execute(array($userId,$itemId));
    $count = $stmt->rowCount();
    if($count >0 ){
        echo json_encode(array("status" => "success"));
   }else{
        echo json_encode(array("status" => "fail"));
   
    }
   

?>

