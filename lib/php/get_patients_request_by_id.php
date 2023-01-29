<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $usertype = $_POST['usertype'];
    $Sql_Query = "";
    if ($usertype == 1) {
        $Sql_Query = "select * from AdminTbl";
    } else if ($usertype == 2) {
        $Sql_Query = "select * from DoctorTbl";
    } else if ($usertype == 3) {
        $Sql_Query = "select * from PatientTbl";
    } else if ($usertype == 4) {
        $Sql_Query = "select * from DonorTbl";
    }
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
