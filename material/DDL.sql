CREATE TABLE customer
(
     nik VARCHAR2 (20) PRIMARY KEY NOT NULL,
     username VARCHAR2(30) REFERENCES akun,
     nama VARCHAR (30),
     ttl DATE,
     alamat VARCHAR2 (100),
     email VARCHAR2 (30),
     no_tlpn NUMBER
);

CREATE TABLE akun
(
    username VARCHAR2 (30) PRIMARY KEY NOT NULL,
    nik VARCHAR (30) NOT NULL,
    password VARCHAR2 (30),
    nama_lengkap VARCHAR2 (30),
    email VARCHAR2 (30)
);

CREATE TABLE transport
(
    id_transportasi VARCHAR2(10) PRIMARY KEY NOT NULL,
    nama_trnsprt VARCHAR2 (20),
    jenis_transport VARCHAR2 (20),
    kelas VARCHAR2 (10) ,
    kapasitas_trnsprt NUMBER,
    rute VARCHAR2 (30),
    no_kursi VARCHAR2 (10),
    harga NUMBER
);

CREATE TABLE penginapan
(
    id_penginapan VARCHAR2 (10) PRIMARY KEY NOT NULL,
    nama_penginapan VARCHAR2 (30),
    no_kamar NUMBER,
    jenis_penginapan VARCHAR2 (10),
    type_penginapan VARCHAR2 (10),
    kapasitas NUMBER,
    lokasi VARCHAR2(30)        	
);


CREATE TABLE memesan 
(
	jam_keberangkatan TIMESTAMP NOT NULL,
	id_transportasi VARCHAR2(10) NOT NULL,
	username VARCHAR2 (30) NOT NULL,
	tujuan VARCHAR2 (20),	
	kode_tiket VARCHAR2(15) PRIMARY KEY NOT NULL,
	tmpt_keberangkatan VARCHAR2(20),
	tanggal_keberangkatan DATE,
    	FOREIGN KEY (username) REFERENCES akun(username),
    	FOREIGN KEY (id_transportasi) REFERENCES transport(id_transportasi)
);

CREATE TABLE pemesanan 
(	
    	tanggal_menginap DATE,
	username VARCHAR2 (30) NOT NULL,	
	id_penginapan VARCHAR2 (10) NOT NULL,
	lokasi_menginap VARCHAR2(30),
	tanggal_keluar DATE,
    	kode_pesan VARCHAR2(20) PRIMARY KEY NOT NULL,
	FOREIGN KEY (username) REFERENCES akun(username),
    	FOREIGN KEY (id_penginapan) REFERENCES penginapan(id_penginapan)
);

CREATE TABLE customer_service
(
    	id_cs varchar2(30) PRIMARY KEY NOT NULL,
    	kode_tiket VARCHAR2(15),
    	kode_pesan VARCHAR(20),
	nama_cs varchar2(30),
	email varchar2(30),
	no_tlp varchar2 (15),
	alamat_cs varchar2 (50),
    	FOREIGN KEY(kode_tiket) 
    	REFERENCES memesan(kode_tiket),
    	FOREIGN KEY(kode_pesan)
    	REFERENCES pemesanan(kode_pesan)
);

Create table pembayaran
 (
	kode_bayar varchar2(20) PRIMARY KEY NOT NULL,
    	kode_tiket VARCHAR2(15),
    	kode_pesan VARCHAR(20),
    	id_penginapan VARCHAR2(10),
	norek_perusahaan varchar2(20),
	norek varchar2(20),
	metode_pembayaran varchar2(20),
	tanggal_bayar DATE,
	total_harga NUMBER,
	status varchar2(30),
    	FOREIGN KEY(kode_tiket) 
    	REFERENCES memesan(kode_tiket),
    	FOREIGN KEY(kode_pesan)
    	REFERENCES pemesanan(kode_pesan)
);
