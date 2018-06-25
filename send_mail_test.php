<?php
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

$pupil = $_GET['fio']; 
$points = $_GET['score']; 
$mail_teacher = $_GET['email'];

$subject = "Результати учня" . $pupil;
$txt = "Результати учня" . $pupil . ":" . $points . "балів";
$back_mail = "From: astronomy@lesson.com";

mail($mail_teacher, $subject, $txt, $back_mail,$headers);
?> 
