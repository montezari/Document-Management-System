/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.5.34 : Database - duta_doc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tm_dept` */

CREATE TABLE `tm_dept` (
  `cKdDept` varchar(3) NOT NULL,
  `vNmDept` varchar(50) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdDept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_dept` */

insert  into `tm_dept`(`cKdDept`,`vNmDept`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values 
('MIS','Management Information System','1','2015-03-20 23:47:05','1','2015-03-20 23:47:05');

/*Table structure for table `tm_dokumen` */

CREATE TABLE `tm_dokumen` (
  `cKdDokumen` int(11) NOT NULL AUTO_INCREMENT,
  `cOwner` int(11) DEFAULT NULL,
  `cName` varchar(250) DEFAULT NULL,
  `cFileName` varchar(250) DEFAULT NULL,
  `cKeterangan` text,
  `cKdKategori` varchar(100) DEFAULT NULL,
  `dDate` datetime DEFAULT NULL,
  `cViewed` int(11) DEFAULT '0',
  `cAktif` int(11) DEFAULT '1',
  `cUserEntry` int(11) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` int(11) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdDokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_dokumen` */

/*Table structure for table `tm_folder` */

CREATE TABLE `tm_folder` (
  `cKdFolder` int(11) NOT NULL AUTO_INCREMENT,
  `vNmFolder` varchar(100) DEFAULT NULL,
  `cKdHdrFolder` int(11) DEFAULT NULL,
  `cOwner` int(11) DEFAULT NULL,
  `cOrder` int(11) DEFAULT '0',
  `cAktif` int(11) DEFAULT '1',
  `cUserEntry` int(11) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` int(11) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdFolder`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tm_folder` */

insert  into `tm_folder`(`cKdFolder`,`vNmFolder`,`cKdHdrFolder`,`cOwner`,`cOrder`,`cAktif`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values 
(8,'Test',0,1,0,1,1,'2015-04-19 20:14:31',1,'2015-04-19 20:14:31'),
(9,'coba',8,1,0,1,1,'2015-04-19 20:17:59',1,'2015-04-19 20:17:59'),
(10,'iwan',8,1,0,1,1,'2015-04-20 11:41:08',1,'2015-04-20 11:41:08');

/*Table structure for table `tm_kantor` */

CREATE TABLE `tm_kantor` (
  `cKdKantor` int(11) NOT NULL AUTO_INCREMENT,
  `vNmKantor` varchar(100) DEFAULT NULL,
  `cAlamat` text,
  `cKota` varchar(100) DEFAULT NULL,
  `cNoTelp` varchar(15) DEFAULT NULL,
  `cFax` varchar(15) DEFAULT NULL,
  `cUserEntry` int(11) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` int(11) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdKantor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tm_kantor` */

insert  into `tm_kantor`(`cKdKantor`,`vNmKantor`,`cAlamat`,`cKota`,`cNoTelp`,`cFax`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values 
(1,'HEAD OFFICE','TEST','JAKARTA','123','456',1,'2015-03-20 23:22:42',1,'2015-03-20 23:22:42');

/*Table structure for table `tm_kategori` */

CREATE TABLE `tm_kategori` (
  `cKdKategori` int(11) NOT NULL AUTO_INCREMENT,
  `cKdGrpKategori` int(11) DEFAULT NULL,
  `vNmKategori` varchar(50) DEFAULT NULL,
  `cUserEntry` int(11) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` int(11) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdKategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tm_kategori` */

insert  into `tm_kategori`(`cKdKategori`,`cKdGrpKategori`,`vNmKategori`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values 
(1,NULL,'BERKAS',1,'2015-04-18 20:57:59',1,'2015-04-18 20:57:59'),
(2,1,'ISO',1,'2015-04-18 20:58:18',1,'2015-04-18 20:58:18'),
(3,NULL,'FORM',1,'2015-04-18 20:59:22',1,'2015-04-18 20:59:22'),
(4,3,'FORM CUTI',1,'2015-04-18 20:59:40',1,'2015-04-18 20:59:40'),
(5,1,'PENDUKUNG ISO',1,'2015-04-18 21:00:26',1,'2015-04-18 21:00:26'),
(6,NULL,'IWAN',1,'2015-04-20 11:37:13',1,'2015-04-20 11:37:13');

/*Table structure for table `tsm_groupuser` */

CREATE TABLE `tsm_groupuser` (
  `cKdGroupUser` int(11) NOT NULL AUTO_INCREMENT,
  `vNmGroupUser` varchar(50) DEFAULT NULL,
  `cAktif` char(1) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdGroupUser`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tsm_groupuser` */

/*Table structure for table `tsm_logged` */

CREATE TABLE `tsm_logged` (
  `dTgl` datetime DEFAULT NULL,
  `fip` varchar(20) DEFAULT NULL,
  `cUserName` varchar(30) DEFAULT NULL,
  `csession_id` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tsm_logged` */

insert  into `tsm_logged`(`dTgl`,`fip`,`cUserName`,`csession_id`) values 
('2015-09-30 11:16:48','127.0.0.1','admin@localhost.com','aa60bba9ab6d937d64826f803bb62729'),
('2015-09-24 20:27:28','127.0.0.1','admin@localhost.com','742b9ee5f6389ac770f54f749bc7245f'),
('2015-08-17 01:08:04','127.0.0.1','admin@localhost.com','93a6d7ee73ba4c37d9c58627c31afe88'),
('2015-07-02 11:53:02','127.0.0.1','admin@localhost.com','6ff7a83de5d94e87558247b2a835bb97'),
('2015-05-27 00:00:42','127.0.0.1','admin@localhost.com','d9a0f8297207c9cfd519999a1274190b'),
('2015-05-26 22:25:58','127.0.0.1','admin@localhost.com','fd7dc0693134acc1a8ea4ee8f2079f90'),
('2015-05-26 20:20:16','127.0.0.1','admin@localhost.com','4cb3e1f7f24c837099fb1301da76ed8e'),
('2015-05-26 17:03:07','127.0.0.1','admin@localhost.com','1768f8094f9ca3d4bbd842e16bbc82e3'),
('2015-05-26 15:59:04','127.0.0.1','admin@localhost.com','bd2b66aba83a35765c2c0d56d0c7d9c0'),
('2015-05-26 15:38:35','127.0.0.1','admin@localhost.com','fdda4341ec38a32bd1245e674e355092'),
('2015-04-21 00:10:30','::1','admin@localhost.com','4167ac859298b89ae68e29e0836060fb'),
('2015-04-20 21:18:14','::1','admin@localhost.com','31f614952ed26c6663aa091cb46e0c09'),
('2015-04-20 11:33:22','::1','admin@localhost.com','18a3ae274910d824f8c1265db9088113'),
('2015-04-18 23:13:46','::1','admin@localhost.com','b27b8e8718d4a4d7a3b5098734d338ed'),
('2015-04-18 20:33:56','::1','admin@localhost.com','76b351f0aaa0548cac3f328ec5442382'),
('2015-04-18 08:43:03','::1','admin@localhost.com','22f78cf7440378a36e973bb6d3ae5033'),
('2015-04-18 01:06:06','::1','admin@localhost.com','6ae35f43f8df95cd5e487bc2806e9583'),
('2015-04-18 01:04:47','::1','admin@localhost.com','140fa7333dbd43b95ead6d1084403ab6'),
('2015-04-18 01:01:23','::1','admin@localhost.com','eed01c6767d193268c5893b08f4ebb6d'),
('2015-04-18 01:00:29','::1','admin','6b3cb420073a3d6877a9bcdda4a1767b');

/*Table structure for table `tsm_menu` */

CREATE TABLE `tsm_menu` (
  `fmenu` varchar(3) NOT NULL,
  `fparent` varchar(3) DEFAULT NULL,
  `fcaption` varchar(50) DEFAULT NULL,
  `fhandler` varchar(150) DEFAULT NULL,
  `ficon` varchar(100) DEFAULT NULL,
  `fnoedit` char(1) DEFAULT NULL,
  `fpublic` char(1) DEFAULT NULL,
  `forder` int(11) DEFAULT NULL,
  PRIMARY KEY (`fmenu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tsm_menu` */

insert  into `tsm_menu`(`fmenu`,`fparent`,`fcaption`,`fhandler`,`ficon`,`fnoedit`,`fpublic`,`forder`) values 
('000',NULL,'Home','index.php',NULL,'1','1',0),
('100',NULL,'System Manager',NULL,'fa fa-user','0','0',0),
('101','100','User Group','user.group',NULL,'0','0',0),
('102','100','Privileges','user.priv',NULL,'0','0',0),
('103','100','User','user.user',NULL,'0','0',0),
('200',NULL,'Master Data',NULL,'fa fa-user','0','0',0),
('300',NULL,'Transaction',NULL,'fa fa-user','0','0',0),
('400',NULL,'Report',NULL,'fa fa-user','0','0',0);

/*Table structure for table `tsm_priv` */

CREATE TABLE `tsm_priv` (
  `cKdGroupUser` int(11) NOT NULL,
  `cKdModuleId` varchar(5) NOT NULL,
  `cView` varchar(1) DEFAULT NULL,
  `cAdd` varchar(1) DEFAULT NULL,
  `cEdit` varchar(1) DEFAULT NULL,
  `cHapus` varchar(1) DEFAULT NULL,
  `cSubItem` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cKdGroupUser`,`cKdModuleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tsm_priv` */

/*Table structure for table `tsm_transno` */

CREATE TABLE `tsm_transno` (
  `cKdEntity` varchar(3) DEFAULT NULL,
  `cIdTrans` varchar(10) DEFAULT NULL,
  `cCount` int(11) DEFAULT NULL,
  `cKodeDok` varchar(20) DEFAULT NULL,
  `cBulan` varchar(2) DEFAULT NULL,
  `cTahun` varchar(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `tsm_transno` */

/*Table structure for table `tsm_user` */

CREATE TABLE `tsm_user` (
  `cIdUser` int(11) NOT NULL AUTO_INCREMENT,
  `cUserName` varchar(30) DEFAULT NULL,
  `cPassword` varchar(50) DEFAULT NULL,
  `cNamaLengkap` varchar(150) DEFAULT NULL,
  `dLastLogin` datetime DEFAULT NULL,
  `cKdDept` varchar(3) DEFAULT NULL,
  `cAktif` varchar(1) DEFAULT '1',
  `cSuper` varchar(1) DEFAULT '0',
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cIdUser`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tsm_user` */

insert  into `tsm_user`(`cIdUser`,`cUserName`,`cPassword`,`cNamaLengkap`,`dLastLogin`,`cKdDept`,`cAktif`,`cSuper`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values 
(1,'admin@localhost.com','sbc1RA3OJTr0hGhr1YKpbcT4D8tYpuraC6qq99ba9E8=','Administrator','2015-09-30 11:16:48','MIS','1','1',NULL,NULL,'ADMIN','2014-10-10 11:10:36');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
