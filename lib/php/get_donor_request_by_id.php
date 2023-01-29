<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $usertype = $_POST['usertype'];
    $userid = $_POST['userid'];
    $Sql_Query = "";
    if ($usertype == 1) {
        $Sql_Query = "select a.Id,a.FullName,u.Id UserId,u.UserName,u.Password from AdminTbl a left join UserTbl u on a.UserId=u.Id where userid='$userid'";
    } else if ($usertype == 2) {
        $Sql_Query = "SELECT d.Id, d.FirstName, d.LastName, d.UserId, d.Mobile, d.Email, d.DOB, d.Specialist, d.Address,u.Id UserId,u.UserName, u.Password,u.UserType 
        FROM DoctorTbl d left join UserTbl u on d.UserId=u.Id WHERE d.UserId='$userid'";
    } else if ($usertype == 3) {
        $Sql_Query = "SELECT p.Id,  p.FirstName, p.LastName, p.Email, p.Mobile, p.DOB, p.Address, u.Id UserId,u.UserName, u.Password,u.UserType  
        FROM PatientTbl p left join UserTbl u on p.UserId=u.Id WHERE p.UserId='$userid'";
    } else if ($usertype == 4) {
        $Sql_Query = "SELECT d.Id, d.FirstName, d.LastName, d.UserId, d.Mobile, d.Email, d.DOB, d.Address,u.Id UserId,u.UserName, u.Password,u.UserType 
        FROM DonorTbl d left join UserTbl u on d.UserId=u.Id WHERE d.userId='$userid'";
    }
    $result = $conn->query($Sql_Query);
    $data = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
        echo json_encode($data);
    } else {
    }
} else {
    echo "Change Request Type";
}
