
-- Inventory Tracking System Schemas
-- Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Inserting Categories
INSERT INTO Category (CategoryName) VALUES 
('Electronics'),
('Furniture'),
('Stationery');

-- Supplier Table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) UNIQUE
);

-- Inserting Suppliers
INSERT INTO Supplier (SupplierName, ContactEmail) VALUES 
('TechCorp', 'contact@techcorp.com'),
('FurniWorld', 'sales@furniworld.com'),
('PaperPlus', 'info@paperplus.com');


-- Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Inserting Products
INSERT INTO Product (ProductName, CategoryID, Price) VALUES 
('Laptop', 1, 1200.00),
('Office Chair', 2, 150.00),
('Notebook', 3, 3.50);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT NOT NULL UNIQUE,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    LastUpdated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Inserting Inventory
INSERT INTO Inventory (ProductID, Quantity) VALUES 
(1, 10),
(2, 25),
(3, 200);

-- ProductSupplier Table
CREATE TABLE ProductSupplier (
    ProductID INT NOT NULL,
    SupplierID INT NOT NULL,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Inserting ProductSupplier relations
INSERT INTO ProductSupplier (ProductID, SupplierID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(1, 3); -- Multiple suppliers for a product


