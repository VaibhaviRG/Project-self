/*IN THE INVENTORY STRUCTURE DISPLAY  (Mini Project):
--1. PID, PDESC, CATEGORY, SNAME, SCITY
--2. DISPLAY OID , ODATE , CNAME, CADDRESS, CPHONE, PDESC, PRICE,OQTY, AMT
*/
--1.
/*ROL:REORDER LEVEL:The reorder level serves as a benchmark, representing the minimum threshold that 
triggers a procurement request for the respective product.
For ex: Inventory of 100 keyboards depletes daily due to sales. Reorder level set at 10; 
upon reaching or falling below, new keyboards are procured from the supplier. 
MOQ:MINIMUM ORDER QUANTITY:The minimum order quantity (MOQ) refers to the lowest quantity of a product that a supplier 
is willing to sell or that a buyer is required to purchase in a single order transaction.
For ex: Assuming we have 50 keyboards per container, our minimum order quantity would be one container, 
ensuring at least 50 keyboards are ordered at a time.*/
--IT,HOME APPLIANCES,HEALTH CARE
---CREATING THE DATABASE
CREATE DATABASE Inventory_Structure; 
USE Inventory_Structure;

--- CREATING TABLES
CREATE TABLE SUPPLIER(SID CHAR(5),SNAME VARCHAR(20),SADD VARCHAR(20),SCITY VARCHAR(20),SPHONE VARCHAR(15),EMAIL VARCHAR(50));
CREATE TABLE PRODUCT(PID CHAR(5),PDESC VARCHAR(50),PRICE INT,CATEGORY VARCHAR(5),SID CHAR(5));
CREATE TABLE STOCK(PID CHAR(5),SQTY INT,ROL INT,MOQ INT);
CREATE TABLE CUST(CID CHAR(5),CNAME VARCHAR(20),ADDRESS VARCHAR(20),CITY VARCHAR(20),PHONE VARCHAR(15),EMAIL VARCHAR(20),DOB DATE);
CREATE TABLE ORDERS(OID CHAR(5),ODATE DATE,PID CHAR(5),CID CHAR(5),OQTY INT);

--- ADDING CONSTRAINTS 
-- ON TABLE SUPPLIER
ALTER TABLE SUPPLIER
ALTER COLUMN SID CHAR(5) NOT NULL;
ALTER TABLE SUPPLIER
ADD CONSTRAINT Pk_Sp PRIMARY KEY (SID);

ALTER TABLE SUPPLIER
ALTER COLUMN SNAME VARCHAR(50) NOT NULL;

ALTER TABLE SUPPLIER
ALTER COLUMN SADD VARCHAR(50) NOT NULL;

ALTER TABLE SUPPLIER
ADD CONSTRAINT Defcty 
DEFAULT 'DELHI' FOR SCITY;

ALTER TABLE SUPPLIER
ADD CONSTRAINT Unqphno UNIQUE (SPHONE);

-- ON TABLE PRODUCT
ALTER TABLE PRODUCT
ALTER COLUMN PID CHAR(5) NOT NULL;
ALTER TABLE PRODUCT
ADD CONSTRAINT Pk_P PRIMARY KEY (PID);

ALTER TABLE PRODUCT
ALTER COLUMN PDESC VARCHAR(50) NOT NULL;

ALTER TABLE PRODUCT
ADD CONSTRAINT Ck_P CHECK (PRICE>0 AND CATEGORY IN ('IT','HA','HC'));

ALTER TABLE PRODUCT
ADD CONSTRAINT Fk_P FOREIGN KEY (SID) REFERENCES SUPPLIER(SID);

-- ON TABLE STOCK
ALTER TABLE STOCK
ADD CONSTRAINT Fk_St FOREIGN KEY (PID) REFERENCES PRODUCT(PID);

ALTER TABLE STOCK
ADD CONSTRAINT Ck_St CHECK (SQTY>=0 AND ROL>=0 AND MOQ>=5);

-- ON TABLE CUST
ALTER TABLE CUST
ALTER COLUMN CID CHAR(5) NOT NULL;
ALTER TABLE CUST
ADD CONSTRAINT Pk_C PRIMARY KEY (CID);

ALTER TABLE CUST
ALTER COLUMN CNAME VARCHAR(20) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN ADDRESS VARCHAR(20) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN CITY VARCHAR(20) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN PHONE VARCHAR(15) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN EMAIL VARCHAR(20) NOT NULL;

ALTER TABLE CUST
ADD CONSTRAINT Ck_C CHECK (DOB < '2000-01-01');

-- ON TABLE ORDERS
--OID CHAR(5),ODATE DATE,PID CHAR(5),CID CHAR(5),OQTY INT);
ALTER TABLE ORDERS
ALTER COLUMN OID CHAR(5) NOT NULL;
ALTER TABLE ORDERS
ADD CONSTRAINT Pk_O PRIMARY KEY (OID);

ALTER TABLE ORDERS
ADD CONSTRAINT Fk_O1 FOREIGN KEY (PID) REFERENCES PRODUCT(PID);

ALTER TABLE ORDERS
ADD CONSTRAINT Fk_O2 FOREIGN KEY (CID) REFERENCES CUST(CID);

ALTER TABLE ORDERS
ADD CONSTRAINT Ck_O CHECK(OQTY>=1);

--INSERTING RECORDS INTO TABLES
INSERT INTO SUPPLIER (SID, SNAME, SADD, SCITY, SPHONE, EMAIL)
VALUES 
('S0001', 'Walmart Inc', '123 Supplier Street', 'Mumbai', '9234567890', 'walmart@gmail.com'),
('S0002', 'XYZ Distributors', '456 Distributor Road', 'Delhi', '7345678901', 'xyz@yahoo.com'),
('S0003', 'PQR Wholesalers', '789 Wholesale Avenue', 'Bangalore', '8456789012', 'pqr@gmail.com'),
('S0004', 'LMN Traders', '321 Trader Lane', 'Kolkata', '9567890123', 'lmn@outlook.com'),
('S0005', 'EFG Exporters', '654 Exporter Boulevard', 'Chennai', '9678901234', 'efg@gmail.com'),
('S0006', 'LMN Electronics', '987 Electronics Avenue', 'Pune', '6789012345', 'lmn_electronics@example.com'),
('S0007', 'RST Appliances', '456 Appliance Street', 'Hyderabad', '7890123456', 'rst_appliances@example.com'),
('S0008', 'GHI Industries', '123 Industry Road', 'Jaipur', '8901234567', 'ghi_industries@example.com'),
('S0009', 'JKL Imports', '789 Importer Lane', 'Ahmedabad', '9012345678', 'jkl_imports@example.com'),
('S0010', 'MNO Exporters', '321 Exporter Road', 'Lucknow', '9123456789', 'mno_exporters@example.com');

INSERT INTO PRODUCT (PID, PDESC, PRICE, CATEGORY, SID)
VALUES 
('P0001', 'Laptop', 50000, 'IT', 'S0001'),
('P0002', 'Mobile Phone', 20000, 'IT', 'S0001'),
('P0003', 'Television', 40000, 'HA', 'S0002'),
('P0004', 'Refrigerator', 30000, 'HA', 'S0002'),
('P0005', 'Microwave Oven', 10000, 'HA', 'S0002'),
('P0006', 'T-shirt', 1000, 'HC', 'S0003'),
('P0007', 'Jeans', 2000, 'HC', 'S0003'),
('P0008', 'Shoes', 3000, 'HC', 'S0003'),
('P0009', 'Tablet', 15000, 'IT', 'S0001'),
('P0010', 'Camera', 25000, 'IT', 'S0001'),
('P0011', 'Washing Machine', 35000, 'HA', 'S0002'),
('P0012', 'Air Conditioner', 40000, 'HA', 'S0002'),
('P0013', 'Printer', 8000, 'IT', 'S0001'),
('P0014', 'Headphones', 3000, 'IT', 'S0001'),
('P0015', 'Speaker System', 8000, 'IT', 'S0003'),
('P0016', 'Smart Watch', 10000, 'IT', 'S0003'),
('P0017', 'Bluetooth Headset', 2000, 'IT', 'S0003'),
('P0018', 'Wireless Mouse', 1500, 'IT', 'S0003');

INSERT INTO STOCK (PID, SQTY, ROL, MOQ)
VALUES 
('P0001', 20, 5, 10),
('P0002', 30, 5, 15),
('P0003', 15, 5, 8),
('P0004', 25, 5, 12),
('P0005', 20, 5, 10),
('P0006', 50, 10, 20),
('P0007', 40, 8, 15),
('P0008', 30, 8, 12),
('P0009', 25, 7, 10),
('P0010', 20, 7, 12),
('P0011', 15, 5, 8),
('P0012', 10, 5, 5),
('P0013', 20, 5, 10),
('P0014', 30, 5, 15),
('P0015', 15, 5, 8);

INSERT INTO CUST (CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB)
VALUES 
('C0001', 'RAMESH GUPTA', 'PALAM', 'Mumbai', '9876543210', 'RK@YAHOO.CO.IN', '1990-05-15'),
('C0002', 'Sandeep Sharma', 'VASANT VIHAR', 'Delhi', '8765432109', 'SAM1@YAHOO.COM', '1985-08-20'),
('C0003', 'KONIKA KAPOOR', 'DLF PHASE 2', 'Bangalore', '7654321098', 'KS@OUTLOOK.com', '1982-03-10'),
('C0004', 'NIDHI KHURANA', 'Vatika Tower', 'Kolkata', '6543210987', 'NIDHIK@GMAIL.COM', '1995-12-25'),
('C0005', 'ABHISHEK RANA', 'SUPERTECH', 'Chennai', '5432109876', 'ARANA@GMAIL.COM', '1988-10-05'),
('C0006', 'SARAH PATEL', 'VASANT VIHAR', 'Pune', '4321098765', 'sarah@example.com', '1992-07-18'),
('C0007', 'ROHAN MALHOTRA', 'ARYA NAGAR', 'Hyderabad', '3210987654', 'RM34@GMAIL.COM', '1987-04-30'),
('C0008', 'AMIT SOOD', 'YAMUNA VIHAR', 'Jaipur', '2109876543', 'ASOOD@GMAIL.COM', '1994-09-12'),
('C0009', 'NAVAL KISHOR', 'ARYA NAGAR', 'Ahmedabad', '1098765432', 'NK33@YAHOO.COM', '1980-11-23'),
('C0010', 'AKETA GUPTA', 'PHASE 2', 'Lucknow', '0987654321', 'AKETAG30@GMAIL.COM', '1998-02-14'),
('C0011', 'AMIT AGARWAL', 'RAJENDER NAGAR', 'Mumbai', '8765432109', 'AMIT@GMAIL.COM', '1983-06-28'),
('C0012', 'NEHA RAWAT', '123 Cedar Avenue', 'Delhi', '7654321098', 'NEHA@GMAIL.COM', '1991-03-05'),
('C0013', 'JITENDRA KUMAR', 'Vidyaranpura', 'Bangalore', '9543210987', 'JK21@GMAIL.COM', '1986-08-17'),
('C0014', 'GAURAV SHARMA', 'MAHAGUN APARTMENTS', 'Kolkata', '9432109876', 'GSHARMA02@GMAIL.COM', '1993-10-09'),
('C0015', 'DAINEL BOSE', 'PALAM COLONY', 'Chennai', '9321098765', 'DB26@OUTLOOK.COM', '1989-12-31');

INSERT INTO ORDERS (OID, ODATE, PID, CID, OQTY)
VALUES 
('O0001', '2024-03-22', 'P0001', 'C0001', 2),
('O0002', '2024-03-22', 'P0002', 'C0002', 3),
('O0003', '2024-03-22', 'P0003', 'C0003', 1),
('O0004', '2024-03-22', 'P0004', 'C0004', 2),
('O0005', '2024-03-22', 'P0005', 'C0005', 1);

SELECT * FROM SUPPLIER;
SELECT * FROM PRODUCT;
SELECT * FROM STOCK;
SELECT * FROM CUST;
SELECT * FROM ORDERS;

/* IN THE INVENTORY STRUCTURE GENERATE A VIEW BILL. IT SHOULD DISPLAY
OID,ODATE,CNAME,ADDRESS,PHONE,PDESC, PRICE, OQTY, AMOUNT */

CREATE VIEW BILL
AS 
SELECT OID,ODATE,CNAME,ADDRESS,PHONE,PDESC,PRICE,OQTY,PRICE*OQTY AS 'AMOUNT' FROM ORDERS
LEFT JOIN CUST
ON ORDERS.CID = CUST.CID
LEFT JOIN PRODUCT
ON ORDERS.PID = PRODUCT.PID;

SELECT * FROM BILL;


/* 
CREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED :

1)ADDSUPPLIER � SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE  DETAILS OF THE NEW SUPPLIER ADDED.

2)ADDPRO � SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE  DETAILS OF THE NEW PRODUCT ADDED.

3)ADDCUST � SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE  DETAILS OF THE NEW CUSTOMER ADDED.

4)ADDORDER � SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS  OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME  AUTOMATICALLY.
*/
---1)
USE Inventory_Structure;
SELECT * FROM SUPPLIER;
CREATE PROCEDURE ADDSUPPLIER @SID AS CHAR(5), @SNAME AS VARCHAR(50), @SADD AS VARCHAR(50), @SCITY AS VARCHAR(20), @SPHONE AS VARCHAR(15), @EMAIL AS VARCHAR(50)
AS
BEGIN
	INSERT INTO SUPPLIER
	VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

	SELECT * FROM SUPPLIER WHERE SID = @SID;
END;

EXEC ADDSUPPLIER 'S0011', 'Healthy lifestyle', '13th Street', 'Bangalore', '9876522343','healtlife@outlook.com'

---2)
SELECT * FROM PRODUCT;
CREATE PROCEDURE ADDPRO @PID AS CHAR(5), @PDESC AS VARCHAR(50), @PRICE AS INT, @CATEGORY AS VARCHAR(5), @SID AS CHAR(15)
AS
BEGIN
	INSERT INTO PRODUCT
	VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);

	SELECT * FROM PRODUCT WHERE PID = @PID;
END;

EXEC ADDPRO 'P0019', 'Juice', '1300', 'HC', 'S0011'

---3)
SELECT * FROM CUST;
CREATE PROCEDURE ADDCUST @CID AS CHAR(5), @CNAME AS VARCHAR(20), @ADDRESS VARCHAR(20), @CITY AS VARCHAR(20), @PHONE AS VARCHAR(15),@EMAIL AS VARCHAR(20), @DOB AS DATE
AS
BEGIN
	INSERT INTO CUST
	VALUES (@CID, @CNAME, @ADDRESS, @CITY, @PHONE, @EMAIL, @DOB);

	SELECT * FROM CUST WHERE CID = @CID;
END;

ADDCUST 'C0016', 'Pavan Kohli', '2nd street Jayanagar', 'Hyderabad', '7844566001','pavan45@yahoo.com','1992-09-23'

---4)
SELECT * FROM ORDERS;
CREATE PROCEDURE ADDORDER @OID AS CHAR(5), @PID CHAR(5), @CID CHAR(5), @OQTY AS INT
AS
BEGIN
	INSERT INTO ORDERS
	VALUES (@OID,(SELECT CONVERT(VARCHAR(10), GETDATE(),20)),@PID, @CID, @OQTY);

	SELECT * FROM ORDERS WHERE OID = @OID;
END;


ADDORDER 'O0006','P0006','C0006',3


/* 
1)CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT SHOULD ACCEPT 2 PARAMETERS 
A CHARACTER AND THE NUMBER AND RETURN THE ID BY CONCANTENATING THE CHARACTER , REQUIRED ZEROS AND THE SPECIFIED NUMBER.

RECREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED 
(ALL THE IDs SHOULD BE  AUTOMATICALLY GENERATED USING ABOVE CREATED FUNCTION AND SEQUENCES) :

2)ADDSUPPLIER � SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OF THE  NEW SUPPLIER ADDED.

3)ADDPRO � SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE
NEW PRODUCT ADDED.

4)ADDCUST � SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF  THE NEW CUSTOMER ADDED.

5)ADDORDER � SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE
ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.*/

---1)
DROP FUNCTION GENID;

CREATE FUNCTION GENID(@C AS CHAR(1), @I AS INT)
RETURNS CHAR(5)
AS
BEGIN
	DECLARE @ID AS CHAR(5);
	
	SELECT @ID = CASE
						WHEN @I<10 THEN CONCAT(@C,'000',@I)
						WHEN @I<100 THEN CONCAT(@C,'00',@I)
						WHEN @I<1000 THEN CONCAT(@C,'0',@I)
						WHEN @I<10000 THEN CONCAT(@C,@I)
						ELSE 'NA'
	END;
	RETURN @ID; 
END;

---2)
DROP PROCEDURE ADDSUPPLIER;
DROP SEQUENCE SEQIDS;

CREATE SEQUENCE SEQIDS 
AS INT
START WITH 12
INCREMENT BY 1;

CREATE PROCEDURE ADDSUPPLIER @SNAME AS VARCHAR(50), @SADD AS VARCHAR(50), @SCITY AS VARCHAR(20), @SPHONE AS VARCHAR(15), @EMAIL AS VARCHAR(50)
AS
BEGIN
	DECLARE @SID AS CHAR(5);
	DECLARE @I AS INT;
	SET @I = (NEXT VALUE FOR SEQIDS);
	SET @SID = DBO.GENID('S',@I);

	INSERT INTO SUPPLIER
	VALUES (@SID, @SNAME, @SADD, @SCITY, @SPHONE, @EMAIL);

	SELECT * FROM SUPPLIER WHERE SID = @SID;
END;

SELECT * FROM SUPPLIER;

ADDSUPPLIER  'Jio meds', 'Srinidhi Layout', 'Mumbai', '8909652232','jiomed@outlook.com'


---3)
DROP PROCEDURE ADDPRO;

CREATE SEQUENCE SEQIDP
AS INT
START WITH 19
INCREMENT BY 1;

CREATE PROCEDURE ADDPRO  @PDESC AS VARCHAR(50), @PRICE AS INT, @CATEGORY AS VARCHAR(5), @SID AS CHAR(15)
AS
BEGIN
	DECLARE @PID AS CHAR(5);
	DECLARE @I AS INT;

	SET @I = NEXT VALUE FOR SEQIDP;
	SET @PID = DBO.GENID('P',@I);

	INSERT INTO PRODUCT
	VALUES (@PID, @PDESC, @PRICE, @CATEGORY, @SID);

	SELECT * FROM PRODUCT WHERE PID = @PID;
END;

ADDPRO  'Biscuit', '1000', 'HC', 'S0011'
ADDPRO  'Bandage', '5000', 'HC', 'S0012'

SELECT * FROM PRODUCT;


---4)
DROP PROCEDURE ADDCUST;

CREATE SEQUENCE SEQIDC
AS INT
START WITH 17
INCREMENT BY 1;

CREATE PROCEDURE ADDCUST  @CNAME AS VARCHAR(20), @ADDRESS VARCHAR(20), @CITY AS VARCHAR(20), @PHONE AS VARCHAR(15),@EMAIL AS VARCHAR(20), @DOB AS DATE
AS
BEGIN
	DECLARE @CID AS CHAR(5);
	DECLARE @I AS INT;

	SET @I = NEXT VALUE FOR SEQIDC;
	SET @CID = DBO.GENID('C',@I);

	INSERT INTO CUST
	VALUES (@CID, @CNAME, @ADDRESS, @CITY, @PHONE, @EMAIL, @DOB);

	SELECT * FROM CUST WHERE CID = @CID;
END;

SELECT * FROM CUST;

ADDCUST  'Anil Verma', 'Rajajinagar', 'Mumbai', '8844566001','anil90@yahoo.com','1993-03-29'
---5)
DROP PROCEDURE ADDORDER;

CREATE SEQUENCE SEQIDO
AS INT
START WITH 7
INCREMENT BY 1;


CREATE PROCEDURE ADDORDER @PID CHAR(5), @CID CHAR(5), @OQTY AS INT
AS
BEGIN
	DECLARE @OID AS CHAR(5);
	DECLARE @I AS INT;

	SET @I = NEXT VALUE FOR SEQIDO;
	SET @OID = DBO.GENID('O',@I);

	INSERT INTO ORDERS
	VALUES (@OID,(SELECT CONVERT(VARCHAR(10), GETDATE(),20)),@PID, @CID, @OQTY);

	SELECT * FROM ORDERS WHERE OID = @OID;
END;

SELECT * FROM ORDERS;

ADDORDER 'P0013','C0011',5;

SELECT * FROM STOCK;


SELECT * FROM PRODUCT;
SELECT * FROM SUPPLIER;
SELECT * FROM STOCK;
SELECT * FROM CUST;
SELECT * FROM ORDERS;


/*CREATE INSERT,UPDATE,DELETE TRIGGER*/
--INSERT TRIGGER
CREATE TRIGGER TR_IN_ORD
ON ORDERS
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON; 
	UPDATE STOCK
	SET SQTY = SQTY - (SELECT OQTY FROM INSERTED) 
	WHERE PID = (SELECT PID FROM INSERTED)
END;

ADDORDER 'P0007','C0008',10;

--DELETE TRIGGER
CREATE TRIGGER TR_DEL_STO
ON STOCK
FOR DELETE 
AS
BEGIN
	DELETE FROM PRODUCT 
	WHERE PID = (SELECT PID FROM DELETED);
END;


SELECT * FROM PRODUCT;
SELECT * FROM STOCK;

DELETE FROM STOCK WHERE PID = 'P0021';

--UPDATE TRIGGER
CREATE TRIGGER TR_UP_ORD
ON ORDERS
FOR UPDATE
AS
BEGIN 
	DECLARE @OQ AS INT;
	DECLARE @NQ AS INT;

	SET @OQ = (SELECT OQTY FROM DELETED);
	SET @NQ= (SELECT OQTY FROM INSERTED);

	UPDATE STOCK SET SQTY = SQTY + @OQ - @NQ
	WHERE PID = (SELECT PID FROM INSERTED); 

END;

UPDATE ORDERS
SET OQTY=3
WHERE OID = 'O0005';


drop trigger TR_IN_ORD;

SELECT * FROM PRODUCT;
SELECT * FROM STOCK;
SELECT * FROM SUPPLIER;

SELECT * FROM CUST;
SELECT * FROM ORDERS;

CREATE TRIGGER TR_IN_ORD
ON ORDERS
FOR INSERT
AS
BEGIN
	DECLARE @QR AS INT;
	DECLARE @QS AS INT;

	SET @QR = (SELECT OQTY FROM INSERTED);
	SET @QS = (SELECT SQTY FROM STOCK WHERE PID = (SELECT PID FROM INSERTED));

	IF @QS  >= @QR
		BEGIN
			UPDATE STOCK SET SQTY = SQTY - @QR
			WHERE PID = (SELECT PID FROM INSERTED);

			COMMIT;
			PRINT('ORDER ACCEPTED')
		END;
	ELSE
	    BEGIN
			ROLLBACK
			PRINT('INSUFFICIENT QUANTITY - ORDER REJECTED')
		END;--inserted record will be deleted
END;

ADDORDER 'P0011','C0007',16