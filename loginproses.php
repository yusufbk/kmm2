<?php
 // memanggil file koneksi.php
 include "config.php";
 // membuat variable dengan nilai dari form
 $username = $_POST['username']; // variablenya = username, dan nilainya sesuai yang dimasukkan di input name="username" tadi
 $password = $_POST['password'];
 $perintah = "select * from m_kontak WHERE username = '$username' AND password = '$password' AND status_login = 'admin'";
 $hasil = mysql_query($perintah);
 $row = mysql_fetch_array($hasil);
 if ($row['username'] == $username AND $row['password'] == $password) {
 session_start(); // memulai fungsi session
 $_SESSION['username'] = $username;
 header("location:inbox.php"); // jika berhasil login, maka masuk ke file home.php
 }
 else {
echo "<script>
alert('Username atau password salah');
window.location.href='index.php';
</script>";
 }
 ?>