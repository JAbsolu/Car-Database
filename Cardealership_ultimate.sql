drop database cardealership;

create database CarDealership;
use carDealership;
-- -------------------------------CREATING TABLES OF THE DATABASE
CREATE TABLE Inventory (
	InventoryID int not null primary key,
    InventoryTotal int	
)  ;

-- drop table color;
CREATE TABLE Color (
	ColorID INT NOT NULL primary key ,
	ColorName Varchar (10) NULL
    
)  ;

-- drop table carmodel;
CREATE TABLE CarModel (
	
	ModelID VARCHAR(10) primary key,
	ModelName varchar(15),
	EngineSize varchar (10) NULL
)  ;


-- drop table car;
CREATE TABLE Car (
	CarID INT NOT NULL primary key,
	DriveTrain char(3) not null,
    Transmission char(9) not null,
    Price Decimal (7,2),
    TotalUnits int not null,
    Status char (12),
    ColorID INT NOT NULL,
    ModelID VARCHAR(10),
    CONSTRAINT FOREIGN KEY (ColorID)  REFERENCES Color (ColorID) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (ModelID)  REFERENCES carModel (ModelID) ON DELETE CASCADE
)  ;



CREATE TABLE Orders (
	OrderID INT NOT NULL primary key ,
	Item VARCHAR(25) not NULL ,
	OrderDate date,
	ShippedDate DATE NULL ,
	DeliveryDate date,
	OrderTotal DECIMAL(10, 2)  NULL DEFAULT 0,
	PaymentMethod char(6) NULL
)  ;

-- drop table ZipCode;
CREATE TABLE ZipCode(
	ZipCode Varchar (10) NOT NULL primary key,
	State VARCHAR(2) ,
	City VARCHAR(20));
	
-- drop table Customers;
CREATE TABLE Customers (
	CustomerID int not NULL primary key,
	FirstName Varchar (20),
	LastName Varchar (20),
	Street VARCHAR(40) not null ,
	PhoneNumber varchar (12) ,
	EmailAddress VARCHAR(30),
	ZipCode VARCHAR(10),
    CONSTRAINT FOREIGN KEY (ZipCode)  REFERENCES ZipCode (ZipCode) ON DELETE CASCADE
)  ;


CREATE TABLE Employees (
	EmployeeID INT NOT NULL primary key ,
	FirstName VARCHAR(20) ,
	LastName VARCHAR(20) ,
	Employee_address VARCHAR(60) ,
	Title VARCHAR(20)
	
)  ;
 -- drop table Edriver
CREATE TABLE EDriver(
	DEmployeID INT NOT NULL primary key,
	LicenseID INT,
	TruckNumber INT);
    
-- drop table EISA
CREATE TABLE EISA(
	IEmployeeID INT NOT NULL primary key,
	Fullname varchar (35));
    
-- ------------------------------------- FILLING UP THE TABLES WITH SOME DATA

INSERT INTO Employees VALUES (01,'PENELOPE','GUINESS','704 Hauser St., New York, NY', 'Driver'),
(02,'NICK','WAHLBERG','Apartment 5A, 129 W. 81st St., New York, NY','ISA'),
(03,'EDDY','CHASER','322 Maple St., Mayberry, NC','ISA'),
(04,'JENNIFER','DAVIS','320 Fowler Street, Lynbrook, NY','Driver'),
(05,'JOHNNY','LOLLOBRIGIDA','1910 Ezekiel Drive, Seattle, WA','ISA'),
(06,'BETTE','NICHOLSON','3344 Oak Hills Drive, Fairfield, CT','ISA'),
(07,'GRACE','MOSTEL','1640 Riverside Drive, Hill Valley, CA','ISA'),
(08,'MATTHEW','JOHANSSON','164 North Dutton Street, Santa Monica, CA','Driver'),
(09,'JOE','SWANK','518 Crestview Drive, Beverly Hills, CA','Driver'),
(10,'CHRISTIAN','GABLE','173 Essex Drive, Denver, CO','ISA'),
(11,'ZERO','CAGE','321 North Gilbert, Chicago, IL','Driver'),
(12,'KARL','BERRY','98 Candlewood Lane, Cabot Cove, ME','Driver'),
(13,'UMA','WOOD','11435 18th Avenue, Oahu, HI','Driver'),
(14,'VIVIEN','BERGEN','1020 Palm Drive, Cocoa Beach, FL','ISA'),
(15,'CUBA','OLIVIER','698 Sycamore Road, San Pueblo, CA','Driver'),
(16,'FRED','COSTNER','200 Spring Valley Road, Beaver Falls, PA','Driver'),
(17,'HELEN','VOIGHT','31 Spooner Street, Quahog, RI','ISA'),
(18,'DAN','TORN','1 Old Decatur Road, Raytown, FL','ISA'),
(19,'BOB','FAWCETT','803 N. Dutton Drive, CA','Driver'),
(20,'LUCILLE','TRACY','328 1/2 Chauncey Street, Brooklyn, NY','Driver'),
(21,'KIRSTEN','PALTROW','11435 18th Avenue, Oahu, HI','Driver'),
(22,'ELVIS','MARX',' 169 Pane Street, Boulder, CL','ISA'),
(23,'SANDRA','KILMER','1111 Glen Oaks Lane, Lawndale, TX','ISA'),
(24,'CAMERON','STREEP','2630 Hegal Place, Apt. 42, Alexandria, VA','ISA'),
(25,'KEVIN','BLOOM',' 263 Pinehurst, Chicago, IL','Driver'),
(26,'RIP','CRAWFORD','454 West 35th Street, New York, NY','ISA'),
(27,'JULIA','MCQUEEN','122 Conch Street, Bikini Bottom, TX','ISA'),
(28,'WOODY','HOFFMAN','1521 Sycamore, Atlanta, GA','Driver'),
(29,'ALEC','DICKSON','1164 Morning Glory Circle, Westport, CT','Driver'),
(30,'SANDRA','PECK','1710 Bryn Mawr Avenue, Philadelphia, PA','ISA');


-- ------------------------ Color

INSERT INTO color VALUES (01,'Black'),
(02,'Red'),
(03,'Gray'),
(04,'White'),
(05,'Orange'),
(06,'Green'),
(07,'Purple'),
(08,'Blue'),
(09,'Brown'),
(10,'Turquoise');

INSERT INTO CarModel VALUES ('J01','Jetta S','1.5L'),
('J02','Jetta Sport','1.5L'),
('J03','Jetta SE','1.5L'),
('J04','Jetta SEL','1.5L'),

('P01','Passat S','1.5L'),
('P02','Passat SE','1.5L'),
('P03','Passat SEL','1.5L'),

('AT01','Arteon SE','2.0L'),
('AT02','Arteon SEL','2.0L'),

('TG01','Tiguan S','2.0L'),
('TG02','Tiguan SE','2.0L'),
('TG03','Tiguan SEL','2.0L'),

('A01','Atlas S','2.0L'),
('A02','Atlas SE','2.0L'),

('T01','Taos S','1.5L'),
('T02','Taos SE','1.5L'),
('T03','Taos SEL','1.5L'),

('ID01','Standard','Electric'),
('ID02','Pro','Electric'),

('GT01','GTI S','2.0L'),
('GT02','GTI SE','2.0L'),
('GT03','GTI Autobahn','2.0L'),

('GR01','R','2.0L');



-- ------------------------------------- INSERT INTO CAR TABLE
 
INSERT INTO Car VALUES 
(01,'FWD','Automatic','20650.00', '1', 'Available',1,'J01'),
(02,'FWD','Automatic','21665.00', '3', 'Pending',6,'J02'),
(03,'FWD','Automatic','24665.00', '3', 'Available',8,'J03'),
(04,'FWD','Automatic','28665.00', '3', 'Available',4,'J04'),
(05,'FWD','Automatic','21665.00', '3', 'Pending',3,'J02'),
(06,'FWD','Automatic','24665.00', '3', 'Available',5,'J03'),
(07,'FWD','Automatic','28665.00', '3', 'Pending',1,'J04'),
(08,'FWD','Automatic','21665.00', '3', 'Available',6,'J02'),
(09,'FWD','Automatic','24665.00', '3', 'Available',5,'J03'),
(10,'FWD','Automatic','28665.00', '3', 'Available',3,'J04'),
 
(11,'FWD','Automatic','23665.00', '4', 'Available',4,'P01'),
(12,'FWD','Automatic','26665.00', '3', 'Pending',8,'P02'),
(13,'FWD','Automatic','29665.00', '3', 'Available',2,'P03'),
(14,'FWD','Automatic','23665.00', '4', 'Pending',3,'P01'),
(15,'FWD','Automatic','26665.00', '3', 'Available',2,'P02'),
(16,'FWD','Automatic','29665.00', '3', 'Available',1,'P03'),
(17,'FWD','Automatic','23665.00', '4', 'Pending',3,'P01'),
(18,'FWD','Automatic','26665.00', '3', 'Available',8,'P02'),
(19,'FWD','Automatic','29665.00', '3', 'Available',9,'P03'),
(20,'FWD','Automatic','23665.00', '4', 'Pending',10,'P01'),



(21,'FWD','Automatic','37495.00', '5', 'Available',6,'AT01'),
(22,'FWD','Automatic','40495.00', '5', 'Available',10,'AT02'),
(23,'FWD','Automatic','37495.00', '5', 'Pending',2,'AT01'),
(24,'FWD','Automatic','40495.00', '5', 'Available',3,'AT02'),
(25,'FWD','Automatic','37495.00', '5', 'Pending',7,'AT01'),
(26,'FWD','Automatic','40495.00', '5', 'Available',1,'AT02'),
(27,'FWD','Automatic','37495.00', '5', 'Available',6,'AT01'),
(28,'FWD','Automatic','40495.00', '5', 'Pending',5,'AT02'),
(29,'FWD','Automatic','37495.00', '5', 'Available',1,'AT01'),
(30,'FWD','Automatic','40495.00', '5', 'Available',3,'AT02'),


(31,'FWD','Automatic','26950.00', '3', 'Available',4,'TG01'),
(32,'FWD','Automatic','29950.00', '3', 'Pending',7,'TG02'),
(33,'AWD','Automatic','32950.00', '3', 'Available',3,'TG03'),
(34,'FWD','Automatic','26950.00', '3', 'Available',1,'TG01'),
(35,'FWD','Automatic','29950.00', '3', 'Available',8,'TG02'),
(36,'AWD','Automatic','32950.00', '3', 'Pending',9,'TG03'),
(37,'FWD','Automatic','26950.00', '3', 'Available',10,'TG01'),
(38,'FWD','Automatic','29950.00', '3', 'Available',10,'TG02'),
(39,'AWD','Automatic','32950.00', '3', 'Pending',3,'TG03'),


(40,'FWD','Automatic','35150.00', '5', 'Available',7,'A01'),
(41,'AWD','Automatic','44940.00', '5', 'Pending',9,'A02'),
(42,'FWD','Automatic','35150.00', '5', 'Pending',6,'A01'),
(43,'AWD','Automatic','44940.00', '5', 'Available',1,'A02'),
(44,'FWD','Automatic','35150.00', '5', 'Pending',9,'A01'),
(45,'AWD','Automatic','44940.00', '5', 'Available',7,'A02'),
(46,'FWD','Automatic','35150.00', '5', 'Available',3,'A01'),
(47,'AWD','Automatic','44940.00', '5', 'Pending',5,'A02'),
(48,'FWD','Automatic','35150.00', '5', 'Available',9,'A01'),
(49,'AWD','Automatic','44940.00', '5', 'Available',2,'A02'),



(50,'FWD','Automatic','24155.00', '4', 'Available',10,'T01'),
(51,'FWD','Automatic','28925.00', '3', 'Pending',3,'T02'),
(52,'FWD','Automatic','28925.00', '3', 'Available',7,'T02'),
(53,'FWD','Automatic','28925.00', '3', 'Pending',1,'T02'),
(54,'FWD','Automatic','24155.00', '4', 'Available',9,'T01'),
(55,'FWD','Automatic','24155.00', '4', 'Pending',5,'T01'),
(56,'AWD','Automatic','34535.00', '3', 'Available',1,'T03'),
(57,'AWD','Automatic','34535.00', '3', 'Available',3,'T03'),
(58,'FWD','Automatic','24155.00', '4', 'Available',9,'T01'),
(59,'FWD','Automatic','34535.00', '3', 'Available',8,'T03'),


(60,'FWD','Automatic','46295.00', '5', 'Pending',4,'ID02'),
(61,'FWD','Automatic','37495.00', '6', 'Available',9,'ID01'),
(62,'FWD','Automatic','46295.00', '5', 'Available',10,'ID02'),
(63,'FWD','Automatic','37495.00', '6', 'Available',2,'ID01'),
(64,'FWD','Automatic','46295.00', '5', 'Pending',3,'ID02'),
(65,'FWD','Automatic','37495.00', '6', 'Pending',8,'ID01'),
(66,'FWD','Automatic','46295.00', '5', 'Available',5,'ID02'),
(67,'FWD','Automatic','37495.00', '6', 'Available',5,'ID01'),
(68,'FWD','Automatic','37495.00', '6', 'Pending',6,'ID01'),
(69,'FWD','Automatic','46295.00', '5', 'Available',7,'ID02'),
(70,'FWD','Automatic','37495.00', '6', 'Available',1,'ID01'),


(71,'FWD','Automatic','35530.00', '3', 'Available',4,'GT02'),
(72,'FWD','Automatic','39070.00','3', 'Available',3,'GT03'),
(73,'FWD','Automatic','39070.00', '3', 'Available',7,'GT03'),
(74,'FWD','Automatic','30530.00', '3', 'Pending',2,'GT01'),
(75,'FWD','Automatic','35530.00', '3', 'Available',8,'GT02'),
(76,'FWD','Automatic','30530.00', '3', 'Available',9,'GT01'),
(77,'FWD','Automatic','39070.00', '3', 'Pending',6,'GT03'),
(78,'FWD','Automatic','30530.00', '3', 'Pending',9,'GT01'),
(79,'FWD','Automatic','35530.00', '3', 'Available',10,'GT02'),


(80,'AWD','Automatic','45835.00', '11', 'Available',1,'GR01'),
(81,'AWD','Automatic','45835.00', '11', 'Available',6,'GR01'),
(82,'AWD','Automatic','45835.00', '11', 'Pending',5,'GR01'),
(83,'AWD','Automatic','45835.00', '11', 'Available',1,'GR01'),
(84,'AWD','Automatic','45835.00', '11', 'Pending',7,'GR01'),
(85,'AWD','Automatic','45835.00', '11', 'Available',8,'GR01'),
(86,'AWD','Automatic','45835.00', '11', 'Available',4,'GR01'),
(87,'AWD','Automatic','45835.00', '11', 'Pending',3,'GR01'),
(88,'AWD','Automatic','45835.00', '11', 'Available',6,'GR01'),
(89,'AWD','Automatic','45835.00', '11', 'Pending',2,'GR01'),
(90,'AWD','Automatic','45835.00', '11', 'Available',8,'GR01');


-- ------------------------zip code data 

INSERT INTO ZipCode
  VALUES 
('61341', 'CT', 'Fairfield' ),
('08102', 'AL', 'Montgomery' ),
('08901', 'AL', 'Birmingham' ),
('90017', 'CA', 'Los Angeles' ),
('38110', 'CO', 'Denver' ),
('33176', 'CO', 'Pueblo' ),
('46865', 'FL', 'Miami' ),
('60607', 'FL', 'Fort Myers' ),
('02132', 'IL', 'Springfield' ),
('43615', 'OH', 'Columbus' ),
('19970', 'VT', 'Bennington' ),
('48608', 'OH', 'Akron' ),
('16442', 'KS', 'Salt Lake City' ),
('70001', 'MA', 'Boston' ),
('44308', 'OH', 'Dayton' ),
('75062', 'SC', 'Columbia' ),
('60605', 'FL', 'Palm Beach' ),
('70114', 'MA', 'Springfield' ),
('35802', 'MS', 'Jackson' ),
('48607', 'OH', 'Cincinnati' ),
('23707', 'CT', 'Hartford' ),
('39211', 'MS', 'Biloxi' ),
('33178', 'MS', 'Greenville' ),
('53511', 'WA', 'Seattle' ),
('22202', 'TX', 'Austin' ),
('60406', 'FL', 'Tampa' ),
('21201', 'TX', 'Houston' ),
('80123', 'NJ', 'Newark' ),
('92654', 'NJ', 'New Brunswick' ),
('48023', 'OH', 'Dayton' ),
('76201', 'MA', 'Pittfield' ),
('46952', 'OH', 'Cleveland' ),
('54401', 'WA', 'Tacoma' ),
('292201', 'TX', 'Dallas' ),
('92614', 'NJ', 'Jersey City' );


-- -------------------------------------customers data

INSERT INTO Customers
  VALUES 
(1001, 'Suzanne', 'Viescas', '1060 Braxton Street',  '425-555-2686', 'sviescas@cdlrship.com', '61341'),
(1002, 'Daba', 'Puskas', '3215 Lincoln Street',  '928-223-9808', 'dpuskas@cdlrship.com','08102'),
(1003, 'Patty', "O'Furniture", '2904 Pennsylvania Avenue',  '798-355-2465', 'pofurniture@cdlrship.com', '08901'),
(1004, 'Ty', 'Ayelloribbin', '1896 Norman Street',  '791-555-4191', 'taye@cdlrship.com', '90017'),
(1005, 'Hugo', 'First','1307 Lightning Point Drive',  '425-555-7011', 'hfirst@cdlrship.com', '38110'),
(1006, 'Percy', 'Ver', '786 Foley Street',  '425-555-2686', 'pver@cdlrship.com', '33176'),
(1007, 'Jack', 'Aranda', '274 New Creek Road',  '425-555-2686','jaranda@cdlrship.com',  '46865'),
(1008, 'Olive', 'Tree', '3832 Braxton Street',  '425-555-2686','otree@cdlrship.com',  '60607'),
(1009, 'Fran G', 'Pan', '2614 Lyon Avenue',  '425-555-2686', 'fpan@cdlrship.com',  '02132'),
(1010, 'Olive', 'Yew','2267 Still Street',  '425-555-2686','oyew@cdlrship.com',  '43615');

INSERT INTO Customers
  VALUES 
(1011, 'Aida', 'Bugg','4899 Callison Lane',  '425-555-2686', 'abugg@cdlrship.com', '19970'),
(1012, 'Maureen', 'Biologist', '2094 Hart Ridge Road',  '425-555-2686', 'mbio@cdlrship.com', '48607'),
(1013, 'Teri', 'Dactyl', '405 Spadafore Drive',  '425-555-2686','tdactyl@cdlrship.com',  '16442'),
(1014, 'Ev R. ', ' Lasting','2057 Wood Street',  '425-555-2686', 'elasting@cdlrship.com', '70001'),
(1015, 'Anne', 'Thurium','219 Horner Street',  '425-555-2686', 'athurium@cdlrship.com', '44308'),
(1016, 'Cherry', 'Blossom', '3771 Worthington Drive',  '425-555-2686', 'cblossom@cdlrship.com', '75062'),
(1017, 'Ginger', 'Plant', '961 Fraggle Drive',  '425-555-2686','gplant@cdlrship.com', '60605'),
(1018, 'Minnie', 'Van Ryder', '2471 Rose Avenue',  '425-555-2686','mryder@cdlrship.com', '70114'),
(1019, 'Lynn', "O'Leeum", '4258 Marcus Street',  '425-555-2686','loleuum@cdlrship.com', '35802'),
(1020, 'P. Ann', "O'Recital", '2429 Wood Street, #383',  '425-555-2686','aorecital@cdlrship.com', '48607'),
(1021, 'Del', 'Phineum', '4754 Jefferson Street, #383',  '425-555-2686','dphineum@cdlrship.com', '23707');

INSERT INTO Customers
  VALUES 
(1022, 'Perry', 'Scope', '116 Tanglewood Road',  '425-555-2686','pscope@cdlrship.com', '39211');

INSERT INTO Customers
  VALUES 
(1023, 'Lee A. ', ' Sun', '2356 Poplar Lane',  '425-555-2686','lsun@cdlrship.com', '33178'),
(1024, 'Ray', 'Sin', '857 Lauren Drive',  '425-555-2686','rsin@cdlrship.com', '53511'),
(1025, 'Pat', 'Thettick', '1976 Daffodil Lane',  '425-555-2686','pthettick@cdlrship.com', '22202'),
(1026, 'Isabelle', 'Ringing', '1628 John Calvin Drive, #383',  '425-555-2686','iringing@cdlrship.com', '60406'),
(1027, 'Ringing', 'Kewshun', '3080 Five Points #383',  '525-575-2686','rkewshun@cdlrship.com', '21201'),
(1028, 'Eileen', 'Sideways', '4694 Tavern Place',  '125-555-2686','esideways@cdlrship.com', '80123'),
(1029, 'Rita', 'Book', '2941 Joy Lane',  '426-555-5874','rbook@cdlrship.com', '92614');

-- ------------------------------------------------------ E driver data

INSERT INTO Edriver
  VALUES 
('4', '346372270', 3),
('8', '276143076', 7),
('9', '735691923', '2'),
('11', '649355453', '5'),
('12', '627883598', 1),
('15', '982092923', 3),
('16', '856080809', '6'),
('20', '844907135', '4'),
('21', '352752482', '8'),
('25', '647417968', '2'),
('28', '924804456', '7'),
('29', '62209052', '1'),
('13', '104804456', '4'),
('19', '822804456', '9'),
('1', '729704456', '9');

-- -------------------------------------------------------------------- E driver data
insert into EISA
select Employeeid, concat (firstname, ' ', lastname ) as FullName
from employees
where title = 'isa';

-- ----------------------------------------------------------------------------------------
-- the number of each type of employees
select count(employeeid) as 'number of employees', title
from employees 
group by title;

-- displaying all the drivers from the employees table

select firstname, lastname, title
from employees
where title = 'driver'
order by lastname;

-- cars over $45,000 and their DriveTrain

select drivetrain, price from car
-- group by carid
having price >= 45000;

-- displaying states that starts with 'M'
select *
from Zipcode
where state like 'M%';

-- car models and their price (innerjoin)

select c1.modelname, c2.price
from carmodel c1 inner join car c2
on c1.modelid = c2.modelid
order by modelname desc;

-- displaying cars by color where the number is more than 7 (inner join)

select count(c2.carid) as NumberOfCars, colorname
from color c1 inner join car c2
on c1.colorid = c2.colorid
group by colorname
having count(c2.carid) > 7;

-- displaying customers and their state (inner join)

select c.firstname, c.lastname, state, city 
from customers c inner join zipcode z
on c.zipcode = z.zipcode
where city like 'S%';

-- find cars that have the same black color (inner join)

select carid, colorname, modelid 
from car inner join color
on car.colorid = color.colorid
where colorname = 'black' ;

-- find all car models that have the greater or equal than 37000 (inner join)

select *
from carmodel c1 inner join car c2
on c1.modelid = c2.modelid
where price >= 37000;

-- find all customers that lives in a state and a city

select c.zipcode, state, city, firstname, lastname
from zipcode z left outer join  customers c
on c.zipcode = z.zipcode
where firstname is not null
order by lastname asc;

-- find all cities and states  who dont have any customers
select state, city, firstname, lastname
from customers c right outer join zipcode z
on c.zipcode = z.zipcode
where firstname is null;

-- displaying all states with or without customer
select state, city, firstname, lastname
from zipcode z left outer join  customers c 
on c.zipcode = z.zipcode;

-- self join 

select distinct *
from car c1, car c2
where c1.carid = c2.carid  and c1.price = c2.price;

-- finding all the car model that are jetta
select *
from car 
where modelid in (
				select modelid
                from carmodel
                where modelname like 'jetta%');
                
CREATE INDEX idx_ModelName
ON carmodel (ModelName);

CREATE INDEX idx_Price
ON car (Price);

CREATE INDEX idx_Employee
ON employees (LastName, FirstName);

