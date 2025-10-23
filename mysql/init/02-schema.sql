-- Flora E-commerce Schema
-- This file creates all necessary tables for the application

USE flora_db;

-- Create example_entity table
-- This table is referenced by the ExampleEntity JPA entity in the backend
CREATE TABLE IF NOT EXISTS example_entity (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create indexes for better query performance
CREATE INDEX idx_example_entity_name ON example_entity(name);
CREATE INDEX idx_example_entity_created_at ON example_entity(created_at);

-- Add sample data for testing
INSERT INTO example_entity (name, description) VALUES 
('Sample Product 1', 'This is a sample product for testing'),
('Sample Product 2', 'Another sample product'),
('Sample Product 3', 'Third sample product');
