DROP TABLE IF EXISTS Building;
CREATE TABLE Building(
	BuildingID				INT 	PRIMARY KEY,
	Name					VARCHAR(50),
	Address					VARCHAR(100),
	ManagerName				VARCHAR(50),
	ManagerContactInfo		CHAR(12)
	
);


DROP TABLE IF EXISTS Apartment;
CREATE TABLE Apartment(
	ApartmentID				INT		PRIMARY KEY,
	BuildingID				INT,
	ApartmentType			VARCHAR(100),
	Rent					INT,
	Availability			INT,
	
	CONSTRAINT BuildingID_FK FOREIGN KEY(BuildingID) REFERENCES Building(BuildingID)
);


DROP TABLE IF EXISTS Guest;
CREATE TABLE Guest(
	GuestID					INT		PRIMARY KEY,
	Name					VARCHAR(100),
	ContactInfo				CHAR(10)
);


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
