<?php
$servername = "mysqlserverhost";
$username = "sql_user";
$password = "password0987654321";
$dbname = "dare";


// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}



?>
