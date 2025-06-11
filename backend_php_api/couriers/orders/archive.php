<?php

include "../../connect.php";

 $courierId = filterRequest("courierId");
 getAllData("ordersview" , "orders_status  = 4 AND orders_courierid = $courierId ", );

?>