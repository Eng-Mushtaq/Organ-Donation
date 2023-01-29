<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $Sql_Query="select id,username,usertype,estate  from UserTbl where UserName='$username' and password='$password'";

    $result = $conn->query($Sql_Query);
    $data = array();
    $temp = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $temp['id'] = $row["id"];
            $temp['username'] = $row["username"];
            $temp['usertype'] = $row["usertype"];
            $temp['estate'] = $row["estate"];
            array_push($data, $temp);
        }
        $type = $data[0]['usertype'];
        $userId = $data[0]['id'];
        if ($type == 1) {
            $sqlAdmin = "SELECT * FROM AdminTbl WHERE UserId = $userId";
            $aresult = $conn->query($Sql_Query);
            $adata = array();
            $atemp = array();
            if ($aresult->num_rows > 0) {
                while ($arow = $aresult->fetch_assoc()) { 
                    array_push($adata, $arow);
                }
            }
            echo json_encode($adata);
        } else if ($type == 2) {
            $sqlDoctor = "SELECT d.id, d.firstname, d.lastname, d.userid, d.mobile, d.email, d.dob, d.specialist, d.address,u.usertype FROM DoctorTbl d left join UserTbl u on d.UserId=u.Id WHERE  u.Id= $userId";
            $docresult = $conn->query($sqlDoctor);
            $docdata = array();
            $doctemp = array();
            if ($docresult->num_rows > 0) {
                while ($docrow = $docresult->fetch_assoc()) {
                    
                    array_push($docdata, $docrow);
                }
            }
            echo json_encode($docdata);
        } else if ($type == 3) {
            $sqlPatient = "SELECT p.id,  p.firstname, p.lastname, p.email, p.mobile,p.userid, p.dob, p.address, u.usertype  FROM PatientTbl p left join UserTbl u on p.UserId=u.Id WHERE  u.Id = $userId";
            $presult = $conn->query($sqlPatient);
            $pdata = array();
            $ptemp = array();
            if ($presult->num_rows > 0) {
                while ($prow = $presult->fetch_assoc()) { 
                    array_push($pdata, $prow);
                }
            }
            echo json_encode($pdata);
        } else if ($type == 4) {
            $sqlDonor = "SELECT d.id, d.firstname, d.lastname,d.userid, d.dob, d.mobile, d.email, d.address , u.usertype FROM DonorTbl d left join UserTbl u on d.UserId=u.Id WHERE  u.Id = $userId";
            $donresult = $conn->query($sqlDonor);
            $dondata = array();
            $dontemp = array();
            if ($donresult->num_rows > 0) {
                while ($donrow = $donresult->fetch_assoc()) {
             
                    array_push($dondata, $donrow);
                }
            }
            echo json_encode($dondata);
        }
    } else {
        echo 'Please try agine';
    }
} else {
    echo "Change Request Type";
}
