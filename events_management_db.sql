CREATE DATABASE EventManagementDB;

-- Create DB
CREATE DATABASE EventManagementDB;
USE EventManagementDB;

-- Create Customer table
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,
    Cust_Name VARCHAR(500),
    Cust_Number VARCHAR(40),
    Cust_Email VARCHAR(500),
    Cust_Type VARCHAR(100)
);

-- Create Venue table
CREATE TABLE Venue (
    Venue_ID INT PRIMARY KEY,
    Ven_Name VARCHAR(500),
    Ven_Location VARCHAR(500),
    Ven_Capacity INT
);

-- Create Catering table
CREATE TABLE Catering (
    CateringID INT PRIMARY KEY,
    Cat_MenuItems TEXT,
    EventType VARCHAR(100) 
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    Inv_Group VARCHAR(300),
    Item_Name VARCHAR(300),
    Item_Volume INT
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Emp_Name VARCHAR(500),
    Emp_Number VARCHAR(40),
    Emp_Email VARCHAR(500),
    Emp_Availability VARCHAR(500)
);

-- Create Events table
CREATE TABLE Events (
    Event_ID INT PRIMARY KEY,
    Event_Date DATE,
    Event_Type VARCHAR(150),
    Cust_ID INT,
    Venue_ID INT,
    CateringID INT,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE RESTRICT, 
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID) ON DELETE RESTRICT,  
    FOREIGN KEY (CateringID) REFERENCES Catering(CateringID) ON DELETE SET NULL  
);

-- Create Event_Inventory 
CREATE TABLE Event_Inventory (
    Event_ID INT,
    InventoryID INT,
    PRIMARY KEY (Event_ID, InventoryID),
    FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID) ON DELETE CASCADE,  
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID) ON DELETE CASCADE  
);


CREATE TABLE Event_Employee (
    Event_ID INT,
    EmployeeID INT,
    Role VARCHAR(500),
    PRIMARY KEY (Event_ID, EmployeeID),
    FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID) ON DELETE CASCADE,  
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE 
);

-- Add data into Customer table
INSERT INTO Customer (Cust_ID, Cust_Name, Cust_Number, Cust_Email, Cust_Type) VALUES
(1, 'John Doe', '1234567890', 'johndoe@email.com', 'Regular'),
(2, 'Jane Smith', '2345678901', 'janesmith@email.com', 'VIP'),
(3, 'Alice Brown', '3456789012', 'alicebrown@email.com', 'Regular'),
(4, 'Bob White', '4567890123', 'bobwhite@email.com', 'Corporate'),
(5, 'Charlie Green', '5678901234', 'charliegreen@email.com', 'VIP'),
(6, 'David Black', '6789012345', 'davidblack@email.com', 'Regular'),
(7, 'Eve Adams', '7890123456', 'eveadams@email.com', 'Corporate'),
(8, 'Frank Miller', '8901234567', 'frankmiller@email.com', 'Regular'),
(9, 'Grace Johnson', '9012345678', 'gracejohnson@email.com', 'Corporate'),
(10, 'Hannah Lee', '0123456789', 'hannahlee@email.com', 'VIP');

-- Add data into Venue table
INSERT INTO Venue (Venue_ID, Ven_Name, Ven_Location, Ven_Capacity) VALUES
(1, 'Grand Hall', 'New York', 500),
(2, 'Sunset Pavilion', 'Los Angeles', 300),
(3, 'Ocean View', 'Miami', 400),
(4, 'Skyline Rooftop', 'Chicago', 200),
(5, 'Regal Ballroom', 'Houston', 600),
(6, 'Mountain Lodge', 'Denver', 250),
(7, 'Royal Garden', 'Seattle', 350),
(8, 'Lakeside Venue', 'Orlando', 450),
(9, 'Metropolitan Center', 'San Francisco', 550),
(10, 'Heritage Hall', 'Boston', 700);

-- Add data into Catering table
INSERT INTO Catering (CateringID, Cat_MenuItems, EventType) VALUES
(1, 'Italian Cuisine', 'Wedding'),
(2, 'BBQ Feast', 'Corporate Event'),
(3, 'Vegetarian Delights', 'Birthday'),
(4, 'French Gourmet', 'Anniversary'),
(5, 'Indian Spices', 'Festival'),
(6, 'Mexican Fiesta', 'Graduation'),
(7, 'Chinese Banquet', 'Cultural Event'),
(8, 'Seafood Special', 'Private Party'),
(9, 'Steakhouse Menu', 'Formal Dinner'),
(10, 'Vegan Choices', 'Health Retreat');

-- Add data into Inventory table
INSERT INTO Inventory (InventoryID, Inv_Group, Item_Name, Item_Volume) VALUES
(1, 'Furniture', 'Tables', 50),
(2, 'Furniture', 'Chairs', 200),
(3, 'Decorations', 'Lighting', 30),
(4, 'Decorations', 'Flowers', 100),
(5, 'Audio', 'Speakers', 20),
(6, 'Audio', 'Microphones', 15),
(7, 'Catering', 'Plates', 500),
(8, 'Catering', 'Glasses', 300),
(9, 'Catering', 'Cutlery', 400),
(10, 'Miscellaneous', 'Napkins', 1000);

-- Add data into Employees table (Updated)
INSERT INTO Employees (EmployeeID, Emp_Name, Emp_Number, Emp_Email, Emp_Availability) VALUES
(1, 'Tim Jones', '9876543210', 'tjones@gmail.com', 'Full-Time'),
(2, 'Wade Wilson', '8765432109', 'wwilson@gmail.com', 'Part-Time'),
(3, 'Clint Barton', '7654321098', 'cbarton@gmail.com', 'Full-Time'),
(4, 'Yingping Lin', '6543210987', 'ylin@email.com', 'Full-Time'),
(5, 'Tony Stark', '5432109876', 'tstark@starkindustries.com', 'Full-Time'),
(6, 'Steve Rogers', '4321098765', 'srogers@avengers.com', 'Part-Time'),
(7, 'Natasha Romanoff', '3210987654', 'nromanoff@shield.com', 'Full-Time'),
(8, 'Peter Parker', '2109876543', 'pparker@dailybugle.com', 'Part-Time'),
(9, 'Thor Odinson', '1098765432', 'thor@asgard.com', 'Full-Time'),
(10, 'Bruce Banner', '0987654321', 'bbanner@avengers.com', 'Contract');

-- Add data into Events table
INSERT INTO Events (Event_ID, Event_Date, Event_Type, Cust_ID, Venue_ID, CateringID) VALUES
(1, '2025-04-10', 'Wedding', 1, 1, 1),
(2, '2025-05-15', 'Corporate Event', 2, 2, 2),
(3, '2025-06-20', 'Birthday', 3, 3, 3),
(4, '2025-07-25', 'Anniversary', 4, 4, 4),
(5, '2025-08-30', 'Festival', 5, 5, 5),
(6, '2025-09-05', 'Graduation', 6, 6, 6),
(7, '2025-10-12', 'Cultural Event', 7, 7, 7),
(8, '2025-11-18', 'Private Party', 8, 8, 8),
(9, '2025-12-22', 'Formal Dinner', 9, 9, 9),
(10, '2026-01-01', 'Health Retreat', 10, 10, 10);

-- Add data into Event_Inventory table
INSERT INTO Event_Inventory (Event_ID, InventoryID) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(4, 6), (5, 7), (6, 8), (7, 9), (8, 10);

-- Add data into Event_Employee table
INSERT INTO Event_Employee (Event_ID, EmployeeID, Role) VALUES
(1, 1, 'Event Coordinator'),
(2, 2, 'Catering Manager'),
(3, 3, 'Logistics Supervisor'),
(4, 4, 'Venue Manager'),
(5, 5, 'Technical Support'),
(6, 6, 'Decor Specialist'),
(7, 7, 'Security Head'),
(8, 8, 'Customer Service'),
(9, 9, 'Marketing Lead'),
(10, 10, 'Assistant Coordinator');

-- Add In New Fields: Modify Employees table to add rate field
ALTER TABLE Employees ADD Emp_Rate DECIMAL(10,2);

-- Update Employees table with rates
UPDATE Employees SET Emp_Rate = 60.00 WHERE EmployeeID = 1; -- Shaquille
UPDATE Employees SET Emp_Rate = 45.00 WHERE EmployeeID = 2; -- Souadou
UPDATE Employees SET Emp_Rate = 70.00 WHERE EmployeeID = 3; -- Jaime
UPDATE Employees SET Emp_Rate = 75.00 WHERE EmployeeID = 4; -- Yingping
UPDATE Employees SET Emp_Rate = 150.00 WHERE EmployeeID = 5; -- Tony Stark
UPDATE Employees SET Emp_Rate = 80.00 WHERE EmployeeID = 6; -- Steve Rogers
UPDATE Employees SET Emp_Rate = 85.00 WHERE EmployeeID = 7; -- Natasha Romanoff
UPDATE Employees SET Emp_Rate = 50.00 WHERE EmployeeID = 8; -- Peter Parker
UPDATE Employees SET Emp_Rate = 120.00 WHERE EmployeeID = 9; -- Thor Odinson
UPDATE Employees SET Emp_Rate = 100.00 WHERE EmployeeID = 10; -- Bruce Banner


-- Modify Events table to add Total_Price field
ALTER TABLE Events ADD Total_Price DECIMAL(10,2);

-- Update Events table with dummy total prices
UPDATE Events SET Total_Price = 5000.00 WHERE Event_ID = 1; 
UPDATE Events SET Total_Price = 3000.00 WHERE Event_ID = 2;
UPDATE Events SET Total_Price = 2500.00 WHERE Event_ID = 3; 
UPDATE Events SET Total_Price = 4000.00 WHERE Event_ID = 4;
UPDATE Events SET Total_Price = 7000.00 WHERE Event_ID = 5; 
UPDATE Events SET Total_Price = 3500.00 WHERE Event_ID = 6; 
UPDATE Events SET Total_Price = 4500.00 WHERE Event_ID = 7;
UPDATE Events SET Total_Price = 3800.00 WHERE Event_ID = 8;
UPDATE Events SET Total_Price = 6000.00 WHERE Event_ID = 9;
UPDATE Events SET Total_Price = 5500.00 WHERE Event_ID = 10;


-- Business Questions: 

-- Which Customer Spent the most? 
SELECT c.Cust_Name, SUM(e.Total_Price) AS Total_Spent
FROM Customer c
JOIN Events e ON c.Cust_ID = e.Cust_ID
GROUP BY c.Cust_Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- What is total employee costs per event?
SELECT ee.Event_ID, SUM(emp.Emp_Rate) AS Total_Employee_Cost
FROM Event_Employee ee
JOIN Employees emp ON ee.EmployeeID = emp.EmployeeID
GROUP BY ee.Event_ID ;

-- What is the profit for each event?
SELECT e.Event_ID, e.Event_Type, 
       e.Total_Price AS Revenue, 
       (e.Total_Price - (
           SELECT SUM(emp.Emp_Rate) 
           FROM Employees emp 
           JOIN Event_Employee ee ON emp.EmployeeID = ee.EmployeeID 
           WHERE ee.Event_ID = e.Event_ID
       )) AS Profit
FROM Events e;


-- What is the total cost of employees for all events?
SELECT SUM(Emp_Rate) AS Total_Employee_Cost 
FROM Employees e
JOIN Event_Employee ee ON e.EmployeeID = ee.EmployeeID;