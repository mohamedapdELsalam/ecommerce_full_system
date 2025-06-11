<?php

include "../../connect.php";

$userId =  filterRequest("userId");
getAllData("addressview" ,  "address_userid  = ? " , array($userId));

?>