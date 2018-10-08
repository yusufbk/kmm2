<?php
include "config.php";

if(isset($_GET['id_inbox'])){
     $sql_query="DELETE FROM sms_inbox WHERE pk=".$_GET['id_inbox'];
    mysql_query($sql_query);
     header("Location: inbox.php");
} else if (isset($_GET['id_outbox'])){
     $sql_query="DELETE FROM sentitems WHERE TPMR=".$_GET['id_outbox'];
     mysql_query($sql_query);
     header("Location: outbox.php");
} else if (isset($_GET['id_truncate_inbox'])){
     $myquery = mysql_query("TRUNCATE TABLE sms_inbox") or die("Error: ".mysql_error());
     $myquery2 = mysql_query("TRUNCATE TABLE inbox") or die("Error: ".mysql_error());
    header("Location: inbox.php");
} else if (isset($_GET['id_truncate_outbox'])){
    $myquery = mysql_query("TRUNCATE TABLE sentitems") or die("Error: ".mysql_error());
    header("Location: outbox.php");
}
?>