CREATE TABLE akun
(
    username VARCHAR2 (30) PRIMARY KEY NOT NULL,
    nik VARCHAR (30) NOT NULL,
    password VARCHAR2 (30),
    nama_lengkap VARCHAR2 (30),
    email VARCHAR2 (30)
);

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
    jenis_penginapan VARCHAR2 (15),
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

INSERT INTO akun VALUES ('dean',31298090031212,'deanherb1','herb dean','herbdean.12@gmail.com');
INSERT INTO akun VALUES ('jdhan',3121238839021,'jdhan123','adhan janujaz','adhanjanujaz@gmail.com');
INSERT INTO akun VALUES ('chrisB',312981399203,'chrisB','Chris Brown','chrisbro@gmail.com');
INSERT INTO akun VALUES ('Lunox',31298213138429,'lunox','lunox','lunoxML@gmail.com');
INSERT INTO akun VALUES ('Alucard',31239201940324,'alucard12','Alucard','AucardML@gmail.com');
INSERT INTO akun VALUES ('Jhonson',31221930280291,'Jhonson134','M.jhonson','jhonson@gmail.com');
INSERT INTO akun VALUES ('zilong',31238238219482,'YZ839','Yun Zhao','Yunzhao22@gmail.com');
INSERT INTO akun VALUES ('hanabi',31249394013932,'selena33','Hanabi','selenaG@gmail.com');
INSERT INTO akun VALUES ('lesley',31298038321023,'lesleyMM','leassy ley','lesleyML@gmail.com');
INSERT INTO akun VALUES ('Bruno',31298412941492,'BrunoMM','Cristian Bruno','Cbruno@gmail.com');
INSERT INTO akun VALUES ('natalia',31294921804214,'nataAss','natali anindya','nataliaML@gmail.com');
INSERT INTO akun VALUES ('akai',31294248194282,'akaiTank','akaipanda','akaipanda@gmail.com');
INSERT INTO akun VALUES ('aldous',31273840218421,'aldous23','mark aldous','m.aldous12@gmail.com');
INSERT INTO akun VALUES ('harley',31247482109992,'GGharley','mighty harley','harleyDvd@gmail.com');
INSERT INTO akun VALUES ('chang.e',31298241800014,'change31','chang.e','changederm@gmail.com');
INSERT INTO akun VALUES ('fanny',31298499122921,'steph21','stephanie','fannygirl@gmail.com');
INSERT INTO akun VALUES ('saber',31293830018332,'sabreman','salim bradd','herbdean.12@gmail.com');
INSERT INTO akun VALUES ('gusion',31298090039932,'gosen1','mr.gusion','gusiam@gmail.com');
INSERT INTO akun VALUES ('roku',31298090031212,'rokuju','avatar roku','rokuav@gmail.com');
INSERT INTO akun VALUES ('frankk',31298090031312,'hookGG','hook franco','francohook@gmail.com');

INSERT INTO customer VALUES (31298090031222,'dean','herb dean','01-12-1992','JL. boulvard kelapa gading no.21','herbdean.12@gmail.com',081293029100);
INSERT INTO customer VALUES (31212388390213,'jdhan','adhan janujaz','06-05-2000','JL.sesama no.30','adhanjanujaz@gmail.com',081293029212);
INSERT INTO customer VALUES (31298139920390,'chrisB','Chris Brown','18-10-1997','JL.soekarno hatta no.100','chrisbro@gmail.com',081239201277);
INSERT INTO customer VALUES (31298213138429,'Lunox','lunox','14-11-1999','JL.soekarno hatta raya no.99','lunoxML@gmail.com',08123382912);
INSERT INTO customer VALUES (31239201940324,'Alucard','Alucard','14-12-1999','JL.soekarno hatta raya no.2','AucardML@gmail.com',081233130039);
INSERT INTO customer VALUES (31221930280291,'Jhonson','M.jhonson','04-10-1988','JL.boulvard kelapa gading no.54','jhonson@gmail.com',081330319382);
INSERT INTO customer VALUES (31238238219482,'zilong','Yun Zhao','01-12-1992','JL.soekarno hatta raya no.1c','Yunzhao22@gmail.com',082133028832);
INSERT INTO customer VALUES (31249394013932,'hanabi','Hanabi','14-12-1996','JL.soekarno hatta raya no.14c','selenaG@gmail.com',085899213032);
INSERT INTO customer VALUES (31298038321023,'lesley','leassy ley','14-12-1996','JL.sesama no.23','lesleyML@gmail.com',083249440041);
INSERT INTO customer VALUES (31298412941492,'Bruno','Cristian Bruno','03-12-1990','JL.boulvard kelapa gading no.27','Cbruno@gmail.com',082133023341);
INSERT INTO customer VALUES (31294921804214,'natalia','natali anindya','23-12-1990','JL.sesama 13','nataliaML@gmail.com',083839213029);
INSERT INTO customer VALUES (31294248194282,'akai','akaipanda','24-04-1992','JL.soekarno hatta raya no.45','akaipanda@gmail.com',082230103391);
INSERT INTO customer VALUES (31273840218421,'aldous','mark aldous','31-03-1990','JL.boulvard kelapa gading no.89','m.aldous12@gmail.com',082293010039);
INSERT INTO customer VALUES (31247482109992,'harley','mighty harley','30-04-1982','JL.sesama no.1b','harleyDvd@gmail.com',087833929300);
INSERT INTO customer VALUES (31298241800014,'chang.e','chang.e','01-09-1982','JL.soekarno hatta raya no.10b','changederm@gmail.com',081293029039);
INSERT INTO customer VALUES (31298499122921,'fanny','stephanie','17-08-1996','JL.soekarno hatta raya no.44','fannygirl@gmail.com',081293029121);
INSERT INTO customer VALUES (31293830018332,'saber','salim bradd','22-10-1998','JL.boulvard kelapa gading no.60','herbdean.12@gmail.com',081293029132);
INSERT INTO customer VALUES (31298090039932,'gusion','mr.gusion','27-11-1999','JL.sesama no.12b','gusiam@gmail.com',081293029213);
INSERT INTO customer VALUES (31298090031212,'roku','avatar roku','20-12-1984','JL.sesama no.23','rokuav@gmail.com',081233919321);
INSERT INTO customer VALUES (31298090031312,'frankk','hook franco','04-10-1988','JL.soekarno hatta raya no.13b','francohook@gmail.com',081293029111);

INSERT INTO transport VALUES ('KR001','Kutojaya','Kereta','Ekonomi',300,'Jakarta - Malang','ABCD',65000);
INSERT INTO transport VALUES ('KR002','Argowilis','Kereta','Eksekutif',300,'Bandung - Malang','ABCD',350000);
INSERT INTO transport VALUES ('KR003','Argo Dwipangga','Kereta','Eksekutif',300,'Jakarta - Jogja','ABCD',300000);
INSERT INTO transport VALUES ('KR004','Mutiara Selatan','Kereta','Bisnis',300,'Bandung - Malang','ABCD',205000);
INSERT INTO transport VALUES ('KR005','Serayu','Kereta','Ekonomi',300,'Jakarta - Solo','ABCD',65000);
INSERT INTO transport VALUES ('PS001','Batik Air','Pesawat','Ekonomi',200,'Jakarta - Bali','ABCD',900000);
INSERT INTO transport VALUES ('PS002','Lion Air','Pesawat','Ekonomi',180,'Jogja - Surabaya','ABCD',750000);
INSERT INTO transport VALUES ('PS003','Garuda Indonesia','Pesawat','Bisnis',150,'Jakarta - Jepang ','ABCD',2500000);
INSERT INTO transport VALUES ('PS004','Susi Air','Pesawat','Bisnis',200,'Surabaya - Papua','ABCD',1200000);
INSERT INTO transport VALUES ('PS005','Air Asia','Pesawat','Eksekutif',150,'Jakarta - Miami','ABCD',5000000);
INSERT INTO transport VALUES ('BS001','Sumber Alam','Bus','Ekonomi',50,'Purwokerto - Jogja','ABCD',60000);
INSERT INTO transport VALUES ('BS002','Efisiensi','Bus','Eksekutif',45,'Jogja - Malang','ABCD',100000);
INSERT INTO transport VALUES ('BS003','Wisata Komodo','Bus','Eksekutif',35,'Jakarta - Bali','ABCD',300000);
INSERT INTO transport VALUES ('BS004','Rosalia Indah','Bus','Eksekutif',40,'Purwokerto - Malang','ABCD',350000);
INSERT INTO transport VALUES ('BS005','Tayo','Bus','Ekonomi',50,'Jakarta - Bekasi','ABCD',80000);
INSERT INTO transport VALUES ('TR001','Nusa Indah','Travel','Ekonomi',20,'Jakarta - Bandung','ABCD',100000);
INSERT INTO transport VALUES ('TR002','Bina Citra','Travel','Eksekutif',15,'Jakarta - Jogja','ABCD',300000);
INSERT INTO transport VALUES ('TR003','Karunia Indah','Travel','Eksekutif',20,'Bandung - Solo','ABCD',500000);
INSERT INTO transport VALUES ('TR004','Bina Manggala','Travel','Ekonomi',40,'Jogja - Surabaya','ABCD',400000);
INSERT INTO transport VALUES ('TR005','Nunggal Eka','Travel','Eksekutif',35,'Malang - Solo','ABCD',455000);
INSERT INTO transport VALUES ('KP001','Nusa Indah','Kapal','Ekonomi',100,'Jakarta - Medan','ABCD',150000);
INSERT INTO transport VALUES ('KP002','Bina Citra','Kapal','Eksekutif',100,'Surabaya - Bali','ABCD',300000);
INSERT INTO transport VALUES ('KP003','Karunia Indah','Kapal','Eksekutif',100,'Semarang - Papua','ABCD',500000);
INSERT INTO transport VALUES ('KP004','Bina Manggala','Kapal','Ekonomi',150,'Jakarta - Pontianak','ABCD',300000);
INSERT INTO transport VALUES ('KP005','Nunggal Eka','Kapal','Eksekutif',100,'Surabaya - Bnagka Belitung','ABCD',455000);

INSERT INTO penginapan VALUES ('HT001','Luxure Hotel',10,'familyroom','family','6','Jakarta');
INSERT INTO penginapan VALUES ('HT002','SetiaBudi Hotel',13,'Singleroom','Single','2','Semarang');
INSERT INTO penginapan VALUES ('HT003','Aston Hotel',122,'Kingroom','King','2','Solo');
INSERT INTO penginapan VALUES ('HT004','Ibis Hoel',03,'Doubleroom','Double','2','Semarang');
INSERT INTO penginapan VALUES ('HT005','Clove Hotel',10,'Singleroom','Single','1','Jogja');
INSERT INTO penginapan VALUES ('HT006','RedDoorz Hotel',70,'SingleRoom','Single','1','Bandung');
INSERT INTO penginapan VALUES ('HT007','Serela Hotel',44,'President','family','6','Bandung');
INSERT INTO penginapan VALUES ('HT008','Yello Hotel',10,'doubleyroom','Double','2','Jakarta');
INSERT INTO penginapan VALUES ('HT009','Grand Hotel',34,'familyroom','family','6','jogja');
INSERT INTO penginapan VALUES ('HT010','Novena Hotel',27,'kingroom','King','2','Bandung');
INSERT INTO penginapan VALUES ('MT001','Bantal Guling',2,'BackPacker','Single','1','Solo');
INSERT INTO penginapan VALUES ('MT002','Budi Motel',10,'familyroom','family','6','Semarang');
INSERT INTO penginapan VALUES ('MT003','Cihampelas Motel',22,'familyroom','family','6','Bandung');
INSERT INTO penginapan VALUES ('MT004','Unique Guesthouse',5,'Doubleroom','Double','2','Jogja');
INSERT INTO penginapan VALUES ('MT005','Cihampelas 2 Motel',22,'familyroom','family','6','Jogja');
INSERT INTO penginapan VALUES ('MT006','Bumi Hegar Hotel',10,'Singleroom','Single','1','Bandung');
INSERT INTO penginapan VALUES ('MT007','Pelangi Hotel',33,'familyroom','family','6','Solo');
INSERT INTO penginapan VALUES ('MT008','Pondok Ayuni ',20,'familyroom','family','6','Semarang');
INSERT INTO penginapan VALUES ('MT009','Catelly Hotel',10,'Singleroom','Single','1','Jakarta');
INSERT INTO penginapan VALUES ('MT010','Cipagati Hotel',27,'familyroom','family','6','Surabaya');

INSERT INTO memesan VALUES
('07:00:00','KR001','dean','Malang','KDKR001','Jakarta','02-04-2017');
INSERT INTO memesan VALUES
('01:00:00','KR002','jdhan','Malang','KDKR002','Bandung','28-02-2017');
INSERT INTO memesan VALUES
('07:00:00','KR003','chrisB','Jogja','KDKR003','Jakarta','16-11-2017');
INSERT INTO memesan VALUES
('13:00:00','KR004','Lunox','Malang','KDKR004','Bandung','16-09-2017');
INSERT INTO memesan VALUES
('08:10:00','KR005','Alucard','Solo','KDKR005','Jakarta','03-10-2017');
INSERT INTO memesan VALUES
('12:00:00','PS001','Jhonson','Bali','KDPS001','Jakarta','12-11-2017');
INSERT INTO memesan VALUES
('09:00:00','PS002','zilong','Surabaya','KDPS002','Jogja','13-08-2017');
INSERT INTO memesan VALUES
('10:00:00','PS003','hanabi','Jepang','KDPS003','Jakarta','06-10-2017');
INSERT INTO memesan VALUES
('14:30:00','PS004','lesley','Papua','KDPS004','Surabaya','18-06-2017');
INSERT INTO memesan VALUES
('07:00:00','PS005','Bruno','Miami','KDPS005','Jakarta','03-08-2017');
INSERT INTO memesan VALUES
('15:30:00','BS001','natalia','Jogja','KDBS001','Purwokerto','13-10-2017');
INSERT INTO memesan VALUES
('06:30:00','BS002','akai','Malang','KDBS002','Jogja','29-08-2017');
INSERT INTO memesan VALUES
('10:30:00','BS003','aldous','Bali','KDBS003','Jakarta','29-06-2017');
INSERT INTO memesan VALUES
('05:30:00','BS004','harley','Malang','KDBS004','Purwokerto','28-02-2017');
INSERT INTO memesan VALUES
('03:30:00','BS005','chang.e','Bekasi','KDBS005','Jakarta','06-10-2017');
INSERT INTO memesan VALUES
('11:00:00','TR001','fanny','Bandung','KDTR001','Jakarta','03-10-2017');
INSERT INTO memesan VALUES
('21:00:00','TR002','saber','Jogja','KDTR002','Jakarta','12-11-2017');
INSERT INTO memesan VALUES
('20:00:00','TR003','gusion','Solo','KDTR003','Bandung','03-08-2017');
INSERT INTO memesan VALUES
('04:00:00','TR004','roku','Surabaya','KDTR004','Jogja','18-06-2017');
INSERT INTO memesan VALUES
('16:30:00','TR005','frankk','Solo','KDTR005','Malang','29-08-2017');
INSERT INTO memesan VALUES
('23:30:00','KP001','dean','Medan','KDKP001','Jakarta','13-08-2017');
INSERT INTO memesan VALUES
('04:00:00','KP002','jdhan','Bali','KDKP002','Surabaya','02-10-2017');
INSERT INTO memesan VALUES
('12:00:00','KP003','chrisB','Papua','KDKP003','Semarang','13-10-2017');
INSERT INTO memesan VALUES
('19:00:00','KP004','Lunox','Pontianak','KDKP004','Jakarta','28-02-2017');
INSERT INTO memesan VALUES
('18:30:00','KP005','Alucard','Bangka Belitung','KDKP005','Surabaya','01-01-2017');
INSERT INTO memesan VALUES
('07:00:00','KR001','Jhonson','Malang','KDKR006','Jakarta','02-04-2017');
INSERT INTO memesan VALUES
('15:30:00','KR002','zilong','Malang','KDKR007','Bandung','28-02-2017');
INSERT INTO memesan VALUES
('14:30:00','KR003','hanabi','Jogja','KDKR008','Jakarta','16-11-2017');
INSERT INTO memesan VALUES
('12:30:00','KR004','lesley','Malang','KDKR009','Bandung','16-09-2017');
INSERT INTO memesan VALUES
('11:30:00','KR005','Bruno','Solo','KDKR010','Jakarta','03-10-2017');
INSERT INTO memesan VALUES
('10:30:00','PS001','natalia','Bali','KDPS006','Jakarta','12-11-2017');
INSERT INTO memesan VALUES
('18:30:00','PS002','akai','Surabaya','KDPS007','Jogja','13-08-2017');
INSERT INTO memesan VALUES
('17:30:00','PS003','aldous','Jepang','KDPS008','Jakarta','06-10-2017');
INSERT INTO memesan VALUES
('22:30:00','PS004','harley','Papua','KDPS009','Surabaya','18-06-2017');
INSERT INTO memesan VALUES
('16:30:00','PS005','chang.e','Miami','KDPS010','Jakarta','03-08-2017');
INSERT INTO memesan VALUES
('19:30:00','BS001','fanny','Jogja','KDBS006','Purwokerto','13-10-2017');
INSERT INTO memesan VALUES
('18:00:00','BS002','saber','Malang','KDBS007','Jogja','29-08-2017');
INSERT INTO memesan VALUES
('13:00:00','BS003','gusion','Bali','KDBS008','Jakarta','30-06-2017');
INSERT INTO memesan VALUES
('09:30:00','BS004','roku','Malang','KDBS009','Purwokerto','28-02-2017');
INSERT INTO memesan VALUES
('06:30:00','BS005','frankk','Bekasi','KDBS010','Jakarta','06-10-2017');
INSERT INTO memesan VALUES
('05:00:00','TR001','dean','Bandung','KDTR006','Jakarta','03-10-2017');
INSERT INTO memesan VALUES
('23:00:00','TR002','jdhan','Jogja','KDTR007','Jakarta','12-11-2017');
INSERT INTO memesan VALUES
('15:00:00','TR003','chrisB','Solo','KDTR008','Bandung','03-08-2017');
INSERT INTO memesan VALUES
('14:00:00','TR004','Lunox','Surabaya','KDTR009','Jogja','18-06-2017');
INSERT INTO memesan VALUES
('19:30:00','TR005','Alucard','Solo','KDTR010','Malang','29-08-2017');
INSERT INTO memesan VALUES
('18:30:00','KP001','Jhonson','Medan','KDKP006','Jakarta','13-08-2017');
INSERT INTO memesan VALUES
('16:30:00','KP002','zilong','Bali','KDKP007','Surabaya','02-10-2017');
INSERT INTO memesan VALUES
('13:30:00','KP003','hanabi','Papua','KDKP008','Semarang','13-10-2017');
INSERT INTO memesan VALUES
('15:30:00','KP004','lesley','Pontianak','KDKP009','Jakarta','28-02-2017');
INSERT INTO memesan VALUES
('11:30:00','KP005','Bruno','Bangka Belitung','KDKP010','Surabaya','01-01-2017');

INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('01-01-2017','dean','HT001','Jakarta','03-01-2017','KDHT001');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','jdhan','HT002','Semarang','01-03-2017','KDHT002');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('16-11-2017','chrisB','HT003','Solo','18-11-2017','KDHT003');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('16-09-2017','Lunox','HT004','Semarang','18-09-2017','KDHT004');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-10-2017','Alucard','HT005','Jogja','05-10-2017','KDHT005');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('12-11-2017','Jhonson','HT006','Bandung','17-11-2017','KDHT006');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-08-2017','zilong','HT007','Bandung','14-08-2017','KDHT007');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('06-10-2017','hanabi','HT008','Jakarta','08-10-2017','KDHT008');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('18-06-2017','lesley','HT009','Jogja','21-06-2017','KDHT009');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-08-2017','Bruno','HT010','Bandung','05-08-2017','KDHT010');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-10-2017','natalia','MT001','Solo','15-10-2017','KDMT001');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('29-08-2017','akai','MT002','Semarang','30-08-2017','KDMT002');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('30-06-2017','aldous','MT003','Bandung','02-07-2017','KDMT003');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','harley','MT004','Jogja','02-03-2017','KDMT004');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('06-12-2017','harley','MT005','Jogja','09-10-2017','KDMT005');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-10-2017','fanny','MT006','Bandung','04-10-2017','KDMT006');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('12-11-2017','saber','MT007','Solo','14-11-2017','KDMT007');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-08-2017','gusion','MT008','Semarang','08-08-2017','KDMT008');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('18-06-2017','roku','MT009','Jakarta','19-06-2017','KDMT009');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('29-08-2017','frankk','MT010','Surabaya','30-08-2017','KDMT010');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-08-2017','dean','HT001','Jakarta','14-08-2017','KDHT011');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('02-10-2017','jdhan','HT002','Semarang','05-10-2017','KDHT012');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-10-2017','chrisB','HT003','Solo','14-10-2017','KDHT013');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','Lunox','HT004','Semarang','03-03-2017','KDHT014');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('01-01-2017','Alucard','HT005','Jogja','04-01-2017','KDHT015');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('02-04-2017','Jhonson','HT006','Bandung','03-04-2017','KDHT016');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','zilong','HT007','Bandung','03-03-2017','KDHT017');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('16-11-2017','hanabi','HT008','Jakarta','17-11-2017','KDHT018');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('16-09-2017','lesley','HT009','Jogja','19-09-2017','KDHT019');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-10-2017','Bruno','HT010','Bandung','06-10-2017','KDHT020');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('12-11-2017','natalia','MT001','Solo','13-11-2017','KDMT011');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-08-2017','akai','MT002','Semarang','15-08-2017','KDMT012');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('06-10-2017','aldous','MT003','Bandung','08-10-2017','KDMT013');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('18-06-2017','harley','MT004','Jogja','20-06-2017','KDMT014');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('30-10-2017','chang.e','MT005','Jogja','02-11-2017','KDMT015');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-10-2017','fanny','MT006','Bandung','15-10-2017','KDMT016');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('29-08-2017','saber','MT007','Solo','02-09-2017','KDMT017');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('30-06-2017','gusion','MT008','Semarang','03-07-2017','KDMT018');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','roku','MT009','Jakarta','01-03-2017','KDMT019');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('06-10-2017','frankk','MT010','Surabaya','07-10-2017','KDMT020');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-10-2017','natalia','HT001','Jakarta','04-10-2017','KDHT021');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('12-11-2017','akai','HT002','Semarang','13-11-2017','KDHT022');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('03-08-2017','aldous','HT003','Solo','04-08-2017','KDHT023');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('18-06-2017','harley','HT004','Semarang','20-06-2017','KDHT024');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('29-08-2017','chang.e','HT005','Jogja','30-08-2017','KDHT025');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-08-2017','fanny','HT006','Bandung','14-08-2017','KDHT026');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('02-10-2017','saber','HT007','Bandung','03-10-2017','KDHT027');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('13-10-2017','gusion','HT008','Jakarta','15-10-2017','KDHT028');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('28-02-2017','roku','HT009','Jogja','03-03-2017','KDHT029');
INSERT INTO pemesanan
(tanggal_menginap,username,id_penginapan,lokasi_menginap,tanggal_keluar,kode_pesan) VALUES
('01-01-2017','frankk','HT010','Bandung','03-01-2017','KDHT030');

INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd01','KDHT001','HT001','4510123','34561','teller','01-01-2011','1400000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd02','KDKR002','HT002','4510123','34562','m-banking','02-02-2011','1350000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd03','KDHT003','HT003','4510123','34563','teller','03-03-2011','1000000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd04','KDKR004','HT004','4510123','34564','m-banking','04-05-2011','4400000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd05','KDHT005','HT005','4510123','34565','teller','05-06-2011','2300000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd06','KDPS001','HT006','4510123','34566','m-banking','06-07-2011','2450000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd07','KDHT007','HT007','4510123','34567','teller','07-08-2011','3400000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd08','KDPS003','HT008','4510123','34568','m-banking','08-09-2011','4500000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd09','KDHT009','HT009','4510123','34569','teller','09-10-2011','2250000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd010','KDPS005','HT010','4510123','345610','m-banking','10-11-2011','3780000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd011','KDMT001','MT001','4510123','345611','teller','11-12-2011','1470000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd012','KDBS002','MT002','4510123','345612','m-banking','12-01-2012','5400000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd013','KDMT003','MT003','4510123','345613','teller','13-02-2012','10400000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd014','KDBS004','MT004','4510123','345614','m-banking','14-03-2012','15000000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd015','KDMT005','MT005','4510123','345615','teller','15-04-2012','20000000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd016','KDTR001','MT006','4510123','345616','m-banking','16-05-2012','10450000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd017','KDMT007','MT007','4510123','345617','teller','17-06-2012','18000000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd018','KDTR003','MT008','4510123','345618','m-banking','18-07-2012','17450000','belum lunas');
INSERT INTO pembayaran (kode_bayar,kode_pesan,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd019','KDMT009','MT009','4510123','345619','teller','19-08-2012','16500000','lunas');
INSERT INTO pembayaran (kode_bayar,kode_tiket,id_penginapan,norek_perusahaan,norek,metode_pembayaran,tanggal_bayar,total_harga,status) VALUES ('kd020','KDTR005','MT010','4510123','345620','m-banking','20-09-2012','19000000','belum lunas');


INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs01','KDHT001','susi melati','susi01@gmail.com','082228123401','jl.melati no.01 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs02','KDKR002','mawar sukma','mawar02@gmail.com','082228123402','jl.mawar no.02 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs03','KDHT003','puji astuti','puji03@gmail.com','082228123403','jl.melati no.11 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs04','KDKR004','andre akbar','andre04@gmail.com','082228123404','jl.matahari no.01 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs05','KDHT005','suswanto','suswanto05@gmail.com','082228123405','jl.bunga sepatu no.02 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs06','KDPS001','akbari','akbari06@gmail.com','082228123406','jl.matahari no.22 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs07','KDHT007','dinda putri','dinda07@gmail.com','082228123407','jl.mawar no.05 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs08','KDPS003','usi trilaksono','usi08@gmail.com','082228123408','jl.bunga sepatu no.10 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs09','KDHT009','dhea dhin','dhea09@gmail.com','082228123409','jl.anggrek no.01 jakarta pusat');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs10','KDPS005','trisyan atmaja','trisyan10@gmail.com','082228123410','jl.taman persib no.01 bandung');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs11','KDMT001','firhan','firhan11@gmail.com','082228123411','jl.cibiru no.20 bandung');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs12','KDBS002','hafiz rizky','hafiz12@gmail.com','082228123412','jl.cicadas no.30 bandung');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs13','KDMT003','putri ayu','putri13@gmail.com','082228123413','jl.cikutra no.05 bandung');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs14','KDBS004','aulia','aulia14@gmail.com','082228123414','jl.dayeuhkolot no.01 bandug');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs15','KDMT005','anatasya mei','anatasya15@gmail.com','082228123415','jl.jakarta no.102 bandung');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs16','KDTR001','jati kusuma','jati16@gmail.com','082228123416','jl.antapani no.10 bandung');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs17','KDMT007','ryan','ryan17@gmail.com','082228123417','jl.mangga no.06 indramayu');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs18','KDTR003','rifat haris','rifat18@gmail.com','082228123418','jl.era no.14 padalarang');
INSERT INTO customer_service (id_cs,kode_pesan,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs19','KDMT009','amanda','amanda19@gmail.com','082228123419','jl.soekarno-hatta no.15 surabaya');
INSERT INTO customer_service (id_cs,kode_tiket,nama_cs,email,no_tlp,alamat_cs) VALUES ('cs20','KDTR005','joel andrew','joel20@gmail.com','082228123420','jl.pejuang no.18 surabaya');

commit;