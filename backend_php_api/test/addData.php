<?php

include"../connect.php";

$name = filterRequest("name");
$label = filterRequest("label");
$userId = filterRequest("id");

$stmt = $con->prepare("INSERT INTO `test` (test_name , test_label, test_user) VALUES (?,?,?) ");
$stmt->execute(array($name,$label,$userId));
$count = $stmt->rowCount();

if($count > 0 ){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}

?>