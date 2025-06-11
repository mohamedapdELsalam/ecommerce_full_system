<?php

include "../../connect.php";

$cityId =  filterRequest("cityId");
getAllData("cities" ,  "city_gov_id  = ? " , array($cityId));

?>