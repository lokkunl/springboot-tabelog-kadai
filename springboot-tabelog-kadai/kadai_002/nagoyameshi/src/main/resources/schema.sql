CREATE TABLE IF NOT EXISTS users (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     role_id INT NOT NULL, 
     name VARCHAR(50) NOT NULL,
     email VARCHAR(255) NOT NULL UNIQUE,
     password VARCHAR(255) NOT NULL,
     postal_code VARCHAR(50) NOT NULL,  
     address VARCHAR(255) NOT NULL,
     phone_number VARCHAR(50) NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
     FOREIGN KEY (role_id) REFERENCES roles (id)
 );
 
CREATE TABLE IF NOT EXISTS roles (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     name VARCHAR(50) NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS reservations (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     reservation_date DATE NOT NULL,
     number_of_people INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (shop_id) REFERENCES shops (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );
 
 CREATE TABLE IF NOT EXISTS reviews (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     score INT NOT NULL,
     content TEXT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     UNIQUE (shop_id, user_id),
     FOREIGN KEY (shop_id) REFERENCES shops (id),      FOREIGN KEY (user_id) REFERENCES users (id)      
 );
 
 CREATE TABLE IF NOT EXISTS favorites (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     shop_id INT NOT NULL,
     user_id INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     UNIQUE (shop_id, user_id),
     FOREIGN KEY (shop_id) REFERENCES shops (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS shops(
	 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  	 category_id INT NOT NULL,
	 shop_name VARCHAR(255) NOT NULL,
	 description VARCHAR(255) NOT NULL,
	 photo_name VARCHAR(50),
	 postal_code VARCHAR(50) NOT NULL,  
     address VARCHAR(255) NOT NULL,
     phone_number VARCHAR(50) NOT NULL,
     price INT NOT NULL,
	 business_hours TIME NOT NULL,
	 holiday_date DATE NOT NULL,
	 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	 FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE IF NOT EXISTS categories(
	　id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	　category_name VARCHAR(50) NOT NULL
);