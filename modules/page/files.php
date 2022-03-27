<?php

$modefull = isset($_POST["mfull"]) ? $_POST["mfull"] : 0;
$mode = isset($_GET["mode"]) ? $_GET["mode"] : 0;
$moduleid = "page.files";

$filename = isset($_POST["fnm"]) ? $_POST["fnm"] : "";
$filenameonly = basename($filename,".dcs");
$filenameonly = $filenameonly.".pdf";
$froot = isset($_POST["froot"]) && ($_POST["froot"]!="") ? $_POST["froot"] : "-1";
$parent = isset($_POST["parent"]) && ($_POST["parent"]!="") ? $_POST["parent"] : "Private Folder";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fmode"]=="1"){
    $sql  = "insert into tm_folder (vNmFolder,cKdHdrFolder, cOwner, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[nama]',$froot,'$_SESSION[Logged]','$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
	$conn->Execute($sql); 
  }elseif($_POST["fmode"]=="2"){
    $sql  = "update tm_folder set vNmFolder = '$parent' where cKdFolder = $froot ";
	$conn->Execute($sql); 
  }elseif($_POST["fmode"]=="3"){
    $sql  = "update tm_folder set cAktif = 0 where cKdFolder = $froot ";
	$conn->Execute($sql); 
  }
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

function showfolder($parent){
global $conn;

  $sql = "SELECT * FROM tm_folder WHERE cKdHdrFolder = $parent AND cAktif = 1 AND cOwner = '$_SESSION[Logged]' ORDER BY cOrder ";
  $rs = $conn->Execute($sql); 
  $str .= "";
  if($rs->RecordCount()>0){
    $str .= "<ul>";
	while(!$rs->EOF){
	  $str .= "<li id='".$rs->fields["cKdFolder"]."' title='".$rs->fields["vNmFolder"]."' >".$rs->fields["vNmFolder"];
      $str .= showfolder($rs->fields["cKdFolder"]);
	  $str .= "</li>";
	  $rs->MoveNext();
    }
	$str .= "</ul>";
  }

  return $str;
}

$tree = showfolder(0);

$fileTpl = new TTemplate($moduleid);
if($mode=="4"){
  $sql  = "SELECT kat.cKdKategori, CONCAT(COALESCE(grp.vNmKategori,''),IF(grp.vNmKategori IS NULL,'',' -> '),kat.vNmKategori) AS vNmKategori FROM tm_kategori kat ";  
  $sql .= "LEFT JOIN tm_kategori grp ON grp.cKdKategori = kat.cKdGrpKategori ";
  $sql .= "ORDER BY CONCAT(COALESCE(DATE_FORMAT(grp.cDateEntry,'%Y%m%d%H%i%S'),''),DATE_FORMAT(kat.cDateEntry,'%Y%m%d%H%i%S')), grp.vNmKategori "; 
  $fileTpl->template->MergeBlock("blk_kat","adodb",$sql); 
}

if($modefull=="0"){
  $gTpl = new TBlock("form.general_box");
  $gTpl->name		= "gTpl";
  $gTpl->title    = "My Files";
  $gTpl->display  = $fileTpl->Show(false);
  $content = $gTpl->Show(false);
}else{
  $content = $fileTpl->Show(false);
}
?>