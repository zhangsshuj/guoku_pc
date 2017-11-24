<?php
header("Content-Type:application/json;charset=utf-8");
require_once("init.php");
@$rid=$_REQUEST["rid"];

$sql="select title as t,sub_title as s,pic as p from gk_articles where rid=$rid ";

$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);

$output=["data"=>null];
$output["data"]=$row;
echo json_encode($output);
?>