<?php
header('Content-Type: application/json;charset=UTF-8');
require_once("init.php");

$kw=$_REQUEST["kw"];
$kws=explode(' ',$kw);
$cond="";
for($i=0;$i<count($kws);$i++){
  $kws[$i]="title LIKE '%".$kws[$i]."%' ";
}
$sql="SELECT lname FROM gk_selected_list where ".join(" AND ",$kws)." ORDER BY sold_count DESC LIMIT 15";

$result = mysqli_query($conn, $sql);

$rowList = mysqli_fetch_all($result,MYSQLI_ASSOC);
echo json_encode($rowList);