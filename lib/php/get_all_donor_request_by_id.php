 <?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $donorid = $_POST['donorid'];
    $Sql_Query = "select drt.Id,drt.Details,drt.DonorRequestDate,drt.Estate,doc.Id,doc.FirstName,doc.LastName,doc.UserId,doc.Mobile,doc.Email,doc.DOB,doc.Specialist,doc.Salary,doc.Address 
from DonorRequestTbl drt left join DoctorTbl doc on drt.DoctorId=doc.Id
left join DonorTbl don on drt.DonorId =don.Id WHERE DonorId='$donorid'";
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
 