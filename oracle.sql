-- User information table
CREATE TABLE users (
    user_id NUMBER(10) PRIMARY KEY,
    email VARCHAR2(255) NOT NULL,
    password VARCHAR2(255) NOT NULL,
    first_name VARCHAR2(255),
    middle_name VARCHAR2(255),
    last_name VARCHAR2(255),
    age NUMBER(3),
    phone_number VARCHAR2(20),
    profile_picture VARCHAR2(255),
    user_type VARCHAR2(10) CHECK (user_type IN ('admin', 'user', 'guest')),
    account_status VARCHAR2(10) CHECK (account_status IN ('active', 'inactive', 'suspended')),
    last_login_date TIMESTAMP,
    registration_ip VARCHAR2(45),
    sex VARCHAR2(10) CHECK (sex IN ('male', 'female', 'other')),
    nationality VARCHAR2(255),
    date_of_birth DATE,
    date_registered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Addresses table
CREATE TABLE addresses (
    address_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    street_address VARCHAR2(255),
    barangay VARCHAR2(255),
    municipality VARCHAR2(255),
    province VARCHAR2(255),
    postal_code VARCHAR2(10),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Additional user information table
CREATE TABLE user_info (
    user_info_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    education VARCHAR2(255),
    occupation VARCHAR2(255),
    hobbies CLOB,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- User roles table 
CREATE TABLE user_roles (
    role_id NUMBER(10) PRIMARY KEY,
    role_name VARCHAR2(50) NOT NULL,
    description VARCHAR2(255),
    CONSTRAINT role_name_unique UNIQUE (role_name)
);

-- User to Roles relationship table
CREATE TABLE user_to_roles (
    user_id NUMBER(10),
    role_id NUMBER(10),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES user_roles(role_id)
);