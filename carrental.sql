create database CarRentalManagementSystem;
Use CarRentalManagementSystem;
CREATE TABLE CAR
(
  License_plate CHAR(20) PRIMARY KEY,
  Status VARCHAR(15) NOT NULL,
  Seating_Capacity INT NOT NULL,
  Car_Type VARCHAR(15) NOT NULL, 
  Model VARCHAR(20),
  Brand Varchar (20),
  Color VARCHAR(10)       
);

CREATE TABLE OFFER_DETAILS
(
  Promo_Code VARCHAR(15) PRIMARY KEY,
  Description VARCHAR(50),
  Promo_Type VARCHAR(20) NOT NULL,
  Percentage INT,
  Discounted_Amount INT,
  Status VARCHAR(10) NOT NULL
);

CREATE TABLE RESERVATION (
       Reservation_ID INT PRIMARY KEY,
       Start_Date DATE NOT NULL,
       End_Date DATE NOT NULL,
       Meter_Start INT NOT NULL,
       Meter_End INT,
       Rent_Amount INT NOT NULL,
       Status VARCHAR(10) NOT NULL,
       License_No VARCHAR(15),
       License_plate CHAR(20) NOT NULL,
       Promo_Code VARCHAR(15),
       Payment_ID INT,
       USER_ID INT,
       CONSTRAINT License_plateRESERVATIONFK
         FOREIGN KEY (License_plate) REFERENCES CAR(License_plate)
         ON DELETE CASCADE,
       CONSTRAINT PromoCodeRESERVATIONFK
         FOREIGN KEY (Promo_Code) REFERENCES OFFER_DETAILS(Promo_Code)
         ON DELETE CASCADE,
       CONSTRAINT PaymentRESERVATIONFK
         FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
         ON DELETE CASCADE,
       CONSTRAINT UserRESERVATIONFK
         FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID)
         ON DELETE CASCADE
     );

CREATE TABLE PAYMENT
(
  Payment_ID INT PRIMARY KEY,
  Amount_Paid INT,
  Card_No CHAR(16),
  Name_On_Card VARCHAR(50),
  Paid_By_Cash boolean,
  Paid_By_Card boolean
);
Create Table User
(
	USER_ID INT Primary key,
    	Name varchar(40),
    	email varchar(40),
	Password varchar(255) NOT NULL,
    	date_of_birth date,
    	phone int,
    	address varchar(50),
    	License_No varchar(30)
);
Create Table Reference
(
	Referee_id int,
    Referer_id int,
    FOREIGN KEY (Referee_id) REFERENCES USER(USER_ID)
			  ON DELETE CASCADE,
    FOREIGN KEY (REferer_id) REFERENCES USER(USER_ID)
			  ON DELETE CASCADE
);
INSERT INTO CAR (License_plate, Status, Seating_Capacity, Car_Type, Model, Brand, Color) 
VALUES 
('AB1234CD', 'Available', 5, 'Sedan', 'Camry', 'Toyota', 'White'),
('EF5678GH', 'Not Available', 7, 'SUV', 'Palisade', 'Hyundai', 'Black'),
('IJ9012KL', 'Available', 4, 'Hatchback', 'Swift', 'Suzuki', 'Red'),
('MN3456OP', 'Not Available', 5, 'SUV', 'CR-V', 'Honda', 'Blue'),
('QR7890ST', 'Available', 2, 'Convertible', 'Mustang', 'Ford', 'Yellow');
INSERT INTO OFFER_DETAILS (Promo_Code, Description, Promo_Type, Percentage, Discounted_Amount, Status)
VALUES 
('SUV20', '20% off on SUVs', 'Percentage', 20, NULL, 'Active'),
('FLAT500', 'Flat 500 off on all cars', 'Flat Discount', NULL, 500, 'Active'),
('WINTER10', '10% off on cars', 'Percentage', 10, NULL, 'Expired'),
('NEWYEAR15', '15% off for New Year', 'Percentage', 15, NULL, 'Active'),
('SAVE300', 'Flat 300 off on all cars', 'Flat Discount', NULL, 300, 'Expired');
INSERT INTO PAYMENT (Payment_ID, Amount_Paid, Card_No, Name_On_Card, Paid_By_Cash, Paid_By_Card)
VALUES 
(1, 10500, '1234567812345678', 'Hermione Granger', FALSE, TRUE),
(2, 7000, NULL, NULL, TRUE, FALSE),
(3, 6300, '9876543298765432', 'Ron Weasley', FALSE, TRUE),
(4, 5000, NULL, NULL, TRUE, FALSE),
(5, 8200, '5555666677778888', 'Draco Malfoy', FALSE, TRUE);

INSERT INTO User (USER_ID, Name, email, date_of_birth, phone, address, License_No)
VALUES 
(1, 'Draco Malfoy', 'dracomalfoy@gmail.com', '1990-01-15', 123456789, '123 Main St, Springfield', 'D12345678'),
(2, 'Jane Smith', 'janesmith@gmail.com', '1985-07-20', 987654321, '456 Elm St, Riverside', 'S98765432'),
(3, 'Hermione Granger', 'hermionegranger@gmail.com', '1992-03-12', 122334455, '789 Pine St, Brookfield', 'A45678901'),
(4, 'Ron Weasley', 'ronweasley@gmail.com', '1988-10-30', 566778899, '321 Oak St, Hillview', 'J12398765'),
(5, 'Severus Snape', 'severussnape@gmail.com', '1995-05-25', 677889900, '654 Maple St, Sunnyvale', NULL);

INSERT INTO RESERVATION (Reservation_ID, Start_Date, End_Date, Meter_Start, Meter_End, Rent_Amount, Status, License_No, License_plate, Promo_Code, Payment_ID, USER_ID)
VALUES
(1, '2024-01-10', '2024-01-15', 10000, 10500, 500, 'Completed', 'D12345678', 'AB1234CD', 'SUV20', 1, 1),
(2, '2024-02-01', '2024-02-05', 20000, 20350, 350, 'Completed', 'S98765432', 'EF5678GH', 'FLAT500', 2, 2),
(3, '2024-03-15', '2024-03-20', 30000, NULL, 600, 'Active', 'A45678901', 'IJ9012KL', NULL, 3, 3),
(4, '2024-04-01', '2024-04-10', 15000, NULL, 900, 'Cancelled', 'J12398765', 'MN3456OP', 'WINTER10', 4, 4),
(5, '2024-05-05', '2024-05-15', 5000, 5200, 700, 'Completed', NULL, 'QR7890ST', 'NEWYEAR15', 5, 5);

INSERT INTO Reference (Referee_id, Referer_id)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);
