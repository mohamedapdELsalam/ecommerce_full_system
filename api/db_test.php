<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

// بيانات الاتصال بقاعدة البيانات
$host = 'DB_HOST'; // استبدل DB_HOST بالقيمة الفعلية
$user = 'DB_USER'; // استبدل DB_USER بالقيمة الفعلية
$password = 'DB_PASSWORD'; // استبدل DB_PASSWORD بالقيمة الفعلية
$dbname = 'DB_NAME'; // استبدل DB_NAME بالقيمة الفعلية

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connection to database successful!";
} catch (PDOException $e) {
    echo "Database connection failed: " . $e->getMessage();
}
?>
