
<?php

include "connect.php";

$allData= array();
$allData["status"] = "success";
$allData["categories"] = getAllData("categories",null,null,"",false);
$allData["items"] = getAllData("items_view",null,null,"",false);
$allData["items_discount"] = getAllData("items_view","items_discount != 0",null,"",false);
echo json_encode($allData);



?>

