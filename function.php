<?php

include "config.php";

function cekinbox(){
	// mencari pesan SMS yang masih false (blm diproses)
	$query = "SELECT * FROM inbox WHERE processed = 'false'";
	$hasil = mysql_query($query);

	while ($data = mysql_fetch_array($hasil))
	{
		$sum = 0;
		$no_hp = $data['SenderNumber'];
		  
		// jika UDH nya ada (mrpkan part long SMS)
		if ($data['UDH'] != ''){
			// baca prefix UDH 
			$chop = substr($data['UDH'], 0, 8);
			// baca bagian UDH untuk mendapatkan total part
			$n = (int) substr($data['UDH'], 8, 2);
			$text = "";
			   
			// mencari semua part SMS berdasarkan struktur UDH dan nomor pengirimnya 
			for ($i=1; $i<=$n; $i++){
				// mengkonstruksi UDH untuk setiap part
				$udh = $chop.sprintf("%02s", $n).sprintf("%02s", $i);
				$query3 = "SELECT * FROM inbox WHERE UDH = '$udh' AND SenderNumber = '$no_hp' AND Processed = 'false'";
				$hasil3 = mysql_query($query3);
				if (mysql_num_rows($hasil3) > 0) $sum++;
			}
   
			// jika semua part sudah ada (lengkap), lakukan penggabungan pesan 
			if ($sum == $n){
				for ($i=1; $i<=$n; $i++){
					// mengkonstruksi UDH untuk setiap part
					$udh = $chop.sprintf("%02s", $n).sprintf("%02s", $i);
					// membaca pesan dari setiap part berdasarkan UDH dan nomor pengirimnya
					$query3 = "SELECT * FROM inbox WHERE UDH = '$udh' AND SenderNumber = '$no_hp' AND Processed = 'false'";
					$hasil3 = mysql_query($query3);
					$data3 = mysql_fetch_array($hasil3);
					// proses penggabungan pesan
					$text = $data3['TextDecoded'];
					$id = $data3['ID'];
					// menghapus pesan yang sudah diproses
					$text2[$i] = "$text";
					$query4 = "UPDATE inbox SET Processed = 'true' WHERE ID = '$id'";
					mysql_query($query4);
				}
				$text3 = implode("", $text2);
				// memasukkan pesan utuh hasil penggabungan ke tabel SMS_INBOX
				$notelp = $data['SenderNumber'];
				$text4 = str_replace("'", "\'", $text3); 

				$query2 = "INSERT INTO sms_inbox(no_hp, pesan, status_pesan) VALUES ('$notelp', '$text4', 'false')";
				mysql_query($query2);  
			}   
		} else {
			// jika UDH nya tidak ada (short SMS)
			$id = $data['ID'];
			$no_hp = $data['SenderNumber'];   
			$text = str_replace("'", "\'", $data['TextDecoded']);
		   
			// menghapus pesan yang sudah diproses
			$query3 = "UPDATE inbox SET Processed = 'true' WHERE ID = '$id'";
			mysql_query($query3);
		   
			// memasukkan pesan ke SMS_INBOX
			$query2 = "INSERT INTO sms_inbox(no_hp, pesan, status_pesan) VALUES ('$no_hp', '$text', 'false')";
			mysql_query($query2);
		}
	}
}

function getUmur($ttl){
    $now   = date('Y-m-d');
    $umur = date_diff(date_create($ttl), date_create($now));
    $umur2 = $umur->format('%y');
    return $umur2;
}

function getJamPraktek($tanggal, $poli, $smsID){
    $tgl_ubah = date("Y-m-d", strtotime($tanggal));
        
    $time = mysql_query("select waktu_terima from sms_inbox where status_pesan = 'false' and pk = '$smsID'");
	$waktu = mysql_fetch_array($time);
	$receivetime = $waktu['waktu_terima'];			
			
	$dt = new DateTime($receivetime);
	$time = $dt->format('H:i:s');
	$date = $dt->format('Y-m-d');
	$timestamp = strtotime($time) + 60*60;
	$times = date('H:i:s', $timestamp);			
			
	$jam_praktek = mysql_query("SELECT * from m_jadwal_praktek as a join m_pelayanan as b on a.pelayanan_fk = b.pk where
	a.jam_praktek > '$times' AND a.tanggal_praktek = '$tgl_ubah' AND b.nama_pelayanan = '$poli' and a.total_pasien < 
	a.batasan_pasien limit 1");
	$fetchjam = mysql_fetch_array($jam_praktek);
	return $fetchjam['jam_praktek'];
}

function getNoreg(){
    $jumlah = mysql_query("SELECT nomor_registrasi from m_kontak where status_login = 'pasien' order by m_kontak.pk desc limit 1");
    $a = mysql_fetch_array($jumlah);
    $b = $a['nomor_registrasi'];
    $noreg = substr("$b", 2, 7);
    $nextnoreg = $noreg + 1;
    $data['nomor_registrasi'] = "PA".sprintf("%04s", $nextnoreg);
    return  $data['nomor_registrasi'];
}

function CekPembayaran($bayar) {
    $query = mysql_query("SELECT * FROM m_metode_pembayaran WHERE metode_bayar = '$bayar'");
    $data =  mysql_fetch_array($query);
    return $data['metode_bayar'];
}

function getinfopoli($tanggal){
	$tgl_ubah = date("Y-m-d", strtotime($tanggal));
	$infopoli = mysql_query("SELECT * from m_jadwal_praktek as a join m_pelayanan as b on a.pelayanan_fk = b.pk join m_kontak as c on a.dokter_fk = c.pk  
							where a.tanggal_praktek = '$tgl_ubah'");
		
	$ada = mysql_num_rows($infopoli);
			
	if($ada > 0){
		for($i = 0; $i < $ada; $i++){
			$fetch1 = mysql_fetch_array($infopoli);
			$a = $fetch1['jam_praktek'];
			//$b = $fetch1['tanggal_praktek'];
			$c = $fetch1['nama_pelayanan'];
			$d = $fetch1['nama'];
			$replyarray[$i] = "( $a  -  $tanggal  -  $c  -  $d )";
		}		
			
		$reply = implode(" ", $replyarray);
	} else
		$reply = "Jam praktek pada tanggal $tanggal belum tersedia, silahkan hubungi pihak rumah sakit";
		
	return $reply;
}

function getidsession($tgl_ubah, $poli){
	$idsession = mysql_query("SELECT id_session_jadwal from m_jadwal_praktek as a join m_pelayanan as b on a.pelayanan_fk = b.pk 
							where a.tanggal_praktek = '$tgl_ubah' and b.nama_pelayanan = '$poli' and a.total_pasien < a.batasan_pasien limit 1");	
	$fetchid = mysql_fetch_array($idsession);
	$id = $fetchid['id_session_jadwal'];	
	return $id;
}


function add_antrian($noreg, $jamplus1, $id, $pembayaran){
	$query1 = mysql_query("select a.* from m_jadwal_praktek as a join m_pelayanan as b on a.pelayanan_fk = b.pk where a.id_session_jadwal = '$id'");
	$fetch1 = mysql_fetch_array($query1);
	$fkjadwal = $fetch1['pk'];	
	$tgl_praktek = $fetch1['tanggal_praktek'];
	
	$query2  = mysql_query("select * from m_kontak where status_login = 'pasien' and nomor_registrasi = '$noreg'");
	$fetch2 = mysql_fetch_array($query2);
	$fkpasien = $fetch2['pk'];
	$noregis = $fetch2['nomor_registrasi'];		
	
	$query3 = mysql_query("SELECT pk from m_metode_pembayaran where metode_bayar = '$pembayaran'");
	$fetch3 = mysql_fetch_array($query3);
	$metodebayar = $fetch3['pk'];	
	
	$query4 = mysql_query("SELECT * from m_jadwal_praktek_antrian as a join m_jadwal_praktek as b on a.jadwal_praktek_fk = b.pk 
							where b.id_session_jadwal = '$id' order by a.nomor_urut desc limit 1");
	$fetch4 = mysql_fetch_array($query4);
	$antre = $fetch4['nomor_urut'];			
	$antre = $antre + 1;	

	$queryantrian = mysql_query("INSERT INTO m_jadwal_praktek_antrian (pk, jadwal_praktek_fk, pasien_fk, nomor_registrasi_pasien, jadwal_kunjung, 
								realisasi_kunjung, status_antrian, nomor_urut, status_sms_terkirim, metode_pembayaran_fk) 
								VALUES ('', '$fkjadwal', '$fkpasien', '$noregis', '$tgl_praktek $jamplus1', '', 'Diantrikan', '$antre', '', '$metodebayar')");	
}

function update_totalpasien($id){
	$batas2 = mysql_query("select count(a.jadwal_praktek_fk) b from m_jadwal_praktek_antrian as a join m_jadwal_praktek as b on a.jadwal_praktek_fk = b.pk where b.id_session_jadwal = '$id'");
	$fetchbatas2 = mysql_fetch_assoc($batas2);	
	$update = mysql_query("UPDATE m_jadwal_praktek SET total_pasien = '$fetchbatas2[b]' WHERE id_session_jadwal = '$id'");	
}


function balasanlama($noreg, $id, $poli){
	$pasien = mysql_query("select * from m_kontak as a join m_jadwal_praktek_antrian as b on a.pk = b.pasien_fk join m_jadwal_praktek as c on b.jadwal_praktek_fk = c.pk where a.status_login = 'pasien' and a.nomor_registrasi = '$noreg' and c.id_session_jadwal = '$id'");			
	$praktek = mysql_query("select * from m_jadwal_praktek where id_session_jadwal = '$id'");
	$dokter = mysql_query("select * from m_kontak as a join m_jadwal_praktek as b on a.pk = b.dokter_fk where b.id_session_jadwal = '$id'");
	$ambilpk = mysql_query("select max(pk) as b from m_kontak where status_login = 'pasien'");

	$pasienhasil = mysql_fetch_array($pasien);
	$m_nama = $pasienhasil['nama'];
	$m_noreg = $pasienhasil['nomor_registrasi'];
	$m_username = $pasienhasil['username'];
	$m_password = $pasienhasil['password'];
	$m_antrian = $pasienhasil['nomor_urut'];
	$m_pk = $pasienhasil['pasien_fk'];

	$praktekhasil = mysql_fetch_array($praktek);
	$m_tanggal = $praktekhasil['tanggal_praktek'];
	$m_jam = $praktekhasil['jam_praktek'];

	$dokterhasil = mysql_fetch_array($dokter);	
	$m_dokter = $dokterhasil['nama'];	

	$hasilpk = mysql_fetch_array($ambilpk);	
	$m__pk = $hasilpk['b'];		
	
//	if($m_pk < $m__pk){
		$reply = "$m_nama - $m_noreg - $m_tanggal - $m_jam - No Urut : $m_antrian - $m_dokter - SELAMAT ANDA TELAH TERDAFTAR SEBAGAI PASIEN $poli DI RUMAH SAKIT AMAL SEHAT";
//	}else{
//		$reply = "$m_nama - $m_noreg - $m_tanggal - $m_jam - No Urut : $m_antrian - $m_dokter - USERNAME : $m_username - PASSWORD : $m_password - SELAMAT ANDA TELAH TERDAFTAR SEBAGAI PASIEN $poli DI RUMAH SAKIT AMAL SEHAT";
//	} 
	return $reply;
}

function balasanbaru($noreg, $id, $poli){
	$pasien = mysql_query("select * from m_kontak as a join m_jadwal_praktek_antrian as b on a.pk = b.pasien_fk join m_jadwal_praktek as c on b.jadwal_praktek_fk = c.pk where a.status_login = 'pasien' and a.nomor_registrasi = '$noreg' and c.id_session_jadwal = '$id'");			
	$praktek = mysql_query("select * from m_jadwal_praktek where id_session_jadwal = '$id'");
	$dokter = mysql_query("select * from m_kontak as a join m_jadwal_praktek as b on a.pk = b.dokter_fk where b.id_session_jadwal = '$id'");
	$ambilpk = mysql_query("select max(pk) as b from m_kontak where status_login = 'pasien'");

	$pasienhasil = mysql_fetch_array($pasien);
	$m_nama = $pasienhasil['nama'];
	$m_noreg = $pasienhasil['nomor_registrasi'];
	$m_username = $pasienhasil['username'];
	$m_password = $pasienhasil['password'];
	$m_antrian = $pasienhasil['nomor_urut'];
	$m_pk = $pasienhasil['pasien_fk'];

	$praktekhasil = mysql_fetch_array($praktek);
	$m_tanggal = $praktekhasil['tanggal_praktek'];
	$m_jam = $praktekhasil['jam_praktek'];

	$dokterhasil = mysql_fetch_array($dokter);	
	$m_dokter = $dokterhasil['nama'];	

	$hasilpk = mysql_fetch_array($ambilpk);	
	$m__pk = $hasilpk['b'];		
	
//	if($m_pk < $m__pk){
//		$reply = "$m_nama - $m_noreg - $m_tanggal - $m_jam - No Urut : $m_antrian - $m_dokter - SELAMAT ANDA TELAH TERDAFTAR SEBAGAI PASIEN $poli DI RUMAH SAKIT AMAL SEHAT";
//	}else{
    $reply = "$m_nama - $m_noreg - $m_tanggal - $m_jam - No Urut : $m_antrian - $m_dokter - USERNAME : $m_username - PASSWORD : $m_password - SELAMAT ANDA TELAH TERDAFTAR SEBAGAI PASIEN $poli DI RUMAH SAKIT AMAL SEHAT";
//	} 
	return $reply;
}

function cek_status_pasien($noreg, $tgl_ubah, $poli){
 $status = mysql_query("select * from m_jadwal_praktek_antrian as a join m_jadwal_praktek as b on a.jadwal_praktek_fk = b.pk join           m_pelayanan as c on b.pelayanan_fk = c.pk where a.nomor_registrasi_pasien = '$noreg' and b.tanggal_praktek = '$tgl_ubah' and        c.nama_pelayanan = '$poli'");

$status1 = mysql_fetch_row($status);
if ($status1 == 0 ){
        return 1;
} else
        return 0;
}
function sendsms($noHP, $reply){
   $query = "SHOW TABLE STATUS LIKE 'outbox'";
   $hasil = mysql_query($query);
   $data  = mysql_fetch_array($hasil);
   $newID = $data['Auto_increment'];  
  
	if (strlen($reply)<=160){
		$query = "INSERT INTO outbox (DestinationNumber, TextDecoded, ID, CreatorID) VALUES ('$noHP', '$reply', '$newID', 'Gammu')";
		mysql_query($query);
	}else{
		$jmlSMS = ceil(strlen($reply)/153);
		$pecah  = str_split($reply, 153);
		
		for ($i=1; $i<=$jmlSMS; $i++){
			// membuat UDH untuk setiap pecahan, sesuai urutannya
			$udh = "050003A7".sprintf("%02s", $jmlSMS).sprintf("%02s", $i);
			// membaca text setiap pecahan
			$msg = $pecah[$i-1];
		   
			if ($i == 1){
			  // jika merupakan pecahan pertama, maka masukkan ke tabel OUTBOX
			  $query = "INSERT INTO outbox (DestinationNumber, UDH, TextDecoded, ID, MultiPart, CreatorID)
						VALUES ('$noHP', '$udh', '$msg', '$newID', 'true', 'Gammu')";
			}
			else{
			  // jika bukan merupakan pecahan pertama, simpan ke tabel OUTBOX_MULTIPART
			  $query = "INSERT INTO outbox_multipart(UDH, TextDecoded, ID, SequencePosition)
						VALUES ('$udh', '$msg', '$newID', '$i')";
			}

			// jalankan query
			mysql_query($query);
		}
	}
}

?>