<?php
  /* 
   * Paging
   */

  $iTotalRecords = 5;
  $iDisplayLength = intval($_REQUEST['length']);
  $iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength; 
  $iDisplayStart = intval($_REQUEST['start']);
  $sEcho = intval($_REQUEST['draw']);
  
  $records = array();
  $records["data"] = array(); 

  $end = $iDisplayStart + $iDisplayLength;
  $end = $end > $iTotalRecords ? $iTotalRecords : $end;

  $status_list = array(
    array("success" => "Pending"),
    array("info" => "Closed"),
    array("danger" => "On Hold"),
    array("warning" => "Fraud")
  );

/*
  for($i = $iDisplayStart; $i < $end; $i++) {
    $status = $status_list[rand(0, 2)];
    $id = ($i + 1);
    $records["data"][] = array(
      $id,
      '<span class="label label-sm label-'.(key($status)).'">'.(current($status)).'</span>',
      '<a href="javascript:;" class="btn btn-xs default"><i class="fa fa-search"></i> View</a>',
   );
  }
*/

  //$sql  = "SELECT cKdFolder, vNmFolder, '0' AS cFile FROM tm_folder WHERE cAktif = '1' "; 
  //$sql .= "UNION ALL ";
  //$sql .= "SELECT cKdDokumen, cName, '1' AS cFile FROM tm_dokumen WHERE cAktif = '1' ";
  //$rs = $conn->Execute($sql); 
/*
  $records["data"][] = array(
      'File PDF',
      '<span>Administrator</span>',
      '<a href="index.php?m=page.files&mode=5" class="btn btn-xs default"><i class="fa fa-search"></i> View</a>'
   );
*/
  $records["data"][] = array(
      'PRINSIP-DASAR-ISO-9001',
      '<span>Administrator</span>',
      '<a href="#" onClick="viewfile(\'PRINSIP-DASAR-ISO-9001\')" class="btn btn-xs default"><i class="fa fa-search"></i> View</a><a href="#" onClick="viewfull(\'PRINSIP-DASAR-ISO-9001\')" class="btn btn-xs default"><i class="fa fa-search"></i> Full</a>'
   );
  $records["data"][] = array(
      'SINTEGRAL_Tahapan_ISO9001',
      '<span>Administrator</span>',
      '<a href="#" onClick="viewfile(\'SINTEGRAL_Tahapan_ISO9001\')" class="btn btn-xs default"><i class="fa fa-search"></i> View</a><a href="#" onClick="viewfull(\'SINTEGRAL_Tahapan_ISO9001\')" class="btn btn-xs default"><i class="fa fa-search"></i> Full</a>'
   );
  $records["data"][] = array(
      'sni_iso9001_2008',
      '<span>Administrator</span>',
      '<a href="#" onClick="viewfile(\'sni_iso9001_2008\')" class="btn btn-xs default"><i class="fa fa-search"></i> View</a><a href="#" onClick="viewfull(\'sni_iso9001_2008\')" class="btn btn-xs default"><i class="fa fa-search"></i> Full</a>'
   );
  $records["data"][] = array(
      'SNI-ISO-9001-2008',
      '<span>Administrator</span>',
      '<a href="#" onClick="viewfile(\'SNI-ISO-9001-2008\')" class="btn btn-xs default"><i class="fa fa-search"></i> View</a><a href="#" onClick="viewfull(\'SNI-ISO-9001-2008\')" class="btn btn-xs default"><i class="fa fa-search"></i> Full</a>'
   );
  $records["data"][] = array(
      'standardisasi-3.4 (ISO 9000)',
      '<span>Administrator</span>',
      '<a href="#" onClick="viewfile(\'standardisasi-3.4 (ISO 9000)\')" class="btn btn-xs default"><i class="fa fa-search"></i> View</a><a href="#" onClick="viewfull(\'standardisasi-3.4 (ISO 9000)\')" class="btn btn-xs default"><i class="fa fa-search"></i> Full</a>'
   );

  if (isset($_REQUEST["customActionType"]) && $_REQUEST["customActionType"] == "group_action") {
    $records["customActionStatus"] = "OK"; // pass custom message(useful for getting status of group actions)
    $records["customActionMessage"] = "Group action successfully has been completed. Well done!"; // pass custom message(useful for getting status of group actions)
  }

  $records["draw"] = $sEcho;
  $records["recordsTotal"] = $iTotalRecords;
  $records["recordsFiltered"] = $iTotalRecords;
  
  echo json_encode($records);
?>