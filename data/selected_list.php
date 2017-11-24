<?php
require_once("init.php");
$sql="select lid,title,sm,lname,price from gk_selected_list,gk_selected_pic where";
$sql.=" gk_selected_list.lid=gk_selected_pic.product_list_id";
$result=sql_execute($sql,MYSQLI_ASSOC);
echo json_encode($result);
?>