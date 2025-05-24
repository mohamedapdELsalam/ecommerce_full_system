
<?php

include "../../connect.php";

$categoryId = filterRequest("categoryId");
$userId = filterRequest("userId");


//  getAllData("items_view","categories_id = $categoryId");

$stmt = $con->prepare(
    "SELECT itemsview.* , 1 as favorite FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = $userId 
WHERE itemsview.categories_id = $categoryId AND items_active =1
UNION ALL 
SELECT itemsview.* , 0 AS favorite FROM itemsview 
WHERE itemsview.categories_id = $categoryId AND items_active =1 AND items_id NOT IN 
(SELECT itemsview.items_id FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = $userId)"
);


$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {

    echo json_encode(array("status" => "fail"));
}



?>

