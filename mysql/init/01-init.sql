-- Flora E-commerce Database Initialization
-- This file runs when the MySQL container starts for the first time

-- Create database if it doesn't exist (though docker-compose handles this)
CREATE DATABASE IF NOT EXISTS flora_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the database
USE flora_db;

-- Sample data or additional setup can be added here
-- For example:
-- CREATE TABLE IF NOT EXISTS users (...);

-- You can add any initial data setup here