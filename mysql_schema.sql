-- Crumbled Cookies MySQL Schema
CREATE DATABASE IF NOT EXISTS crumbled_cookies;
USE crumbled_cookies;

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Flavor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CookieSize (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CookieStock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flavor_id INT NOT NULL,
    size_id INT NOT NULL,
    store_id INT NOT NULL,
    quantity INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (flavor_id) REFERENCES Flavor(id),
    FOREIGN KEY (size_id) REFERENCES CookieSize(id),
    FOREIGN KEY (store_id) REFERENCES Store(id)
);

CREATE TABLE Pack (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    size_id INT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (size_id) REFERENCES CookieSize(id)
);

CREATE TABLE PackFlavorPriceAdjustment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pack_id INT NOT NULL,
    flavor_id INT NOT NULL,
    price_adjustment DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (pack_id) REFERENCES Pack(id),
    FOREIGN KEY (flavor_id) REFERENCES Flavor(id)
);

CREATE TABLE `Order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    store_id INT NOT NULL,
    status ENUM('pending','confirmed','delivered','cancelled') DEFAULT 'pending',
    total_price DECIMAL(10,2) NOT NULL,
    otp_code VARCHAR(10),
    otp_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (store_id) REFERENCES Store(id)
);

CREATE TABLE OrderItem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    pack_id INT NOT NULL,
    flavor_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(id),
    FOREIGN KEY (pack_id) REFERENCES Pack(id),
    FOREIGN KEY (flavor_id) REFERENCES Flavor(id)
);

CREATE TABLE HeaderMedia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    media_url VARCHAR(255) NOT NULL,
    media_type ENUM('image','video') NOT NULL,
    display_start DATETIME,
    display_end DATETIME,
    is_enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_id INT,
    type ENUM('email','sms','whatsapp') NOT NULL,
    message TEXT NOT NULL,
    status ENUM('pending','sent','failed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (order_id) REFERENCES `Order`(id)
); 