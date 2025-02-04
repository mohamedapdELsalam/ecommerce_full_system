
<?php

include "../connect.php";

$userId = filterRequest("userId");
$itemId = filterRequest("itemId");


    $stmt = $con->prepare("DELETE FROM  `favorite` WHERE favorite_userid = ? AND favorite_itemId =?");
    $stmt->execute(array($userId,$itemId));
    $count = $stmt->rowCount();
    if($count >0 ){
        echo json_encode(array("status" => "success"));
   }else{
        echo json_encode(array("status" => "fail"));
   
    }
   

?>

