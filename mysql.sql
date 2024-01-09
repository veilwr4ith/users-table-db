-- User information table 
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT,
    phone_number VARCHAR(20),
    user_type ENUM('admin', 'user', 'guest'),
    account_status ENUM('active', 'inactive', 'suspended'),
    registration_ip VARCHAR(45),
    sex ENUM('male', 'female', 'other'),
    nationality VARCHAR(255),
    date_of_birth DATE,
    date_registered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Addresses table
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street_address VARCHAR(255),
    barangay VARCHAR(255),
    municipality VARCHAR(255),
    province VARCHAR(255),
    postal_code VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Additional user information table
CREATE TABLE user_info (
    user_info_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    education VARCHAR(255),
    occupation VARCHAR(255),
    hobbies TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- User roles table
CREATE TABLE user_roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    UNIQUE (role_name)
);

-- User to Roles relationship table
CREATE TABLE user_to_roles (
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES user_roles(role_id)
);