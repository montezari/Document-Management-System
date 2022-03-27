<?php

function setcss_js($mode="common"){
  $path  = "default";

  if(!isset($_SESSION["Logged"])){
    $str   = "<link type=\"text/css\" href=\"bs3/css/bootstrap.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/bootstrap-reset.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/style.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/style-responsive.css\" rel=\"stylesheet\">\n";
  }else{
    $str   = "<link type=\"text/css\" href=\"bs3/css/bootstrap.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"assets/jquery-ui/jquery-ui-1.10.1.custom.min.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/bootstrap-reset.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\">\n";
    //$str  .= "<link type=\"text/css\" href=\"assets/bootstrap-datepicker/css/datepicker.css\" rel=\"stylesheet\">\n";
    //$str  .= "<link type=\"text/css\" href=\"assets/bootstrap-datetimepicker/css/datetimepicker.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/style.css\" rel=\"stylesheet\">\n";
    $str  .= "<link type=\"text/css\" href=\"css/style-responsive.css\" rel=\"stylesheet\">\n";
	//$str  .= "<link type=\"text/css\" href=\"js/validation/css/bootstrapValidator.css\" rel=\"stylesheet\">\n";
  }

  return $str;

}

function imageProportions($image){
  $imageLoad = @getimagesize($image);
  if($imageLoad[1] > 100){
    $proportion =  $imageLoad[1] / $imageLoad[0];
    $imageLoad[1] = 100;
    $imageLoad[0] = $imageLoad[1] / $proportion;
    return array(ceil($imageLoad[0]),$imageLoad[1]);
  }else {
    return array($imageLoad[0], $imageLoad[1]);
  }
}

function parseHTMLTags($val){

  $html = str_get_html($val);
  foreach($html->find('img') as $e){
    $imageStats = imageProportions($e->src);
	$e->width = $imageStats[0];
    $e->height = $imageStats[1];
  }

  return $html->save();
}

function setComboTanggal($pVal){
  echo $pVal;
  $str = "<option></option>";
  for($i=1;$i<=31;$i++){ 
    $s = $i == $pVal ? "selected" : "";
    $str .= "<option value='$i' $s>$i</option>";
  }
  return $str;
}

function setComboBulan($pVal){
global $arr_bulan;

  $str = "<option></option>";
  foreach($arr_bulan as $i=>$b){  
    if(isset($pVal)){
	  $s = ($i+1) == $pVal ? "selected" : "";
    }else{
	  //$s = ($i+1) == date("n") ? "selected" : "";
    }
    $str .= "<option value='".($i+1)."' $s>$b</option>";
  }

  return $str;
}

function setComboTahun($pVal,$pAwal=5,$pAkhir=0){
  $str = "<option></option>";
  for($i=date("Y")-$pAwal;$i<=date("Y")-$pAkhir;$i++){  
    $s = $i == $pVal ? "selected" : "";
    $str .= "<option value='$i' $s>$i</option>";
  }

  return $str;
}

function encrypt_decrypt($action, $string) {
   $output = false;

   $key = 'My strong random secret key';
   $iv = md5(md5($key));
   if( $action == 'encrypt' ) {
       $output = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $string, MCRYPT_MODE_CBC, $iv);
       $output = base64_encode($output);
   }
   else if( $action == 'decrypt' ){
       $output = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($string), MCRYPT_MODE_CBC, $iv);
       $output = rtrim($output, "");
   }
   return $output;
}

function setromawi($n){
  $hasil = "";
  $iromawi = array("","I","II","III","IV","V","VI","VII","VIII","IX","X",20=>"XX",30=>"XXX",40=>"XL",50=>"L",
				   60=>"LX",70=>"LXX",80=>"LXXX",90=>"XC",100=>"C",200=>"CC",300=>"CCC",400=>"CD",500=>"D",600=>"DC",700=>"DCC",
				   800=>"DCCC",900=>"CM",1000=>"M",2000=>"MM",3000=>"MMM");
  if(array_key_exists($n,$iromawi)){
    $hasil = $iromawi[$n];
  }elseif($n >= 11 && $n <= 99){
    $i = $n % 10;
    $hasil = $iromawi[$n-$i] . Romawi($n % 10);
  }elseif($n >= 101 && $n <= 999){
	$i = $n % 100;
	$hasil = $iromawi[$n-$i] . Romawi($n % 100);
  }else{
	$i = $n % 1000;
	$hasil = $iromawi[$n-$i] . Romawi($n % 1000);
  }
  return $hasil;

}

function settransno($transid){
global $conn;

	$thn = date('Y');
    $bln = date('m');
	//$sql  = "SELECT cAlias FROM tm_proyek WHERE cIdProyek = '".$_SESSION["cIdProyek"]."' ";
	//$rs = $conn->Execute($sql);
	//$KodeDok = $rs->fields["cAlias"];
	$KodeDok = "JKT";
	$cKdEntity = "000";
	//$sql  = "SELECT * FROM tsm_transno WHERE cKdEntity = '".$_SESSION["cKdEntity"]."' AND cIdTrans = '".strtoupper($transid)."' AND cKodeDok = '".$KodeDok."' ";
	$sql  = "SELECT * FROM tsm_transno WHERE cKdEntity = '$cKdEntity' AND cIdTrans = '".strtoupper($transid)."' AND cKodeDok = '".$KodeDok."' ";
	$sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	$rs = $conn->Execute($sql);
	if($rs->RecordCount()==0){
	  //$sql  = "INSERT INTO tsm_transno VALUES ('".$_SESSION["cKdEntity"]."','".strtoupper($transid)."',1,'".$KodeDok."','".$bln."','".$thn."') ";
	  $sql  = "INSERT INTO tsm_transno VALUES ('$cKdEntity','".strtoupper($transid)."',1,'".$KodeDok."','".$bln."','".$thn."') ";
	  $conn->Execute($sql);
	  $idx=1;
	}else{
	  $idx  = $rs->fields["cCount"]+1;
	  //$sql  = "UPDATE tsm_transno set cCount = $idx WHERE cKdEntity = '".$_SESSION["cKdEntity"]."' ";
	  $sql  = "UPDATE tsm_transno set cCount = $idx WHERE cKdEntity = '$cKdEntity' ";
	  $sql .= "AND cIdTrans = '".strtoupper($transid)."' AND cKodeDok = '".$KodeDok."' ";
	  $sql .= "AND cBulan = '".$bln."' AND cTahun = '".$thn."' ";
	  $conn->Execute($sql);
	}
	$nums = "00000$idx";
	$no_dok = substr($nums,-5)."/".trim(strtoupper($transid))."-".trim($KodeDok)."/".$bln."/".substr($thn,-2);
	//$no_dok = substr($nums,-5)."/".trim(strtoupper($transid))."-".trim($KodeDok)."/".setromawi(intval($bln))."/".substr($thn,-2);

	return $no_dok;

}

?>