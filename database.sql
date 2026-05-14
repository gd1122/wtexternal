CREATE DATABASE IF NOT EXISTS store_db;
USE store_db;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Insert premium dummy data
INSERT INTO products (name, description, category, price) VALUES 
('Ultra HD Smart TV', '55-inch 4K Display with vibrant HDR colors', 'Electronics', 699.99),
('Wireless Noise-Canceling Headphones', 'Over-ear premium audio with 30hr battery life', 'Audio', 249.50),
('Ergonomic Mesh Office Chair', 'Adjustable lumbar support and smooth-rolling casters', 'Furniture', 185.00),
('Mechanical Gaming Keyboard', 'RGB backlit keys with ultra-responsive linear switches', 'Accessories', 119.99);
