<?php
  
$host = "tmsfp.mysql.database.azure.com";       
$username = "tmsfp";        
$password = "Qwerty12345";            
$database = "tms_db"; 
$port = 3306;

$conn = new mysqli($host, $username, $password, $database, $port);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
} else {
    echo "Koneksi berhasil";
}

function executeQuery($query) {
    global $conn;
    $result = $conn->query($query);

    if ($result === FALSE) {
        die("Query Error: " . $conn->error);
    }

    return $result;
}

function closeConnection() {
    global $conn;
    $conn->close();
}
?>
