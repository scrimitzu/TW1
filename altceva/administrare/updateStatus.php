<?php
include("../setari/db.conn.php");

$status = mysql_real_escape_string($_GET['status']);
if(isset($_GET['status'])){
	if($_GET['status'] == 'Confirmat'){
		$statusValue = 1;
	}
	else{
		$statusValue = 0;
	}
	$query = 'UPDATE nelo_rezervari SET status = '.$statusValue.' where booking_id="'.$_GET['id'].'"' ;
	$result = mysql_query($query) or die(mysql_error());
	if($result){
        echo "Success";
    }
    else{
        echo "Update Error";
    }

}
