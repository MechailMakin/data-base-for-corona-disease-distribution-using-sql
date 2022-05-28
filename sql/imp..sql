DROP DATABASE IF EXISTS corona_distripution;
CREATE DATABASE corona_distripution;

CREATE TABLE Governorate(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
Name_govv VARCHAR(30),
population INT
);

CREATE TABLE cases(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
case_name VARCHAR(100)
);

CREATE TABLE patients( -- phone no
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
f_name VARCHAR(50),
m_name VARCHAR(50),
l_name VARCHAR(50),
phone_number DECIMAL,
gender VARCHAR(10),
blood_type VARCHAR(5),
Birth_date DATE,
pt_address VARCHAR(100),
over_seas_tarvel BOOL,
ethnicity VARCHAR(50),
Gov_id INT NOT NULL,
case_id INT NOT NULL,
protocol_id INT NOT NULL,
FOREIGN KEY (Gov_id) REFERENCES Governorate(id),
FOREIGN KEY (case_id) REFERENCES cases(id),
FOREIGN KEY (protocol_id) REFERENCES protocols(id)
);

CREATE TABLE Patient_bed(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Bed_type VARCHAR(50),
patient_status VARCHAR(50),
Pt_id INT NOT NULL,
FOREIGN KEY (Pt_id) REFERENCES patients(id)
);

CREATE TABLE Isolations(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Iso_type VARCHAR(50),
St_Name VARCHAR(50),
St_Number INT,
Gov_id INT NOT NULL,
FOREIGN KEY (Gov_id) REFERENCES Governorate(id)
);

CREATE TABLE Patient_isolation(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
iso_Discharge_Date DATE,
iso_Charge_Date DATE,
pt_id INT NOT NULL,
IsoType_id INT NOT NULL,
FOREIGN KEY (pt_id) REFERENCES patients(id),
FOREIGN KEY (IsoType_id) REFERENCES Isolations(id)
);

CREATE TABLE patient_test( -- new
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
test_result BOOL,
test_date DATE,
pt_id INT NOT NULL,
FOREIGN KEY (pt_id) REFERENCES patients(id)
);

CREATE TABLE Isolation_beds(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
normal_beds INT,
Icu_beds INT,
Ventilation_beds INT,
IsoType_id INT NOT NULL,
FOREIGN KEY (IsoType_id) REFERENCES Isolations(id)
);

CREATE TABLE Tests(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Test_Result BOOL, -- msh random
Test_date DATE
);

CREATE TABLE Test_Order(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Test_Order VARCHAR(20),
Pt_id INT NOT NULL,
Test_id INT NOT NULL,
FOREIGN KEY (Pt_id) REFERENCES patients(id),
FOREIGN KEY (Test_id) REFERENCES Tests(id)
);

CREATE TABLE Patient_chronic_diseases(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
chronic_diseases VARCHAR(100),
PT_id INT NOT NULL,
FOREIGN KEY (Pt_id) REFERENCES patients(id)
);

CREATE TABLE medicines(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
med_name VARCHAR(100),
category VARCHAR(100),
prod_date DATE,
ex_date DATE,
quantity INT
);

CREATE TABLE protocols(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
protocol_name VARCHAR(100)
);

CREATE TABLE protocol_medicines(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
med_id INT NOT NULL,
protocol_id INT NOT NULL,
FOREIGN KEY (protocol_id) REFERENCES protocols(id),
FOREIGN KEY (med_id) REFERENCES medicines(id)
);

INSERT INTO `Governorate` (`Name_govv`,`population`) VALUES ("Rome",2710),("Milan",2475),("Naples",4224),("Turin",4934),("Palermo",1933),("Bari",1712),("Catania",3822),("Bologna",1970),("Florence",3774),("Genoa",2481);
INSERT INTO `Governorate` (`Name_govv`,`population`) VALUES ("Venice",3214),("Messina",4162),("Reggio Calabria",1337),("Cagliari",2194);

INSERT INTO `cases` (`case_name`) VALUES ("Active"),("Probable"),("Death");

INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Petra","Hall","Leonard","3528460970","female","AB+","1985-03-29 ","P.O. Box 581, 7445 Duis Street","1"," Latino ",13,1,5),("Nehru","Amir","Garrett","3054454295","male","A-","2014-09-29 ","Ap #436-7103 Cubilia Av.","0"," African ",4,3,3),("Keegan","Salvador","Ashton","3853424669","male","","2011-07-27 ","1137 Et St.","1"," American Indian",9,2,2),("Genevieve","Cole","Todd","3181886096","female","B+","1967-03-29 ","P.O. Box 216, 9119 Turpis Avenue","1"," African ",2,3,1),("Stephanie","Cyrus","Jonah","3943761323","female","ِA+","2006-04-06 ","P.O. Box 724, 8111 Sed Avenue","0"," American Indian",11,1,2),("Colorado","Garrison","Griffin","3934817640","male","AB-","1974-04-24 ","P.O. Box 999, 4385 Cras Street","0","White ",6,1,1),("Ria","Demetrius","Barclay","3983054876","female","AB-","1995-10-27 ","4451 Est Road","0"," African ",12,1,1),("Ima","Zahir","Bevis","3716317837","female","","1981-09-18 ","Ap #468-7513 Est. Av.","0"," Latino ",13,1,2),("Porter","Grant","Akeem","3395029177","male","","1963-02-21 ","P.O. Box 213, 4726 Tempor Avenue","1","White ",6,1,3),("Harriet","Linus","Prescott","3449757446","female","AB+","1992-07-18 ","P.O. Box 635, 7597 A, Ave","1","White ",7,2,5);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Cain","Garrison","David","3567990580","male","","1974-08-29 ","Ap #278-1034 Ullamcorper Ave","0"," American Indian",4,2,1),("Kasper","Yuli","Donovan","3747791523","male","O-","1975-12-04 ","833-6824 Et St.","1"," Latino ",1,2,1),("Florence","Rashad","Bruce","3635258819","female","A-","1979-11-01 ","803-7959 Diam. Ave","1"," American Indian",5,1,4),("Ezekiel","Beau","Eagan","3138056927","male","","2013-12-19 ","P.O. Box 599, 6234 Tempus Rd.","0"," American Indian",4,3,4),("Felicia","Hashim","Gregory","3034247246","female","ِA+","1962-11-16 ","487-2376 Sit Av.","0"," Latino ",2,1,2),("Irma","Henry","Dorian","3554716352","female","B+","2001-05-02 ","Ap #723-7246 Et, Road","1"," Latino ",14,2,5),("Kylan","Jerry","Driscoll","3696557431","female","B-","1996-03-28 ","P.O. Box 296, 1330 Felis Road","0"," African ",12,2,5),("Chase","Carson","Kuame","3589226756","male","O+","1997-03-30 ","515 Morbi Avenue","1","White ",8,1,5),("Iris","Donovan","Burton","3506291392","female","O+","1997-09-02 ","Ap #161-9553 Nec St.","0"," African ",6,1,5),("Holmes","Seth","Thane","3225847200","male","AB+","2008-09-03 ","9045 Interdum St.","1"," African ",7,2,5);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Louis","Hakeem","Edan","3486850282","male","A-","1967-04-09 ","612-1668 Cursus Avenue","1"," American Indian",2,2,4),("Fitzgerald","Ralph","Samuel","3324630343","male","AB-","2009-08-30 ","P.O. Box 758, 2698 Urna, St.","0"," Latino ",12,1,2),("Maile","Mufutau","Kelly","3627936525","female","","2009-12-18 ","Ap #203-3874 Montes, Rd.","0","White ",8,2,2),("Celeste","Howard","Raphael","3766562038","female","A-","1979-09-04 ","5742 Phasellus Street","0"," African ",10,2,3),("Bradley","Samuel","Rooney","3304233436","male","AB-","1967-11-20 ","P.O. Box 871, 1768 At Street","1"," American Indian",3,2,1),("Baxter","Ciaran","Wade","3622824771","male","B-","1968-10-16 ","P.O. Box 656, 9363 Est. St.","1","White ",10,1,3),("Giacomo","Wesley","Sean","3939071545","male","O-","2005-07-20 ","140-7817 At St.","1"," Latino ",12,3,1),("Wylie","Chandler","Hunter","3986384030","male","AB+","1969-12-11 ","Ap #302-3996 Ligula. Street","0"," Latino ",12,1,5),("Mallory","Kasper","Cullen","3276222668","female","B+","1998-12-06 ","Ap #897-5118 Cursus Rd.","0"," Latino ",2,1,2),("September","Davis","Charles","3491837231","female","AB+","1969-08-09 ","Ap #357-5374 Eleifend Rd.","1"," Latino ",10,3,1);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Thor","Jerome","Daniel","3638422094","male","ِA+","2010-04-08 ","430-3216 Placerat, Av.","1"," African ",1,2,5),("Lael","Ulric","Dexter","3761424100","female","ِA+","1997-05-25 ","P.O. Box 902, 5705 Ac Road","0"," African ",10,3,2),("Abdul","Marsden","Avram","3696819399","male","ِA+","1979-07-31 ","861-1302 Nec St.","0"," African ",5,3,2),("Evan","Talon","Neville","3979926621","male","B-","2004-06-15 ","166 A St.","0"," Latino ",5,3,3),("Chava","Rudyard","Tobias","3068717347","female","AB-","1998-04-29 ","P.O. Box 219, 914 Amet Av.","0"," American Indian",10,1,3),("Imogene","Beau","Cain","3231260834","female","ِA+","1973-02-03 ","P.O. Box 958, 1545 Volutpat Street","0"," African ",4,1,4),("Hashim","Hayden","Theodore","3601263413","male","ِA+","2013-03-10 ","P.O. Box 453, 9842 Nulla Av.","0","White ",9,1,3),("Victoria","Buckminster","Silas","3650377225","female","O+","1981-07-27 ","Ap #431-4171 Nisi. Road","1","White ",12,2,5),("Zelenia","Bevis","Lance","3991276607","female","O+","1992-01-17 ","P.O. Box 783, 1762 Fringilla. Rd.","0"," African ",2,1,2),("Nehru","Roth","Colorado","3926214043","male","B-","2004-10-04 ","Ap #929-3868 Mattis St.","1"," Latino ",1,1,3);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Dillon","Camden","Timon","3348752700","male","O+","1989-05-29 ","5355 Maecenas Rd.","1"," African ",14,1,1),("Merrill","Ryder","Zane","3817150869","male","AB+","1999-02-25 ","627-9918 Eu Avenue","1","White ",11,1,5),("Mechelle","Samson","Caesar","3304308731","female","ِA+","1961-03-02 ","Ap #211-7541 Nisl Road","1","White ",12,2,2),("Uta","Ignatius","Ralph","3499444091","female","O+","1969-06-09 ","725-6746 Parturient Rd.","1"," American Indian",3,2,4),("Xena","Ferdinand","Cooper","3905889740","female","AB-","1994-07-25 ","2026 Mauris Av.","0"," African ",4,3,1),("Tanek","Wallace","Armando","3211115218","male","O+","1966-05-11 ","3772 Augue, Road","0"," American Indian",13,3,5),("Alice","Erich","Russell","3156736692","female","AB+","1972-06-30 ","361 Suspendisse Ave","0"," Latino ",9,2,5),("Zelda","Moses","Moses","3184473741","female","A-","2009-09-29 ","185-9198 Nulla. Rd.","1"," American Indian",8,3,4),("Plato","Dillon","Jameson","3297365214","male","B-","2014-09-20 ","Ap #481-1372 Donec Rd.","1"," Latino ",9,1,4),("Harrison","Len","Maxwell","3442794565","male","B+","1978-12-22 ","P.O. Box 221, 4554 Sollicitudin St.","1","White ",10,2,1);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Bradley","Kaseem","Barrett","3317534895","male","B+","2013-01-03 ","P.O. Box 551, 5912 Senectus Rd.","1","White ",5,1,4),("Nicole","Keane","Galvin","3157019389","female","A-","1999-01-02 ","Ap #201-8842 Quisque Av.","0"," American Indian",6,1,2),("Shaeleigh","Edan","Raphael","3219163857","female","A-","1993-07-16 ","9588 Vestibulum Street","1","White ",11,1,5),("Tashya","Brett","Aaron","3430413328","female","AB+","2011-06-11 ","109-8893 Malesuada Av.","0","White ",6,2,1),("Garrison","Beau","Rashad","3545204347","male","AB-","1970-03-28 ","2549 Sem, Rd.","1"," African ",8,1,4),("Wyoming","Trevor","Isaac","3026168127","female","AB-","1983-08-09 ","Ap #922-6620 Tortor, Av.","0"," American Indian",3,2,4),("Madeline","Simon","Macon","3168171242","female","O-","1981-06-19 ","7431 Tempor Rd.","1"," African ",2,2,4),("Nola","Wayne","Ryan","3680292102","female","B-","2014-02-15 ","Ap #912-3707 Turpis. Road","1","White ",4,3,1),("Cecilia","Zeus","Sean","3041821082","female","B-","1999-02-12 ","P.O. Box 109, 3593 Vivamus St.","0","White ",1,2,4),("Kenyon","Odysseus","Rashad","3535768049","male","AB-","2012-02-19 ","409-6044 Et Rd.","1"," American Indian",11,1,5);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Grady","Emerson","Hakeem","3390870942","male","","1964-11-19 ","Ap #597-340 Ac St.","0"," Latino ",6,3,1),("Austin","Hasad","Timothy","3916992496","male","AB-","1980-09-20 ","3594 Gravida. Av.","1"," Latino ",14,3,3),("Kim","Boris","Seth","3105212033","female","O+","1967-04-10 ","5738 Ante Street","0"," Latino ",4,1,2),("Tyrone","Elton","Allen","3597680968","male","AB-","2010-07-18 ","816-4888 Sagittis Av.","1"," Latino ",12,1,2),("Kenneth","Paki","Calvin","3856705140","male","B-","1997-01-20 ","Ap #149-8179 Lacinia. St.","0"," African ",14,2,2),("Yetta","Luke","Brett","3167156413","female","B+","1973-07-01 ","Ap #490-1349 Et, Road","1"," Latino ",9,3,1),("Clio","Shad","Herrod","3170675685","female","AB+","2009-09-24 ","453-7969 Volutpat. Street","0"," Latino ",2,1,4),("Flynn","Rahim","Eric","3792552001","male","AB-","2005-06-16 ","639-4928 Montes, Street","1"," African ",4,1,4),("Eve","Timothy","Merrill","3037647562","female","ِA+","1987-10-29 ","P.O. Box 538, 2053 Etiam Road","1","White ",11,2,1),("Yasir","Jameson","Jasper","3612399350","male","AB-","1977-04-01 ","Ap #787-7604 Aliquam Av.","1"," African ",1,1,2);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Nash","Quinn","Victor","3972291160","male","B-","1998-05-05 ","Ap #896-4894 Ac Rd.","0"," Latino ",4,1,5),("Christian","Brett","Amir","3555726827","male","A-","1984-05-24 ","Ap #653-4525 Ultricies Road","0"," African ",7,2,4),("Adria","Chester","Quamar","3653781581","female","B-","1970-02-24 ","259-1425 Nec Street","1"," Latino ",2,3,1),("Kelly","Zahir","Ali","3113938935","male","A-","1982-06-06 ","Ap #649-1730 Sed, St.","1"," Latino ",3,3,2),("Ifeoma","Dale","Neville","3887857218","female","B+","2013-11-28 ","2522 Nunc Road","1"," American Indian",10,2,2),("Kirby","Levi","Rahim","3131013098","female","AB-","2001-01-19 ","Ap #521-8551 In Road","0"," American Indian",11,1,4),("Vielka","Aladdin","Dalton","3498201962","female","AB-","2006-07-24 ","7132 Felis. St.","1"," American Indian",3,1,2),("Kirk","Silas","Kaseem","3249829289","male","AB-","1965-10-10 ","831-2709 Eget Rd.","0","White ",2,3,1),("Maite","Chase","Guy","3853065747","female","A-","1989-11-24 ","7622 Magnis St.","1"," African ",3,1,3),("Harper","Ryan","Ali","3880621925","male","O+","1980-02-12 ","652-5881 Nulla Av.","1"," American Indian",5,3,5);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Cassidy","Marshall","Brady","3416835146","female","O-","1997-10-26 ","Ap #117-8448 Pellentesque Road","1"," Latino ",9,3,2),("Rigel","Ulysses","Vernon","3688418145","male","B-","1984-04-20 ","5049 Ornare St.","1","White ",4,3,3),("Alea","Todd","Sylvester","3115175716","female","","2000-01-30 ","664-9037 Egestas Road","0","White ",11,1,1),("Sydnee","Raymond","Herrod","3452551147","female","O-","2014-12-15 ","P.O. Box 789, 5060 Eu Rd.","1"," American Indian",11,3,4),("Leslie","Alden","Ezra","3377189813","female","B-","1983-09-06 ","P.O. Box 356, 303 Est Rd.","0","White ",12,2,5),("Steel","Asher","Craig","3085871603","male","AB-","1972-09-27 ","P.O. Box 700, 7957 Cum St.","1","White ",4,2,3),("Zenia","Hunter","Arthur","3344245427","female","B+","1967-08-20 ","P.O. Box 593, 4751 Enim Rd.","1"," American Indian",6,3,4),("Carla","Lucas","Asher","3237446367","female","O-","1983-10-04 ","Ap #155-4172 Purus. Road","1"," American Indian",6,3,1),("Ramona","Uriah","Dale","3980452207","female","B-","1980-10-21 ","P.O. Box 424, 1989 Et Av.","1"," American Indian",14,3,2),("Leroy","Daquan","Todd","3824980764","male","","1967-12-25 ","6867 Est, St.","1"," Latino ",7,1,5);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Whoopi","Vernon","Arsenio","3658053061","female","B-","1979-12-28 ","Ap #556-4331 A, St.","0"," American Indian",7,2,1),("Shafira","Henry","Abel","3965408289","female","","2000-07-21 ","Ap #679-4223 Nunc Street","0"," African ",8,3,3),("Dean","Patrick","Jack","3170679493","male","ِA+","2008-10-08 ","P.O. Box 544, 8321 Dictum Street","0"," African ",2,1,4),("Coby","Castor","Randall","3632171992","male","","2012-11-29 ","2179 Lacus. Street","1"," Latino ",12,2,2),("Griffith","Ethan","Myles","3064769510","male","B+","1963-05-15 ","8680 Nibh St.","0"," Latino ",13,3,5),("Lacota","Mannix","Christian","3708263352","female","AB+","1997-06-08 ","Ap #872-7167 Ac Rd.","0","White ",6,2,3),("Kimberley","Quinn","Amir","3477444916","female","AB+","2000-09-02 ","Ap #390-5981 Tempus, Rd.","0","White ",2,3,2),("Ira","Harding","Stuart","3552514683","male","O+","1968-12-15 ","Ap #315-1073 Consectetuer St.","0"," Latino ",11,1,3),("Hollee","James","Luke","3447890425","female","A-","1984-11-09 ","160-5843 Libero Ave","0"," African ",5,2,2),("Leah","Knox","Marvin","3566876619","female","AB-","2007-11-29 ","P.O. Box 277, 6634 Nulla Rd.","0"," American Indian",7,3,4); 
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("john","Locas","Legend","3567990580","male","A-","1999-10-07","7348 Cum Ave","1","African",4,2,1);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Micheal","fluid","peterson","3486850282","male","A+","1988-01-20","P.O. Box 197, 9483 Neque Av.","0","Latino",2,2,4);
INSERT INTO `patients` (`f_name`,`m_name`,`l_name`,`phone_number`,`gender`,`blood_type`,`Birth_date`,`pt_address`,`over_seas_tarvel`,`ethnicity`,`Gov_id`,`case_id`,`protocol_id`) VALUES ("Jennifer","lopez","Fernandez","3348752700","female","B+","1990-10-04","7348 Cum Ave","1","Latino",4,1,5);


INSERT INTO `Tests` (`Test_Result`,`Test_date`) VALUES ("0","2020-09-17"),("0","2020-11-10"),("1","2020-10-06"),("0","2020-08-18"),("0","2020-03-28"),("0","2020-11-23"),("1","2020-11-25"),("1","2020-11-11"),("1","2020-07-27"),("1","2020-10-06"),("0","2020-09-01"),("0","2020-12-12"),("1","2020-08-15"),("1","2020-10-23"),("1","2020-10-01"),("0","2020-05-28"),("0","2020-09-12"),("1","2020-09-08"),("0","2020-11-12"),("1","2020-04-04"),("0","2020-06-09"),("1","2020-03-01"),("0","2020-12-13"),("0","2020-01-22"),("1","2020-09-29"),("1","2020-02-05"),("1","2020-01-04"),("1","2020-09-14"),("1","2020-11-01"),("0","2020-03-13"),("0","2020-07-27"),("0","2020-06-30"),("1","2020-09-18"),("0","2020-06-26"),("1","2020-12-04"),("0","2020-08-20"),("0","2020-07-08"),("1","2020-02-12"),("0","2020-05-17"),("0","2020-02-04"),("0","2020-01-01"),("1","2020-06-12"),("0","2020-07-17"),("0","2020-02-07"),("1","2020-05-01"),("1","2020-02-19"),("1","2020-01-10"),("0","2020-05-12"),("1","2020-06-05"),("1","2020-08-16"),("1","2020-12-20"),("1","2020-08-09"),("0","2020-05-25"),("1","2020-11-20"),("0","2020-07-12"),("1","2020-03-11"),("1","2020-04-01"),("1","2020-12-19"),("0","2020-06-08"),("0","2020-12-01"),("1","2020-12-04"),("0","2020-06-01"),("1","2020-07-15"),("0","2020-06-10"),("0","2020-07-13"),("0","2020-03-26"),("0","2020-07-01"),("0","2020-01-01"),("1","2020-03-09"),("0","2020-04-18"),("0","2020-01-07"),("0","2020-07-20"),("1","2020-07-12"),("0","2020-06-30"),("1","2020-11-07"),("0","2020-12-26"),("1","2020-02-20"),("1","2020-06-16"),("1","2020-08-03"),("0","2020-10-02"),("0","2020-04-27"),("1","2020-03-25"),("0","2020-04-10"),("0","2020-07-30"),("0","2020-08-23"),("0","2020-10-07"),("1","2020-04-19"),("0","2020-02-11"),("0","2020-11-14"),("1","2020-01-17"),("0","2020-03-11"),("0","2020-02-20"),("0","2020-11-26"),("0","2020-11-08"),("1","2020-09-16"),("1","2020-12-23"),
("0","2020-03-02"),("0","2020-10-10"),("1","2020-04-01"),("0","2020-06-26"),("1","2020-01-07"),("1","2020-02-07");
INSERT INTO `Tests` (`Test_Result`,`Test_date`) VALUES("0","2020-02-20");
INSERT INTO `Tests` (`Test_Result`,`Test_date`) VALUES("1","2020-03-20"),("0","2020-04-05");
INSERT INTO `Tests` (`Test_Result`,`Test_date`) VALUES("1","2020-03-05"),("1","2020-03-21"),("0","2020-04-08");


INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Third",72,41),("Second",41,4),("Second",91,44),("First",49,5),("Third",26,62),("First",91,7),("Second",94,44),("First",5,43),("Third",3,59),("Second",54,93);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Third",13,22),("Second",49,11),("Third",22,34),("Third",94,75),("Second",8,14),("Second",38,50),("First",50,22),("Second",70,96),("Third",4,92),("Third",54,69);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Second",95,50),("Third",22,82),("First",34,24),("Third",12,93),("First",48,99),("Third",100,59),("Second",52,8),("Second",79,77),("Third",43,20),("First",8,99);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",24,4),("Second",92,9),("Third",25,24),("Second",1,79),("First",42,17),("Second",80,49),("Third",63,24),("Second",81,92),("First",84,19),("Second",63,13);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",73,100),("Second",19,71),("Second",78,64),("First",63,83),("Third",3,24),("Second",17,91),("Second",80,100),("Third",54,87),("Second",71,44),("First",68,65);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",67,62),("Third",4,26),("Second",59,70),("Second",57,15),("First",11,51),("Third",69,46),("Second",52,97),("First",100,84),("First",46,100),("First",47,92);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Third",2,88),("Second",46,3),("Second",2,7),("Third",57,35),("First",84,97),("Third",82,18),("Second",40,70),("Second",76,40),("Third",5,52),("Second",51,39);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Third",9,55),("First",63,48),("First",92,86),("Third",73,80),("First",21,56),("Third",43,47),("Third",59,7),("Second",84,26),("Second",65,2),("Second",96,49);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("Second",31,45),("Second",77,14),("Third",46,48),("Second",61,90),("First",79,93),("Third",44,51),("Second",44,92),("First",43,5),("Second",100,17),("Second",68,30);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",11,47),("Second",27,44),("Third",39,65),("Second",88,51),("Third",69,30),("Third",100,70),("First",35,66),("Third",42,64),("Third",30,23),("Second",31,88);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",101,101),("Second",101,102),("Third",101,103);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",102,104),("Second",101,105);
INSERT INTO `Test_Order` (`Test_Order`,`Pt_id`,`Test_id`) VALUES ("First",103,106),("Second",103,107),("Third",103,108);

INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (60,29,21,90),(92,11,14,53),(26,15,4,58),(60,49,29,86),(122,17,15,23),(65,24,6,4),(33,40,4,30),(129,37,11,98),(138,13,19,81),(58,1,25,28);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (103,19,16,66),(43,3,18,55),(76,23,13,93),(156,35,3,86),(177,40,22,68),(129,17,10,71),(82,35,25,43),(113,31,12,74),(132,11,17,47),(177,28,5,86);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (50,36,29,77),(185,11,30,74),(169,37,15,83),(92,31,5,54),(43,15,9,30),(180,13,10,74),(49,39,11,28),(39,5,6,30),(177,15,2,53),(143,3,26,94);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (188,39,27,46),(71,49,25,39),(150,48,24,60),(101,2,23,76),(159,26,3,21),(123,14,13,81),(44,30,23,93),(70,5,17,91),(123,13,8,73),(78,44,16,16);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (118,15,11,57),(37,33,26,65),(70,21,9,67),(143,13,24,77),(54,25,22,83),(78,27,25,38),(21,25,11,20),(13,8,29,48),(13,3,17,52),(183,41,14,86);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (6,44,18,76),(179,26,30,49),(126,29,21,44),(172,23,11,72),(178,37,7,50),(197,13,12,55),(111,45,25,88),(173,33,29,69),(160,20,15,82),(122,2,28,100);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (3,7,21,69),(83,9,29,24),(60,35,19,3),(127,27,9,29),(128,34,4,45),(30,17,15,90),(54,5,26,1),(51,5,25,66),(151,33,29,70),(52,10,16,86);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (160,12,25,30),(107,25,10,82),(182,25,6,54),(167,9,4,81),(141,31,29,76),(149,14,4,100),(188,47,17,69),(50,42,23,98),(97,2,10,54),(38,1,27,15);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (134,33,13,83),(137,28,19,18),(66,10,26,47),(79,21,1,41),(200,24,8,18),(36,4,8,97),(144,45,24,76),(6,25,4,12),(64,29,21,79),(182,47,16,70);
INSERT INTO `Isolation_beds` (`normal_beds`,`Icu_beds`,`Ventilation_beds`,`IsoType_id`) VALUES (150,21,11,93),(60,4,28,27),(195,31,2,31),(13,18,16,15),(73,35,16,6),(115,10,3,89),(177,44,10,1),(133,5,15,65),(56,8,5,57),(139,37,14,53);

INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-05-29","2020-08-07",97,42),("2020-08-24","2020-02-06",70,2),("2020-12-04","2020-05-13",63,64),("2020-09-27","2020-12-20",89,100),("2020-12-08","2020-11-16",89,55),("2020-04-30","2020-05-07",42,16),("2020-07-12","2020-11-30",81,71),("2020-08-27","2020-07-24",5,35),("2020-11-12","2020-08-22",66,2),("2020-12-18","2020-01-21",87,87);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-12-06","2020-01-15",25,36),("2020-11-10","2020-12-25",15,92),("2020-03-19","2020-12-26",97,99),("2020-07-12","2020-04-17",28,35),("2020-10-31","2020-07-24",22,84),("2020-11-23","2020-06-20",3,74),("2020-07-03","2020-08-06",28,25),("2020-12-17","2020-03-18",48,41),("2020-07-16","2020-09-13",36,45),("2020-10-16","2020-11-29",34,43);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-08-23","2020-04-12",58,37),("2020-05-11","2020-02-13",17,75),("2020-10-07","2020-05-08",65,94),("2020-06-06","2020-08-20",21,55),("2020-09-04","2020-01-21",35,97),("2020-09-17","2020-06-04",27,91),("2020-03-29","2020-01-15",94,45),("2020-11-01","2020-11-05",95,60),("2020-03-18","2020-04-20",42,8),("2020-07-23","2020-08-19",51,86);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-12-11","2020-12-19",11,97),("2020-08-27","2020-11-02",28,86),("2020-10-15","2020-09-22",59,87),("2020-03-18","2020-11-11",35,18),("2020-06-27","2020-04-11",20,68),("2020-04-15","2020-06-15",26,93),("2020-09-07","2020-02-06",29,23),("2020-07-05","2020-05-12",63,61),("2020-07-25","2020-04-27",96,54),("2020-05-21","2020-03-04",38,37);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-11-12","2020-12-30",27,77),("2020-06-07","2020-12-21",99,38),("2020-03-12","2020-09-16",81,76),("2020-03-12","2020-07-06",16,17),("2020-04-25","2020-11-17",37,7),("2020-11-20","2020-08-17",64,92),("2020-11-15","2020-03-07",62,46),("2020-12-16","2020-06-25",21,16),("2020-04-22","2020-07-10",19,70),("2020-11-21","2020-09-20",9,52);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-12-05","2020-06-22",83,59),("2020-06-14","2020-12-10",11,45),("2020-04-25","2020-04-19",91,99),("2020-06-05","2020-02-16",50,88),("2020-07-09","2020-12-04",9,18),("2020-11-20","2020-08-28",67,11),("2020-11-14","2020-09-25",99,77),("2020-03-02","2020-04-22",77,2),("2020-08-12","2020-12-28",95,18),("2020-10-21","2020-01-01",79,45);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-03-17","2020-04-07",98,39),("2020-07-28","2020-04-18",68,66),("2020-05-22","2020-03-12",47,40),("2020-06-03","2020-06-15",83,80),("2020-11-20","2020-05-29",56,11),("2020-06-21","2020-10-01",64,31),("2020-12-22","2020-01-21",17,10),("2020-06-12","2020-08-08",51,63),("2020-09-27","2020-05-12",91,6),("2020-10-16","2020-04-18",59,57);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-06-17","2020-11-06",71,53),("2020-03-10","2020-11-24",55,80),("2020-06-20","2020-05-03",10,67),("2020-07-30","2020-08-25",41,1),("2020-03-04","2020-02-10",46,51),("2020-12-09","2020-09-08",44,86),("2020-03-26","2020-05-07",53,39),("2020-10-12","2020-04-28",74,88),("2020-12-25","2020-12-16",4,77),("2020-08-16","2020-04-13",48,89);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-04-28","2020-11-01",19,99),("2020-04-19","2020-11-01",55,77),("2020-03-08","2020-12-04",52,53),("2020-08-02","2020-02-22",78,58),("2020-12-24","2020-01-31",17,46),("2020-12-05","2020-05-18",60,100),("2020-11-01","2020-12-24",79,12),("2020-04-26","2020-06-15",62,84),("2020-03-01","2020-12-27",53,46),("2020-08-09","2020-07-16",74,13);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-10-22","2020-05-02",71,61),("2020-05-11","2020-09-30",23,20),("2020-07-02","2020-01-01",74,57),("2020-12-22","2020-05-09",23,2),("2020-08-18","2020-11-05",72,75),("2020-10-12","2020-11-26",32,38),("2020-03-23","2020-01-03",4,66),("2020-09-17","2020-06-03",59,40),("2020-09-15","2020-05-10",49,52),("2020-04-09","2020-04-03",22,6);
INSERT INTO `Patient_isolation` (`iso_Discharge_Date`,`iso_Charge_Date`,`pt_id`,`IsoType_id`) VALUES ("2020-05-29","2020-08-07",101,97),("2020-05-29","2020-08-07",102,97),("2020-05-29","2020-08-07",103,97);



INSERT INTO `Isolations` (`Iso_type`,`St_Name`,`St_Number`,`Gov_id`) VALUES ("Hospital","P.O. Box 395, 3679 Sem Rd.",454,1),("Hospital","P.O. Box 916, 9581 Pharetra Av.",203,13),("Quarantine","P.O. Box 379, 103 Ac Rd.",100,2),("Hospital","Ap #992-3530 Lectus Rd.",279,11),("Hospital","P.O. Box 669, 7046 Lacinia. Street",193,2),("Quarantine","1898 Pellentesque Avenue",89,7),("Hospital","881-7974 Nam Avenue",445,6),("Hospital","720-2078 Ligula Av.",306,4),("Hospital","1725 Egestas Street",243,12),("Quarantine","Ap #600-2482 Magna. Street",359,7),("Quarantine","651-8057 Auctor Rd.",100,3),("Quarantine","9577 Consectetuer St.",258,9),("Quarantine","149-4157 Urna St.",173,4),("Quarantine","6972 Ac St.",194,9),("Quarantine","Ap #537-1037 Est, Street",96,7),("Quarantine","7813 Egestas, Ave",292,10),("Quarantine","Ap #164-1370 Proin St.",328,11),("Hospital","922-7344 Magna. Ave",308,5),("Quarantine","P.O. Box 111, 9674 Dolor Avenue",55,11),("Hospital","P.O. Box 427, 7112 Elit Street",354,2),("Quarantine","Ap #772-2890 Dapibus Avenue",305,3),("Quarantine","P.O. Box 776, 7328 Metus Ave",114,14),("Hospital","2041 Egestas Rd.",219,7),("Quarantine","478 Non, St.",395,2),("Hospital","Ap #614-420 Iaculis St.",464,1),("Quarantine","P.O. Box 420, 2547 Pellentesque St.",229,12),("Quarantine","564-8226 Libero. Avenue",213,14),("Quarantine","1487 Enim. Street",59,5),("Quarantine","P.O. Box 332, 4691 Augue Av.",130,13),("Quarantine","Ap #898-2526 Vel Ave",172,6),("Hospital","5148 Tellus. Road",68,3),("Quarantine","856-8279 Mauris St.",249,1),("Quarantine","P.O. Box 317, 7710 Lorem Rd.",147,6),("Quarantine","6061 Dapibus Rd.",247,9),("Hospital","1813 Eleifend, Avenue",333,13),("Hospital","P.O. Box 143, 1260 Arcu. Av.",173,3),("Hospital","P.O. Box 233, 2574 Molestie Ave",420,11),("Quarantine","791-4566 Dolor Av.",102,12),("Quarantine","4076 Sociis Ave",147,4),("Quarantine","P.O. Box 142, 7013 Tristique Rd.",141,6),("Hospital","P.O. Box 918, 6700 Luctus Rd.",278,4),("Hospital","Ap #743-8162 Donec Street",176,4),("Quarantine","611-1156 Nec Ave",10,2),("Quarantine","P.O. Box 438, 2893 Diam Rd.",341,12),("Quarantine","5241 Sapien Rd.",175,8),("Quarantine","988-7204 Malesuada Street",88,2),("Quarantine","8205 Duis Rd.",38,5),("Quarantine","Ap #834-4932 Dui St.",158,9),("Quarantine","706-591 Consequat St.",114,14),("Hospital","P.O. Box 952, 6187 Orci, Ave",482,7),("Quarantine","689-5882 Luctus Street",484,6),("Hospital","5954 Consequat Av.",302,13),("Hospital","7221 Fringilla. Rd.",186,11),("Hospital","Ap #620-2054 Adipiscing St.",479,7),("Hospital","1996 Cras Road",17,2),("Hospital","802-6808 Nulla Road",34,14),("Quarantine","108-9918 Mauris Ave",194,7),("Quarantine","Ap #915-4570 Quisque Road",427,1),("Quarantine","210-8773 Purus. Road",411,1),("Hospital","9899 Vestibulum. Rd.",4,9),("Quarantine","P.O. Box 395, 7432 Eu, Avenue",106,12),("Quarantine","Ap #653-1853 Nunc St.",243,8),("Quarantine","958-7573 Amet Street",380,9),("Quarantine","286-6768 Ultricies St.",291,11),("Quarantine","144-9101 Adipiscing. Rd.",276,14),("Quarantine","977-4682 Libero Avenue",31,8),("Hospital","437-183 Mauris Road",94,7),("Quarantine","377 Neque. Rd.",115,11),("Quarantine","P.O. Box 931, 7077 Parturient Av.",389,7),("Hospital","P.O. Box 929, 8614 Integer Avenue",125,14),("Hospital","P.O. Box 503, 8718 Vitae, St.",73,2),("Hospital","Ap #482-1074 Parturient Street",350,9),("Quarantine","P.O. Box 700, 1776 Malesuada Av.",427,14),("Quarantine","P.O. Box 265, 9420 Tincidunt Av.",324,8),("Quarantine","P.O. Box 240, 725 Sem. Rd.",500,3),("Quarantine","P.O. Box 498, 1643 Sit Road",384,5),("Hospital","703-8999 Phasellus Street",373,7),("Hospital","P.O. Box 747, 6194 Ad St.",496,11),("Quarantine","P.O. Box 945, 7294 Vel Rd.",139,11),("Quarantine","P.O. Box 156, 9752 Facilisis Av.",306,12),("Hospital","P.O. Box 765, 6523 Nam Avenue",202,9),("Hospital","Ap #387-3408 Dictum Rd.",156,9),("Hospital","P.O. Box 695, 2108 Nec Road",115,11),("Quarantine","8406 Mi St.",184,5),("Hospital","305-1775 Torquent Av.",247,11),("Quarantine","5013 Pede Avenue",28,2),("Hospital","2535 Morbi Rd.",153,3),("Hospital","597-8575 Dictum Av.",3,14),("Hospital","P.O. Box 712, 2167 Gravida Street",315,12),("Quarantine","2325 Metus. Street",324,6),("Hospital","5447 Donec Ave",284,10),("Hospital","Ap #285-2362 Adipiscing Street",286,7),("Hospital","P.O. Box 956, 6343 Ipsum. Avenue",359,4),("Quarantine","495-3267 Malesuada Rd.",429,9),("Hospital","Ap #597-7852 Purus Street",461,3),("Quarantine","P.O. Box 479, 3315 Vitae Ave",86,2),("Quarantine","7620 Est, Road",109,8),("Quarantine","295-4453 Cursus St.",238,12),("Hospital","Ap #944-6817 Dictum. Avenue",186,1),("Quarantine","P.O. Box 902, 6939 Diam. Rd.",92,3);

INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("stable","normal_beds",90),("stable","normal_beds",45),("lack_oxy","Ventilation_beds",26),("stable","normal_beds",61),("stable","Icu_beds",99),("critical","Icu_beds",99),("stable","normal_beds",100),("stable","normal_beds",60),("probable","Icu_beds",16),("stable","normal_beds",41);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("stable","normal_beds",20),("stable","normal_beds",72),("probable","Icu_beds",39),("stable","normal_beds",5),("stable","normal_beds",72),("critical","Icu_beds",97),("lack_oxy","Ventilation_beds",91),("lack_oxy","Ventilation_beds",33),("stable","normal_beds",53),("lack_oxy","Ventilation_beds",69);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("critical","Icu_beds",22),("stable","normal_beds",33),("lack_oxy","Ventilation_beds",51),("lack_oxy","Ventilation_beds",33),("lack_oxy","Ventilation_beds",91),("critical","Icu_beds",32),("stable","normal_beds",72),("lack_oxy","Ventilation_beds",15),("stable","normal_beds",84),("critical","Icu_beds",85);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("critical","Icu_beds",96),("stable","normal_beds",9),("critical","Icu_beds",92),("lack_oxy","Ventilation_beds",71),("stable","normal_beds",50),("stable","normal_beds",34),("lack_oxy","Ventilation_beds",24),("critical","Icu_beds",73),("critical","Icu_beds",99),("stable","normal_beds",28);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("lack_oxy","Ventilation_beds",89),("stable","normal_beds",26),("stable","normal_beds",18),("lack_oxy","Ventilation_beds",15),("stable","normal_beds",31),("lack_oxy","Ventilation_beds",65),("critical","Icu_beds",28),("critical","Icu_beds",26),("lack_oxy","Ventilation_beds",34),("lack_oxy","Ventilation_beds",61);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("stable","normal_beds",53),("stable","normal_beds",72),("probable","Ventilation_beds",25),("critical","Icu_beds",6),("lack_oxy","Ventilation_beds",60),("lack_oxy","Ventilation_beds",96),("stable","normal_beds",93),("stable","normal_beds",100),("lack_oxy","Ventilation_beds",16),("critical","Icu_beds",45);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("critical","Icu_beds",56),("lack_oxy","Ventilation_beds",8),("critical","Icu_beds",6),("stable","normal_beds",81),("critical","Icu_beds",56),("stable","normal_beds",6),("stable","normal_beds",89),("lack_oxy","Ventilation_beds",21),("critical","Icu_beds",44),("lack_oxy","Ventilation_beds",70);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("lack_oxy","Ventilation_beds",64),("stable","normal_beds",81),("critical","Icu_beds",62),("critical","Icu_beds",71),("critical","Icu_beds",71),("critical","Icu_beds",23),("lack_oxy","Ventilation_beds",33),("stable","normal_beds",71),("lack_oxy","Ventilation_beds",27),(" lack_oxy ","Ventilation_beds",97);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("stable","normal_beds",50),("stable","Icu_beds",47),("critical","Icu_beds",40),("lack_oxy","Ventilation_beds",36),("stable","normal_beds",91),("critical","Icu_beds",41),("critical","Icu_beds",18),("stable","normal_beds",19),("stable","normal_beds",41),("stable","normal_beds",29);
INSERT INTO `Patient_bed` (`patient_status`,`Bed_type`,`Pt_id`) VALUES ("critical","Icu_beds",6),("lack_oxy","Ventilation_beds",53),("lack_oxy","Ventilation_beds",31),("lack_oxy","Ventilation_beds",59),("stable","normal_beds",32),("critical","Icu_beds",65),("stable","normal_beds",24),("stable","normal_beds",2),("stable","normal_beds",76),("lack_oxy","Ventilation_beds",6),("stable","normal_beds",101),("stable","normal_beds",102),("stable","normal_beds",103);

INSERT INTO `medicines` (`med_name`,`category`,`prod_date`,`ex_date`,`quantity`)
 VALUES ("Remdesivir","Hepatitis-c","17-10-18","22-05-06","20"),
("Kaletra","Hepatitis-c","19-05-21","23-08-10","55"),
("Chloroquine","Rheimatoid covid-19","19-04-29","22-02-24","45"),
("Remdesivir","Antimalarial","18-07-26","23-09-20","60"),
("Actemra","Indluenza","17-01-03","24-05-26","45"),
("Kevzara","Hepatitis-c","17-08-14","21-06-02","50"),
("Actemra","Indluenza","19-11-11","22-09-24","65"),
("Favipiravir","Rheimatoid covid-19","18-01-10","22-10-06","55"),
("Chloroquine","Anti-thrombosis","17-01-15","22-02-24","20"),
("Interferon alfa-2b","Rheimatoid covid-19","17-01-05","25-07-10","55"),
("Zinctron","Zinc supplement","17-01-05","25-07-10","55"),
("Vitacid C","Vitamin C supplement","17-01-05","25-07-10","55"),
("Biovea Vitamin D3","Vitamin D Supplement","17-01-05","25-07-10","55");

INSERT INTO `Protocols` (`id`,`protocol_name`)
VALUES (1,"First"),(2,"Second"),(3,"Third"),(4,"Forth"),(5,"Fifth");

INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("1","2020-10-29 ",64),("1","2020-08-28 ",77),("0","2020-07-29 ",9),("1","2020-07-26 ",11),("0","2020-08-25 ",67),("0","2020-02-25 ",73),("0","2020-09-13 ",97),("1","2020-05-05 ",88),("0","2020-10-16 ",40),("1","2020-06-12 ",18);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("0","2020-07-07 ",8),("1","2020-03-13 ",15),("1","2020-01-19 ",15),("0","2020-10-21 ",96),("0","2020-01-21 ",67),("0","2020-06-11 ",19),("1","2020-02-02 ",14),("1","2020-03-02 ",17),("0","2020-04-13 ",93),("1","2020-08-30 ",99);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("1","2020-04-06 ",67),("0","2020-06-09 ",68),("0","2020-06-09 ",47),("0","2020-12-04 ",25),("0","2020-12-23 ",60),("0","2020-09-01 ",62),("1","2020-06-13 ",96),("1","2020-08-06 ",61),("1","2020-08-05 ",18),("0","2020-01-07 ",25);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("0","2020-08-26 ",26),("1","2020-02-02 ",77),("1","2020-10-04 ",3),("1","2020-01-01 ",47),("0","2020-01-25 ",69),("1","2020-02-14 ",60),("1","2020-09-08 ",35),("0","2020-03-16 ",8),("0","2020-12-21 ",17),("0","2020-03-18 ",83);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("0","2020-11-24 ",42),("1","2020-05-12 ",40),("0","2020-08-18 ",29),("1","2020-09-01 ",32),("1","2020-07-14 ",29),("0","2020-03-31 ",22),("1","2020-04-09 ",51),("1","2020-01-31 ",82),("1","2020-10-04 ",73),("1","2020-02-06 ",55);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("0","2020-09-23 ",37),("0","2020-01-14 ",77),("1","2020-10-25 ",88),("1","2020-04-02 ",60),("0","2020-07-11 ",66),("0","2020-01-14 ",54),("1","2020-09-29 ",17),("1","2020-08-24 ",14),("0","2020-02-02 ",67),("1","2020-11-20 ",2);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("0","2020-03-17 ",51),("0","2020-04-03 ",55),("0","2020-05-07 ",36),("1","2020-10-25 ",30),("0","2020-10-13 ",16),("0","2020-05-21 ",67),("0","2020-11-25 ",54),("0","2020-12-14 ",2),("1","2020-08-11 ",49),("1","2020-03-06 ",84);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("1","2020-06-29 ",78),("0","2020-11-19 ",72),("1","2020-01-20 ",3),("1","2020-11-03 ",21),("0","2020-08-23 ",35),("1","2020-12-19 ",42),("1","2020-01-01 ",84),("1","2020-04-09 ",14),("0","2020-04-04 ",72),("0","2020-07-14 ",2);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("1","2020-04-25 ",67),("0","2020-09-07 ",46),("0","2020-01-12 ",50),("0","2020-07-20 ",21),("1","2020-04-26 ",19),("0","2020-12-13 ",22),("0","2020-10-05 ",2),("0","2020-02-24 ",55),("1","2020-11-20 ",76),("0","2020-01-21 ",53);
INSERT INTO `patient_test` (`test_result`,`test_date`,`pt_id`) VALUES ("1","2020-12-15 ",22),("0","2020-02-11 ",21),("1","2020-06-05 ",10),("0","2020-02-11 ",72),("0","2020-11-28 ",83),("0","2020-01-28 ",25),("1","2020-06-10 ",30),("0","2020-06-17 ",44),("0","2020-12-24 ",33),("0","2020-12-25 ",49),("1","2020-12-15 ",101),("1","2020-12-15 ",102),("1","2020-12-15 ",103);

INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Null",58),("Cancer",65),("Diabetes",94),("HIV ",88),("Null",13),("HIV ",77),("Cancer",99),("HIV ",47),("Null",54),("Diabetes",43);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("HIV ",68),("Null",72),("Heart disease ",4),("Heart disease ",25),("Cancer",90),("Asthma",20),("Cardiovascular Diseases",6),("Cardiovascular Diseases",41),("Cancer",75),("Cardiovascular Diseases",89);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Cancer",91),("Cancer",81),("Cardiovascular Diseases",97),("HIV ",1),("HIV ",85),("Diabetes",92),("Asthma",86),("Diabetes",84),("Null",61),("Heart disease ",4);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Asthma",31),("Heart disease ",20),("HIV ",38),("Cardiovascular Diseases",77),("Asthma",97),("HIV ",42),("Asthma",57),("Null",59),("Null",84),("Cardiovascular Diseases",42);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Cardiovascular Diseases",95),("Null",35),("HIV ",45),("Cardiovascular Diseases",35),("Asthma",26),("Diabetes",16),("Heart disease ",58),("Heart disease ",73),("Asthma",69),("HIV ",2);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Heart disease ",12),("Asthma",98),("Cancer",54),("Diabetes",11),("Cardiovascular Diseases",28),("Heart disease ",16),("Heart disease ",92),("Heart disease ",57),("HIV ",64),("Null",7);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Null",37),("Heart disease ",68),("Diabetes",43),("Asthma",58),("Heart disease ",55),("Heart disease ",72),("Cancer",74),("Cardiovascular Diseases",29),("Null",64),("Null",61);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Asthma",85),("HIV ",55),("Cancer",43),("Heart disease ",62),("Cardiovascular Diseases",87),("Diabetes",84),("Cardiovascular Diseases",81),("Heart disease ",17),("Asthma",73),("HIV ",22);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Diabetes",42),("Cardiovascular Diseases",73),("HIV ",13),("Diabetes",34),("Cardiovascular Diseases",14),("Cardiovascular Diseases",100),("HIV ",18),("Cancer",54),("Heart disease ",15),("Diabetes",25);
INSERT INTO `Patient_chronic_diseases` (`chronic_diseases`,`PT_id`) VALUES ("Heart disease ",97),("Heart disease ",36),("HIV ",93),("Cardiovascular Diseases",55),("HIV ",6),("Cancer",34),("Cardiovascular Diseases",60),("Cancer",97),("Asthma",6),("Diabetes",69),("Cancer",101),("Null",102),("Cancer",103);

INSERT INTO `Protocol_Medicines` (`protocol_id`,`med_id`) VALUES (1,11),(1,12),(1,13),(1,8),(1,9),(1,1) ; 
INSERT INTO `Protocol_Medicines` (`protocol_id`,`med_id`) VALUES (2,11),(2,12),(2,13),(2,2),(2,3),(2,4) ; 
INSERT INTO `Protocol_Medicines` (`protocol_id`,`med_id`) VALUES (3,11),(3,12),(3,13),(3,5),(3,6),(3,7) ; 
INSERT INTO `Protocol_Medicines` (`protocol_id`,`med_id`) VALUES (4,11),(4,12),(4,13),(4,8),(4,3),(4,5) ; 
INSERT INTO `Protocol_Medicines` (`protocol_id`,`med_id`) VALUES (5,11),(5,12),(5,13),(5,6),(5,1),(5,10) ;
