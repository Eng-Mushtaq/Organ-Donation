<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $usertype = $_POST['usertype'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $mobile = $_POST['mobile'];
    $email = $_POST['email'];
    $dob = $_POST['dob'];
    $address = $_POST['address'];
    $user_Query = "INSERT INTO UserTbl( UserName, Password, UserType, Estate) VALUES('$username' ,'$password','$usertype',1)";

    if ($conn->query($user_Query) === TRUE) {
        $last_id = $conn->insert_id;
        // echo "New  record created in UserTbl successfully. Last inserted ID is: " . $last_id;
        if ($usertype == 2) {
            $specialist = $_POST['specialist'];
            $sqlDoctor = "INSERT INTO DoctorTbl(FirstName, LastName, UserId, Mobile, Email, DOB, Specialist,
            Address)
            values ('$firstname','$lastname','$last_id','$mobile','$email','$dob','$specialist',
            '$address')";
            if ($conn->query($sqlDoctor) === TRUE) {
                $last_Doc_id = $conn->insert_id;
                echo $last_Doc_id;
            }
        } else if ($usertype == 3) {
            $sqlPatient = "INSERT INTO PatientTbl( FirstName, LastName, Email, Mobile, DOB, Address, UserId)
                values ('$firstname','$lastname','$email','$mobile','$dob','$address','$last_id')";
            if ($conn->query($sqlPatient) === TRUE) {
                $last_Pat_id = $conn->insert_id;
                echo $last_Pat_id;
            }
        } else if ($usertype == 4) {
            $sqlDonor = "INSERT INTO DonorTbl(FirstName, LastName, UserId, Dob, Mobile, Email, Address)
                VALUES('$firstname','$lastname','$last_id','$dob','$mobile','$email','$address')";
            if ($conn->query($sqlDonor) === TRUE) {
                $last_Don_id = $conn->insert_id;
                echo $last_Don_id;
            }
        }
    } else {
        echo 0;
    }
} else {
    echo "Change Request Type";
}
?>