
CREATE DATABASE Sahasra_ABC_CARS_DB;
-- Car entity
CREATE TABLE Car (
    CarID CHAR (50)PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    YearMade INT,
    Color VARCHAR(20),
    LicensePlate VARCHAR(15),
    ClassID CHAR(20),  -- Foreign Key to Car Class
    OdometerReading INT
);

INSERT INTO Car VALUES
('C000001', 'Bens', '260R', 2008, 'Black', 'BW-2020', '001', 260),
('C000002', 'BMW', '320X', 2009, 'White', 'ACC-6578', '002', 230),
('C000003', 'Nissan', '455', 2000, 'Blue', 'FV-0998', '003', 240),
('C000004', 'Toyota', '7666', 2002, 'Brown', 'MN-1818', '004', 250),
('C000005', 'Mazda', '22', 2001, 'Ash', 'KL-1111', '005', 210),
('C000006', 'GTR', '9980', 2005, 'Black', 'PL-2222', '006', 280);

DROP TABLE Car;
SELECT * FROM Car;

-- Rental entity
CREATE TABLE Rental (
    RentalID CHAR(20) PRIMARY KEY,
    CarID CHAR(20),  -- Foreign Key to Car
    CustomerID CHAR(20),  -- Foreign Key to Customer
    RentDate DATE,
    ReturnDate DATE,
    RentDurationDays INT,
    AdditionalDistanceKM DECIMAL(10, 2)
);

INSERT INTO Rental VALUES
('REN-000000001', 'C000001', 'CUS-00000001', '2023-10-20', '2023-10-23', 3, 10.25),
('REN-000000002', 'C000002', 'CUS-00000002', '2023-10-20', '2023-10-27', 7, 15.71),
('REN-000000003', 'C000003', 'CUS-00000003', '2023-10-20', '2023-10-22', 2, 14.33),
('REN-000000004', 'C000004', 'CUS-00000004', '2023-10-21', '2023-10-25', 4, 12.71),
('REN-000000005', 'C000005', 'CUS-00000005', '2023-10-22', '2023-10-25', 3, 16.47),
('REN-000000006', 'C000006', 'CUS-00000006', '2023-10-23', '2023-10-28', 5, 9.02);

DROP TABLE Rental;
SELECT * FROM Rental;

-- Customer entity
CREATE TABLE Customer (
    CustomerID CHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    DriversLicenseNumber VARCHAR(20)
);

INSERT INTO Customer VALUES
('CUS-00000001', 'Sahasra Kesara Cooray', 'Lakshapathiya, Moratuwa', 0770568688, 'A354890236'),
('CUS-00000002', 'Nadeera Deshan Peiris', 'Katubedda, Moratuwa', 0786392107, 'S333890236'),
('CUS-00000003', 'Viruna Chamathvin Fernando', 'Willorawatte, Moratuwa', 0760556788, 'K354890234'),
('CUS-00000004', 'Uthpala Pahalavithana', 'Maliban Junction, rathmalane', 0710222688, 'Q354890980'),
('CUS-00000005', 'Thilina Uvindairi', 'Manelwatta, Kelaniya', 0727778688, 'U354999236'),
('CUS-00000006', 'Savindu Yasasvin Mallawathanthie', 'Bokundara, Piliyandala', 0777778688, 'M354658236');

DROP TABLE Customer;

SELECT * FROM Customer;

-- Car Class entity
CREATE TABLE CarClass (
    ClassID CHAR(20) PRIMARY KEY,
    ClassName VARCHAR(50),
    Pricing DECIMAL(10, 2),
    FixedDepositAmount DECIMAL(10, 2),
    FreeKilometersPerDay INT,
    AdditionalKilometerCharge DECIMAL(10, 2)
);

INSERT INTO CarClass VALUES
('001', 'Ford', 30000.00, 5000.00, 10, 1000),
('002', 'Corvette', 32500.00, 5000.00, 10, 700),
('003', 'Corolla', 25750.00, 5000.00, 10, 650),
('004', 'Dodge', 36000.00, 5000.00, 10, 650),
('005', 'Tata', 38500.00, 5000.00, 10, 500),
('006', 'Pinto', 20000.00, 5000.00, 10, 350);

DROP TABLE CarClass;
SELECT * FROM CarClass;




-- Customer Rentals entity
CREATE TABLE CustomerRentals (
	CustomerID CHAR(20) PRIMARY KEY,
	RentalID CHAR(20),
	ReturnDate DATE,
	FixedDipositAmount DECIMAL(10, 2) 
);

INSERT INTO CustomerRentals VALUES
('CUS-00000001', 'REN-000000001', '2023-10-23', 5000.00),
('CUS-00000002', 'REN-000000002', '2023-10-27', 5000.00),
('CUS-00000003', 'REN-000000003', '2023-10-22', 5000.00),
('CUS-00000004', 'REN-000000004', '2023-10-25', 5000.00),
('CUS-00000005', 'REN-000000005', '2023-10-25', 5000.00),
('CUS-00000006', 'REN-000000006', '2023-10-28', 5000.00);

DROP TABLE CustomerRentals;
SELECT * FROM CustomerRentals;

-- Billings entity
CREATE TABLE Billings (
	InvoiceNumber VARCHAR(50) PRIMARY KEY,
	CarID CHAR(20),
	CustomerID CHAR(20),
	RentalID CHAR(20),
	FixDipositAmount DECIMAL(10, 2),
	Pricing DECIMAL(10, 2),
	OdometerReading DECIMAL(10, 2),
	FullAmount DECIMAL(10, 2)
);

INSERT INTO Billings VALUES
('INV-00000001', 'C000001', 'CUS-00000001', '000000001', 5000.00, 30000.00, 260, 35000.00),
('INV-00000002', 'C000002', 'CUS-00000002', '000000002', 5000.00, 32500.00, 230, 37500.00),
('INV-00000003', 'C000003', 'CUS-00000003', '000000003', 5000.00, 25750.00, 240, 30750.00),
('INV-00000004', 'C000004', 'CUS-00000004', '000000004', 5000.00, 36000.00, 250, 41000.00),
('INV-00000005', 'C000005', 'CUS-00000005', '000000005', 5000.00, 38500.00, 210, 43500.00),
('INV-00000006', 'C000006', 'CUS-00000006', '000000006', 5000.00, 20000.00, 280, 25000.00);

DROP TABLE Billings;
SELECT * FROM Billings;




-- Define Foreign Key constraints

ALTER TABLE Car
ADD FOREIGN KEY (ClassID) REFERENCES CarClass(ClassID);

ALTER TABLE Rental
ADD FOREIGN KEY (CarID) REFERENCES Car(CarID);

ALTER TABLE Rental
ADD FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

--List of Borrowers of a Particular Car Type
SELECT C.Name AS CustomerName, R.RentalID, R.RentDate, R.ReturnDate
FROM Car AS Ca
JOIN Rental AS R ON Ca.CarID = R.CarID
JOIN Customer AS C ON R.CustomerID = C.CustomerID
WHERE Ca.ClassID = '001';


--Sum of Payments Received Within a Given Duration
SELECT SUM(B.FullAmount) AS TotalPayments
FROM Billings AS B
JOIN Rental AS R ON B.RentalID = R.RentalID
WHERE R.RentDate >= '2023-10-20' AND R.ReturnDate <= '2023-10-28';

--List of Car Details in the Fleet
SELECT CarID, Make, Model, YearMade, Color, LicensePlate, ClassID, OdometerReading
FROM Car;

--Update the Make of a specific car
UPDATE Car
SET Make = 'Honda'
WHERE CarID = 'C000001';

SELECT * FROM Car;


--Update the RentDurationDays of a rental record
UPDATE Rental
SET RentDurationDays = 4
WHERE RentalID = 'REN-000000002';

SELECT * FROM Rental;


--Update the phone number of a customer
UPDATE Customer
SET PhoneNumber = '0771234567'
WHERE CustomerID = 'CUS-00000001';

SELECT * FROM Customer;


--Update the Pricing of a car class
UPDATE CarClass
SET Pricing = 31000.00
WHERE ClassID = '001';

SELECT * FROM CarClass;


--Update the FixedDepositAmount for a customer rental
UPDATE CustomerRentals
SET FixedDipositAmount = 6000.00
WHERE CustomerID = 'CUS-00000002';

SELECT * FROM CustomerRentals;


--Update the FullAmount in Billings for a specific invoice
UPDATE Billings
SET FullAmount = 40000.00
WHERE InvoiceNumber = 'INV-00000003';

SELECT * FROM Billings;