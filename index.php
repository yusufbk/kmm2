<?php
session_start();
 if (isset($_SESSION['username'])) {
   header("Location: inbox.php");
 } 
?>
<!DOCTYPE html>
<html>

<head>
 
    <title>SMS GATEWAY RS. AMAL SEHAT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
    <style>
        .masuk{
            margin-top:50px;
        }
    </style>
</head>

<body class="login-bg" onload="ajaxrunning()">
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <!-- Logo -->
                    <div class="logo">
                        <h1><a href="inbox.php">SMS GATEWAY RS. AMAL SEHAT</a></h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-content container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-wrapper">
                    <div class="box">
                        <div class="content-wrap">
                            <h6>SMS SERVER RUNNING . . .</h6>
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="running." aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                </div>
                            </div>
                            <form class="masuk" method="POST" action="loginproses.php">
                                <input class="form-control" type="text" name="username" class="form-control" placeholder="Username">
                                <input class="form-control" type="password" name="password" class="form-control" placeholder="Password">
                                <button type="submit" class="btn btn-default">Masuk</button>
                                <h5><i>*login untuk melihat pesan</i></h5>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>