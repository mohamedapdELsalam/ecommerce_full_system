<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$port = getenv('PORT') ?: 8000; // استخدام المنفذ من البيئة
echo "Hello, this is your PHP API running on Vercel!";
?>
