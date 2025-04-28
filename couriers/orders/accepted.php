<?php

include "../../connect.php";

$courierId = filterRequest("courierId");


 getAllData("ordersview" , "orders_status  = 3  AND  orders_courierid = ? ", array($courierId));

?>