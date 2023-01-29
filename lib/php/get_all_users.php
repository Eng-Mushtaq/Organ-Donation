<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $patientid = $_POST['patientid'];
    $Sql_Query = "select pr.Id,pr.Organ,pr.Details,pr.Estate,pr.RequestDate,pr.PatientId,p.FirstName,p.LastName,p.Mobile,p.Address,p.Email,p.DOB,p.UserId 
from PatientRequestTbl pr left join PatientTbl p on pr.PatientId=p.Id WHERE p.Id='$patientid'";
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
