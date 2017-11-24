<?php
header("Content-Type:application/json;charset=utf-8");
require_once("init.php");
@$lid=$_REQUEST["lid"];

$sql="select price as price,sub_title as sub_title,sm as sm,lname as lname from gk_selected_list,gk_selected_pic where";
$sql.=" gk_selected_list.lid=$lid and gk_selected_pic.product_list_id=$lid";
#$sql="select lname,price from gk_selected_list where lid=$lid ";

$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
echo json_encode($row);
?>