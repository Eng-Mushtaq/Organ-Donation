<?php
include 'config.php'; 
if(isset($_FILES["fileToUpload"]))
{ 
 $target_dir = "uploads/";//"uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
  
}
exit;
?>