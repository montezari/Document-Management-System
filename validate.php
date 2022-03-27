<?php
require_once "includes/global.inc.php";

$valid = true;
if (($_REQUEST["m"] == "master.dept") && isset($_POST['kode'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_dept WHERE cKdDept = '".$_POST['kode']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}

echo json_encode(array(
    'valid' => $valid
));

?>