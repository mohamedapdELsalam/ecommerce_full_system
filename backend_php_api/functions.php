<?php
   require __DIR__ . '/vendor/autoload.php';
    
   use Kreait\Firebase\Factory;
   use Kreait\Firebase\Messaging;
   use Kreait\Firebase\Messaging\CloudMessage;
   use Kreait\Firebase\Messaging\Notification;
   use PHPMailer\PHPMailer\PHPMailer;
   use PHPMailer\PHPMailer\Exception;
   require "vendor/autoload.php";
   require "secrets/tokens.php";
   
define("MB" , 1048576);

function filterRequest($requestName){
    return htmlspecialchars(strip_tags($_POST[$requestName]));

}

function imageUpload($imageRequest,$address){
    global $msgError ;
    $imageName        = $_FILES[$imageRequest]['name'] ;
    $imageTmp         = $_FILES[$imageRequest]['tmp_name'];
    $imageSize        = $_FILES[$imageRequest]['size']; 
    $allowExtensions  = array("jpg" , "gif" , "png" ,"jpeg" ,"svg","heic");
    $strToarray       = explode("." , $imageName);
    $extension        = end($strToarray);
    $extension        = strtolower($extension);
    $random = rand(1000,5000) ;
    $imageName = $random . $imageName ;

    if(!empty($imageName) && !in_array($extension,$allowExtensions)){
        $msgError[] = "ext" ;
    }
    if($imageSize > 6 * MB){
        $msgError[] = "size" ;
    }
    if(empty($msgError)){
        move_uploaded_file($imageTmp,__DIR__ . $address . $imageName);
        
        return json_encode(["status" => "success" , "imageName" => $imageName]);;
    }else{
       
        return json_encode(["status" => "fail" , "imageName" => null ,"error" => $msgError ]);
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
    
    function getAllData($table , $where  = null, $values = null , $message ="empty", $json = true){
        global $con;
        $data= array();
        if($where == null){

            $stmt = $con->prepare("SELECT * FROM $table "); 
        }else{

            $stmt = $con->prepare("SELECT * FROM $table WHERE $where"); 
        }
        $stmt->execute($values);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $count = $stmt->rowCount();
        if($json){

            if($count > 0 ){
             echo json_encode(array("status" => "success" , "data" => $data));
            }else{
             echo json_encode(array("status" => "fail" , "message" => $message));
            }
           
            return $count;
        }else{
            if($count > 0 ){
             return $data;
            }else{
             return $count;
            }
        }

    }



 
    function sendNotification($title, $body, $topic,$pageName)
    {
        try {
          
            $factory = (new Factory)->withServiceAccount(__DIR__ . '/secrets/ecommerce-9d588-f1cd0e84bd7d.json');
            $messaging = $factory->createMessaging();
    
            $notification = Notification::create($title, $body);
    
            $message = CloudMessage::withTarget('topic', $topic)
                ->withNotification($notification)
                ->withData([
                    'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                    'pageName' => $pageName,
                ]);
    
            $messaging->send($message);
    
            return "Notification sent successfully!";
        } catch (Exception $e) {
            return "Error: " . $e->getMessage();
        }
    }


    function insertNotification($title,$body,$userid,$topic,$pageName){
        global $con;
        $stmt = $con->prepare("INSERT INTO `notification`
         (notification_title,notification_body,notification_userid)  VALUES (?,?,?)");
        $stmt->execute(array($title , $body,$userid)); 
        $count = $stmt->rowCount();
        if($count > 0){
            sendNotification($title,$body,$topic,$pageName);
        }else{
            echo json_encode(array("status" => "fail insert notification"));
        }
    }


    function sendVerifyCode($toEmail,$toName,$verifyCode,$subject="verification code"){
    $mail = new PHPMailer(true);

try {
    $mail->isSMTP();
    $mail->Host       = 'sandbox.smtp.mailtrap.io';
    $mail->SMTPAuth   = true;
    $mail->Username   = '4a93b07d212584';
    $mail->Password   = "064779e38832fe";
    $mail->Port       = 587;

    $mail->setFrom('hello@demomailtrap.co', 'ecommerce app');
    $mail->addAddress($toEmail, $toName);

    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body    = "hello $toName ! \nyour verification code is : <b>$verifyCode</b>";
    $mail->AltBody = "your verification code is : $verifyCode";

    $mail->send();
} catch (Exception $e) {
    echo "حصل خطأ: {$mail->ErrorInfo}";
}

}



    
   
    



?>






