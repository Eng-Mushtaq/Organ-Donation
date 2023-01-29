<?php
include 'config.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $userid = $_POST['userid'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $usertype = $_POST['usertype'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $mobile = $_POST['mobile'];
    $email = $_POST['email'];
    $dob = $_POST['dob'];
    $address = $_POST['address'];
    $user_Query = "UPDATE UserTbl set  UserName='$username' ,  Password='$password' where Id='$userid'";
    if ($conn->query($user_Query) === TRUE) {
        
        if ($usertype == '2') {
            $specialist = $_POST['specialist'];
            $sqlDoctor = " UPDATE DoctorTbl set FirstName='$firstname', LastName='$lastname', Mobile='$mobile', Email='$email', DOB='$dob', Specialist='$specialist',Address ='$address' where userid='$userid'";
            if ($conn->query($sqlDoctor) === TRUE) {
                echo $userid;
            }
        } else if ($usertype == 3) {
            $sqlPatient = "UPDATE PatientTbl set FirstName='$firstname', LastName='$lastname', Email='$email', Mobile='$mobile', DOB='$dob', Address='$address' where userid='$userid'";
            if ($conn->query($sqlPatient) === TRUE) {
                echo $userid;
            }
        } else if ($usertype == 4) {
            $sqlDonor = "UPDATE DonorTbl set  FirstName='$firstname', LastName='$lastname',   Dob='$dob', Mobile='$mobile', Email='$email', Address='$address'  where userid='$userid'";
            if ($conn->query($sqlDonor) === TRUE) {
                echo $userid;
            }
        }
    } else {
        echo $conn->error;
    }
} else {
    echo "Change Request Type";
}
?>