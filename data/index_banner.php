<?php
require_once("init.php");
$sql="select pic,rid,title from gk_articles where rid<5";

$result=sql_execute($sql,MYSQLI_ASSOC);
echo json_encode($result);
?>