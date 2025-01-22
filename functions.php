<?php
define("MB" , 1048576);

function filterRequest($requestName){
    return htmlspecialchars(strip_tags($_POST[$requestName]));

}

function imageUpload($imageRequest){
    global $msgError ;
    $imageName        = $_FILES[$imageRequest]['name'] ;
    $imageTmp         = $_FILES[$imageRequest]['tmp_name'];
    $imageSize        = $_FILES[$imageRequest]['size']; 
    $allowExtensions  = array("jpg" , "gif" , "png" ,"jpeg");
    $strToarray       = explode("." , $imageName);
    $extension        = end($strToarray);
    $extension        = strtolower($extension);
    $random = rand(1000,5000) ;
    $imageName = $random . $imageName ;

    if(!empty($imageName) && !in_array($extension,$allowExtensions)){
        $msgError[] = "ext" ;
    }
    if($imageSize > 3 * MB){
        $msgError[] = "size" ;
    }
    if(empty($msgError)){
        move_uploaded_file($imageTmp,"../upload/" . $imageName);
        
        return json_encode(["statue" => "success" , "imageName" => $imageName]);;
    }else{
       
        return json_encode(["statue" => "fail" , "imageName" => null ,"error" => $msgError ]);
    }

}

function deleteFile($dir , $fileName){

     if( $fileName != "") {
        $filePath = $dir . "/" . $fileName;
        if(file_exists($filePath)){
           unlink($dir . "/" . $fileName);
        }
     }
    
}


  function insertData($table , $data, $json = true)
  {
    global $con;
    foreach ($data as $field => $value ){
        $ins[]= ":" . $field;
        $ins = implode("," , $ins);
        $fields = implode("," ,array_keys($data));
        $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

        $stmt = $con->prepare($sql);

        foreach($data as $f => $v){
            $stmt->bindValue(":",$f.$v);
        }
        $stmt->execute();
        $count = $stmt->rowCount();
        if($json){
            if($count > 0){
                echo json_encode(array("status" => "success"));
            }else{
                echo json_encode(array("status" => "fail"));
            }
             
        }

    }

  }


    function checkAuthenticate()
    {
    
        if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
    
            if ($_SERVER['PHP_AUTH_USER'] != "mohamed" ||  $_SERVER['PHP_AUTH_PW'] != "cs50html"){
                header('WWW-Authenticate: Basic realm="My Realm"');
                header('HTTP/1.0 401 Unauthorized');
                echo 'Page Not Found';
                exit;
            }
        } else {
            exit;
        }
    }

    function getData($table , $where  = null, $values = null , $message =""){
        global $con;
        $data= array();
        $stmt = $con->prepare("SELECT * FROM $table WHERE $where"); 
        $stmt->execute($values);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $count = $stmt->rowCount();
        if($count > 0 ){
         echo json_encode(array("status" => "success" , "data" => $data));
        }else{
         echo json_encode(array("status" => "fail" , "message" => $message));
        }
       
        return $count;

    }



?>