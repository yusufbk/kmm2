<?php
  session_start();
 if (!isset($_SESSION['username'])) {
   header("Location: index.php");
 } 

?>
<!DOCTYPE html>
<html>

<head>
    <title>SMS GATEWAY</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="refresh" content="600"/>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
    <script type="text/javascript">
        function ajaxrunning() {
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {}
            }
            xmlhttp.open("GET", "run.php");
            xmlhttp.send();
            setTimeout("ajaxrunning()", 5000);
        }
    </script>
</head>

<body onload="ajaxrunning()">
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <!-- Logo -->
                    <div class="logo">
                        <h1><a href="inbox.php">SMS GATEWAY</a></h1>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="page-content">
        <div class="row">
            <div class="col-md-2">
                <div class="sidebar content-box" style="display: block;">
                    <ul class="nav">
                        <!-- Main menu -->
                        <li><a href="inbox.php"><i class="glyphicon glyphicon-envelope"></i>Pesan Masuk</a></li>
                        <li class="current"> <a href="outbox.php"><i class="glyphicon glyphicon-send"></i>Pesan Terkirim</a></li>
                         <li><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i>Log out</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="col-md-10">                
                <div class="row">
                    <div class="col-md-12 panel-warning">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title "><i class="glyphicon glyphicon-send"></i> PESAN TERKIRIM</div>
                            <div class="panel-options">
                                <a href="outbox.php" data-rel="collapse"><i class="glyphicon glyphicon-refresh" title="refresh"></i></a>
                               <a href="delete.php?id_truncate_outbox" onclick="return confirm('Apakah anda yakin ingin menghapus SEMUA data outbox?')"><i class="glyphicon glyphicon-trash" title="reset data"></i></a>
                            </div>
                        </div>
                        <div class="content-box-large box-with-header">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table id="datatables" class="table">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nomor Pengirim</th>
                                                <th>Tanggal Pesan</th>
                                                <th>Pesan</th>
                                                <th>Hapus</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php   
                                            include 'config.php';
                                            $no = 1;
			                                $sql = mysql_query("SELECT * FROM sentitems order by ID desc");
			                                while($data = mysql_fetch_array($sql)){
				                            echo '
				                            <tr>
                                             <td>'.$no.'</td>
                                             <td>'.$data['DestinationNumber'].'</td>
                                              <td>'.$data['SendingDateTime'].'</td>
                                              <td>'.$data['TextDecoded'].'</td>
                                              <td align="center"> <a href="delete.php?id_outbox='.$data['TPMR'].'" onclick="return confirm(\'Apakah anda yakin ingin menghapus?\')"> <i class="glyphicon glyphicon-remove" alt="delete"></i></a> </td>
                                             </tr>  
                                                ';
                                                $no++;
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                
                <footer>
                    <div class="container">
                        <div class="copy text-center">
                            Copyright 2018 <a href='#'>SKYNOSOFT</a>
                        </div>

                    </div>
                </footer>
            </div>
            
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--    <script src="https://code.jquery.com/jquery.js"></script>-->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <!--datatable-->
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8">
            $(document).ready(function(){
                $('#datatables').dataTable({
                    "sPaginationType":"full_numbers",
                    "aaSorting":[[2, "desc"]],
                    "bJQueryUI":true
                });
            })            
    </script>
</body>

</html>