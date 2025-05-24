
<?php

include "../../connect.php";

$nameAr = filterRequest("nameAr");
$nameEn = filterRequest("nameEn");
$nameDe = filterRequest("nameDe");
$nameSp = filterRequest("nameSp");
$descAr = filterRequest("descAr");
$descEn = filterRequest("descEn");
$descDe = filterRequest("descDe");
$descSp = filterRequest("descSp");
$price = filterRequest("price");
$discount = filterRequest("discount");
$count = filterRequest("count");
$active = filterRequest("active");
$categoryId  = filterRequest("categoryId");
$imageRequest  =  imageUpload("image","/upload/items/");

$imageName;

$imageData = json_decode($imageRequest,true) ;

if($imageData["status"] == "success"){
  $imageName = $imageData["imageName"];
} else {
        echo $imageRequest;
        return;
}

  
$stmt = $con->prepare("INSERT INTO items (
    items_name_ar, items_name_en, items_name_de , items_name_sp , items_desc_ar , 
    items_desc_en , items_desc_de , items_desc_sp ,items_price , items_discount , items_count ,
    items_active , items_image ,items_categories )
    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) " );

$stmt->execute(array($nameAr, $nameEn,$nameDe,$nameSp,$descAr , $descEn, $descDe,$descSp,$price,
$discount,$count,$active,$imageName , $categoryId));
$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}



?>


