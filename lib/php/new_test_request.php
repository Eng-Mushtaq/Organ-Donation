<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    $table = $_POST['table'];
    $column = $_POST['column'];
    $value = $_POST['value'];
    $Sql_Query =  "select * from $table where $column like '%$value%'  ";
    $result = $conn->query($Sql_Query);
    $data = array();
     if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) { 
            array_push($data, $row);
        }
        echo json_encode($data);
    } else {
        echo 'No Data To show';
    }
} else {
    echo "Change Request Type";
}
