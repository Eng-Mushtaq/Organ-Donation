<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $Sql_Query = "select id,username,password,usertype,estate  from UserTbl";
    $result = $conn->query($Sql_Query);
    $data = array();
    $temp = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // $temp['id'] = $row["id"];
            // $temp['username'] = $row["username"];
            // $temp['usertype'] = $row["usertype"];
            // $temp['estate'] = $row["estate"];
            array_push($data, $row);
        }
        echo json_encode($data);
    } else {
    }
} else {
    echo "Change Request Type";
}
?>