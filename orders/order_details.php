<?php

 include "../connect.php";

 $orderId = filterRequest("orderId");

 getAllData("orderdetails" , "orders_id = ? " , array($orderId));

?>