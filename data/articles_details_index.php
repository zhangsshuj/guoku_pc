<?php
require_once("init.php");
$sql="select * from gk_articles where rid<4";

$result=sql_execute($sql,MYSQLI_ASSOC);
echo json_encode($result);
?>