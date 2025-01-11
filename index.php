<?php
header("Content-Type: application/json");

$response = [
    "status" => "success",
    "message" => "API is working fine!"
];

echo json_encode($response);
?>
