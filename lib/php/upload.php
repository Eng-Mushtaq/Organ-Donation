<?php
$request_body = $_POST;
if(isset($_FILES["fileToUpload"]))
{
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
}
exit;
?>