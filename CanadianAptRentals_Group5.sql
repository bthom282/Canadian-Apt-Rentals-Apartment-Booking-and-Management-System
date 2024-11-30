DROP TABLE IF EXISTS Building;
CREATE TABLE Building(
	BuildingID				INT 	PRIMARY KEY,
	Name					VARCHAR(50),
	Address					VARCHAR(100),
	ManagerName				VARCHAR(50),
	ManagerContactInfo		CHAR(12)
	
);
INSERT INTO Building (BuildingID, Name, Address, ManagerName, ManagerContactInfo) 
VALUES	(1, 'Maple Heights',	'123 Maple St, Springfield', 	'Alice Johnson',	'555-123-4567'),
		(2, 'Oak Residences', 	'456 Oak St, Springfield', 		'Bob Smith', 		'555-234-5678'),
		(3, 'Pine Plaza', 		'789 Pine St, Springfield', 	'Carol Lee', 		'555-345-6789'),
		(4, 'Cedar Apartments', '101 Cedar St, Springfield', 	'Dave Brown', 		'555-456-7890'),
		(5, 'Elm Towers', 		'202 Elm St, Springfield', 		'Emma White', 		'555-567-8901');

DROP TABLE IF EXISTS Apartment;
CREATE TABLE Apartment(
	ApartmentID				INT		PRIMARY KEY,
	BuildingID				INT,
	ApartmentType			VARCHAR(100),
	Rent					INT,
	Availability			INT,
	
	CONSTRAINT BuildingID_FK FOREIGN KEY(BuildingID) REFERENCES Building(BuildingID)
);
INSERT INTO Apartment (ApartmentID, BuildingID, ApartmentType, Rent, Availability) 
VALUES 	(1,  1, 'Studio', 	800, 	9),
		(2,  1, '1BHK',  	1200, 	1),
		(3,  1, '2BHK', 	1600, 	7),
		(4,  2, 'Studio', 	750, 	3),
		(5,  2, '1BHK', 	1100, 	9),
		(6,  2, '2BHK', 	1500, 	9),
		(7,  3, 'Studio', 	700, 	6),
		(8,  3, '1BHK', 	1000,	7),
		(9,  3, '2BHK', 	1400, 	8),
		(10, 4, 'Studio', 	800, 	3),
		(11, 4, '1BHK', 	1150, 	2),
		(12, 4, '2BHK', 	1700, 	0),
		(13, 5, 'Studio', 	850, 	4),
		(14, 5, '1BHK', 	1250, 	5),
		(15, 5, '2BHK', 	1800, 	2);

DROP TABLE IF EXISTS Guest;
CREATE TABLE Guest(
	GuestID					INT		PRIMARY KEY,
	Name					VARCHAR(100),
	ContactInfo				CHAR(10)
);
INSERT INTO Guest (GuestID, Name, ContactInfo) 
VALUES	(1,  'John Doe', 		'555-1010'),
		(2,  'Jane Smith', 		'555-2020'),
		(3,  'Tom Brown', 		'555-3030'),
		(4,  'Emily Davis', 	'555-4040'),
		(5,  'Michael Johnson', '555-5050'),
		(6,  'Sarah Wilson', 	'555-6060'),
		(7,  'Chris Lee', 		'555-7070'),
		(8,  'Anna Martin', 	'555-8080'),
		(9,  'Peter Scott', 	'555-9090'),
		(10, 'Laura Clark', 	'555-1111');

DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking(
	BookingID				INT,
	GuestID					INT,
	ApartmentID				INT,
	StartTime				DATE,
	EndTime					DATE,
	Status					CHAR(10),
	Cost					INT,
	
	CONSTRAINT GuestID_FK FOREIGN KEY(GuestID) REFERENCES Guest(GuestID),
	CONSTRAINT ApartmentID_FK FOREIGN KEY(ApartmentID) REFERENCES Apartment(ApartmentID)
);
INSERT INTO Booking (BookingID, GuestID, ApartmentID, StartTime, EndTime, Status, Cost) 
VALUES	(1,  1,  2,  '2024-12-01', '2024-12-10', 'Confirmed', 1200),
		(2,  2,  3,  '2024-11-15', '2024-11-20', 'Completed', 800),
		(3,  3,  1,  '2024-12-01', '2024-12-07', 'Confirmed', 1100),
		(4,  4,  8,  '2024-12-05', '2024-12-12', 'Cancelled', 1000),
		(5,  5,  9,  '2024-11-20', '2024-11-30', 'Completed', 1400),
		(6,  6,  11, '2024-12-03', '2024-12-10', 'Confirmed', 1150),
		(7,  7,  7,  '2024-11-25', '2024-12-02', 'Completed', 700),
		(8,  8,  1,  '2024-12-01', '2024-12-08', 'Confirmed', 800),
		(9,  9,  14, '2024-12-10', '2024-12-15', 'Pending',   1250),
		(10, 10, 13, '2024-11-18', '2024-11-25', 'Completed', 850),
		(11, 1,  4,  '2024-12-15', '2024-12-20', 'Cancelled', 750),
		(12, 2,  6,  '2024-12-22', '2024-12-29', 'Pending',   1500),
		(13, 3,  12, '2024-11-05', '2024-11-12', 'Completed', 1700),
		(14, 4,  10, '2024-12-01', '2024-12-06', 'Pending',   800),
		(15, 5,  1, '2024-12-05', '2024-12-15', 'Confirmed', 1800),
		(16, 7,  2,  '2024-12-10', '2024-12-17', 'Pending',   1200),
		(17, 7,  5,  '2024-12-20', '2024-12-27', 'Cancelled', 1100),
		(18, 8,  9,  '2024-12-01', '2024-12-10', 'Confirmed', 1400),
		(19, 9,  14, '2024-11-10', '2024-11-20', 'Completed', 1250),
		(20, 10, 8,  '2024-11-01', '2024-11-10', 'Completed', 1000);
