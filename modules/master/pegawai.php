<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.pegawai";
$frmcaption = $mode==1 ? "Form Entry" : "Grid Layout"; 

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $val_pass = trim(encrypt_decrypt('encrypt',$_POST["pass"]));
  if($_POST["fkey"] != ""){
    $sql  = "update tsm_user set cUserName='$_POST[email]',cNamaLengkap='$_POST[nama]', cPassword = '".$val_pass."', cKdDept='$_POST[dept]', ";
	$sql .= "cUserEdit = '$_SESSION[Logged]', cDateEdit = CURRENT_TIMESTAMP ";
    $sql .= "where cIdUser = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tsm_user (cUserName,cPassword,cNamaLengkap,cKdDept, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[email]','".$val_pass."','$_POST[nama]','$_POST[dept]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "DELETE FROM tsm_user WHERE cIdUser <> '1' and cIdUser = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT usr.*, dept.vNmDept FROM tsm_user usr  ";
$sql .= "LEFT JOIN tm_dept dept ON dept.cKdDept = usr.cKdDept ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE usr.cIdUser = '$_GET[key]' ";
}
$sql .= "ORDER BY usr.cNamaLengkap ";

$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$sql = "SELECT cPassword FROM tsm_user WHERE cIdUser = '$_GET[key]' ";
$rs = $conn->Execute($sql);
if($rs->fields["cPassword"]!=""){
  $cPassword = trim(encrypt_decrypt('decrypt',$rs->fields["cPassword"]));
}else{
  $cPassword = "";
}
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_dept","adodb","SELECT cKdDept,vNmDept FROM tm_dept ORDER BY vNmDept");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Employee";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>