<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $organ = $_POST['organ'];
    $doctorid = $_POST['doctorid'];
    $donorid = $_POST['donorid'];
    $details = $_POST['details'];
    $estate = $_POST['estate'];
    $donorrequestdate = $_POST['donorrequestdate'];
    $request_Query = "INSERT INTO DonorRequestTbl( Organ,Details, DoctorId, DonorId, DonorRequestDate, Estate) 
     VALUES('$organ','$details','$doctorid' ,'$donorid','$donorrequestdate', '$estate')";

    if ($conn->query($request_Query) === TRUE) {
        $last_id = $conn->insert_id;
        echo "New  record created in Request successfully. Last inserted ID is: " . $last_id;
    }
    else{
     'Falid insert';
    }
}
