<?php

include "../../connect.php";

 $userId = filterRequest("userId");

 getAllData("orders" , "orders_userid  = ? AND orders_status = 4 " , array($userId));

?>