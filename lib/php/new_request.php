<?php
include 'config.php';
{
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $doctorid = $_POST['doctorid'];
    $donorid = $_POST['donorid'];
    $description = $_POST['description'];
    $date = $_POST['date']; 
    
    $request_Query = "INSERT INTO MedicalTestTbl( DoctorId, DonorId, Description, TestDate)
    VALUES ('$doctorid','$donorid','$description','$date')";
    
    if ($conn->query($request_Query) === TRUE) {
               $last_id = $conn->insert_id;
               echo $last_id;
    }
    else{
        echo $conn->error;
    }
}
else{
    echo 'Change Request Type';
}
    
}
