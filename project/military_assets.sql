-- Create database
CREATE DATABASE IF NOT EXISTS military_assets;
USE military_assets;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Insert sample users (passwords are hashed with bcrypt for "password")
INSERT INTO users (username, password, role, name, email) VALUES
('admin', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', 'System Admin', 'admin@military.com'),
('commander', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Base Commander', 'John Commander', 'commander@military.com'),
('officer', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Logistics Officer', 'Jane Officer', 'officer@military.com');

-- Create purchases table
CREATE TABLE IF NOT EXISTS purchases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    base VARCHAR(100) NOT NULL,
    equipmentType VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending'
);

-- Insert sample purchases
INSERT INTO purchases (base, equipmentType, quantity, date, status) VALUES
('Base A', 'Vehicle', 10, '2023-06-01', 'Approved'),
('Base B', 'Weapon', 50, '2023-06-15', 'Pending'),
('Base C', 'Ammunition', 1000, '2023-07-01', 'Approved');

-- Create transfers table
CREATE TABLE IF NOT EXISTS transfers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fromBase VARCHAR(100) NOT NULL,
    toBase VARCHAR(100) NOT NULL,
    equipmentType VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    date DATE NOT NULL
);

-- Insert sample transfers
INSERT INTO transfers (fromBase, toBase, equipmentType, quantity, date) VALUES
('Base A', 'Base B', 'Vehicle', 5, '2023-06-01'),
('Base C', 'Base A', 'Weapon', 20, '2023-06-10'),
('Base B', 'Base C', 'Ammunition', 500, '2023-07-05');

-- Create assignments table
CREATE TABLE IF NOT EXISTS assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    base VARCHAR(100) NOT NULL,
    personnel VARCHAR(100) NOT NULL,
    equipmentType VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    expended BOOLEAN DEFAULT FALSE,
    date DATE NOT NULL
);

-- Insert sample assignments
INSERT INTO assignments (base, personnel, equipmentType, quantity, expended, date) VALUES
('Base A', 'Soldier 1', 'Weapon', 1, FALSE, '2023-06-01'),
('Base B', 'Soldier 2', 'Vehicle', 1, TRUE, '2023-06-15'),
('Base C', 'Soldier 3', 'Ammunition', 100, FALSE, '2023-07-01');
