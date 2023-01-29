<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $organ = $_POST['organ'];
    $details = $_POST['details'];
    $estate = $_POST['estate'];
    $requestdate = $_POST['requestdate'];
    $patientid = $_POST['patientid'];
    $request_Query = "INSERT INTO PatientRequestTbl(Organ, Details, Estate, RequestDate, PatientId) 
     VALUES('$organ' ,'$details','$estate','$requestdate','$patientid')";

    if ($conn->query($request_Query) === TRUE) {
        $last_id = $conn->insert_id;
        echo "New  record created in Request successfully. Last inserted ID is: " . $last_id;
    }
}
