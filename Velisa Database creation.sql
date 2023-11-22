--TABLE CREATION

--Customer (phoneno, firstname, lastname, simcardno, custAddress, accountType)
create table customer ( 
phoneno number (11),
firstname varchar2 (16), 
lastname varchar2 (16), 
simcardno number (20),
custAddress varchar2(100),
accountType varchar2 (15),
constraint pk_customer primary key (phoneno)
 );
 
--Destination (destID, destType, callRate)
create table destination ( 
destID varchar2 (5),
destType varchar2 (30), 
callRate number (6), 
constraint pk_destination primary key (destID)
 );
 
--CallCategory (callCatID, catname, markupRate, country, network)
create table callcategory ( 
callCatID varchar2 (5),
catName varchar2 (20), 
network varchar2 (20), 
markupRate number (6), 
country varchar2 (20)
constraint pk_ callcategory primary key (callCatID)
 );
 
--BaseStation (baseStID, baseStName)
create table basestation ( 
baseStID varchar2 (5),
baseStName varchar2 (50), 
constraint pk_ basestation primary key (baseStID)
 );
 
--BSLocation (postcode, city, county, country, baseStID*)
create table bslocation ( 
postcode varchar2 (15),
city varchar2 (20), 
county varchar2 (20), 
country varchar2 (30),
baseStID varchar2 (5), 
constraint fk_baseStID foreign key (baseStID) references basestation (baseStID)
 );
 
--BeaconMessage (msgID, timestamp, signalStrength, phoneno*, baseStID *)
create table beaconmessage ( 
mgsID varchar2 (40),
timestamp timestamp, 
signalStrength number (3), 
phoneno number (11),
baseStID varchar2 (5), 
constraint pk_beaconmessage primary key (mgsID),
constraint fk_phoneno foreign key (phoneno) references customer (phoneno),
constraint fk_beacon_baseStID foreign key (baseStID) references basestation (baseStID)
 );
 
--Call (callID, duration, price, destID*, baseStID*, phoneno*, callCatID)
create table call ( 
callID varchar2 (15),
duration number (5), 
price number (5), 
destID varchar2 (5), 
baseStID varchar2 (5), 
phoneno number (11), 
callCatID varchar2 (5), 
constraint pk_call primary key (callID),
constraint fk_call_destID foreign key (destID) references destination (destID),
constraint fk_call_baseStID foreign key (baseStID) references basestation (baseStID),
constraint fk_call_phoneno foreign key (phoneno) references customer (phoneno),
constraint fk_call_callCatID foreign key (callCatID) references callcategory (callCatID)
 );
 
--PAYG (balance, phoneno*)
create table PAYG (
credit float,
phoneno number (11), 
constraint fk_PAYG_customer foreign key (phoneno) references customer (phoneno)
);

--ContractCustomer (phoneno*contractID, accountNo, startDate, sortcode, IBAN, Swiftcode, bankAddress)
create table Contract_Customer(
contractID varchar2(16),
phoneno varchar2(13),
accountno varchar2(10),
startDate timestamp,
bankname varchar2(13),
SortCode number,
IBAN varchar2(25),
Swiftcode varchar2(14),
bankAddress varchar2(100),
constraint pk_Contract primary key (contractID),
constraint fk_Contract_Customer foreign key (phoneno) references customer (phoneno)
);

--Contract Customer-Vadarbank (phoneno*contractID, custID, dateofBirth, occupation, creditScore)
create table Contract_Vadarbank(
contractID varchar2(16),
custID varchar2(10),
dateofbirth timestamp,
occupation varchar2(30),
creditscore number,
constraint pk_vadarbank primary key (contractID),
constraint fk_Vadarbank_Contract foreign key (contractid) references Contract_Customer (contractid)
);

--Contract Customer-Lukebank (phoneno*contractID, backcustID)
create table Contract_Lukebank (
contractID varchar2(16),
custID varchar2(10),
constraint pk_Lukebank primary key (contractID),
constraint fk_Lukebank_Contract foreign key (contractid) references Contract_Customer (contractid)
);

--DATA ENTRY

--Customer (phoneno, firstname, lastname, simcardno, custAddress, accountType)
insert into customer
values (445493905043, 'Marisa', 'Merry', 8944386879005709407, '30 Heol Eglwys Ystradgynlais SWANSEA West Glamorgan SA9 1EY UK', 'Contract');
insert into customer
values (449453291437, 'Ella', 'Oscar', 8944386342052922756, 'Unit 1B The Junction Retail Park, Western Avenue, GRAYS, Essex, RM20 3LP, UK',	'Contract');
insert into customer
values (446875201376, 'Kevin', 'Vito', 8944386069367107485, ‘Mortimer Market Centre, Mortimer Market, Caper Street, LONDON, WC1E 6JB, UK’,	‘Contract’);
insert into customer
values (449092700583, 'Chantal', 'Cleveland', 8944386658554996084, 'Pharmacy Department, Guest Hospital, Tipton Road, DUDLEY, West Midlands, DY1 4SE, UK', 'Contract');
insert into customer
values (448696640014, 'Jewel', 'Lyman', 8944386412481691068, 'Unit B3 Orbital Shopping Park, Thamesdown Drive, SWINDON, Wiltshire, SN25 4AN, UK', 'Contract');
insert into customer
values (443879521739, 'Franklin', 'Thaddeus',	8944386503585464125, '67/69 Park Lane, HORNCHURCH, Essex, RM11 1BH, UK', 'Contract');
insert into customer
values (449747035423, 'Carli', 'Jerry', 8944386511130096149, 'Bristol Royal Infirmary, Upper Maudlin Street, BRISTOL, BS2 8HW, UK', 'Contract');
insert into customer
values (447177320264, 'Harold', 'Katelyn', 8944386951737280803, '50 Southampton Row, LONDON, WC1B 5AN, UK', 'Contract');
insert into customer
values (440302935607, 'Darrell', 'Petra', 8944386937285616634, 'Unit E, Congleton Retail Park, Barn Road, CONGLETON, Cheshire, CW12 1LJ, UK', 'Contract');
insert into customer
values (446114363863, 'Marco', 'Lynn',8944386510151258208, '21 High Street, Barrow Upon Soar, LOUGHBOROUGH, Leicestershire, LE12 8PY, UK', 'Contract');
insert into customer
values (442581977254, 'Dangelo', 'Jeanette', 8944386572515099239, 'The Coombes, Polperro, LOOE, Cornwall, PL13 2RG, UK', 'Contract');
insert into customer
values (444551825746, 'Hafsa', 'Aja',	8944386289013132347, '29 Harcourt Road, Bushey, WATFORD, Hertfordshire, WD23 3PP, UK', 'Contract');
insert into customer
values (445675980814, 'Adiel', 'Phoebe', 8944386082651426039, '200 Yorkshire Street, ROCHDALE, Lancashire, OL16 2DW, UK', 'Contract');
insert into customer
values (442875719211, 'Ophelia', 'Patrick', 8944386774995389196, 'ASDA Superstore, Princess Way, BURNLEY, Lancashire, BB12 0EQ, UK', 'Contract');
insert into customer
values (444230786157, 'Elexis', 'Elsie', 8944386311686110088, '33 Oxford Street, LEAMINGTON SPA, Warwickshire, CV32 4RA, UK', 'Contract');
insert into customer
values (447752614595, 'Anita', 'Aya', 8944386834267837482, '39 Four Seasons Shopping Centre, MANSFIELD, Nottinghamshire, NG18 1SU, UK', 'Contract');
insert into customer
values (441677085514, 'Greysen', 'Forest', 8944386572020649998, '12 - 13 Steep Street, CHEPSTOW, Gwent, NP16 5PJ, UK', 'PAYG');
insert into customer
values (446998355147, 'Ernestine', 'Belen', 8944386107438274031, '95 Musters Road, West Bridgford, NOTTINGHAM, Nottinghamshire, NG2 7PX, UK', 'PAYG');
insert into customer
values (444174560882, 'Marshall', 'Mirna', 8944386302083042472, '223 High Street, EPPING, Essex, CM16 4BL, UK', 'PAYG');
insert into customer
values (441400098134, 'Amari', 'Rose', 8944386814031277418, '94 High Street, Neyland, MILFORD HAVEN, Dyfed, SA73 1TF, UK', 'PAYG');
insert into customer
values (445957752425, 'Racquel', 'Claudette', 8944386323577910678, '4 High Street, RENFREW, Renfrewshire, PA4 8QR, UK', 'PAYG');
insert into customer
values (446550854535, 'Divya', 'Zelma', 8944386790263481383, '8 The Oval, Pin Green, STEVENAGE, Hertfordshire, SG1 5RB, UK', 'PAYG');
insert into customer
values (446912435884, 'Emerson', 'Penny', 8944386107372348806, 'Pharmacy Department, Waverley Road, ST. ALBANS, Hertfordshire, AL3 5PN, UK', 'PAYG');
insert into customer
values (440221139695, 'Cecilia', 'Portia', 8944386053818526644, '321 Bethnal Green Road, LONDON, E2 6AH, UK', 'PAYG');
insert into customer
values (443847418126, 'Angela', 'Lindsey', 8944386944586511211, '45 East Street, BLANDFORD FORUM, Dorset, DT11 7DX, UK', 'PAYG');
insert into customer
values (449817266567, 'Courtney', 'Robert', 8944386514670951897, '188 New Road, Croxley Green, RICKMANSWORTH, Hertfordshire, WD3 3HD, UK', 'PAYG');
insert into customer
values (444647267946, 'Mary', 'Jess', 8944386648954471517, 'West Dyke Road, REDCAR, Cleveland, TS10 2AA, UK', 'PAYG');
insert into customer
values (446668124030, 'Jaylin', 'Alfred', 8944386426078230776, '26 Rough Road, Kingstanding, BIRMINGHAM, West Midlands, B44 0UY, UK', 'PAYG');
insert into customer
values (441880633392, 'Jasper', 'Malinda', 8944386814510800905, '128 Malden Road, NEW MALDEN, Surrey, KT3 6DD, UK', 'PAYG');
insert into customer
values (444016206170, 'Fletcher', 'Karyn', 8944386770583102583,'109 High Street, SUTTON, Surrey, SM1 1JG, UK', 'PAYG');

--Destination (destID, destType, callRate)
insert into destination
values ('SN', 'Same Network', 0.005);
insert into destination
values ('AMN', 'Another Mobile Network', 0.011);
insert into destination
values ('FLN', 'Fixed Line Network', 0.065);
insert into destination
values ('IC', 'International Call', 0.042);

--CallCategory (callCatID, catname, network, markupRate, country)
insert into callcategory
values ('STD', 'Standard', 0.00, 'United Kingdom', 'Velisa');
insert into callcategory
values ('RM1', 'US_Roaming', 0.20, 'United State', 'Vodafone');
insert into callcategory
values ('RM2', 'Can_Roaming', 0.15, 'Canada', 'Three');
insert into callcategory
values ('RM3', 'Ngr_Roaming', 0.30, 'Nigeria','MTN');
insert into callcategory
values ('RM4', 'Aus_Roaming', 0.24, 'Australia','EE');
insert into callcategory
values ('RM5', 'Bra_Roaming', 0.20, 'Brazil', 'Lebara');
insert into callcategory
values ('RM6', 'Ind_Roaming', 0.19, 'India', 'Lyca');

--BaseStation (baseStID, baseStName)
insert into BaseStation
values ('BS0001', 'Tower Hamlets Base Station');
insert into BaseStation
values ('BS0002', 'Brent Base Station');
insert into BaseStation
values ('BS0003', 'Sutton Base Station');
insert into BaseStation
values ('BS0004', 'Harrow Base Station');
insert into BaseStation
values ('BS0005', 'Hounslow Base Station');
insert into BaseStation
values ('BS0006', 'Wandsworth Base Station');
insert into BaseStation
values ('BS0007', 'Lambeth Base Station');
insert into BaseStation
values ('BS0008', 'Croydon Base Station');
insert into BaseStation
values ('BS0009', 'Southwark Base Station');
insert into BaseStation
values ('BS0010', 'Hackney Base Station');
insert into BaseStation
values ('BS0011', 'Barking Base Station');
insert into BaseStation
values ('BS0012', 'Greenwich Base Station');
insert into BaseStation
values ('BS0013', 'Lewisham Base Station');
insert into BaseStation
values ('BS0014', 'Richmond Base Station');
insert into BaseStation
values ('BS0015', 'Ealing Base Station');
insert into BaseStation
values ('BS0016', 'Kingston Base Station');
insert into BaseStation
values ('BS0017', 'Hammersmith Base Station');
insert into BaseStation
values ('BS0018', 'Clapham Base Station');
insert into BaseStation
values ('BS0019', 'Ilford Base Station');
insert into BaseStation
values ('BS0020', 'Cheshunt Base Station');
insert into BaseStation
values ('BS0021', 'New York Base Station');
insert into BaseStation
values ('BS0022', 'Toronto Base Station');
insert into BaseStation
values ('BS0023', 'Lekki Base Station');
insert into BaseStation
values ('BS0024', 'Melbourne Base Station');
insert into BaseStation
values ('BS0025', 'Fortaleza Base Station');
insert into BaseStation
values ('BS0026', 'New Delhi Base Station');

--PAYG (balance, phoneno*)
insert into payg
values (14.35,	'445493905043');
insert into payg
values (6.00,	'449453291437');
insert into payg
values (11.01,	'446875201376');
insert into payg
values (10.50,	'449092700583');
insert into payg
values (5.00, 	'448696640014');
insert into payg
values (10.10,	'443879521739');
insert into payg
values (9.00,	'449747035423');
insert into payg
values (9.00,	'447177320264');
insert into payg
values (12.35,	'440302935607');
insert into payg
values (8.78,	'449817266567');
insert into payg
values (5.00,	'444647267946');
insert into payg
values (7.89,	'446668124030');
insert into payg
values (4.32,	'441880633392');
insert into payg
values (5.00,	'444016206170');

--BeaconMessage (msgID, timestamp, signalStrength, phoneno*, baseStID *)
insert into beaconmessage
values ('dda91a91-1a89-4ef2-9a96-c1ca8db996c7', TO_TIMESTAMP('2023-03-09 05:07:11', 'YYYY-MM-DD HH24:MI:SS'), -67, '441400098134', 'BS0001');
insert into beaconmessage
values ('97c11ad4-0f0b-4e1a-bc1d-e0b3edf3a956',	TO_TIMESTAMP('2023-02-03 23:35:56', 'YYYY-MM-DD HH24:MI:SS'), -82, '441400098134', 'BS0002');
insert into beaconmessage
values ('8337b738-f04c-4a6d-94d3-50a24c1656c8',	TO_TIMESTAMP('2022-12-17 01:19:19', 'YYYY-MM-DD HH24:MI:SS'), -55, '441400098134', 'BS0003');
insert into beaconmessage
values ('5d9fb5f1-b5c1-4aa5-bdcf-20d6565b8b7c',	TO_TIMESTAMP('2023-03-15 10:39:01', 'YYYY-MM-DD HH24:MI:SS'), -59, '442875719211', 'BS0004');
insert into beaconmessage
values ('5d5d5c5b-53a9-4d8b-ba0d-528ff2e5f5b8',	TO_TIMESTAMP('2023-01-31 23:39:22', 'YYYY-MM-DD HH24:MI:SS'), -53, '444230786157', 'BS0005');
insert into beaconmessage
values ('a4a4e50a-4c95-4e7b-ae20-969b7f5e5c10',	TO_TIMESTAMP('2023-02-18 02:39:07', 'YYYY-MM-DD HH24:MI:SS'), -60, '447752614595', 'BS0007');
insert into beaconmessage
values ('9f7af103-9bf8-4e17-87d3-7d20f207c357',	TO_TIMESTAMP('2022-12-11 02:22:31', 'YYYY-MM-DD HH24:MI:SS'), -75, '443847418126', 'BS0007');
insert into beaconmessage
values ('e1cc65d7-4ea3-4bc1-b2e2-f4ad38a2f07c',	TO_TIMESTAMP('2023-01-02 23:54:23', 'YYYY-MM-DD HH24:MI:SS'), -56, '446912435884', 'BS0007');
insert into beaconmessage
values ('52e8f1c2-69d2-4d9a-a8f7-833ecb76d522',	TO_TIMESTAMP('2023-03-29 04:48:34', 'YYYY-MM-DD HH24:MI:SS'), -62, '444174560882', 'BS0008');
insert into beaconmessage
values ('8e542273-417d-4d2c-b24e-1c99a9b063a6',	TO_TIMESTAMP('2023-01-13 05:09:14', 'YYYY-MM-DD HH24:MI:SS'), -77, '444230786157', 'BS0009');
insert into beaconmessage
values ('4af7cc4c-f4fb-4cf3-8b17-9e76f858d0b7',	TO_TIMESTAMP('2023-03-22 19:12:42', 'YYYY-MM-DD HH24:MI:SS'), -77, '441880633392', 'BS0010');
insert into beaconmessage
values ('7f59c14f-0557-4f87-bec5-9d5f792aa5c5',	TO_TIMESTAMP('2023-03-16 03:17:28', 'YYYY-MM-DD HH24:MI:SS'), -85, '445675980814', 'BS0010');
insert into beaconmessage
values ('f4d67faa-73c4-4d8f-8dce-88219d270b44',	TO_TIMESTAMP('2023-02-20 06:16:25', 'YYYY-MM-DD HH24:MI:SS'), -56, '441880633392', 'BS0011');
insert into beaconmessage
values ('d0dd943c-9cf5-4cb5-9967-cb1a14183e0f',	TO_TIMESTAMP('2023-02-17 07:27:16', 'YYYY-MM-DD HH24:MI:SS'), -72, '444647267946', 'BS0011');
insert into beaconmessage
values ('79d7cb21-bdc9-423f-9b0f-1e39994a8b31',	TO_TIMESTAMP('2023-03-07 18:13:50', 'YYYY-MM-DD HH24:MI:SS'), -53, '442581977254', 'BS0012');
insert into beaconmessage
values ('a49186fb-7d61-42fc-9a9b-7296b7347c3e',	TO_TIMESTAMP('2023-01-24 01:11:12', 'YYYY-MM-DD HH24:MI:SS'), -59, '446668124030', 'BS0012');
insert into beaconmessage
values ('6173d3bf-14d6-42e6-a5c9-5e5a0c6f5a6e',	TO_TIMESTAMP('2022-12-30 11:27:56', 'YYYY-MM-DD HH24:MI:SS'), -54, '446114363863', 'BS0013');
insert into beaconmessage
values ('83e56fc4-4fc4-4b27-9b3f-09b7a35f62d7',	TO_TIMESTAMP('2023-02-06 22:56:02', 'YYYY-MM-DD HH24:MI:SS'), -68, '446114363863', 'BS0014');
insert into beaconmessage
values ('1e24691b-2e12-4628-8d62-0f75e98ecf24',	TO_TIMESTAMP('2023-03-28 08:11:37', 'YYYY-MM-DD HH24:MI:SS'), -65, '449817266567', 'BS0026');
insert into beaconmessage
values ('50c7b1f8-7b7d-4fcb-9d9d-8e1aa7c49d98',	TO_TIMESTAMP('2023-03-05 12:54:47', 'YYYY-MM-DD HH24:MI:SS'), -79, '447752614595', 'BS0023');

--BSLocation (postcode, city, county, country, baseStID*)
insert into bslocation
values ('L3 3AC', 'Liverpool', 'Merseyside', 'England',	'BS0001');
insert into bslocation
values ('S4 4AD', 'Sheffield', 'South Yorkshire', 'England', 'BS0002');
insert into bslocation
values ('LE4 4AD', 'Leicester', 'Leicestershire', 'England', 'BS0003');
insert into bslocation
values ('BS1 1AA', 'Bristol', 'City of Bristol', 'England', 'BS0004');
insert into bslocation
values ('DD2 2AB', 'Dundee', 'Angus', 'Scotland', 'BS0005');
insert into bslocation
values ('PL5 5AE', 'Plymouth', 'Devon', 'England', 'BS0006');
insert into bslocation
values ('SO14 0AA', 'Southampton', 'Hampshire', 'England', 'BS0007');
insert into bslocation
values ('AB13 4AD', 'Aberdeen', 'Aberdeenshire', 'Scotland', 'BS0008');
insert into bslocation
values ('NP18 5AE', 'Newport',	'Newport', 'Wales', 'BS0009');
insert into bslocation
values ('NE5 5AE', 'Newcastle',	'Tyne and Wear', 'England', 'BS0010');
insert into bslocation
values ('CV3 3AC', 'Coventry',	'West Midlands', 'England', 'BS0011');
insert into bslocation
values ('BH3 3AC', 'Bournemouth', 'Dorset', 'England', 'BS0012');
insert into bslocation
values ('BA4 4AD', 'Bath', 'Somerset', 'England', 'BS0013');
insert into bslocation
values ('YO19 3AC', 'York', 'North Yorkshire', 'England', 'BS0014');
insert into bslocation
values ('SA2 2AB', 'Swansea', 'Swansea', 'Wales', 'BS0015');
insert into bslocation
values ('FK9 2AC', 'Stirling', 'Stirling', 'Scotland', 'BS0016');
insert into bslocation
values ('OX3 3AC', 'Oxford', 'Oxfordshire', 'England', 'BS0017');
insert into bslocation
values ('GL5 5AE', 'Gloucester', 'Gloucestershire', 'England', 'BS0018');
insert into bslocation
values ('RG1 1AA', 'Reading', 'Berkshire', 'England', 'BS0019');
insert into bslocation
values ('B5 5AE', 'Birmingham', 'West Midlands', 'England', 'BS0020');
insert into bslocation
values ('10001', 'New York', 'New york', 'United State', 'BS0021');
insert into bslocation
values ('M5V 2T6', 'Toronto', 'Ontario', 'Canada', 'BS0022');
insert into bslocation
values ('100234', 'Lekki', 'Lagos', 'Nigeria', 'BS0023');
insert into bslocation
values ('3000', 'Melbourne', 'Victoria', 'Australia', 'BS0024');
insert into bslocation
values ('60175-045', 'Fortaleza', 'Ceará', 'Brazil', 'BS0025');
insert into bslocation
values ('110001', 'New Delhi', 'Delhi', 'India', 'BS0026');

--Call (callID, duration, price, destID*, baseStID*, phoneno*, callCatID)
insert into call values ('AMN0008',	79,	0.869,	'AMN',	'BS0009',	'447177320264',	'STD');
insert into call values ('AMN0012',	92,	1.012,	'AMN',	'BS0005',	'444551825746',	'STD');
insert into call values ('AMN0016',	143, 1.573,	'AMN',	'BS0007',	'447752614595',	'STD');
insert into call values ('AMN0019',	183, 2.013,	'AMN',	'BS0001',	'445675980814',	'STD');
insert into call values ('AMN0021',	263, 2.893,	'AMN',	'BS0010',	'444230786157',	'STD');
insert into call values ('AMN0022',	268, 2.948,	'AMN',	'BS0003',	'447752614595',	'STD');
insert into call values ('AMN0023',	274, 3.014,	'AMN',	'BS0002',	'441677085514',	'STD');
insert into call values ('AMN0024',	320, 3.52,	'AMN',	'BS0006',	'446998355147',	'STD');
insert into call values ('AMN0027',	373, 4.103,	'AMN',	'BS0004',	'445957752425',	'STD');
insert into call values ('FLN0033',	193, 12.545,	'FLN',	'BS0015',	'440302935607',	'STD');
insert into call values ('FLN0037',	250, 16.25,	'FLN',	'BS0018',	'445675980814',	'STD');
insert into call values ('FLN0038',	254, 16.51,	'FLN',	'BS0018',	'442875719211',	'STD');
insert into call values ('FLN0039',	315, 20.475,	'FLN',	'BS0013',	'444230786157',	'STD');
insert into call values ('IC0026',	95,	3.99,	'IC',	'BS0020',	'441400098134',	'STD');
insert into call values ('IC0030',	235, 9.87,	'IC',	'BS0004',	'440221139695',	'STD');
insert into call values ('IC0036',	356, 14.952,	'IC',	'BS0010',	'444551825746',	'STD');
insert into call values ('SN0001',	69,	0.345,	'SN',	'BS0015',	'445493905043',	'STD');
insert into call values ('SN0002',	72,	0.36,	'SN',	'BS0013',	'449453291437',	'STD');
insert into call values ('SN0003',	73,	0.365,	'SN',	'BS0014',	'446875201376',	'STD');
insert into call values ('SN0004',	117,	0.585,	'SN',	'BS0012',	'449092700583',	'STD');
insert into call values ('SN0005',	149,	0.745,	'SN',	'BS0010',	'448696640014',	'STD');
insert into call values ('SN0007',	171,	0.855,	'SN',	'BS0002',	'449747035423',	'STD');
insert into call values ('SN0010',	185,	0.925,	'SN',	'BS0004',	'446114363863',	'STD');
insert into call values ('SN0013',	204,	1.02,	'SN',	'BS0001',	'445675980814',	'STD');
insert into call values ('SN0015',	229,	1.145,	'SN',	'BS0011',	'444230786157',	'STD');
insert into call values ('SN0017',	368,	1.84,	'SN',	'BS0012',	'442581977254',	'STD');
insert into call values ('SN0018',	379,	1.895,	'SN',	'BS0009',	'444551825746',	'STD');
insert into call values ('SN0011',	201,	1.005,	'SN',	'BS0020',	'442581977254',	'RM6');
insert into call values ('SN0009',	182,	0.91,	'SN',	'BS0024',	'440302935607',	'RM5');
insert into call values ('FLN0040',	397,	25.805,	'FLN',	'BS0026',	'447752614595',	'RM4');
insert into call values ('SN0014',	216,	1.08,	'SN',	'BS0023',	'442875719211',	'RM4');
insert into call values ('FLN0031',	161,	10.465,	'FLN',	'BS0020',	'443847418126',	'RM3');
insert into call values ('IC0025',	92,	3.864,	'IC',	'BS0021',	'444174560882',	'RM3');
insert into call values ('IC0034',	305,	12.81,	'IC',	'BS0024',	'446114363863',	'RM3');
insert into call values ('AMN0020',	188,	2.068,	'AMN',	'BS0022',	'442875719211',	'RM2');
insert into call values ('IC0029',	185,	7.77,	'IC',	'BS0023',	'446912435884',	'RM2');
insert into call values ('IC0032',	238,	9.996,	'IC',	'BS0021',	'449817266567',	'RM2');
insert into call values ('AMN0006',	69,	0.759,	'AMN',	'BS0021',	'443879521739',	'RM1');
insert into call values ('IC0028',	115,	4.83,	'IC',	'BS0023',	'446550854535',	'RM1');
insert into call values ('IC0035',	307,	12.894,	'IC',	'BS0021',	'442581977254',	'RM1');


--ContractCustomer (phoneno*contractID, accountNo, startDate, sortcode, IBAN, Swiftcode, bankAddress)
insert into contract_customer 
values ('CT446114363863','446114363863','19982296',TO_DATE('12/11/2012', 'DD/MM/YYYY'),	'Lukebank',201753,'GB47LKBK20175319982296','LKBKGB21639','201 Union Street, Aberdeen, AB11, 6BB')
insert into contract_customer 
values ('CT442581977254','442581977254','32238307',TO_DATE('11/11/2013', 'DD/MM/YYYY'),	'Lukebank',202936,'GB47LKBK20293602238307','LKBKGB21874','Golden Bank House, Broadgate Lane, Horsforth, LEEDS, West Yorkshire, LS18 4SE, UK');
insert into contract_customer
values ('CT444551825746','444551825746','40004427',TO_DATE('22/01/2012', 'DD/MM/YYYY'),	'Vadarbank',305649,'GB38VDRB30564940004427','VDRBGB31667','Manor Road, RICHMOND, Surrey, TW9 1YB, UK');
insert into contract_customer 
values ('CT445675980814','445675980814','60400904',TO_DATE('16/12/2015', 'DD/MM/YYYY'),	'Vadarbank',308521,'GB38VDRB30852160400904','VDRBGB31140','Charlton Place, Andover, Andover, Hampshire, SP10, 1RB');
insert into contract_customer
values ('CT442875719211','442875719211','83703448',TO_DATE('12/06/2013', 'DD/MM/YYYY'),	'Lukebank',203765,'GB47LKBK20376583703448','LKBKGB21856','23 Station Road, VERWOOD, Dorset, BH31 7PY, UK');
insert into contract_customer 
values ('CT444230786157','444230786157','70525674',TO_DATE('29/05/2015', 'DD/MM/YYYY'),	'Vadarbank',302936,'GB38VDRB30293600525674','VDRBGB31920','7 Worthing Road, HORSHAM, West Sussex, RH12 1SQ, UK');
insert into contract_customer 
values ('CT447752614595','447752614595','47000030',TO_DATE('07/02/2019', 'DD/MM/YYYY'),	'Lukebank',209475,'GB47LKBK20947547000030','LKBKGB21481','401 Highfield Road, Yardley Wood, BIRMINGHAM, West Midlands, B14 4DU, UK');
insert into contract_customer 
values ('CT441677085514','441677085514','40160286',TO_DATE('16/12/2016', 'DD/MM/YYYY'),	'Vadarbank',307243,'GB38VDRB30724340160286','VDRBGB31624','One Snowhill, Snowhill Queensway, Birmingham, B4, 6GN');
insert into contract_customer 
values ('CT446998355147','446998355147','61975840',TO_DATE('23/11/2012', 'DD/MM/YYYY'),	'Vadarbank',301875,'GB38VDRB30187561975840','VDRBGB31702','Red Bank Road, BLACKPOOL, Lancashire, FY2 9HY, UK');
insert into contract_customer 
values ('CT444174560882','444174560882','48445923',TO_DATE('19/07/2015', 'DD/MM/YYYY'),	'Lukebank',208577,'GB47LKBK20857748445923','LKBKGB21148','Millshaw Court, Global Avenue, Beeston, Leeds, LS11, 8DD');
insert into contract_customer 
values ('CT441400098134','441400098134','68508841',TO_DATE('09/04/2018', 'DD/MM/YYYY'),	'Lukebank',207124,'GB47LKBK20712468508841','LKBKGB21728','25 Circular Road, Douglas, Isle Of Man, IM1, 1AD');
insert into contract_customer 
values ('CT445957752425','445957752425','28735308',TO_DATE('29/04/2016', 'DD/MM/YYYY'),	'Vadarbank',307243,'GB38VDRB30724328735308','VDRBGB31624','One Snowhill, Snowhill Queensway, Birmingham, B4, 6GN');
insert into contract_customer 
values ('CT446550854535','446550854535','54051631',TO_DATE('25/01/2013', 'DD/MM/YYYY'),	'Vadarbank',306915,'GB38VDRB30691554051631','VDRBGB31102','53 New Zealand Drive, WALTON-ON-THAMES, Surrey, KT12 1AD, UK');
insert into contract_customer
values ('CT446912435884','446912435884','96568835',TO_DATE('14/12/2017', 'DD/MM/YYYY'),	'Vadarbank',303880,'GB38VDRB30388096568835','VDRBGB31747','61 Hide Hill, Berwick-Upon-Tweed, TD15, 1EN');
insert into contract_customer
 values ('CT440221139695','440221139695','75045406',TO_DATE('03/12/2019', 'DD/MM/YYYY'),'Lukebank',208577,'GB47LKBK20857775045406','LKBKGB21148','Millshaw Court, Global Avenue, Beeston, Leeds, LS11, 8DD');
insert into contract_customer 
values ('CT443847418126','443847418126','26059666',TO_DATE('19/03/2012', 'DD/MM/YYYY'),	'Vadarbank',307659'GB38VDRB30765926059666','VDRBGB31466','Plymouth Road, Crabtree, PLYMOUTH, Devon, PL3 6RL, UK');

--Contract Customer-Vadarbank (contractID*, custID, dateofBirth, occupation, creditScore)
insert into contract_vadarbank values ('CT444551825746',	'VD01',	TO_DATE('12/11/2012', 'DD/MM/YYYY'),	'Software Engineer',	569);
insert into contract_vadarbank values ('CT445675980814',	'VD02',	TO_DATE('11/11/2013', 'DD/MM/YYYY'),	'Dentist',	900);
insert into contract_vadarbank values ('CT444230786157',	'VD03',	TO_DATE('22/01/2012', 'DD/MM/YYYY'),	'Lawyer',	548);
insert into contract_vadarbank values ('CT441677085514',	'VD04',	TO_DATE('16/12/2015', 'DD/MM/YYYY'),	'Data Analyst',	670);
insert into contract_vadarbank values ('CT446998355147',	'VD05',	TO_DATE('12/06/2013', 'DD/MM/YYYY'),	'Customer Support',	450);
insert into contract_vadarbank values ('CT445957752425',	'VD06',	TO_DATE('29/05/2015', 'DD/MM/YYYY'),	'Educationist',	656);
insert into contract_vadarbank values ('CT446550854535',	'VD07',	TO_DATE('07/02/2019', 'DD/MM/YYYY'),	'Driver',	400);
insert into contract_vadarbank values ('CT446912435884',	'VD08',	TO_DATE('16/12/2016', 'DD/MM/YYYY'),	'Liberian',	750);
insert into contract_vadarbank values ('CT443847418126',	'VD09',	TO_DATE('23/11/2012', 'DD/MM/YYYY'),	'Project Management',	830);

--Contract Customer-Lukebank (contractID*, backcustID)
insert into contract_lukebank values ('CT446114363863',	'LK01')
insert into contract_lukebank values ('CT442581977254',	'LK02')
insert into contract_lukebank values ('CT442875719211',	'LK03')
insert into contract_lukebank values ('CT447752614595',	'LK04')
insert into contract_lukebank values ('CT444174560882',	'LK05')
insert into contract_lukebank values ('CT441400098134',	'LK06')
insert into contract_lukebank values ('CT440221139695',	'LK07')

--SAMPLE QUERIES
--1
select phoneno, callid, callcatid, basestid from call
where phoneno = '442581977254';

--2
SELECT phoneno, SUM(price) AS Total_price, 
  CASE 
    WHEN SUM(price) < 2 THEN 'Low'
    WHEN SUM(price) < 5 THEN 'Medium'
    WHEN SUM(price) < 10 THEN 'High Value'
    ELSE 'Platinum'
  END AS call_group 
FROM call 
GROUP BY phoneno;

--3
SELECT FIRSTNAME, LASTNAME, PHONENO FROM CUSTOMER
ORDER BY LASTNAME;

--4
SELECT phoneno, SUM(price) AS Total_price FROM CALL
GROUP BY PHONENO
HAVING SUM(price)> 5;

--5
SELECT CUSTOMER.FIRSTNAME, CALL.PHONENO, CALL.CALLID FROM CUSTOMER, CALL
WHERE CUSTOMER.PHONENO = CALL.PHONENO
ORDER BY FIRSTNAME;

--6 DISPLAY THE LIST OF ALL CUSTOMERS WHO MADE ROAMING CALL AND GENERATE THE BILL FOR THE CALLS
SELECT CALL.PHONENO, CALL.PRICE, CALLCATEGORY.CATNAME, CALL.PRICE+(CALL.PRICE * CALLCATEGORY.MARKUPRATE) AS TOTAL_PRICE 
FROM CALL, CALLCATEGORY
WHERE CALL.CALLCATID =CALLCATEGORY.CALLCATID
AND CALLCATEGORY.CATNAME <> 'Standard';

--7: DISPLAY THE LIST OF CONTRACT-CUSTOMER WHO MADE ROAMING CALL AND GENERATE THE BILL FOR THE CALLS
SELECT CALL.PHONENO, CALL.DURATION, CALL.PRICE, CALLCATEGORY.CATNAME, CONTRACT_CUSTOMER.BANKNAME, CALL.PRICE+(CALL.PRICE * CALLCATEGORY.MARKUPRATE) AS TOTAL_PRICE 
FROM CALL, CALLCATEGORY, CONTRACT_CUSTOMER
WHERE CALL.CALLCATID =CALLCATEGORY.CALLCATID 
AND CALL.PHONENO = CONTRACT_CUSTOMER.PHONENO
AND CALLCATEGORY.CATNAME <> 'Standard';

--7EXTENDED
SELECT CALL.PHONENO, CALL.PRICE, SUM(CALL.PRICE+(CALL.PRICE * CALLCATEGORY.MARKUPRATE)) AS TOTAL_PRICE_PER_CUSTOMER
FROM CALL, CALLCATEGORY, CUSTOMER
WHERE CALL.CALLCATID = CALLCATEGORY.CALLCATID
AND CUSTOMER.PHONENO = CALL.PHONENO
AND CALLCATEGORY.CATNAME <> 'Standard'
GROUP BY CALL.PHONENO, CALL.PRICE, CALL.PRICE+(CALL.PRICE * CALLCATEGORY.MARKUPRATE);

--Retrieve the total number of calls made by each customer.
SELECT PHONENO, COUNT(PHONENO) AS COUNT_OF_CALLS FROM CALL
GROUP BY PHONENO;

--Retrieve the average call duration for calls made from a specific base station.
SELECT BASESTATION.BASESTID, BASESTATION.BASESTNAME, SUM(CALL.DURATION) AS SUM_DURATION_STATION
FROM CALL, BASESTATION
WHERE BASESTATION.BASESTID = CALL.BASESTID
GROUP BY BASESTATION.BASESTID, BASESTATION.BASESTNAME
ORDER BY AVG(CALL.DURATION) DESC;

--Retrieve the total revenue generated by the network for each destination
SELECT CALL.DESTID, SUM(CALL.PRICE), (SUM(CALL.PRICE)+ SUM(CALL.PRICE * CALLCATEGORY.MARKUPRATE)) AS TOTAL_REVENUE
FROM CALL, CALLCATEGORY
WHERE CALL.CALLCATID = CALLCATEGORY.CALLCATID
GROUP BY CALL.DESTID;

--Retrieve the list of base stations that have not received any beacon messages or calls
SELECT BASESTATION.BASESTID, BASESTATION.BASESTNAME
FROM BASESTATION
LEFT JOIN BEACONMESSAGE ON BASESTATION.BASESTID = BEACONMESSAGE.BASESTID
LEFT JOIN CALL ON BASESTATION.BASESTID = CALL.BASESTID
WHERE BEACONMESSAGE.BASESTID IS NULL AND CALL.BASESTID IS NULL;

--Retrieve the list of customers with contractaccounts who have not made any calls
SELECT CUSTOMER.PHONENO, CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME
FROM CUSTOMER
LEFT JOIN CONTRACT_CUSTOMER ON CUSTOMER.PHONENO = CONTRACT_CUSTOMER.PHONENO
LEFT JOIN CALL ON CUSTOMER.PHONENO = CALL.PHONENO
WHERE CALL.PHONENO IS NULL;

----Retrieve the list of customers with contractaccounts who have not made any calls(SUBQUERIES)
SELECT CUSTOMER.PHONENO, CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME
FROM CUSTOMER
INNER JOIN CONTRACT_CUSTOMER ON CUSTOMER.PHONENO = CONTRACT_CUSTOMER.PHONENO
WHERE CUSTOMER.PHONENO NOT IN 
    (SELECT CALL.PHONENO 
     FROM CALL 
     WHERE CALL.PHONENO IS NOT NULL);