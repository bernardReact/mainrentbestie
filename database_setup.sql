-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS shortlet_vetting_db;
USE shortlet_vetting_db;

-- 2. Create the 'users' table (Landlords)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the 'alerts' table (Bad Behavior Reports)
CREATE TABLE alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    guest_phone VARCHAR(15), 
    offense_type VARCHAR(50) NOT NULL,
    description TEXT,
    reported_by_user_id INT,
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reported_by_user_id) REFERENCES users(user_id)
);

-- 4. Create the 'activities' table (Audit Log)
CREATE TABLE activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action_type VARCHAR(50),
    activity_details VARCHAR(255),
    activity_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 5. Insert Dummy Data (5-10 rows)

-- Adding Landlords
INSERT INTO users (full_name, email, phone_number) VALUES 
('Emeka Okafor', 'emeka@ph-rentals.com', '08012345678'),
('Chioma Adebayo', 'chioma@lagos-stays.com', '08087654321'),
('Tunde Bakare', 'tunde@abuja-shortlets.com', '08055555555');

-- Adding Alerts (Bad Guests)
INSERT INTO alerts (guest_name, guest_phone, offense_type, description, reported_by_user_id) VALUES 
('John Doe', '09011112222', 'Damages', 'Broke the 65 inch TCL TV screen.', 1),
('Jane Smith', '07033334444', 'Theft', 'Stole the microwave and towels.', 2),
('Mike Johnson', '08122223333', 'Noise', 'Held a party with 20 people in a 1-bed apartment.', 1),
('Sarah Connor', '08099998888', 'Payment', 'Used a fake transfer receipt.', 3);

-- Adding Activities
INSERT INTO activities (user_id, action_type, activity_details) VALUES 
(1, 'LOGIN', 'User logged into the dashboard'),
(1, 'POST_ALERT', 'Reported John Doe for Damages'),
(2, 'SEARCH_GUEST', 'Searched for phone number 09011112222'),
(3, 'LOGIN', 'User logged in'),
(3, 'POST_ALERT', 'Reported Sarah Connor for Payment fraud');
