/***
-- straight across copy of PM's in Legacy Access DB into CRT 

BEGIN TRANSACTION
SET NOCOUNT ON;

DECLARE @legacyId int, @itemCount int = 10;
DECLARE @legacyName nvarchar(255);

DECLARE pm_cursor CURSOR FOR
	SELECT ID, REPLACE([Full Name], '''', '''''') FROM tblProjectManagers
	WHERE Active = 1
	ORDER BY [Full Name]

OPEN pm_cursor

WHILE 1 = 1
BEGIN
	FETCH NEXT FROM pm_cursor INTO @legacyId, @legacyName;

	IF @@FETCH_STATUS <> 0
	BEGIN
		BREAK;
	END;

	INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT)
		VALUES ('PROJECT_MANAGER', @legacyName, NULL, NULL, @itemCount, 'STRING');
	
	SET @itemCount = @itemCount + 10;
END;

CLOSE pm_cursor;
DEALLOCATE pm_cursor;

COMMIT
GO

*/

/*** Scripts to retrieve data, inject into appropriate worksheet of excel workbook ./Mapping.xslx

-- retrieve values from Legacy table
SELECT ID, [Full Name] FROM tblProjectManagers
WHERE Active = 1
ORDER BY [Full Name]

--retrieve values from CRT Code Table
SELECT CODE_LOOKUP_ID, CODE_NAME FROM CRT_CODE_LOOKUP
WHERE CODE_SET = 'PROJECT_MANAGER'
AND END_DATE IS NULL
ORDER BY CODE_NAME

***/

BEGIN TRANSACTION

IF OBJECT_ID('dbo.MAP_PROJECT_MANAGER', 'U') IS NOT NULL
	DROP TABLE dbo.MAP_PROJECT_MANAGER;
COMMIT
GO

BEGIN TRANSACTION

CREATE TABLE dbo.MAP_PROJECT_MANAGER
(
	LEGACY_ID numeric(9, 0) NOT NULL,
	CRT_ID numeric(9, 0) NOT NULL
)  ON [PRIMARY]

COMMIT
GO

BEGIN TRANSACTION
SET NOCOUNT ON

/*** Generated Inserts Go Here ***/
INSERT INTO MAP_PROJECT_MANAGER VALUES (279, 1267);  --NULL > NULL
INSERT INTO MAP_PROJECT_MANAGER VALUES (353, 1268);  --Aaron Barrett > Aaron Barrett
INSERT INTO MAP_PROJECT_MANAGER VALUES (229, 1269);  --Abid Sivic > Abid Sivic
INSERT INTO MAP_PROJECT_MANAGER VALUES (443, 1270);  --Adam Stubbs > Adam Stubbs
INSERT INTO MAP_PROJECT_MANAGER VALUES (246, 1271);  --Adam Veley > Adam Veley
INSERT INTO MAP_PROJECT_MANAGER VALUES (450, 1272);  --Adelle Corrado > Adelle Corrado
INSERT INTO MAP_PROJECT_MANAGER VALUES (47, 1273);  --Adriana Da Costa > Adriana Da Costa
INSERT INTO MAP_PROJECT_MANAGER VALUES (449, 1274);  --Aimee Barre > Aimee Barre
INSERT INTO MAP_PROJECT_MANAGER VALUES (212, 1275);  --Al Kennedy > Al Kennedy
INSERT INTO MAP_PROJECT_MANAGER VALUES (74, 1276);  --Alan Schmidt > Alan Schmidt
INSERT INTO MAP_PROJECT_MANAGER VALUES (319, 1277);  --Alex Crawford > Alex Crawford
INSERT INTO MAP_PROJECT_MANAGER VALUES (290, 1278);  --Alex Masun > Alex Masun
INSERT INTO MAP_PROJECT_MANAGER VALUES (406, 1279);  --Alex O'Brien > Alex O''Brien
INSERT INTO MAP_PROJECT_MANAGER VALUES (30, 1280);  --Alfred Ho > Alfred Ho
INSERT INTO MAP_PROJECT_MANAGER VALUES (305, 1281);  --Alicia Kosolofski > Alicia Kosolofski
INSERT INTO MAP_PROJECT_MANAGER VALUES (312, 1282);  --Alicia Traas > Alicia Traas
INSERT INTO MAP_PROJECT_MANAGER VALUES (119, 1283);  --Allan Galambos > Allan Galambos
INSERT INTO MAP_PROJECT_MANAGER VALUES (314, 1284);  --Alley Bates > Alley Bates
INSERT INTO MAP_PROJECT_MANAGER VALUES (333, 1285);  --Alysha Piccini > Alysha Piccini
INSERT INTO MAP_PROJECT_MANAGER VALUES (59, 1286);  --Alyssa Morice > Alyssa Morice
INSERT INTO MAP_PROJECT_MANAGER VALUES (322, 1287);  --Alyssa Schultz > Alyssa Schultz
INSERT INTO MAP_PROJECT_MANAGER VALUES (339, 1288);  --Amandeep Dhaliwal > Amandeep Dhaliwal
INSERT INTO MAP_PROJECT_MANAGER VALUES (163, 1289);  --Ameilia Adams > Ameilia Adams
INSERT INTO MAP_PROJECT_MANAGER VALUES (8, 1290);  --Amy Tsang > Amy Tsang
INSERT INTO MAP_PROJECT_MANAGER VALUES (9, 1291);  --Andrew Hind > Andrew Hind
INSERT INTO MAP_PROJECT_MANAGER VALUES (323, 1292);  --Andrew Swift > Andrew Swift
INSERT INTO MAP_PROJECT_MANAGER VALUES (341, 1293);  --Andrew Swift > Andrew Swift
INSERT INTO MAP_PROJECT_MANAGER VALUES (158, 1294);  --Angie Allwood > Angie Allwood
INSERT INTO MAP_PROJECT_MANAGER VALUES (282, 1295);  --Anna Kosmala > Anna Kosmala
INSERT INTO MAP_PROJECT_MANAGER VALUES (433, 1296);  --Anton Stefanac > Anton Stefanac
INSERT INTO MAP_PROJECT_MANAGER VALUES (286, 1297);  --Arkesteyn Mikayla > Arkesteyn Mikayla
INSERT INTO MAP_PROJECT_MANAGER VALUES (86, 1298);  --Art McLean > Art McLean
INSERT INTO MAP_PROJECT_MANAGER VALUES (424, 1299);  --Ashley Cousens > Ashley Cousens
INSERT INTO MAP_PROJECT_MANAGER VALUES (244, 1300);  --Ashok Bhatti > Ashok Bhatti
INSERT INTO MAP_PROJECT_MANAGER VALUES (377, 1301);  --August Sheldon > August Sheldon
INSERT INTO MAP_PROJECT_MANAGER VALUES (127, 1302);  --Bart Chenuz > Bart Chenuz
INSERT INTO MAP_PROJECT_MANAGER VALUES (326, 1303);  --Beau Annunziello > Beau Annunziello
INSERT INTO MAP_PROJECT_MANAGER VALUES (97, 1304);  --Beau Sutherland > Beau Sutherland
INSERT INTO MAP_PROJECT_MANAGER VALUES (421, 1305);  --Ben Reinbolt > Ben Reinbolt
INSERT INTO MAP_PROJECT_MANAGER VALUES (393, 1306);  --Ben Reinbolt > Ben Reinbolt
INSERT INTO MAP_PROJECT_MANAGER VALUES (254, 1307);  --Ben Tanasichuk > Ben Tanasichuk
INSERT INTO MAP_PROJECT_MANAGER VALUES (128, 1308);  --Bill Becker > Bill Becker
INSERT INTO MAP_PROJECT_MANAGER VALUES (16, 1309);  --Bill Crichton > Bill Crichton
INSERT INTO MAP_PROJECT_MANAGER VALUES (122, 1310);  --Bill Glen > Bill Glen
INSERT INTO MAP_PROJECT_MANAGER VALUES (196, 1311);  --Bill Leitch > Bill Leitch
INSERT INTO MAP_PROJECT_MANAGER VALUES (54, 1312);  --Bill Rose > Bill Rose
INSERT INTO MAP_PROJECT_MANAGER VALUES (38, 1313);  --Bob Alexandruk > Bob Alexandruk
INSERT INTO MAP_PROJECT_MANAGER VALUES (336, 1314);  --Bonnie Meints > Bonnie Meints
INSERT INTO MAP_PROJECT_MANAGER VALUES (329, 1315);  --Brad Beaupre > Brad Beaupre
INSERT INTO MAP_PROJECT_MANAGER VALUES (143, 1316);  --Brad Boyden > Brad Boyden
INSERT INTO MAP_PROJECT_MANAGER VALUES (15, 1317);  --Brad Bushill > Brad Bushill
INSERT INTO MAP_PROJECT_MANAGER VALUES (217, 1318);  --Brad Hogg > Brad Hogg
INSERT INTO MAP_PROJECT_MANAGER VALUES (70, 1319);  --Brad Moores > Brad Moores
INSERT INTO MAP_PROJECT_MANAGER VALUES (311, 1320);  --Brad Panton > Brad Panton
INSERT INTO MAP_PROJECT_MANAGER VALUES (397, 1321);  --Brandon Klingbell > Brandon Klingbell
INSERT INTO MAP_PROJECT_MANAGER VALUES (40, 1322);  --Brent Cameron > Brent Cameron
INSERT INTO MAP_PROJECT_MANAGER VALUES (367, 1323);  --Brent Case > Brent Case
INSERT INTO MAP_PROJECT_MANAGER VALUES (67, 1324);  --Brent Davies > Brent Davies
INSERT INTO MAP_PROJECT_MANAGER VALUES (198, 1325);  --Brent McDonald > Brent McDonald
INSERT INTO MAP_PROJECT_MANAGER VALUES (202, 1326);  --Brent Persello > Brent Persello
INSERT INTO MAP_PROJECT_MANAGER VALUES (368, 1327);  --Brian Lomas > Brian Lomas
INSERT INTO MAP_PROJECT_MANAGER VALUES (55, 1328);  --Brian Taylor > Brian Taylor
INSERT INTO MAP_PROJECT_MANAGER VALUES (34, 1329);  --Brigid Canil > Brigid Canil
INSERT INTO MAP_PROJECT_MANAGER VALUES (273, 1330);  --Brooke Casby > Brooke Casby
INSERT INTO MAP_PROJECT_MANAGER VALUES (48, 1331);  --Brooke Clasby > Brooke Clasby
INSERT INTO MAP_PROJECT_MANAGER VALUES (99, 1332);  --Bryan Crosby > Bryan Crosby
INSERT INTO MAP_PROJECT_MANAGER VALUES (366, 1333);  --Cailey Brown > Cailey Brown
INSERT INTO MAP_PROJECT_MANAGER VALUES (227, 1334);  --Caitlin Dobson > Caitlin Dobson
INSERT INTO MAP_PROJECT_MANAGER VALUES (83, 1335);  --Carolyn Turcotte > Carolyn Turcotte
INSERT INTO MAP_PROJECT_MANAGER VALUES (62, 1336);  --Catherine Bartlett > Catherine Bartlett
INSERT INTO MAP_PROJECT_MANAGER VALUES (384, 1337);  --Catherine Bartlett > Catherine Bartlett
INSERT INTO MAP_PROJECT_MANAGER VALUES (78, 1338);  --Cecil Bianco > Cecil Bianco
INSERT INTO MAP_PROJECT_MANAGER VALUES (18, 1339);  --Cedric Evangelista > Cedric Evangelista
INSERT INTO MAP_PROJECT_MANAGER VALUES (12, 1340);  --Cedrick Evangelista > Cedrick Evangelista
INSERT INTO MAP_PROJECT_MANAGER VALUES (185, 1341);  --Chad Marsh > Chad Marsh
INSERT INTO MAP_PROJECT_MANAGER VALUES (14, 1342);  --Chad Siemens > Chad Siemens
INSERT INTO MAP_PROJECT_MANAGER VALUES (176, 1343);  --Chris Gordon  > Chris Gordon 
INSERT INTO MAP_PROJECT_MANAGER VALUES (80, 1344);  --Chris Keir > Chris Keir
INSERT INTO MAP_PROJECT_MANAGER VALUES (243, 1345);  --Chris Lee > Chris Lee
INSERT INTO MAP_PROJECT_MANAGER VALUES (404, 1346);  --Christine Ingham > Christine Ingham
INSERT INTO MAP_PROJECT_MANAGER VALUES (77, 1347);  --Clayton Tomas > Clayton Tomas
INSERT INTO MAP_PROJECT_MANAGER VALUES (278, 1348);  --Clint Monson  > Clint Monson 
INSERT INTO MAP_PROJECT_MANAGER VALUES (180, 1349);  --Clint Monson > Clint Monson
INSERT INTO MAP_PROJECT_MANAGER VALUES (213, 1350);  --Colin Midgley > Colin Midgley
INSERT INTO MAP_PROJECT_MANAGER VALUES (76, 1351);  --Colleen Davis > Colleen Davis
INSERT INTO MAP_PROJECT_MANAGER VALUES (390, 1352);  --Corey Peterson > Corey Peterson
INSERT INTO MAP_PROJECT_MANAGER VALUES (239, 1353);  --Corinna Ellerman > Corinna Ellerman
INSERT INTO MAP_PROJECT_MANAGER VALUES (318, 1354);  --Cory Schmidt > Cory Schmidt
INSERT INTO MAP_PROJECT_MANAGER VALUES (401, 1355);  --Courtenay Nicol > Courtenay Nicol
INSERT INTO MAP_PROJECT_MANAGER VALUES (301, 1356);  --Curtis Saunders > Curtis Saunders
INSERT INTO MAP_PROJECT_MANAGER VALUES (169, 1357);  --Dan Baker > Dan Baker
INSERT INTO MAP_PROJECT_MANAGER VALUES (417, 1358);  --Dan Brooks > Dan Brooks
INSERT INTO MAP_PROJECT_MANAGER VALUES (147, 1359);  --Dan Olson > Dan Olson
INSERT INTO MAP_PROJECT_MANAGER VALUES (32, 1360);  --Dana Aljanaby  > Dana Aljanaby 
INSERT INTO MAP_PROJECT_MANAGER VALUES (370, 1361);  --Daniel Belisle > Daniel Belisle
INSERT INTO MAP_PROJECT_MANAGER VALUES (369, 1362);  --Daniel Cossette > Daniel Cossette
INSERT INTO MAP_PROJECT_MANAGER VALUES (429, 1363);  --Daniel Johnson > Daniel Johnson
INSERT INTO MAP_PROJECT_MANAGER VALUES (316, 1364);  --Danielle Dessureault > Danielle Dessureault
INSERT INTO MAP_PROJECT_MANAGER VALUES (388, 1365);  --Danielle French > Danielle French
INSERT INTO MAP_PROJECT_MANAGER VALUES (351, 1366);  --Danny Arndt > Danny Arndt
INSERT INTO MAP_PROJECT_MANAGER VALUES (44, 1367);  --Danny Morris > Danny Morris
INSERT INTO MAP_PROJECT_MANAGER VALUES (193, 1368);  --Darcy Grykuliak > Darcy Grykuliak
INSERT INTO MAP_PROJECT_MANAGER VALUES (136, 1369);  --Darcy Penner > Darcy Penner
INSERT INTO MAP_PROJECT_MANAGER VALUES (211, 1370);  --Darin Welch > Darin Welch
INSERT INTO MAP_PROJECT_MANAGER VALUES (150, 1371);  --Darrell Gunn > Darrell Gunn
INSERT INTO MAP_PROJECT_MANAGER VALUES (134, 1372);  --Darren Englund > Darren Englund
INSERT INTO MAP_PROJECT_MANAGER VALUES (249, 1373);  --Daryl Nolan > Daryl Nolan
INSERT INTO MAP_PROJECT_MANAGER VALUES (164, 1374);  --Dave Edgar > Dave Edgar
INSERT INTO MAP_PROJECT_MANAGER VALUES (200, 1375);  --Dave Prehara > Dave Prehara
INSERT INTO MAP_PROJECT_MANAGER VALUES (257, 1376);  --Dave Sarsiat > Dave Sarsiat
INSERT INTO MAP_PROJECT_MANAGER VALUES (49, 1377);  --Dave Shibata > Dave Shibata
INSERT INTO MAP_PROJECT_MANAGER VALUES (220, 1378);  --Dave Swales > Dave Swales
INSERT INTO MAP_PROJECT_MANAGER VALUES (338, 1379);  --Daveena Thomas > Daveena Thomas
INSERT INTO MAP_PROJECT_MANAGER VALUES (340, 1380);  --David Chang > David Chang
INSERT INTO MAP_PROJECT_MANAGER VALUES (378, 1381);  --David Gerein > David Gerein
INSERT INTO MAP_PROJECT_MANAGER VALUES (23, 1382);  --David Holloway > David Holloway
INSERT INTO MAP_PROJECT_MANAGER VALUES (117, 1383);  --David Keely > David Keely
INSERT INTO MAP_PROJECT_MANAGER VALUES (179, 1384);  --David Mintak > David Mintak
INSERT INTO MAP_PROJECT_MANAGER VALUES (320, 1385);  --David Retzer > David Retzer
INSERT INTO MAP_PROJECT_MANAGER VALUES (240, 1386);  --Dean Daniel > Dean Daniel
INSERT INTO MAP_PROJECT_MANAGER VALUES (27, 1387);  --Deborah Newby > Deborah Newby
INSERT INTO MAP_PROJECT_MANAGER VALUES (17, 1388);  --Deborah Tan > Deborah Tan
INSERT INTO MAP_PROJECT_MANAGER VALUES (349, 1389);  --Dejan Pesic > Dejan Pesic
INSERT INTO MAP_PROJECT_MANAGER VALUES (112, 1390);  --Dennis Kurylowich > Dennis Kurylowich
INSERT INTO MAP_PROJECT_MANAGER VALUES (5, 1391);  --Derek Drummond > Derek Drummond
INSERT INTO MAP_PROJECT_MANAGER VALUES (317, 1392);  --Derek Kitamura > Derek Kitamura
INSERT INTO MAP_PROJECT_MANAGER VALUES (22, 1393);  --Dickson Chung > Dickson Chung
INSERT INTO MAP_PROJECT_MANAGER VALUES (237, 1394);  --District Staff > District Staff
INSERT INTO MAP_PROJECT_MANAGER VALUES (182, 1395);  --DJ Bella > DJ Bella
INSERT INTO MAP_PROJECT_MANAGER VALUES (258, 1396);  --Dominko Komnenovic > Dominko Komnenovic
INSERT INTO MAP_PROJECT_MANAGER VALUES (413, 1397);  --Don Hounsell > Don Hounsell
INSERT INTO MAP_PROJECT_MANAGER VALUES (20, 1398);  --Don Legault > Don Legault
INSERT INTO MAP_PROJECT_MANAGER VALUES (204, 1399);  --Don Shaw > Don Shaw
INSERT INTO MAP_PROJECT_MANAGER VALUES (126, 1400);  --Donalda Ritchie > Donalda Ritchie
INSERT INTO MAP_PROJECT_MANAGER VALUES (168, 1401);  --Donovan Gee > Donovan Gee
INSERT INTO MAP_PROJECT_MANAGER VALUES (26, 1402);  --Doug Hyde > Doug Hyde
INSERT INTO MAP_PROJECT_MANAGER VALUES (350, 1403);  --Doug Wilson > Doug Wilson
INSERT INTO MAP_PROJECT_MANAGER VALUES (428, 1404);  --Duane Wells > Duane Wells
INSERT INTO MAP_PROJECT_MANAGER VALUES (391, 1405);  --Dylan Bennett > Dylan Bennett
INSERT INTO MAP_PROJECT_MANAGER VALUES (304, 1406);  --Emily Fukumoto > Emily Fukumoto
INSERT INTO MAP_PROJECT_MANAGER VALUES (346, 1407);  --Emma MacTavish > Emma MacTavish
INSERT INTO MAP_PROJECT_MANAGER VALUES (357, 1408);  --Eric Julien > Eric Julien
INSERT INTO MAP_PROJECT_MANAGER VALUES (347, 1409);  --Eric Kronlacher > Eric Kronlacher
INSERT INTO MAP_PROJECT_MANAGER VALUES (64, 1410);  --Eric Lachmuth > Eric Lachmuth
INSERT INTO MAP_PROJECT_MANAGER VALUES (422, 1411);  --Erik Jamik > Erik Jamik
INSERT INTO MAP_PROJECT_MANAGER VALUES (46, 1412);  --Erik Lachmuth > Erik Lachmuth
INSERT INTO MAP_PROJECT_MANAGER VALUES (29, 1413);  --Erin Moxon > Erin Moxon
INSERT INTO MAP_PROJECT_MANAGER VALUES (79, 1414);  --Faisal Siddiqui > Faisal Siddiqui
INSERT INTO MAP_PROJECT_MANAGER VALUES (233, 1415);  --Felix Latour - 37288, Florian Kund - 37291 > Felix Latour - 37288, Florian Kund - 37291
INSERT INTO MAP_PROJECT_MANAGER VALUES (234, 1416);  --Florian Kund > Florian Kund
INSERT INTO MAP_PROJECT_MANAGER VALUES (436, 1417);  --Francois Laurent > Francois Laurent
INSERT INTO MAP_PROJECT_MANAGER VALUES (171, 1418);  --Fred Seychuk > Fred Seychuk
INSERT INTO MAP_PROJECT_MANAGER VALUES (21, 1419);  --Gateway  > Gateway 
INSERT INTO MAP_PROJECT_MANAGER VALUES (43, 1420);  --Gayle Keefe > Gayle Keefe
INSERT INTO MAP_PROJECT_MANAGER VALUES (75, 1421);  --George Lomas > George Lomas
INSERT INTO MAP_PROJECT_MANAGER VALUES (221, 1422);  --George Warnock > George Warnock
INSERT INTO MAP_PROJECT_MANAGER VALUES (380, 1423);  --Gerri Goulet > Gerri Goulet
INSERT INTO MAP_PROJECT_MANAGER VALUES (89, 1424);  --Gerry Fleming > Gerry Fleming
INSERT INTO MAP_PROJECT_MANAGER VALUES (173, 1425);  --Giesila Decker  > Giesila Decker 
INSERT INTO MAP_PROJECT_MANAGER VALUES (152, 1426);  --Gord Bonwick > Gord Bonwick
INSERT INTO MAP_PROJECT_MANAGER VALUES (88, 1427);  --Gord Chudleigh > Gord Chudleigh
INSERT INTO MAP_PROJECT_MANAGER VALUES (376, 1428);  --Gordon H Wagner > Gordon H Wagner
INSERT INTO MAP_PROJECT_MANAGER VALUES (10, 1429);  --Graeme Schimpf > Graeme Schimpf
INSERT INTO MAP_PROJECT_MANAGER VALUES (415, 1430);  --Grant Erickson > Grant Erickson
INSERT INTO MAP_PROJECT_MANAGER VALUES (381, 1431);  --Grant Herman > Grant Herman
INSERT INTO MAP_PROJECT_MANAGER VALUES (104, 1432);  --Grant Smith > Grant Smith
INSERT INTO MAP_PROJECT_MANAGER VALUES (146, 1433);  --Grant Watson > Grant Watson
INSERT INTO MAP_PROJECT_MANAGER VALUES (115, 1434);  --Greg Bruce > Greg Bruce
INSERT INTO MAP_PROJECT_MANAGER VALUES (139, 1435);  --Greg Kinnear > Greg Kinnear
INSERT INTO MAP_PROJECT_MANAGER VALUES (141, 1436);  --Greg Ross > Greg Ross
INSERT INTO MAP_PROJECT_MANAGER VALUES (58, 1437);  --Hali Davenport > Hali Davenport
INSERT INTO MAP_PROJECT_MANAGER VALUES (24, 1438);  --Helen Evans > Helen Evans
INSERT INTO MAP_PROJECT_MANAGER VALUES (124, 1439);  --Hilary Barnett > Hilary Barnett
INSERT INTO MAP_PROJECT_MANAGER VALUES (423, 1440);  --Holden Spencer > Holden Spencer
INSERT INTO MAP_PROJECT_MANAGER VALUES (342, 1441);  --Ian Grant > Ian Grant
INSERT INTO MAP_PROJECT_MANAGER VALUES (328, 1442);  --Ian Mandrusiak > Ian Mandrusiak
INSERT INTO MAP_PROJECT_MANAGER VALUES (382, 1443);  --Irene Pearce > Irene Pearce
INSERT INTO MAP_PROJECT_MANAGER VALUES (395, 1444);  --James Dash > James Dash
INSERT INTO MAP_PROJECT_MANAGER VALUES (262, 1445);  --James Hewitt > James Hewitt
INSERT INTO MAP_PROJECT_MANAGER VALUES (386, 1446);  --James Luo > James Luo
INSERT INTO MAP_PROJECT_MANAGER VALUES (451, 1447);  --Jamie Goodridge > Jamie Goodridge
INSERT INTO MAP_PROJECT_MANAGER VALUES (129, 1448);  --Janelle Erwin > Janelle Erwin
INSERT INTO MAP_PROJECT_MANAGER VALUES (372, 1449);  --Janet Colussi > Janet Colussi
INSERT INTO MAP_PROJECT_MANAGER VALUES (298, 1450);  --Jarret Wedel > Jarret Wedel
INSERT INTO MAP_PROJECT_MANAGER VALUES (148, 1451);  --Jason Templeton > Jason Templeton
INSERT INTO MAP_PROJECT_MANAGER VALUES (135, 1452);  --Jay Dunbar > Jay Dunbar
INSERT INTO MAP_PROJECT_MANAGER VALUES (1, 1453);  --Jay Porter > Jay Porter
INSERT INTO MAP_PROJECT_MANAGER VALUES (383, 1454);  --Jayson Chaplin > Jayson Chaplin
INSERT INTO MAP_PROJECT_MANAGER VALUES (418, 1455);  --Jeanette Grant > Jeanette Grant
INSERT INTO MAP_PROJECT_MANAGER VALUES (68, 1456);  --Jed Zimmerman > Jed Zimmerman
INSERT INTO MAP_PROJECT_MANAGER VALUES (189, 1457);  --Jeff Ferguson > Jeff Ferguson
INSERT INTO MAP_PROJECT_MANAGER VALUES (203, 1458);  --Jeff Saby > Jeff Saby
INSERT INTO MAP_PROJECT_MANAGER VALUES (25, 1459);  --Jennifer Locke > Jennifer Locke
INSERT INTO MAP_PROJECT_MANAGER VALUES (306, 1460);  --Jennifer Stites > Jennifer Stites
INSERT INTO MAP_PROJECT_MANAGER VALUES (28, 1461);  --Jesse Morwood  > Jesse Morwood 
INSERT INTO MAP_PROJECT_MANAGER VALUES (402, 1462);  --Jessica Learn > Jessica Learn
INSERT INTO MAP_PROJECT_MANAGER VALUES (426, 1463);  --Jessica Zylicz > Jessica Zylicz
INSERT INTO MAP_PROJECT_MANAGER VALUES (420, 1464);  --Jessie Horton > Jessie Horton
INSERT INTO MAP_PROJECT_MANAGER VALUES (251, 1465);  --Jim White > Jim White
INSERT INTO MAP_PROJECT_MANAGER VALUES (444, 1466);  --Jo Cowper > Jo Cowper
INSERT INTO MAP_PROJECT_MANAGER VALUES (431, 1467);  --Jody Deane > Jody Deane
INSERT INTO MAP_PROJECT_MANAGER VALUES (399, 1468);  --Joey Tasker > Joey Tasker
INSERT INTO MAP_PROJECT_MANAGER VALUES (210, 1469);  --John Babineau > John Babineau
INSERT INTO MAP_PROJECT_MANAGER VALUES (294, 1470);  --John Marchesan > John Marchesan
INSERT INTO MAP_PROJECT_MANAGER VALUES (92, 1471);  --John Schnablegger > John Schnablegger
INSERT INTO MAP_PROJECT_MANAGER VALUES (264, 1472);  --John Snyder > John Snyder
INSERT INTO MAP_PROJECT_MANAGER VALUES (172, 1473);  --John Van Geloven > John Van Geloven
INSERT INTO MAP_PROJECT_MANAGER VALUES (192, 1474);  --Jon Jensen > Jon Jensen
INSERT INTO MAP_PROJECT_MANAGER VALUES (133, 1475);  --Jonathan Tillie > Jonathan Tillie
INSERT INTO MAP_PROJECT_MANAGER VALUES (256, 1476);  --Jonathan Tillies > Jonathan Tillies
INSERT INTO MAP_PROJECT_MANAGER VALUES (114, 1477);  --Joseph Adom > Joseph Adom
INSERT INTO MAP_PROJECT_MANAGER VALUES (197, 1478);  --Joyce Chang > Joyce Chang
INSERT INTO MAP_PROJECT_MANAGER VALUES (222, 1479);  --JP Fournier > JP Fournier
INSERT INTO MAP_PROJECT_MANAGER VALUES (111, 1480);  --Jurgen Lutter > Jurgen Lutter
INSERT INTO MAP_PROJECT_MANAGER VALUES (270, 1481);  --Karamjeet Degan > Karamjeet Degan
INSERT INTO MAP_PROJECT_MANAGER VALUES (151, 1482);  --Kareen Peters > Kareen Peters
INSERT INTO MAP_PROJECT_MANAGER VALUES (56, 1483);  --Karen Andrews > Karen Andrews
INSERT INTO MAP_PROJECT_MANAGER VALUES (300, 1484);  --Kasey Foyston > Kasey Foyston
INSERT INTO MAP_PROJECT_MANAGER VALUES (63, 1485);  --Kassidi Jones > Kassidi Jones
INSERT INTO MAP_PROJECT_MANAGER VALUES (440, 1486);  --Kathy Crawford > Kathy Crawford
INSERT INTO MAP_PROJECT_MANAGER VALUES (11, 1487);  --Kathy Strobbe > Kathy Strobbe
INSERT INTO MAP_PROJECT_MANAGER VALUES (138, 1488);  --Katie Ward > Katie Ward
INSERT INTO MAP_PROJECT_MANAGER VALUES (19, 1489);  --Keith Lastoria  > Keith Lastoria 
INSERT INTO MAP_PROJECT_MANAGER VALUES (331, 1490);  --Keith Lastoria > Keith Lastoria
INSERT INTO MAP_PROJECT_MANAGER VALUES (101, 1491);  --Kellen Truant > Kellen Truant
INSERT INTO MAP_PROJECT_MANAGER VALUES (61, 1492);  --Ken Aura > Ken Aura
INSERT INTO MAP_PROJECT_MANAGER VALUES (285, 1493);  --Ken Namislo > Ken Namislo
INSERT INTO MAP_PROJECT_MANAGER VALUES (93, 1494);  --Kenedee Ludwar > Kenedee Ludwar
INSERT INTO MAP_PROJECT_MANAGER VALUES (165, 1495);  --Kent Hodgson > Kent Hodgson
INSERT INTO MAP_PROJECT_MANAGER VALUES (283, 1496);  --Kevin Carter > Kevin Carter
INSERT INTO MAP_PROJECT_MANAGER VALUES (414, 1497);  --Kevin Lutz > Kevin Lutz
INSERT INTO MAP_PROJECT_MANAGER VALUES (295, 1498);  --Kevyn Hryhirchuk > Kevyn Hryhirchuk
INSERT INTO MAP_PROJECT_MANAGER VALUES (408, 1499);  --Khalid Khan > Khalid Khan
INSERT INTO MAP_PROJECT_MANAGER VALUES (425, 1500);  --Kirk Normand > Kirk Normand
INSERT INTO MAP_PROJECT_MANAGER VALUES (364, 1501);  --Kirsten Konge > Kirsten Konge
INSERT INTO MAP_PROJECT_MANAGER VALUES (412, 1502);  --Korry Bonhomme > Korry Bonhomme
INSERT INTO MAP_PROJECT_MANAGER VALUES (432, 1503);  --Kristen Johnson > Kristen Johnson
INSERT INTO MAP_PROJECT_MANAGER VALUES (107, 1504);  --Kristen Spearman  > Kristen Spearman 
INSERT INTO MAP_PROJECT_MANAGER VALUES (6, 1505);  --Kyle Drummond > Kyle Drummond
INSERT INTO MAP_PROJECT_MANAGER VALUES (409, 1506);  --Kyle Drummond > Kyle Drummond
INSERT INTO MAP_PROJECT_MANAGER VALUES (419, 1507);  --Kyle Halvorson > Kyle Halvorson
INSERT INTO MAP_PROJECT_MANAGER VALUES (94, 1508);  --Kylee O’Dell  > Kylee O’Dell 
INSERT INTO MAP_PROJECT_MANAGER VALUES (157, 1509);  --Larry Park > Larry Park
INSERT INTO MAP_PROJECT_MANAGER VALUES (379, 1510);  --Laura Herrera > Laura Herrera
INSERT INTO MAP_PROJECT_MANAGER VALUES (400, 1511);  --Lauren Bell > Lauren Bell
INSERT INTO MAP_PROJECT_MANAGER VALUES (430, 1512);  --Lauren Scott > Lauren Scott
INSERT INTO MAP_PROJECT_MANAGER VALUES (263, 1513);  --Laurie Christiansen > Laurie Christiansen
INSERT INTO MAP_PROJECT_MANAGER VALUES (161, 1514);  --Leanne Ilnicki > Leanne Ilnicki
INSERT INTO MAP_PROJECT_MANAGER VALUES (160, 1515);  --Leeah Reese > Leeah Reese
INSERT INTO MAP_PROJECT_MANAGER VALUES (205, 1516);  --Leeah Tappert > Leeah Tappert
INSERT INTO MAP_PROJECT_MANAGER VALUES (51, 1517);  --Len Sauchuk > Len Sauchuk
INSERT INTO MAP_PROJECT_MANAGER VALUES (187, 1518);  --Les Gilburg > Les Gilburg
INSERT INTO MAP_PROJECT_MANAGER VALUES (90, 1519);  --Lina Halwani > Lina Halwani
INSERT INTO MAP_PROJECT_MANAGER VALUES (389, 1520);  --Lindsay McKinnon > Lindsay McKinnon
INSERT INTO MAP_PROJECT_MANAGER VALUES (52, 1521);  --Lindsay Parker > Lindsay Parker
INSERT INTO MAP_PROJECT_MANAGER VALUES (118, 1522);  --Lisa Amminson > Lisa Amminson
INSERT INTO MAP_PROJECT_MANAGER VALUES (31, 1523);  --Lisa Miller > Lisa Miller
INSERT INTO MAP_PROJECT_MANAGER VALUES (206, 1524);  --Loreen Russel > Loreen Russel
INSERT INTO MAP_PROJECT_MANAGER VALUES (13, 1525);  --Loris Tommasel > Loris Tommasel
INSERT INTO MAP_PROJECT_MANAGER VALUES (154, 1526);  --Louis Sun > Louis Sun
INSERT INTO MAP_PROJECT_MANAGER VALUES (153, 1527);  --Louise Sun > Louise Sun
INSERT INTO MAP_PROJECT_MANAGER VALUES (445, 1528);  --Lucill Green > Lucill Green
INSERT INTO MAP_PROJECT_MANAGER VALUES (159, 1529);  --Lynn Ann Cheverie > Lynn Ann Cheverie
INSERT INTO MAP_PROJECT_MANAGER VALUES (296, 1530);  --Lynn Ann Cheverie > Lynn Ann Cheverie
INSERT INTO MAP_PROJECT_MANAGER VALUES (437, 1531);  --Mackenzie Berry > Mackenzie Berry
INSERT INTO MAP_PROJECT_MANAGER VALUES (53, 1532);  --Maike Schimpf > Maike Schimpf
INSERT INTO MAP_PROJECT_MANAGER VALUES (232, 1533);  --Marcus Barber > Marcus Barber
INSERT INTO MAP_PROJECT_MANAGER VALUES (69, 1534);  --Margie Henley > Margie Henley
INSERT INTO MAP_PROJECT_MANAGER VALUES (411, 1535);  --Marie Wood > Marie Wood
INSERT INTO MAP_PROJECT_MANAGER VALUES (177, 1536);  --Mark Louttit > Mark Louttit
INSERT INTO MAP_PROJECT_MANAGER VALUES (260, 1537);  --Mark Savage > Mark Savage
INSERT INTO MAP_PROJECT_MANAGER VALUES (310, 1538);  --Marleen Keehn > Marleen Keehn
INSERT INTO MAP_PROJECT_MANAGER VALUES (137, 1539);  --Marvin Jones > Marvin Jones
INSERT INTO MAP_PROJECT_MANAGER VALUES (373, 1540);  --Matt Foley > Matt Foley
INSERT INTO MAP_PROJECT_MANAGER VALUES (175, 1541);  --Matthew Bond > Matthew Bond
INSERT INTO MAP_PROJECT_MANAGER VALUES (435, 1542);  --Matthew Butterfield > Matthew Butterfield
INSERT INTO MAP_PROJECT_MANAGER VALUES (335, 1543);  --Maurice LaFrancois > Maurice LaFrancois
INSERT INTO MAP_PROJECT_MANAGER VALUES (195, 1544);  --Maurice LeFrancois > Maurice LeFrancois
INSERT INTO MAP_PROJECT_MANAGER VALUES (325, 1545);  --Max Birkner > Max Birkner
INSERT INTO MAP_PROJECT_MANAGER VALUES (268, 1546);  --Maziar Kazemi  > Maziar Kazemi 
INSERT INTO MAP_PROJECT_MANAGER VALUES (324, 1547);  --Michael Blancher > Michael Blancher
INSERT INTO MAP_PROJECT_MANAGER VALUES (354, 1548);  --Michael Braun > Michael Braun
INSERT INTO MAP_PROJECT_MANAGER VALUES (4, 1549);  --Michael Dinney > Michael Dinney
INSERT INTO MAP_PROJECT_MANAGER VALUES (442, 1550);  --Michelle Bell > Michelle Bell
INSERT INTO MAP_PROJECT_MANAGER VALUES (407, 1551);  --Michelle Boudreau > Michelle Boudreau
INSERT INTO MAP_PROJECT_MANAGER VALUES (194, 1552);  --Michelle Evans > Michelle Evans
INSERT INTO MAP_PROJECT_MANAGER VALUES (57, 1553);  --Michelle Schilling > Michelle Schilling
INSERT INTO MAP_PROJECT_MANAGER VALUES (293, 1554);  --Mikayla Arkesteyn > Mikayla Arkesteyn
INSERT INTO MAP_PROJECT_MANAGER VALUES (41, 1555);  --Mike Aldred > Mike Aldred
INSERT INTO MAP_PROJECT_MANAGER VALUES (130, 1556);  --Mike Boissoneault > Mike Boissoneault
INSERT INTO MAP_PROJECT_MANAGER VALUES (149, 1557);  --Mike Dinney > Mike Dinney
INSERT INTO MAP_PROJECT_MANAGER VALUES (170, 1558);  --Mike Dolman > Mike Dolman
INSERT INTO MAP_PROJECT_MANAGER VALUES (447, 1559);  --Mike Frazier > Mike Frazier
INSERT INTO MAP_PROJECT_MANAGER VALUES (96, 1560);  --Mike Kelly > Mike Kelly
INSERT INTO MAP_PROJECT_MANAGER VALUES (207, 1561);  --Mike Lorimer > Mike Lorimer
INSERT INTO MAP_PROJECT_MANAGER VALUES (85, 1562);  --Mike Matejka > Mike Matejka
INSERT INTO MAP_PROJECT_MANAGER VALUES (267, 1563);  --Mike Odowichuk > Mike Odowichuk
INSERT INTO MAP_PROJECT_MANAGER VALUES (132, 1564);  --Mike Pearson > Mike Pearson
INSERT INTO MAP_PROJECT_MANAGER VALUES (446, 1565);  --Millie Furlong > Millie Furlong
INSERT INTO MAP_PROJECT_MANAGER VALUES (365, 1566);  --Mohsin Gohir > Mohsin Gohir
INSERT INTO MAP_PROJECT_MANAGER VALUES (361, 1567);  --Monique Gairns > Monique Gairns
INSERT INTO MAP_PROJECT_MANAGER VALUES (253, 1568);  --Nadia Lebel > Nadia Lebel
INSERT INTO MAP_PROJECT_MANAGER VALUES (259, 1569);  --Nash Jamal > Nash Jamal
INSERT INTO MAP_PROJECT_MANAGER VALUES (174, 1570);  --Nassir Malik > Nassir Malik
INSERT INTO MAP_PROJECT_MANAGER VALUES (410, 1571);  --Nathan Lepoudre > Nathan Lepoudre
INSERT INTO MAP_PROJECT_MANAGER VALUES (7, 1572);  --Nathan Voogd > Nathan Voogd
INSERT INTO MAP_PROJECT_MANAGER VALUES (358, 1573);  --Neal Moulton > Neal Moulton
INSERT INTO MAP_PROJECT_MANAGER VALUES (356, 1574);  --Neal Moulton > Neal Moulton
INSERT INTO MAP_PROJECT_MANAGER VALUES (188, 1575);  --Neetu Bhatti > Neetu Bhatti
INSERT INTO MAP_PROJECT_MANAGER VALUES (345, 1576);  --Nicola Hogg > Nicola Hogg
INSERT INTO MAP_PROJECT_MANAGER VALUES (405, 1577);  --Nicole Folk > Nicole Folk
INSERT INTO MAP_PROJECT_MANAGER VALUES (247, 1578);  --Nini Long > Nini Long
INSERT INTO MAP_PROJECT_MANAGER VALUES (100, 1579);  --Oliver Schwuchow > Oliver Schwuchow
INSERT INTO MAP_PROJECT_MANAGER VALUES (281, 1580);  --Pat Devereaux > Pat Devereaux
INSERT INTO MAP_PROJECT_MANAGER VALUES (261, 1581);  --Pat Egan > Pat Egan
INSERT INTO MAP_PROJECT_MANAGER VALUES (265, 1582);  --Patrica Mazuck > Patrica Mazuck
INSERT INTO MAP_PROJECT_MANAGER VALUES (33, 1583);  --Patrick Coates > Patrick Coates
INSERT INTO MAP_PROJECT_MANAGER VALUES (348, 1584);  --Paul Rae > Paul Rae
INSERT INTO MAP_PROJECT_MANAGER VALUES (125, 1585);  --Paul Riegert > Paul Riegert
INSERT INTO MAP_PROJECT_MANAGER VALUES (332, 1586);  --Paul Savinkoff > Paul Savinkoff
INSERT INTO MAP_PROJECT_MANAGER VALUES (162, 1587);  --Paul Soffo > Paul Soffo
INSERT INTO MAP_PROJECT_MANAGER VALUES (216, 1588);  --Paula Cousins > Paula Cousins
INSERT INTO MAP_PROJECT_MANAGER VALUES (156, 1589);  --Peter Cocker > Peter Cocker
INSERT INTO MAP_PROJECT_MANAGER VALUES (299, 1590);  --Peter DeWith > Peter DeWith
INSERT INTO MAP_PROJECT_MANAGER VALUES (276, 1591);  --Peter Gooch > Peter Gooch
INSERT INTO MAP_PROJECT_MANAGER VALUES (334, 1592);  --Peter Yates > Peter Yates
INSERT INTO MAP_PROJECT_MANAGER VALUES (439, 1593);  --Phu Bui > Phu Bui
INSERT INTO MAP_PROJECT_MANAGER VALUES (360, 1594);  --Rachel Driedger > Rachel Driedger
INSERT INTO MAP_PROJECT_MANAGER VALUES (183, 1595);  --Ralph English > Ralph English
INSERT INTO MAP_PROJECT_MANAGER VALUES (60, 1596);  --Rampaul Dulay > Rampaul Dulay
INSERT INTO MAP_PROJECT_MANAGER VALUES (142, 1597);  --Randy Penner > Randy Penner
INSERT INTO MAP_PROJECT_MANAGER VALUES (337, 1598);  --Raouldy Hottua > Raouldy Hottua
INSERT INTO MAP_PROJECT_MANAGER VALUES (434, 1599);  --Raphael Avalos > Raphael Avalos
INSERT INTO MAP_PROJECT_MANAGER VALUES (186, 1600);  --Rebecca Huang > Rebecca Huang
INSERT INTO MAP_PROJECT_MANAGER VALUES (108, 1601);  --Reid Drummond > Reid Drummond
INSERT INTO MAP_PROJECT_MANAGER VALUES (394, 1602);  --Rena Gibson > Rena Gibson
INSERT INTO MAP_PROJECT_MANAGER VALUES (178, 1603);  --Richard Bush > Richard Bush
INSERT INTO MAP_PROJECT_MANAGER VALUES (235, 1604);  --Richard Lokken > Richard Lokken
INSERT INTO MAP_PROJECT_MANAGER VALUES (355, 1605);  --Rino Parise > Rino Parise
INSERT INTO MAP_PROJECT_MANAGER VALUES (81, 1606);  --Rob Kaleka > Rob Kaleka
INSERT INTO MAP_PROJECT_MANAGER VALUES (84, 1607);  --Robbie Kalabis > Robbie Kalabis
INSERT INTO MAP_PROJECT_MANAGER VALUES (113, 1608);  --Ron Domanko > Ron Domanko
INSERT INTO MAP_PROJECT_MANAGER VALUES (184, 1609);  --Ron Lowther > Ron Lowther
INSERT INTO MAP_PROJECT_MANAGER VALUES (396, 1610);  --Ron McCormack > Ron McCormack
INSERT INTO MAP_PROJECT_MANAGER VALUES (120, 1611);  --Ron Sharp > Ron Sharp
INSERT INTO MAP_PROJECT_MANAGER VALUES (140, 1612);  --Rosemary Barnewall > Rosemary Barnewall
INSERT INTO MAP_PROJECT_MANAGER VALUES (181, 1613);  --Ross Coates  > Ross Coates 
INSERT INTO MAP_PROJECT_MANAGER VALUES (215, 1614);  --Russ Roberts > Russ Roberts
INSERT INTO MAP_PROJECT_MANAGER VALUES (144, 1615);  --Ryan Edmonds > Ryan Edmonds
INSERT INTO MAP_PROJECT_MANAGER VALUES (226, 1616);  --Ryan Evanoff > Ryan Evanoff
INSERT INTO MAP_PROJECT_MANAGER VALUES (106, 1617);  --Ryan Oakley > Ryan Oakley
INSERT INTO MAP_PROJECT_MANAGER VALUES (255, 1618);  --Ryan Spillett > Ryan Spillett
INSERT INTO MAP_PROJECT_MANAGER VALUES (327, 1619);  --Ryan Thorpe > Ryan Thorpe
INSERT INTO MAP_PROJECT_MANAGER VALUES (121, 1620);  --Sam Pantaleo > Sam Pantaleo
INSERT INTO MAP_PROJECT_MANAGER VALUES (218, 1621);  --Samantha Kinnniburgh > Samantha Kinnniburgh
INSERT INTO MAP_PROJECT_MANAGER VALUES (309, 1622);  --Sandra Griffiths > Sandra Griffiths
INSERT INTO MAP_PROJECT_MANAGER VALUES (441, 1623);  --Sandy Lu > Sandy Lu
INSERT INTO MAP_PROJECT_MANAGER VALUES (344, 1624);  --Sarin Warman > Sarin Warman
INSERT INTO MAP_PROJECT_MANAGER VALUES (302, 1625);  --Satish Prasad > Satish Prasad
INSERT INTO MAP_PROJECT_MANAGER VALUES (385, 1626);  --Scott Hales > Scott Hales
INSERT INTO MAP_PROJECT_MANAGER VALUES (292, 1627);  --Scott Lain > Scott Lain
INSERT INTO MAP_PROJECT_MANAGER VALUES (36, 1628);  --Scotty Mckenzie > Scotty Mckenzie
INSERT INTO MAP_PROJECT_MANAGER VALUES (155, 1629);  --SCR- Jay Porter > SCR- Jay Porter
INSERT INTO MAP_PROJECT_MANAGER VALUES (330, 1630);  --Shaldon Datt > Shaldon Datt
INSERT INTO MAP_PROJECT_MANAGER VALUES (352, 1631);  --Shane Bennetts > Shane Bennetts
INSERT INTO MAP_PROJECT_MANAGER VALUES (321, 1632);  --Shannon Quarterman > Shannon Quarterman
INSERT INTO MAP_PROJECT_MANAGER VALUES (199, 1633);  --Sharon Goddard > Sharon Goddard
INSERT INTO MAP_PROJECT_MANAGER VALUES (307, 1634);  --Shaun HolaHan > Shaun HolaHan
INSERT INTO MAP_PROJECT_MANAGER VALUES (35, 1635);  --Shawn Clough > Shawn Clough
INSERT INTO MAP_PROJECT_MANAGER VALUES (45, 1636);  --Shawn Grant > Shawn Grant
INSERT INTO MAP_PROJECT_MANAGER VALUES (392, 1637);  --Shawn Haley > Shawn Haley
INSERT INTO MAP_PROJECT_MANAGER VALUES (91, 1638);  --Sheila Hui > Sheila Hui
INSERT INTO MAP_PROJECT_MANAGER VALUES (105, 1639);  --Shelby Snow > Shelby Snow
INSERT INTO MAP_PROJECT_MANAGER VALUES (191, 1640);  --Simon Lee > Simon Lee
INSERT INTO MAP_PROJECT_MANAGER VALUES (416, 1641);  --Spencer Holden > Spencer Holden
INSERT INTO MAP_PROJECT_MANAGER VALUES (65, 1642);  --Spencer King > Spencer King
INSERT INTO MAP_PROJECT_MANAGER VALUES (313, 1643);  --Stefan Yancey > Stefan Yancey
INSERT INTO MAP_PROJECT_MANAGER VALUES (315, 1644);  --Stephanie Daniels > Stephanie Daniels
INSERT INTO MAP_PROJECT_MANAGER VALUES (387, 1645);  --Stephanie Lorentz > Stephanie Lorentz
INSERT INTO MAP_PROJECT_MANAGER VALUES (102, 1646);  --Stephanie Rothman > Stephanie Rothman
INSERT INTO MAP_PROJECT_MANAGER VALUES (87, 1647);  --Stevan Sobat > Stevan Sobat
INSERT INTO MAP_PROJECT_MANAGER VALUES (224, 1648);  --Steve Dowling > Steve Dowling
INSERT INTO MAP_PROJECT_MANAGER VALUES (42, 1649);  --Steve Sirett > Steve Sirett
INSERT INTO MAP_PROJECT_MANAGER VALUES (201, 1650);  --Stew Miller > Stew Miller
INSERT INTO MAP_PROJECT_MANAGER VALUES (269, 1651);  --Stuart Johnson  > Stuart Johnson 
INSERT INTO MAP_PROJECT_MANAGER VALUES (359, 1652);  --Stuart Johnson > Stuart Johnson
INSERT INTO MAP_PROJECT_MANAGER VALUES (245, 1653);  --Susan Pearson > Susan Pearson
INSERT INTO MAP_PROJECT_MANAGER VALUES (166, 1654);  --Susan Randle > Susan Randle
INSERT INTO MAP_PROJECT_MANAGER VALUES (374, 1655);  --Susheela D'Souza > Susheela D''Souza
INSERT INTO MAP_PROJECT_MANAGER VALUES (223, 1656);  --Tammy Anderson > Tammy Anderson
INSERT INTO MAP_PROJECT_MANAGER VALUES (275, 1657);  --Tara Holmberg > Tara Holmberg
INSERT INTO MAP_PROJECT_MANAGER VALUES (272, 1658);  --Tara Jones > Tara Jones
INSERT INTO MAP_PROJECT_MANAGER VALUES (287, 1659);  --TBD TBD > TBD TBD
INSERT INTO MAP_PROJECT_MANAGER VALUES (109, 1660);  --Ted Moore > Ted Moore
INSERT INTO MAP_PROJECT_MANAGER VALUES (427, 1661);  --Terry Burns > Terry Burns
INSERT INTO MAP_PROJECT_MANAGER VALUES (438, 1662);  --Terry Burns > Terry Burns
INSERT INTO MAP_PROJECT_MANAGER VALUES (209, 1663);  --Terry Harbicht > Terry Harbicht
INSERT INTO MAP_PROJECT_MANAGER VALUES (219, 1664);  --Terry Murphy > Terry Murphy
INSERT INTO MAP_PROJECT_MANAGER VALUES (363, 1665);  --Theodore Hipol > Theodore Hipol
INSERT INTO MAP_PROJECT_MANAGER VALUES (103, 1666);  --Thomas Chhun  > Thomas Chhun 
INSERT INTO MAP_PROJECT_MANAGER VALUES (82, 1667);  --Tim Dyer > Tim Dyer
INSERT INTO MAP_PROJECT_MANAGER VALUES (230, 1668);  --Tim Meszaros > Tim Meszaros
INSERT INTO MAP_PROJECT_MANAGER VALUES (403, 1669);  --Tina Rogers > Tina Rogers
INSERT INTO MAP_PROJECT_MANAGER VALUES (375, 1670);  --Tomas Horalek > Tomas Horalek
INSERT INTO MAP_PROJECT_MANAGER VALUES (271, 1671);  --Tracey Raume > Tracey Raume
INSERT INTO MAP_PROJECT_MANAGER VALUES (190, 1672);  --Tracy Cooper > Tracy Cooper
INSERT INTO MAP_PROJECT_MANAGER VALUES (214, 1673);  --Tracy LeClair > Tracy LeClair
INSERT INTO MAP_PROJECT_MANAGER VALUES (71, 1674);  --Tracy Raume > Tracy Raume
INSERT INTO MAP_PROJECT_MANAGER VALUES (116, 1675);  --Trent Folk > Trent Folk
INSERT INTO MAP_PROJECT_MANAGER VALUES (95, 1676);  --Tricia Klein  > Tricia Klein 
INSERT INTO MAP_PROJECT_MANAGER VALUES (362, 1677);  --Trish Ryu > Trish Ryu
INSERT INTO MAP_PROJECT_MANAGER VALUES (123, 1678);  --Val Fabick > Val Fabick
INSERT INTO MAP_PROJECT_MANAGER VALUES (308, 1679);  --Val Hunsaker > Val Hunsaker
INSERT INTO MAP_PROJECT_MANAGER VALUES (208, 1680);  --Various  > Various 
INSERT INTO MAP_PROJECT_MANAGER VALUES (242, 1681);  --Victoria Godsaye-Simpson  > Victoria Godsaye-Simpson 
INSERT INTO MAP_PROJECT_MANAGER VALUES (277, 1682);  --Vince Trozzo > Vince Trozzo
INSERT INTO MAP_PROJECT_MANAGER VALUES (343, 1683);  --Vincent Ong > Vincent Ong
INSERT INTO MAP_PROJECT_MANAGER VALUES (131, 1684);  --Virginia Dragan > Virginia Dragan
INSERT INTO MAP_PROJECT_MANAGER VALUES (303, 1685);  --Wayne Byczek > Wayne Byczek
INSERT INTO MAP_PROJECT_MANAGER VALUES (73, 1686);  --Wes Wiebe > Wes Wiebe
INSERT INTO MAP_PROJECT_MANAGER VALUES (228, 1687);  --Will Zhang > Will Zhang
INSERT INTO MAP_PROJECT_MANAGER VALUES (241, 1688);  --Wim Jellema > Wim Jellema
INSERT INTO MAP_PROJECT_MANAGER VALUES (3, 1689);  --Wim Jellima > Wim Jellima
INSERT INTO MAP_PROJECT_MANAGER VALUES (398, 1690);  --Woongje Lee > Woongje Lee
INSERT INTO MAP_PROJECT_MANAGER VALUES (452, 1691);  --Zach Crippen > Zach Crippen
INSERT INTO MAP_PROJECT_MANAGER VALUES (274, 1692);  --Zach Staples > Zach Staples

COMMIT
GO


DECLARE @legacyCnt int, @crtCnt int, @mappedCnt int;

-- retrieve values from Legacy table
SELECT @legacyCnt = COUNT(*) 
FROM tblProjectManagers
WHERE Active = 1

--retrieve values from CRT Code Table
SELECT @crtCnt = COUNT(*) 
FROM CRT_CODE_LOOKUP
WHERE CODE_SET = 'PROJECT_MANAGER'
AND END_DATE IS NULL

SELECT @mappedCnt = COUNT(*) 
FROM MAP_PROJECT_MANAGER

PRINT CHAR(10) + 'Found ' + CONVERT(varchar, @legacyCnt) + ' Legacy Items and ' + CONVERT(varchar, @crtCnt) + ' CRT CodeLookup Items'
PRINT 'Mapped ' + CONVERT(varchar, @mappedCnt) + ' Total Items'

--SELECT * FROM MAP_PROJECT_MANAGER

BEGIN
	DECLARE @missing int;

	SELECT @missing = COUNT(*) 
	FROM tblProjects
	WHERE [Project Manager] IN (SELECT ID FROM 
		(SELECT * FROM MAP_PROJECT_MANAGER mpm
		RIGHT JOIN tblProjectManagers tpm
		ON tpm.ID = mpm.LEGACY_ID
		WHERE tpm.Active = 1) AS PM
		WHERE LEGACY_ID IS NULL)

	PRINT 'Found ' + CONVERT(varchar, @missing) + ' Projects linked to un-mapped Project Managers'
END

/*
-- Will find 93 projects linked to Project Manager ID 279 which is NULL, this is ok

SELECT [Project Manager], *
FROM tblProjects
WHERE [Project Manager] IN (SELECT ID FROM 
	(SELECT * FROM MAP_PROJECT_MANAGER mpm
	RIGHT JOIN tblProjectManagers tpm
	ON tpm.ID = mpm.LEGACY_ID
	WHERE tpm.Active = 1) AS PM
	WHERE LEGACY_ID IS NULL)

SELECT * FROM tblProjectManagers WHERE ID = 279
*/
