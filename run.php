<?php

include "config.php";
include "function.php";

cekinbox();
// mencari sms di dlm tabel sms_inbox yg belum diproses
$query = "SELECT * FROM sms_inbox WHERE status_pesan = 'false'";
$hasil = mysql_query($query);

while ($data = mysql_fetch_array($hasil))
{
 // baca no hp pengirim
 $noHP = $data['no_hp'];
 // baca isi sms
 $sms = strtoupper($data['pesan']);
 // baca id sms
 $smsID = $data['pk'];
   
 // memparsing isi sms berdasar karakter #
 $split = explode("#", $sms);
 // membaca keyword perintah
 $command = $split[0];
 
 if($command == "INFO POLI"){
	if(count($split) == 2){
		$tanggal = $split[1];
		$reply = getinfopoli($tanggal);
	}else{
		$reply = "Format penulisan pesan info poli anda salah atau kurang, cek kembali format pesan anda.";
	}
	
 }else if ($command == "BARU"){
	if (count($split) == 9){
        $nama       = $split[1];  
        $jenkel     = $split[2]; 
        $ttl        = $split[3]; 
        $alamat     = $split[4]; 
        $namaibu    = $split[5];
        $poli       = $split[6]; 
        $pembayaran = $split[7]; 
        $tanggal    = $split[8]; 
		
        //tgl hari ini
        $today = date("d-m-Y");
        $today2 = strtotime($today); 
        //tgl pesan
        $tgl_pesan = strtotime($tanggal); 
        //ubah format Y-m-d
        $tgl_ubah = date("Y-m-d", strtotime($tanggal));
	if ($jenkel == "L" || $jenkel == "P"){
        if (CekPembayaran($pembayaran) != NULL){
			if ($tgl_pesan == $today2){
                //hari ini
				$jamplus1 = getJamPraktek($tanggal, $poli, $smsID);
				if($jamplus1 != NULL){										
					$querypasien = mysql_query("INSERT INTO m_kontak (nomor_registrasi, tanggal_registrasi, nomor_telepon, nama, alamat, usia, jenis_kelamin, 
					nama_ibu_kandung, username, password, approved, status_login) VALUES ('".getNoreg()."', '$tgl_ubah', '$noHP', '$nama', '$alamat',
					'".getUmur($ttl)."', '$jenkel', '$namaibu', '".getNoreg()."', '".getNoreg()."', '1', 'pasien')"); 
					
					$queryreg = mysql_query("select * from m_kontak where status_login = 'pasien' order by pk desc");
					$fetchreg = mysql_fetch_array($queryreg);
					$noreg = $fetchreg['nomor_registrasi'];
					
					$hasil_id = getidsession($tgl_ubah, $poli);
					add_antrian($noreg, $jamplus1, $hasil_id, $pembayaran);
					update_totalpasien($hasil_id);
					$reply = balasanbaru($noreg, $hasil_id, $poli); 
					
				}else
                    $reply = "Praktek poli $poli yang anda tuju tidak tersedia pada tanggal $tanggal, coba tanggal lain atau hubungi pihak rumah sakit.";
					
			} else if ($tgl_pesan > $today2){   
                $getid = mysql_query("SELECT a.* FROM m_jadwal_praktek AS a join m_pelayanan AS b ON a.pelayanan_fk = b.pk WHERE 
				a.tanggal_praktek = '$tgl_ubah' AND b.nama_pelayanan = '$poli'
                AND a.batasan_pasien > a.total_pasien
                LIMIT 1");
                $data = mysql_fetch_array($getid);
                $hasil_id = $data['id_session_jadwal'];
                $hasil_jam = $data['jam_praktek'];
                $hasil_tanggal = $data['tanggal_praktek'];
                
                if ($hasil_id != NULL){					
					$now   = date('Y-m-d');	
					$querypasien = mysql_query("INSERT INTO m_kontak (nomor_registrasi, tanggal_registrasi, nomor_telepon, nama, alamat, usia, jenis_kelamin, 
					nama_ibu_kandung, username, password, approved, status_login) VALUES ('".getNoreg()."', '$now', '$noHP', '$nama', '$alamat',
					'".getUmur($ttl)."', '$jenkel', '$namaibu', '".getNoreg()."', '".getNoreg()."', '1', 'pasien')"); 

					$queryreg = mysql_query("select * from m_kontak where status_login = 'pasien' order by pk desc");
					$fetchreg = mysql_fetch_array($queryreg);
					$noreg = $fetchreg['nomor_registrasi'];
					
					add_antrian($noreg, $hasil_jam, $hasil_id, $pembayaran);
					update_totalpasien($hasil_id);
					$reply = balasanbaru($noreg, $hasil_id, $poli);    
                
				} else{
                $reply = "Praktek poli $poli yang anda tuju tidak tersedia pada tanggal $tanggal, coba tanggal lain atau hubungi pihak rumah sakit.";
				echo $reply;}
             } else
             $reply = "Tanggal yang anda masukkan salah, pastikan format tanggal benar (hari-bulan-tahun) atau cek kembali tanggal anda";
        }else 
		{	
        $reply = "Metode pembayaran $pembayaran tidak tersedia, coba metode lain atau hubungi pihak rumah sakit.";
		echo $reply;}
    }else {
	$reply = "Jenis Kelamin $jenkel tidak diketahui, pastikan jenis kelamin L atau P.";
	echo $reply;}
    }else
    $reply = "Format penulisan pesan pasien baru anda salah atau kurang, cek kembali format pesan anda.";	   	
}else if ($command == "LAMA") {
    if (count($split) == 6){
            $noreg       = $split[1];
            $nama        = $split[2];
            $poli        = $split[3]; //poli
            $pembayaran  = $split[4]; //pembayaran
            $tanggal     = $split[5];  //tanggal
            $cekreg = mysql_query("SELECT nomor_registrasi from m_kontak where nomor_registrasi = '$noreg'");
            $data = mysql_fetch_array($cekreg);
            $hsl_cek = $data['nomor_registrasi'];
         if ($hsl_cek != NULL){
               //ada noreg
             
            if (CekPembayaran($pembayaran) != NULL){
                //ada metode pembayaran 
            $today = date("d-m-Y"); //cek tgl hari ini
            $today2 = strtotime($today); //tgl pesan
            $tgl_pesan = strtotime($tanggal); 
            $tgl_ubah = date("Y-m-d", strtotime($tanggal));	//ubah format Y-m-d	
                if (cek_status_pasien($noreg, $tgl_ubah, $poli) == 1){
			     if ($tgl_pesan == $today2){
                //pemesanan hari ini
				  $jamplus1 = getJamPraktek($tanggal, $poli, $smsID);				
                    if($jamplus1 != NULL){	
                        $hasil_id = getidsession($tgl_ubah, $poli);
						add_antrian($hsl_cek, $jamplus1, $hasil_id, $pembayaran);
                        update_totalpasien($hasil_id);
                        $reply = balasanlama($hsl_cek, $hasil_id, $poli); 
					
                    } else 
                        $reply = "Praktek poli $poli yang anda tuju tidak tersedia pada tanggal $tanggal, coba tanggal lain atau hubungi pihak rumah sakit.";
                
					
                 } else if ($tgl_pesan > $today2){  
                        //pemesanan > dari hari ini
                        $getid = mysql_query("SELECT a.* FROM m_jadwal_praktek AS a join m_pelayanan AS b ON a.pelayanan_fk = b.pk WHERE 
                        a.tanggal_praktek = '$tgl_ubah' AND b.nama_pelayanan = '$poli'
                        AND a.batasan_pasien > a.total_pasien
                        LIMIT 1");
                        $data = mysql_fetch_array($getid);
                        $hasil_id = $data['id_session_jadwal'];
                        $hasil_jam = $data['jam_praktek'];
                        $hasil_tanggal = $data['tanggal_praktek'];
                
                        if ($hasil_id != NULL){
							add_antrian($hsl_cek, $hasil_jam, $hasil_id, $pembayaran);
							update_totalpasien($hasil_id);
							$reply = balasanlama($hsl_cek, $hasil_id, $poli);   
                        } else
                             $reply = "Praktek poli $poli yang anda tuju tidak tersedia pada tanggal $tanggal, coba tanggal lain atau hubungi pihak rumah sakit.";
                 }else 
                    $reply = "Tanggal yang anda masukkan salah, pastikan format tanggal benar (hari-bulan-tahun) atau cek kembali tanggal anda"; 
                 }else
                 $reply = "Mohon maaf anda sudah terdaftar di poli yang sama dengan tanggal yang sama";
              }else 
                $reply = "Metode pembayaran $pembayaran tidak tersedia, coba metode lain atau hubungi pihak rumah sakit.";
            ;
             }else
            $reply = "Nomor registrasi anda belum terdaftar, coba cek kembali nomor registrasi anda."; 
    }else 
        $reply = "Format penulisan pesan pasien lama anda salah atau kurang, cek kembali format pesan anda.";         
}else {
    $reply = "Tipe pesan tidak diketahui atau penulisan salah , pastikan format pesan benar (BARU/LAMA/INFO POLI)";          
}
sendsms($noHP, $reply);    
// menandai sms yg sudah diproses
$update = mysql_query("UPDATE sms_inbox SET status_pesan = 'true' WHERE pk = '$smsID'");
}
?>