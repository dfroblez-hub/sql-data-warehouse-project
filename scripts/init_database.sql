/*
CREATE DATABASE AND SCHEMAS
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
	within the database: 'bronze', 'silver', 'gold'.
WARNING:
	Running the script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permanently deleted. Proceed with caution and ensure you have
	proper backups before running the script.
*/

-- -----------------------------------------------------------------------------------------------------------------
-- Create database "Data Warehouse"
-- -----------------------------------------------------------------------------------------------------------------

USE master;
GO

-- Drop and recreate the 'Data Warehouse' database
IF EXISTS ( SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Select the db created

USE DataWarehouse;
GO
-- -----------------------------------------------------------------------------------------------------------------
-- 1. Create the schemas
-- Think the schema a as folder or container that helps keep things organized.
-- Since we have 3 layers in the arquitecture → Create 1 schema for each layer.
-- -----------------------------------------------------------------------------------------------------------------
CREATE SCHEMA bronze;
GO -- GO is like a separator. It tells SQL: First execute completely the first command before going to the next one.
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
