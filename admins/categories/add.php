
<?php

include "../../connect.php";

$nameAr = filterRequest("nameAr");
$nameEn = filterRequest("nameEn");
$nameDe = filterRequest("nameDe");
$nameSp = filterRequest("nameSp");
$image  =  imageUpload("image", __DIR__ . "/upload/categories/");
$imageName;

$imageData = json_decode($image,true) ;

if($imageData["status"] == "success"){
  $imageName =  $imageData["imageName"];
} else {
        echo $image;
         return;
 }

  
$stmt = $con->prepare("INSERT INTO categories (
    categories_name_ar,
    categories_name_en,
    categories_name_de,
    categories_name_sp,
    categories_image )
    VALUES(?,?,?,?,?) " );

$stmt->execute(array($nameAr, $nameEn,$nameDe,$nameSp,$imageName));
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}



?>