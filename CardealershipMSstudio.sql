create database CarDealership;
USE CARDEALERSHIP

CREATE TABLE Inventory (
	InventoryID int not null primary key,
    InventoryTotal int	
) 
GO

CREATE TABLE Car (
	CarID INT NOT NULL primary key,
	DriveTrain NCHAR(3) not null,
    Transmission NCHAR(9) not null,
    Price DECIMAL (8,2),
    TotalUnits INT not null,
    Status NCHAR (12)
) 
GO

CREATE TABLE Color (
	ColorID INT NOT NULL primary key ,
	carID INT NOT NULL,
	ColorName INT NULL ,
    CONSTRAINT FK_CarID FOREIGN KEY (CarID)  REFERENCES Car (CarID))
GO


CREATE TABLE CarModel (
	Model NVARCHAR(10) NOT NULL primary key ,
	carID INT NOT NULL,
	EngineSize NVARCHAR (10) NULL ,
    CONSTRAINT FK_Car FOREIGN KEY (CarID)  REFERENCES Car (CarID))
GO



CREATE TABLE Orders (
	OrderID INT NOT NULL primary key ,
	Item NVARCHAR(25) not NULL ,
	OrderDate DATE,
	ShippedDate DATE NULL ,
	DeliveryDate DATE,
	OrderTotal DECIMAL(10, 2)  NULL DEFAULT 0,
	PaymentMethod NCHAR(6) NULL
)
GO


CREATE TABLE Customers (
	CustomerID INT not NULL primary key,
	FirstName NVARCHAR (20),
	LastName NVARCHAR (20),
	HouseNumber NVARCHAR (20),
	Street NVARCHAR(40) not null ,
	PhoneNumber NVARCHAR (12) ,
	EmailAddress NVARCHAR(30),
	ZipCode NVARCHAR(10)	
	
) 
GO


CREATE TABLE ZipCode(
	ZipCode NVARCHAR (10) NOT NULL primary key,
	State NVARCHAR(2) ,
	City NVARCHAR(20) ,
	CustomerID int not NULL ,
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(customerID)
) 
GO


CREATE TABLE Employees (
	EmployeeID INT NOT NULL primary key ,
	FirstName NVARCHAR(20) ,
	LastName NVARCHAR(20) ,
	Employee_address NVARCHAR(60) ,
	Title NVARCHAR(20)
	
)
GO

CREATE TABLE EDriver(
	DEmployeID INT NOT NULL primary key,
	LicenseID INT,
	TruckNumber INT ,
	DeliveryNumber INT not NULL)
	GO
    

CREATE TABLE EISA(
	IEmployeeID INT NOT NULL primary key,
	SalesNumber INT,
	Commission DECIMAL (5,2))
GO
    

	