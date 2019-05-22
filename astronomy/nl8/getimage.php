<?php

/* get image path from DB */
function getImgPath(string $imgid,string $ftype,string $lnum) {

// established connection 
$user = 'spaceman';
$pass = 'mask';
$db = 'solarSystem';

$img_id = $imgid;
$file_type = $ftype;
$l_num = $lnum;

// Establish connection

$conn = new mysqli('localhost',$user,$pass,$db) or die("Unable to connect");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

//run the store proc
 $call = mysqli_prepare($conn,"CALL getImagePath(?, ?, ?,@fpath)");
 $call->bind_param('sss',$img_id,$file_type,$l_num);
 $call->execute();

 $select = mysqli_query($conn,'SELECT @fpath');
 $result = $select->fetch_assoc();

 $fetched_path = $result['@fpath'];
 $conn->close();
 return $fetched_path;
}

// parameters for test
/*$imgid = 'img1';
$ftype = 'I';
$lnum = '0';*/

$imgid = $_POST['img_post_id'];
$ftype = $_POST['file_post_type'];
$lnum = $_POST['lesson_post_number'];

// show for test
echo sprintf(getImgPath($imgid,$ftype,$lnum));
?>