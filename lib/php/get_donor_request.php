
<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $donorid = $_POST['donorid'];
    $Sql_Query = "SELECT * FROM DonorRequestTbl WHERE DonorId='$donorid'";
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
 