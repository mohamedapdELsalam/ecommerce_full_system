
<?php

include "../connect.php";

$categoryId = filterRequest("categoryId");
$userId = filterRequest("userId");


//  getAllData("items_view","categories_id = $categoryId");

$stmt = $con->prepare(
"SELECT items_view.* , 1 as favorite FROM items_view 
INNER JOIN favorite ON favorite.favorite_itemid = items_view.items_id AND favorite.favorite_userid = $userId 
WHERE items_view.categories_id = $categoryId
UNION ALL 
SELECT items_view.* , 0 AS favorite FROM items_view 
WHERE items_view.categories_id = $categoryId AND items_id NOT IN 
(SELECT items_view.items_id FROM items_view 
INNER JOIN favorite ON favorite.favorite_itemid = items_view.items_id AND favorite.favorite_userid = $userId)"
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

