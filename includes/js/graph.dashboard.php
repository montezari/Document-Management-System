<?php
require_once "includes/config.inc.php";
require_once "includes/connect.inc.php";

// pie -> biaya
$sql  = "SELECT biaya.cBiaya, biaya.vBiaya, COALESCE(peg.jml,0) AS jml ";
$sql .= "FROM (SELECT 1 AS cBiaya, 'Langsung' AS vBiaya UNION ALL SELECT 2 AS cJK, 'Tidak Langsung' AS vBiaya ) biaya ";
$sql .= "LEFT JOIN ( ";
$sql .= "  SELECT cBiaya, COUNT(*) AS jml "; 
$sql .= "  FROM tm_pegawai WHERE dTglResign IS NULL "; 
$sql .= "  GROUP BY cBiaya ";
$sql .= ") peg ON peg.cBiaya = biaya.cBiaya ";
$rs = $conn->Execute($sql);
$pie_biaya  = "var data1 = []; \n";
$pie_biaya .= "var series1 = ".$rs->RecordCount()."; \n";
$idx=0;
while(!$rs->EOF){
  $pie_biaya .= "data1[$idx] = { \n";
  $pie_biaya .= "	label: \"".strtoupper($rs->fields["vBiaya"])."\", \n";
  $pie_biaya .= "	data: ".$rs->fields["jml"]." \n";
  $pie_biaya .= "} \n";
  $idx++;
  $rs->MoveNext();
}
$rs->Close();

// pie -> status pegawai
$sql  = "SELECT stat.cKdStatus, stat.vNmStatus, COALESCE(peg.jml,0) AS jml ";
$sql .= "FROM tm_statuspegawai stat ";
$sql .= "LEFT JOIN ( ";
$sql .= "  SELECT cStatusPegawai, COUNT(*) AS jml ";
$sql .= "  FROM tm_pegawai WHERE dTglResign IS NULL ";  
$sql .= "  GROUP BY cStatusPegawai ";
$sql .= ") peg ON peg.cStatusPegawai = stat.cKdStatus ";
$rs = $conn->Execute($sql);
$pie_status  = "var data2 = []; \n";
$pie_status .= "var series2 = ".$rs->RecordCount()."; \n";
$idx=0;
while(!$rs->EOF){
  $pie_status .= "data2[$idx] = { \n";
  $pie_status .= "	label: \"".strtoupper($rs->fields["vNmStatus"])."\", \n";
  $pie_status .= "	data: ".$rs->fields["jml"]." \n";
  $pie_status .= "} \n";
  $idx++;
  $rs->MoveNext();
}
$rs->Close();

// jumlah pegawai per kantor
$sql  = "SELECT knt.cKdKantor, knt.vNmKantor, COALESCE(peg.jml,0) AS jml "; 
$sql .= "FROM tm_kantor knt ";
$sql .= "LEFT JOIN ( ";
$sql .= "  SELECT cKdKantor, COUNT(*) AS jml "; 
$sql .= "  FROM tm_pegawai WHERE dTglResign IS NULL "; 
$sql .= "  GROUP BY cKdKantor ";
$sql .= ") peg ON peg.cKdKantor = knt.cKdKantor ";
$rs = $conn->Execute($sql);
$bar_jml  = "var data1 = [ ";
$bykdata = $rs->RecordCount();
$idx = 1;
while(!$rs->EOF){
  $sep = $idx<$bykdata ? "," : "";
  $bar_jml .= "[\"".strtoupper($rs->fields["vNmKantor"])."\", ".$rs->fields["jml"]."]".$sep;
  $idx++;
  $rs->MoveNext();
}
$bar_jml .= "];";
$rs->Close();

$src = "var Charts = function () { 

    return {
        init: function () {
			App.addResponsiveHandler(function () {
                 Charts.initPieCharts(); 
            });
        },

        initBarCharts: function () {
			$bar_jml
            var options = {
                    series:{
                        bars:{show: true}
                    },
                    bars:{
						barWidth: 0.5,
						lineWidth: 0, // in pixels
						shadowSize: 0,
						align: 'center'
                    },            
					xaxis: {
						mode: \"categories\",
						tickLength: 0
					},                
                    grid:{
						 tickColor: \"#eee\",
						 borderColor: \"#eee\",
						 borderWidth: 2
                    }
            };
 
            $.plot($(\"#chart_1_1\"),
             [{
                data: data1,
				lines: {
                    lineWidth: 1,
                },
                shadowSize: 0
             }]
             , options);

		},

        initPieCharts: function () {
            $pie_biaya
			$pie_status
				
			$.plot($(\"#pie_chart_4\"), data1, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            label: {
                                show: true,
                                radius: 3 / 4,
                                formatter: function (label, series) {
                                    return '<div style=\"font-size:10pt;text-align:center;padding:2px;color:black;\">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
                                },
                                background: {
                                    opacity: 0,
                                    color: '#000'
                                }
                            }
                        }
                    },
                    legend: {
                        show: true
                    }
                });

            $.plot($(\"#pie_chart_6\"), data2, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            label: {
                                show: true,
                                radius: 2 / 3,
                                formatter: function (label, series) {
                                    return '<div style=\"font-size:10pt;text-align:center;padding:2px;color:black;\">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
                                },
                                threshold: 0.1
                            }
                        }
                    },
                    legend: {
                        show: true
                    }
                });

        }
        
    };

}();
";

echo $src;
?>