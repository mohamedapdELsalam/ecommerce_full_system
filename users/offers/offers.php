
<?php

include "../../connect.php";

$userId = filterRequest("userId");



$stmt = $con->prepare(
"SELECT itemsview.* , 1 as favorite FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = $userId 
WHERE items_discount >0
UNION ALL 
SELECT itemsview.* , 0 AS favorite FROM itemsview 
WHERE items_discount >0 AND items_id NOT IN 
(SELECT itemsview.items_id FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = $userId)"
);


$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success" , "data" => $data) );
}else{

    echo json_encode(array("status" => "fail") );
}



?>

