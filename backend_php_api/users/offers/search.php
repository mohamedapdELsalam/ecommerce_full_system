
<?php

include "../../connect.php";

$search = filterRequest("search");

$stmt = $con->prepare("SELECT * FROM itemsview WHERE 
 (items_discount != 0 )AND
 (items_name_ar LIKE '%$search%'
 OR items_name_en LIKE '%$search%'
 OR items_name_de LIKE '%$search%'
 OR items_name_sp LIKE '%$search%' )");

 $stmt->execute();

 $count = $stmt->rowCount();
 $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

 if($count >  0){
    echo json_encode(array("status" => "success" , "data" => $data));
}else{
     echo json_encode(array("status" => "fail"));
 }

?>