<?php
header("Content-Type:application/json;charset=UTF-8");
require_once("init.php");

@$kw=$_REQUEST["kw"];
$cond="";
if($kw){
  $kws=explode(" ",$kw);
  for($i=0;$i<count($kws);$i++){
    $kws[$i]="lname like '%".$kws[$i]."%'";
  }
   $cond=" where ".join(" and ",$kws)." order by price DESC";
}
$sql="SELECT count(*) FROM gk_selected_list ".$cond;
$output=[
  "recordCount"=>0, 
  "pageSize"=>9, "pageCount"=>0,"pno"=>1,      
  "data"=>null   
];
$output["recordCount"]=
  sql_execute($sql,MYSQLI_ASSOC)[0]["count(*)"];
$output["pageCount"]=ceil(
  $output["recordCount"]/$output["pageSize"]
);
#$sql="SELECT lid,title,price,sold_count,is_onsale,(select md from xz_laptop_pic where #laptop_id=lid limit 0,1) as pic FROM xz_laptop ".$cond;

$sql="select lid,title,lname,price,(select sm from gk_selected_pic where product_list_id=lid limit 0,1) as sm from  gk_selected_list ".$cond;

@$pno=$_REQUEST["pno"];
if($pno){
  $output["pno"]=$pno;
  $start=$output["pageSize"]*($pno-1);
  $sql=$sql." limit $start,".$output["pageSize"];
}
$result = mysqli_query($conn, $sql);
$rowList = mysqli_fetch_all($result,MYSQLI_ASSOC);
$output["data"]=$rowList;
echo json_encode($output);
?>