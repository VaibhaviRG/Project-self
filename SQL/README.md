# Inventory Structure Management System
## Overview
The Inventory Structure Management System is a comprehensive SQL-based mini-project designed to manage the inventory of a business. It includes various features such as managing suppliers, products, stock, customers, and orders. Additionally, it encompasses functionalities like reorder levels, minimum order quantities, and automated ID generation for entities.

## Features
### Inventory Display
   1. Display Product Information: Shows PID, PDESC, CATEGORY, SNAME, and SCITY.
   2. Display Order Details: Shows OID, ODATE, CNAME, CADDRESS, CPHONE, PDESC, PRICE, OQTY, and AMT.
      
### Inventory Management Concepts
   - Reorder Level (ROL): The minimum inventory level that triggers a procurement request for the product.
   - Minimum Order Quantity (MOQ): The lowest quantity a supplier is willing to sell or a buyer is required to purchase in a single order.

## Database Schema
### Tables
   - SUPPLIER: SID, SNAME, SADD, SCITY, SPHONE, EMAIL
   - PRODUCT: PID, PDESC, PRICE, CATEGORY, SID
   - STOCK: PID, SQTY, ROL, MOQ
   - CUST: CID, CNAME, ADDRESS, CITY, PHONE, EMAIL, DOB
   - ORDERS: OID, ODATE, PID, CID, OQTY
     
### Constraints
   Primary keys, unique constraints, check constraints, and foreign keys ensure data integrity and validity.

### Procedures
  - ADDSUPPLIER: Adds a new supplier.
  - ADDPRO: Adds a new product.
  - ADDCUST: Adds a new customer.
  - ADDORDER: Adds a new order with the current date.
    
### Triggers
  - Insert Trigger: Updates stock quantity when a new order is inserted.
  - Update Trigger: Adjusts stock quantity when an order is updated.
  - Delete Trigger: Deletes product when corresponding stock is deleted.
    
### Views
   BILL: Displays a detailed bill with OID, ODATE, CNAME, ADDRESS, PHONE, PDESC, PRICE, OQTY, and AMOUNT.

### Functions
   GENID: Auto-generates a 5-character alphanumeric ID based on a given character and number.

## Usage
  1. Create the Database and Tables: Run the provided SQL scripts to create the necessary database and tables.
  2. Insert Initial Data: Use the INSERT statements to populate the tables with initial data.
  3. Run Procedures: Execute the stored procedures to add new suppliers, products, customers, and orders.
  4. View Data: Use SELECT statements to view data from tables and the BILL view.
  5. Manage Inventory: Utilize triggers to automatically handle stock adjustments during order insertion and updates.
