
<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $organ=$_POST['organ'];
     $Sql_Query = "select drt.Id,drt.Details,drt.Organ,drt.DonorRequestDate,drt.Estate,doc.Id,doc.FirstName DocFirstName,doc.LastName DocLastName,don.UserId,doc.Mobile DocMobile,doc.Email DocEmail,doc.DOB DocDob,doc.Specialist,doc.Address DocAddress ,don.FirstName DonFirstName,don.LastName DonLastName,don.Address DonAddress,don.Mobile DonMobile,don.Email DonEmail from DonorRequestTbl drt left join DoctorTbl doc on drt.DoctorId=doc.Id left join DonorTbl don on drt.DonorId =don.Id where drt.Organ= '$organ' ";
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
