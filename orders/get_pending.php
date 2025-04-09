<?php

 include "../connect.php";

 $userId = filterRequest("userId");

 getAllData("ordersview" , "orders_userid  = ? AND orders_status IN (0,1) " , array($userId));

?>