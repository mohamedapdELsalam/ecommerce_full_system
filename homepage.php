
<?php

include "connect.php";

$allData= array();
$allData["status"] = "success";
$allData["categories"] = getAllData("categories",null,null,"",false);
$allData["items"] = getAllData("itemsview",null,null,"",false);
$allData["items_discount"] = getAllData("itemsview","items_discount != 0",null,"",false);
echo json_encode($allData);



?>

