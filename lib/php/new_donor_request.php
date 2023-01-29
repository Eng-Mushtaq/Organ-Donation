 
<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  
    $testid=$_POST['testid']; 
    $name=$_POST['name']; 
    $exe=$_POST['extention']; 
    $request_Query = "INSERT INTO TestFilesTbl( TestId, Path,Extention) VALUES ('$testid','$name','$exe')";

    if ($conn->query($request_Query) === TRUE) {
        $last_id = $conn->insert_id;
        echo "New  record created in Request successfully. Last inserted ID is: " . $last_id;
    }
    else{
        echo $conn->error;
    }
}
