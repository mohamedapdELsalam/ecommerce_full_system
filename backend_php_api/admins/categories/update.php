
<?php

include "../../connect.php";
$id = filterRequest("id");
$nameAr = filterRequest("nameAr");
$nameEn = filterRequest("nameEn");
$nameDe = filterRequest("nameDe");
$nameSp = filterRequest("nameSp");
$imageName = filterRequest("imageName");
$imageRequest  = isset($_FILES["image"]) ? imageUpload("image","/upload/categories/") : null;

if($imageRequest != null){
    $imageData = json_decode($imageRequest,true) ;

    if($imageData["status"] == "success"){
        deleteFile(__DIR__ . "/../../upload/categories/",$imageName);
        $imageName =  $imageData["imageName"];
    } else {
             $imageRequest;
             return;
     }

}




  
$stmt = $con->prepare("UPDATE categories SET 
    categories_name_ar = ?,
    categories_name_en = ?,
    categories_name_de = ?,
    categories_name_sp = ?,
    categories_image  =? 
    WHERE categories_id = ?" );

$stmt->execute(array($nameAr, $nameEn,$nameDe,$nameSp,$imageName,$id));
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}



?>