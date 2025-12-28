create database AMAZONDB;

use AMAZONDB;

-- Drop and create database
DROP DATABASE IF EXISTS AMAZONDB;
-- ---------------------------------------------------------
-- 1. customers
CREATE TABLE customers (
  customer_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(128) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE,
  loyalty_points INT DEFAULT 0 CHECK (loyalty_points >= 0),
  birthdate DATE,
  preferred_language VARCHAR(10) DEFAULT 'en',
  gender ENUM('male','female','other','prefer_not_say')
);

INSERT INTO customers (username, email, password_hash, first_name, last_name, phone, birthdate, gender)
VALUES
('arjun.k','arjun.k@example.in','hash1','Arjun','Kumar','9876100001','1989-01-10','male'),
('riya.sharma','riya.sharma@example.in','hash2','Riya','Sharma','9876100002','1992-03-05','female'),
('raj.singh','raj.singh@example.in','hash3','Raj','Singh','9876100003','1988-07-21','male'),
('sneha.patel','sneha.patel@example.in','hash4','Sneha','Patel','9876100004','1991-02-18','female'),
('amit.verma','amit.verma@example.in','hash5','Amit','Verma','9876100005','1990-08-10','male'),
('neha.gupta','neha.gupta@example.in','hash6','Neha','Gupta','9876100006','1995-06-15','female'),
('rahul.nair','rahul.nair@example.in','hash7','Rahul','Nair','9876100007','1987-12-09','male'),
('pooja.iyer','pooja.iyer@example.in','hash8','Pooja','Iyer','9876100008','1994-05-03','female'),
('vijay.reddy','vijay.reddy@example.in','hash9','Vijay','Reddy','9876100009','1986-09-30','male'),
('kavya.das','kavya.das@example.in','hash10','Kavya','Das','9876100010','1993-10-11','female'),
('suresh.p','suresh.p@example.in','hash11','Suresh','Pillai','9876100011','1990-11-12','male'),
('anita.jain','anita.jain@example.in','hash12','Anita','Jain','9876100012','1992-04-14','female'),
('manish.yadav','manish.yadav@example.in','hash13','Manish','Yadav','9876100013','1989-08-22','male'),
('priya.rao','priya.rao@example.in','hash14','Priya','Rao','9876100014','1994-02-28','female'),
('deepak.m','deepak.m@example.in','hash15','Deepak','Mehta','9876100015','1985-01-17','male'),
('aisha.k','aisha.k@example.in','hash16','Aisha','Khan','9876100016','1996-07-19','female'),
('rohit.b','rohit.b@example.in','hash17','Rohit','Bose','9876100017','1991-09-12','male'),
('isha.p','isha.p@example.in','hash18','Isha','Pandey','9876100018','1993-03-08','female'),
('vishal.g','vishal.g@example.in','hash19','Vishal','Ghosh','9876100019','1988-11-25','male'),
('meera.t','meera.t@example.in','hash20','Meera','Thakur','9876100020','1995-12-01','female');
select * from customers;

-- Find departments starting with 'F'
SELECT DeptID, DeptName
FROM Departments   
WHERE DeptName LIKE 'F%';

-- Count how many departments exist
SELECT COUNT(*) AS TotalDepartments
FROM Departments;

-- List departments in ascending order
SELECT DeptID, DeptName
FROM Departments
ORDER BY DeptName ASC;

-- Find departments which have at least one employee
SELECT DISTINCT d.DeptID, d.DeptName
FROM Departments d
JOIN Employees e
ON d.DeptID = e.DeptID;



-- ---------------------------------------------------------
-- 2. sellers
CREATE TABLE sellers (
  seller_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(150) NOT NULL,
  contact_name VARCHAR(100),
  contact_email VARCHAR(255) NOT NULL UNIQUE,
  contact_phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  rating DECIMAL(2,1) DEFAULT 0 CHECK (rating BETWEEN 0 AND 5),
  is_active BOOLEAN DEFAULT TRUE,
  gst_number VARCHAR(20),
  seller_description TEXT
);

INSERT INTO sellers (company_name, contact_name, contact_email, contact_phone, rating, gst_number)
VALUES
('TechMart India','Anil Kapoor','contact@techmart.in','9810011111',4.8,'29ABCDE1234F1Z5'),
('BookNest','Shreya Ghosh','info@booknest.in','9810011112',4.6,'07ABCDE5678G2H6'),
('StyleBazaar','Rohan Jain','hello@stylebazaar.in','9810011113',4.7,'27ABCDE9876L3P7'),
('HomeChoice','Meena Pillai','support@homechoice.in','9810011114',4.5,'19ABCDE6543Z9X8'),
('GadgetHub','Nikhil Rao','sales@gadgethub.in','9810011115',4.9,'33ABCDE4321K8V2'),
('SuperStore','Amit Shah','contact@superstore.in','9810011116',4.3,'09ABCDE8765N7M9'),
('BeautyKart','Ritika Arora','sales@beautykart.in','9810011117',4.4,'24ABCDE1239C5T2'),
('ToyWorld','Vikram Patil','support@toyworld.in','9810011118',4.5,'32ABCDE3458S2Q3'),
('Sportify','Mahesh Reddy','info@sportify.in','9810011119',4.6,'20ABCDE6582A9K5'),
('KitchenPro','Sonal Mehta','help@kitchenpro.in','9810011120',4.7,'18ABCDE9521P6N8');
select * from sellers;

-- Get all active employees
SELECT EmpID, EmpName, Salary
FROM Employees
WHERE IsActive = TRUE;

-- Find employees with salary above company average
SELECT EmpName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Retrieve top 3 highest salaries
SELECT EmpName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- Calculate average salary per department
SELECT DeptID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;

-- Calculate annual salary of each employee
SELECT EmpName, Salary * 12 AS AnnualSalary
FROM Employees;

-- ---------------------------------------------------------
-- 3. categories
CREATE TABLE categories (
  category_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  parent_id BIGINT,
  description TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  display_order INT DEFAULT 0,
  slug VARCHAR(150) UNIQUE,
  FOREIGN KEY (parent_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

INSERT INTO categories (name, description, slug)
VALUES
('Mobiles','Smartphones & accessories','mobiles'),
('Books','Books & Stationery','books'),
('Fashion','Clothing & Footwear','fashion'),
('Home Appliances','Kitchen & Home essentials','home-appliances'),
('Beauty','Cosmetics & Wellness','beauty'),
('Toys','Toys & Games','toys'),
('Sports','Sports equipment','sports'),
('Groceries','Daily needs & food items','groceries'),
('Audio','Speakers & Headphones','audio'),
('Computers','Laptops & accessories','computers');
select * from categories;




-- ---------------------------------------------------------
-- 4. products
CREATE TABLE products (
  product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  seller_id BIGINT NOT NULL,
  category_id BIGINT,
  sku VARCHAR(100) NOT NULL UNIQUE,
  title VARCHAR(255) NOT NULL,
  short_description VARCHAR(512),
  long_description TEXT,
  price DECIMAL(12,2) NOT NULL CHECK (price >= 0),
  currency CHAR(3) DEFAULT 'INR',
  weight_kg DECIMAL(8,3) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


INSERT INTO products (seller_id, category_id, sku, title, short_description, price)
VALUES
(1,1,'SKUIN001','Samsung Galaxy S24','Flagship Samsung smartphone',79999.00),
(1,1,'SKUIN002','iPhone 15','Latest Apple smartphone',129999.00),
(2,2,'SKUIN003','The Monk Who Sold His Ferrari','Book by Robin Sharma',399.00),
(3,3,'SKUIN004','Cotton Kurta Set','Ethnic wear for women',1299.00),
(4,4,'SKUIN005','Prestige Cooker 5L','Pressure cooker',2199.00),
(5,5,'SKUIN006','Lakme Face Cream','Moisturizer 100ml',249.00),
(6,8,'SKUIN007','Fortune Basmati Rice 5kg','Premium rice',499.00),
(7,5,'SKUIN008','Himalaya Shampoo 400ml','Herbal shampoo',189.00),
(8,6,'SKUIN009','Lego City Set','Creative toy',2299.00),
(9,7,'SKUIN010','Nivia Football','Professional ball',599.00),
(10,9,'SKUIN011','Boat Rockerz Headphones','Bluetooth headphones',1999.00),
(5,10,'SKUIN012','HP Laptop i5','14-inch laptop',59999.00),
(3,3,'SKUIN013','Men Casual Shirt','Cotton half-sleeve',799.00),
(9,7,'SKUIN014','Yonex Badminton Racket','Lightweight racket',1799.00),
(7,5,'SKUIN015','Lotus Facewash','Herbal facewash',199.00),
(4,4,'SKUIN016','Philips Mixer Grinder','3-jar kitchen appliance',3499.00),
(10,9,'SKUIN017','JBL Speaker','Portable Bluetooth speaker',4499.00),
(8,6,'SKUIN018','Barbie Doll Set','Toy for kids',999.00),
(1,1,'SKUIN019','Redmi Note 13','Mid-range smartphone',17999.00),
(2,2,'SKUIN020','Rich Dad Poor Dad','Book by Robert Kiyosaki',349.00);
select * from products;

SELECT product_name, price
FROM products
WHERE stock_quantity > 0;

SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT product_name, price
FROM products
WHERE price BETWEEN 500 AND 2000;



-- ---------------------------------------------------------
-- 5. addresses
CREATE TABLE addresses (
  address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(100),
  postal_code VARCHAR(10),
  country VARCHAR(100) DEFAULT 'India',
  address_type ENUM('billing','shipping') DEFAULT 'shipping',
  is_default BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO addresses (customer_id, street, city, state, postal_code, address_type, is_default)
VALUES
(1,'12 MG Road','Bengaluru','Karnataka','560001','shipping',TRUE),
(2,'45 Nehru Nagar','Delhi','Delhi','110065','billing',TRUE),
(3,'221 Park Street','Kolkata','West Bengal','700016','shipping',TRUE),
(4,'77 Nungambakkam High Rd','Chennai','Tamil Nadu','600034','billing',TRUE),
(5,'54 FC Road','Pune','Maharashtra','411004','shipping',TRUE),
(6,'33 Law Garden','Ahmedabad','Gujarat','380009','shipping',TRUE),
(7,'88 Marine Drive','Mumbai','Maharashtra','400020','shipping',TRUE),
(8,'99 Jubilee Hills','Hyderabad','Telangana','500033','billing',TRUE),
(9,'14 Sector 17','Chandigarh','Punjab','160017','shipping',TRUE),
(10,'21 Civil Lines','Lucknow','Uttar Pradesh','226001','billing',TRUE),
(11,'25 Race Course Rd','Dehradun','Uttarakhand','248001','shipping',TRUE),
(12,'17 MG Marg','Gangtok','Sikkim','737101','billing',TRUE),
(13,'48 Boring Rd','Patna','Bihar','800001','shipping',TRUE),
(14,'50 MI Road','Jaipur','Rajasthan','302001','billing',TRUE),
(15,'72 VIP Rd','Raipur','Chhattisgarh','492001','shipping',TRUE),
(16,'61 Bapuji Nagar','Bhubaneswar','Odisha','751009','shipping',TRUE),
(17,'85 Lalpur','Ranchi','Jharkhand','834001','billing',TRUE),
(18,'42 Sector 62','Noida','Uttar Pradesh','201301','shipping',TRUE),
(19,'34 Anand Rao Circle','Bengaluru','Karnataka','560009','shipping',TRUE),
(20,'90 Town Hall','Coimbatore','Tamil Nadu','641001','billing',TRUE);

select * from addresses;
SELECT address_line, city, state
FROM addresses
WHERE user_id = 1;

SELECT *
FROM addresses
WHERE is_default = TRUE;

SELECT *
FROM addresses
WHERE city = 'Mumbai';

SELECT user_id, COUNT(*) AS address_count
FROM addresses
GROUP BY user_id;

SELECT *
FROM addresses
ORDER BY created_at DESC;



-- ---------------------------------------------------------
-- 6. warehouses
CREATE TABLE warehouses (
  warehouse_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  manager_name VARCHAR(100),
  contact_phone VARCHAR(20),
  email VARCHAR(100),
  street VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  postal_code VARCHAR(10),
  capacity INT CHECK (capacity > 0),
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO warehouses (name, manager_name, contact_phone, email, street, city, state, postal_code, capacity)
VALUES
('Bengaluru Central WH','Kiran Rao','9820000011','blrwh@ecom.in','45 Mysore Rd','Bengaluru','Karnataka','560026',5000),
('Mumbai West WH','Ravi Desai','9820000012','mumwh@ecom.in','22 Andheri East','Mumbai','Maharashtra','400069',6000),
('Delhi NCR WH','Ajay Sharma','9820000013','delhiwh@ecom.in','18 Okhla Phase II','New Delhi','Delhi','110020',8000),
('Kolkata Main WH','Sourav Ghosh','9820000014','kolwh@ecom.in','89 Howrah Rd','Kolkata','West Bengal','700001',4000),
('Hyderabad South WH','Vikram Reddy','9820000015','hydwh@ecom.in','11 Banjara Hills','Hyderabad','Telangana','500034',5500),
('Chennai North WH','Deepa Iyer','9820000016','chnwh@ecom.in','33 Mount Rd','Chennai','Tamil Nadu','600002',5200),
('Pune WH','Manoj Patil','9820000017','punewh@ecom.in','25 Hinjewadi Phase 1','Pune','Maharashtra','411057',4000),
('Ahmedabad WH','Rupal Shah','9820000018','amdwh@ecom.in','78 Ashram Rd','Ahmedabad','Gujarat','380009',4200),
('Jaipur WH','Harish Meena','9820000019','jaiwh@ecom.in','12 MI Rd','Jaipur','Rajasthan','302001',3000),
('Lucknow WH','Pankaj Verma','9820000020','lkwwh@ecom.in','17 Hazratganj','Lucknow','Uttar Pradesh','226001',2800);
 select*from warehouses ;

-- ---------------------------------------------------------
-- 7. inventory
CREATE TABLE inventory (
  inventory_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  product_id BIGINT NOT NULL,
  warehouse_id BIGINT NOT NULL,
  stock_qty INT DEFAULT 0 CHECK (stock_qty >= 0),
  reorder_level INT DEFAULT 10 CHECK (reorder_level >= 0),
  last_restocked DATE,
  shelf_location VARCHAR(50),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO inventory (product_id, warehouse_id, stock_qty, reorder_level, last_restocked, shelf_location)
VALUES
(1,1,300,20,'2025-09-15','A1'),
(2,1,200,10,'2025-09-10','A2'),
(3,2,150,15,'2025-09-05','B1'),
(4,3,500,50,'2025-09-20','B2'),
(5,4,250,20,'2025-09-14','C1'),
(6,5,600,30,'2025-09-25','C2'),
(7,6,1000,50,'2025-09-28','D1'),
(8,7,400,40,'2025-09-11','D2'),
(9,8,350,35,'2025-09-12','E1'),
(10,9,280,25,'2025-09-16','E2'),
(11,1,450,50,'2025-09-15','F1'),
(12,2,200,20,'2025-09-18','F2'),
(13,3,420,40,'2025-09-22','G1'),
(14,4,190,10,'2025-09-19','G2'),
(15,5,600,30,'2025-09-08','H1'),
(16,6,330,20,'2025-09-27','H2'),
(17,7,150,10,'2025-09-24','I1'),
(18,8,410,40,'2025-09-26','I2'),
(19,9,700,70,'2025-09-29','J1'),
(20,10,270,25,'2025-09-30','J2');

select* from inventory;
-- Current stock of all products
SELECT product_id, stock_quantity
FROM inventory;

-- Products with low stock
SELECT product_id, stock_quantity
FROM inventory
WHERE stock_quantity < 10;

-- Total available stock
SELECT SUM(stock_quantity) AS total_stock
FROM inventory;

-- Latest inventory updates
SELECT *
FROM inventory
ORDER BY updated_at DESC
LIMIT 5;

-- Inventory with product details
SELECT p.product_name, i.stock_quantity
FROM inventory i
JOIN products p ON i.product_id = p.product_id;

-- ---------------------------------------------------------
-- 8. orders
CREATE TABLE orders (
  order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_amount DECIMAL(12,2) CHECK (total_amount >= 0),
  payment_status ENUM('pending','paid','failed','refunded') DEFAULT 'pending',
  shipping_status ENUM('pending','shipped','delivered','cancelled') DEFAULT 'pending',
  shipping_address_id BIGINT,
  billing_address_id BIGINT,
  warehouse_id BIGINT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (shipping_address_id) REFERENCES addresses(address_id),
  FOREIGN KEY (billing_address_id) REFERENCES addresses(address_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO orders (customer_id, total_amount, payment_status, shipping_status, shipping_address_id, billing_address_id, warehouse_id)
VALUES
(1,17999.00,'paid','shipped',1,1,1),
(2,249.00,'paid','delivered',2,2,3),
(3,59999.00,'paid','shipped',3,3,2),
(4,2199.00,'paid','delivered',4,4,4),
(5,349.00,'paid','delivered',5,5,5),
(6,79999.00,'paid','shipped',6,6,1),
(7,999.00,'paid','delivered',7,7,8),
(8,4499.00,'paid','delivered',8,8,5),
(9,3499.00,'paid','shipped',9,9,7),
(10,2299.00,'paid','shipped',10,10,4),
(11,1299.00,'paid','delivered',11,11,6),
(12,599.00,'paid','delivered',12,12,3),
(13,1799.00,'paid','delivered',13,13,9),
(14,499.00,'paid','delivered',14,14,6),
(15,999.00,'paid','shipped',15,15,2),
(16,249.00,'paid','delivered',16,16,1),
(17,799.00,'paid','delivered',17,17,8),
(18,129999.00,'paid','shipped',18,18,3),
(19,599.00,'paid','delivered',19,19,4),
(20,999.00,'paid','shipped',20,20,7);
select * from orders;

SELECT order_id, user_id, order_date
FROM orders
WHERE order_status = 'Completed';

SELECT *
FROM orders
WHERE DATE(order_date) = CURDATE();

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT order_id, order_date
FROM orders
WHERE user_id = 1;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;

-- ---------------------------------------------------------
CREATE TABLE order_items (
  order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  price_per_unit DECIMAL(12,2) NOT NULL,
  total_price DECIMAL(12,2) NOT NULL,
  CONSTRAINT fk_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_product
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ;


INSERT INTO order_items (order_id, product_id, quantity, price_per_unit)
VALUES
(1,19,1,17999.00),
(2,6,1,249.00),
(3,12,1,59999.00),
(4,5,1,2199.00),
(5,20,1,349.00),
(6,1,1,79999.00),
(7,18,1,999.00),
(8,17,1,4499.00),
(9,16,1,3499.00),
(10,9,1,2299.00),
(11,4,1,1299.00),
(12,10,1,599.00),
(13,14,1,1799.00),
(14,7,1,499.00),
(15,18,1,999.00),
(16,6,1,249.00),
(17,13,1,799.00),
(18,2,1,129999.00),
(19,10,1,599.00),
(20,9,1,999.00);

select * from order_items;

SELECT product_id, quantity, total_price
FROM order_items
WHERE order_id = 1;

SELECT SUM(total_price) AS total_sales
FROM order_items;

SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

SELECT AVG(price_per_unit) AS avg_price
FROM order_items;

SELECT order_id, SUM(total_price) AS order_total
FROM order_items
GROUP BY order_id;


-- ---------------------------------------------------------
-- 10. payments
CREATE TABLE payments (
  payment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card','debit_card','upi','net_banking','cod'),
  amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
  transaction_id VARCHAR(100) UNIQUE,
  payment_status ENUM('success','failed','pending','refunded') DEFAULT 'success',
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_method, amount, transaction_id, payment_status)
VALUES
(1,'upi',17999.00,'TXN001','success'),
(2,'credit_card',249.00,'TXN002','success'),
(3,'debit_card',59999.00,'TXN003','success'),
(4,'upi',2199.00,'TXN004','success'),
(5,'upi',349.00,'TXN005','success'),
(6,'net_banking',79999.00,'TXN006','success'),
(7,'cod',999.00,'TXN007','success'),
(8,'credit_card',4499.00,'TXN008','success'),
(9,'upi',3499.00,'TXN009','success'),
(10,'upi',2299.00,'TXN010','success');

select * from payments;

SELECT payment_id, amount
FROM payments
WHERE payment_status = 'Success';

SELECT SUM(amount) AS total_revenue
FROM payments;

SELECT payment_method, COUNT(*) AS count
FROM payments
GROUP BY payment_method;

SELECT *
FROM payments
ORDER BY payment_date DESC
LIMIT 5;

-- ---------------------------------------------------------
-- 11. shipping
CREATE TABLE shipping (
  shipping_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  courier_name VARCHAR(100),
  tracking_number VARCHAR(100) UNIQUE,
  ship_date DATE,
  expected_delivery DATE,
  actual_delivery DATE,
  shipping_cost DECIMAL(10,2) DEFAULT 0 CHECK (shipping_cost >= 0),
  status ENUM('pending','shipped','in_transit','delivered','returned') DEFAULT 'pending',
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO shipping (order_id,courier_name,tracking_number,ship_date,expected_delivery,shipping_cost,status)
VALUES
(1,'BlueDart','BLR001','2025-09-12','2025-09-16',79.00,'delivered'),
(2,'DTDC','DEL002','2025-09-13','2025-09-17',49.00,'delivered'),
(3,'EcomExpress','MUM003','2025-09-15','2025-09-20',89.00,'shipped'),
(4,'IndiaPost','CHN004','2025-09-14','2025-09-19',39.00,'delivered'),
(5,'Delhivery','PUN005','2025-09-13','2025-09-18',59.00,'delivered'),
(6,'BlueDart','BLR006','2025-09-16','2025-09-21',99.00,'in_transit'),
(7,'DTDC','DEL007','2025-09-18','2025-09-23',49.00,'shipped'),
(8,'EcomExpress','HYD008','2025-09-17','2025-09-22',89.00,'delivered'),
(9,'IndiaPost','KOL009','2025-09-19','2025-09-24',39.00,'delivered'),
(10,'Delhivery','AHD010','2025-09-20','2025-09-25',59.00,'in_transit'),
(11,'BlueDart','BLR011','2025-09-21','2025-09-26',79.00,'shipped'),
(12,'DTDC','DEL012','2025-09-22','2025-09-27',49.00,'delivered'),
(13,'EcomExpress','PUN013','2025-09-23','2025-09-28',89.00,'delivered'),
(14,'IndiaPost','KOL014','2025-09-24','2025-09-29',39.00,'delivered'),
(15,'Delhivery','MUM015','2025-09-25','2025-09-30',59.00,'shipped'),
(16,'BlueDart','CHN016','2025-09-26','2025-10-01',79.00,'shipped'),
(17,'DTDC','HYD017','2025-09-27','2025-10-02',49.00,'in_transit'),
(18,'EcomExpress','DEL018','2025-09-28','2025-10-03',89.00,'shipped'),
(19,'IndiaPost','BLR019','2025-09-29','2025-10-04',39.00,'shipped'),
(20,'Delhivery','PUN020','2025-09-30','2025-10-05',59.00,'delivered');
select * from shipping;
-- Orders that are shipped
SELECT order_id, ship_date
FROM shipping
WHERE shipment_status = 'Shipped';

-- Orders not yet delivered
SELECT order_id, expected_delivery
FROM shipping
WHERE shipment_status = 'Pending';

-- Orders delivered after expected date
SELECT order_id, delivered_date
FROM shipments
WHERE delivered_date > expected_delivery;

-- Latest delivered orders
SELECT *
FROM shipments
ORDER BY delivered_date DESC
LIMIT 5;

-- Count orders by shipment status
SELECT shipment_status, COUNT(*) AS total_orders
FROM shipments
GROUP BY shipment_status;



-- ---------------------------------------------------------
-- 12. returns
CREATE TABLE returns (
  return_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  reason VARCHAR(255),
  return_date DATE,
  refund_amount DECIMAL(10,2),
  status ENUM('requested','approved','rejected','refunded') DEFAULT 'requested',
  processed_by VARCHAR(100),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO returns (order_id,product_id,reason,return_date,refund_amount,status,processed_by)
VALUES
(4,5,'Defective product','2025-09-20',2199.00,'refunded','Anil Desai'),
(7,18,'Color mismatch','2025-09-21',999.00,'refunded','Priya Singh'),
(10,9,'Late delivery','2025-09-22',2299.00,'approved','Ravi Patel'),
(15,18,'Changed mind','2025-09-25',999.00,'refunded','Nisha Reddy'),
(17,13,'Size issue','2025-09-28',799.00,'refunded','Amit Jain'),
(19,10,'Damaged','2025-09-29',599.00,'approved','Sonal Gupta'),
(20,9,'Duplicate order','2025-09-30',999.00,'refunded','Ramesh Rao'),
(2,6,'Allergic reaction','2025-09-19',249.00,'refunded','Anita Mehta'),
(9,16,'Faulty grinder','2025-09-25',3499.00,'approved','Deepak Joshi'),
(3,12,'Wrong model','2025-09-23',59999.00,'refunded','Neha Arora');
select * from returns;
-- Orders that were returned
SELECT order_id, return_reason
FROM returns;
-- Count returns by reason
SELECT return_reason, COUNT(*) AS total_returns
FROM returns
GROUP BY return_reason;

-- Returns raised by a user
SELECT r.order_id, r.return_reason
FROM returns r
JOIN orders o ON r.order_id = o.order_id
WHERE o.user_id = 1;

-- Approved return requests
SELECT *
FROM returns
WHERE return_status = 'Approved';


-- ---------------------------------------------------------
-- 13. reviews
CREATE TABLE reviews (
  review_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  product_id BIGINT NOT NULL,
  customer_id BIGINT NOT NULL,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  review_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO reviews (product_id,customer_id,rating,review_text)
VALUES
(1,1,5,'Excellent phone performance!'),
(2,2,4,'Camera quality great.'),
(3,3,5,'Inspiring book.'),
(4,4,3,'Good but overpriced.'),
(5,5,5,'Perfect for cooking.'),
(6,6,4,'Nice fragrance.'),
(7,7,5,'Good rice quality.'),
(8,8,3,'Average product.'),
(9,9,5,'Kids loved it.'),
(10,10,4,'Good football for practice.'),
(11,11,4,'Nice bass.'),
(12,12,5,'Laptop performance excellent.'),
(13,13,4,'Soft fabric shirt.'),
(14,14,5,'Lightweight racket.'),
(15,15,3,'Average facewash.'),
(16,16,4,'Works well.'),
(17,17,5,'Sound clarity amazing.'),
(18,18,5,'Kids happy!'),
(19,19,4,'Budget smartphone.'),
(20,20,5,'Must-read book.');
select * from reviews;

-- Get reviews of a specific product
SELECT user_id, rating, comment
FROM reviews
WHERE product_id = 10;

-- Calculate average rating of each product
SELECT product_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY product_id;

-- Products with high ratings
SELECT DISTINCT product_id
FROM reviews
WHERE rating >= 4;

-- Recently added reviews
SELECT *
FROM reviews
ORDER BY created_at DESC
LIMIT 5;

-- Number of reviews per product
SELECT product_id, COUNT(*) AS total_reviews
FROM reviews
GROUP BY product_id;




-- ---------------------------------------------------------
-- 14. employees
CREATE TABLE employees (
  employee_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  position VARCHAR(100),
  salary DECIMAL(10,2),
  hire_date DATE,
  warehouse_id BIGINT,
  FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO employees (first_name,last_name,email,phone,position,salary,hire_date,warehouse_id)
VALUES
('Ramesh','Iyer','r.iyer@ecom.in','9000000011','Manager',75000,'2022-02-12',1),
('Sunita','Patel','s.patel@ecom.in','9000000012','Clerk',35000,'2023-05-18',1),
('Arun','Reddy','a.reddy@ecom.in','9000000013','Loader',25000,'2024-01-10',2),
('Kavita','Jain','k.jain@ecom.in','9000000014','Supervisor',55000,'2023-07-21',3),
('Vivek','Gupta','v.gupta@ecom.in','9000000015','Driver',28000,'2024-04-15',4),
('Sneha','Mehta','s.mehta@ecom.in','9000000016','Manager',78000,'2023-11-01',5),
('Harish','Kumar','h.kumar@ecom.in','9000000017','Technician',40000,'2022-09-30',6),
('Priya','Shah','p.shah@ecom.in','9000000018','Operator',32000,'2024-05-09',7),
('Rohit','Nair','r.nair@ecom.in','9000000019','Driver',29000,'2024-06-01',8),
('Manju','Das','m.das@ecom.in','9000000020','Security',26000,'2022-08-11',9),
('Akash','Roy','a.roy@ecom.in','9000000021','Manager',80000,'2021-02-14',10),
('Lata','Sen','l.sen@ecom.in','9000000022','Helper',23000,'2023-10-10',3),
('Ankit','Yadav','a.yadav@ecom.in','9000000023','Technician',42000,'2022-03-09',2),
('Tanu','Kaur','t.kaur@ecom.in','9000000024','Supervisor',56000,'2022-12-18',4),
('Deepa','Verma','d.verma@ecom.in','9000000025','Clerk',34000,'2023-09-01',5),
('Rajat','Chowdhury','r.chow@ecom.in','9000000026','Loader',25000,'2024-02-10',6),
('Swati','Bose','s.bose@ecom.in','9000000027','Operator',31000,'2022-11-22',7),
('Neeraj','Menon','n.menon@ecom.in','9000000028','Security',27000,'2024-03-16',8),
('Arpita','Ghosh','a.ghosh@ecom.in','9000000029','Helper',23000,'2023-08-30',9),
('Ravi','Pillai','r.pillai@ecom.in','9000000030','Driver',28000,'2024-05-22',10);
select * from  employees;
-- ---------------------------------------------------------
-- 15. suppliers
CREATE TABLE suppliers (
  supplier_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(100),
  contact_person VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(100),
  gst_number VARCHAR(20),
  city VARCHAR(100),
  state VARCHAR(100),
  rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
  active BOOLEAN DEFAULT TRUE
);

INSERT INTO suppliers (company_name,contact_person,phone,email,gst_number,city,state,rating)
VALUES
('Alpha Distributors','Mahesh Bhat','9811000011','alpha@sup.in','29ABCD1234F1Z1','Bengaluru','Karnataka',4.7),
('Metro Traders','Pooja Singh','9811000012','metro@sup.in','07EFGH5678H2Y2','Delhi','Delhi',4.5),
('Sunrise Pvt Ltd','Rajesh Patel','9811000013','sunrise@sup.in','27JKLM9876K3P3','Mumbai','Maharashtra',4.8),
('Elite Supplies','Sneha Rao','9811000014','elite@sup.in','19MNOP6543L4M4','Hyderabad','Telangana',4.6),
('GreenLeaf Corp','Rohit Mehta','9811000015','green@sup.in','33QRST4321M5N5','Kolkata','West Bengal',4.3),
('Star Imports','Anita Verma','9811000016','star@sup.in','09UVWX8765N6O6','Chennai','Tamil Nadu',4.5),
('SmartLine Ltd','Nikhil Jain','9811000017','smart@sup.in','24YZAB1239O7P7','Pune','Maharashtra',4.4),
('EverGrow Co','Divya Desai','9811000018','ever@sup.in','32CDEF3458P8Q8','Jaipur','Rajasthan',4.6),
('Omega Traders','Suresh Reddy','9811000019','omega@sup.in','20GHIJ6582Q9R9','Ahmedabad','Gujarat',4.9),
('SkyHigh Pvt','Kavya Nair','9811000020','sky@sup.in','18KLMN9521R0S0','Lucknow','Uttar Pradesh',4.2);
select * from suppliers;

-- Total suppliers
SELECT COUNT(*) AS total_suppliers
FROM suppliers;

-- Suppliers currently active
SELECT supplier_name
FROM suppliers
WHERE is_active = TRUE;

-- Suppliers located in Mumbai
SELECT supplier_name, city
FROM suppliers
WHERE city = 'Mumbai';

-- Number of products supplied
SELECT supplier_id, COUNT(product_id) AS product_count
FROM products
GROUP BY supplier_id;

-- ---------------------------------------------------------
-- 16) coupons
CREATE TABLE coupons (
  coupon_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(255),
  discount_type ENUM('percentage','fixed') NOT NULL,
  discount_value DECIMAL(10,2) NOT NULL CHECK (discount_value >= 0),
  max_uses INT DEFAULT 1 CHECK (max_uses >= 0),
  used_count INT DEFAULT 0 CHECK (used_count >= 0),
  valid_from DATE NOT NULL,
  valid_to DATE NOT NULL,
  min_order_total DECIMAL(12,2) DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO coupons (code,description,discount_type,discount_value,max_uses,valid_from,valid_to,min_order_total,is_active)
VALUES
('WELCOMEIN','10% off for new users','percentage',10.00,100,'2025-01-01','2026-12-31',0,TRUE),
('DIWALI50','Flat Rs.50 off on Rs.500+','fixed',50.00,500,'2025-10-01','2025-11-10',500,TRUE),
('FREESHIP','Free shipping on Rs.299+','fixed',0.00,1000,'2025-01-01','2026-12-31',299,TRUE),
('GURUPURNIMA','15% off books','percentage',15.00,200,'2025-07-01','2026-07-01',0,TRUE),
('HAPPYHOLI','20% off selected','percentage',20.00,150,'2025-03-01','2025-03-31',199,TRUE),
('NEWYEAR2026','Rs.200 off','fixed',200.00,100,'2025-12-20','2026-01-10',1500,TRUE),
('STUDENT10','10% student discount','percentage',10.00,1000,'2025-01-01','2026-01-01',0,TRUE),
('MOTHERSDAY','Rs.150 off on beauty','fixed',150.00,200,'2025-05-01','2025-05-15',1000,TRUE),
('SUMMER25','25% summer sale','percentage',25.00,300,'2025-06-01','2025-06-30',499,TRUE),
('FLASH100','Rs.100 flash discount','fixed',100.00,500,'2025-09-25','2025-09-25',500,TRUE),
('EMPLOYEE5','5% staff discount','percentage',5.00,1000,'2025-01-01','2026-12-31',0,TRUE),
('REFER50','Refer friend Rs.50','fixed',50.00,10000,'2025-01-01','2026-12-31',0,TRUE),
('GROC10','10% on groceries','percentage',10.00,2000,'2025-01-01','2026-12-31',0,TRUE),
('ELECTRO5','5% electronics','percentage',5.00,500,'2025-01-01','2026-12-31',1000,TRUE),
('KITCHEN75','Rs.75 off kitchen','fixed',75.00,300,'2025-01-01','2026-12-31',400,TRUE),
('FESTIVE40','40% select categories','percentage',40.00,100,'2025-11-01','2025-11-15',999,TRUE),
('BIRTHDAY50','Rs.50 birthday credit','fixed',50.00,10000,'2025-01-01','2026-12-31',0,TRUE),
('CLEAROUT30','30% clearout','percentage',30.00,200,'2025-08-01','2025-08-31',0,TRUE),
('WEEKEND20','20% weekend deal','percentage',20.00,500,'2025-01-01','2026-12-31',0,TRUE),
('LOYALTY100','Rs.100 loyalty reward','fixed',100.00,1000,'2025-01-01','2026-12-31',500,TRUE);
select *from  coupons;
-- Active discount coupons
SELECT coupon_code, discount_percent
FROM coupons
WHERE is_active = TRUE;

-- Coupons expiring in next 7 days
SELECT coupon_code, expiry_date
FROM coupons
WHERE expiry_date <= CURDATE() + INTERVAL 7 DAY;

-- Coupon with maximum discount
SELECT coupon_code, discount_percent
FROM coupons
ORDER BY discount_percent DESC
LIMIT 1;

-- Total number of coupons
SELECT COUNT(*) AS total_coupons
FROM coupons;

-- Coupons valid on current date
SELECT coupon_code
FROM coupons
WHERE CURDATE() BETWEEN start_date AND expiry_date;

-- ----- ---------------------------------------------------
-- 17) coupon_redemptions
CREATE TABLE coupon_redemptions (
  redemption_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  coupon_id BIGINT NOT NULL,
  order_id BIGINT,
  customer_id BIGINT,
  redeemed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  discount_amount DECIMAL(12,2) NOT NULL,
  ip_address VARCHAR(50),
  user_agent VARCHAR(255),
  FOREIGN KEY (coupon_id) REFERENCES coupons(coupon_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO coupon_redemptions (coupon_id,order_id,customer_id,redeemed_at,discount_amount,ip_address,user_agent)
VALUES
(1,6,6,'2025-09-10 10:15:00',7999.90,'103.21.45.11','Mozilla/5.0 (Linux)'),
(2,4,4,'2025-10-05 12:25:00',50.00,'103.21.46.12','Mozilla/5.0 (Windows)'),
(3,7,7,'2025-08-14 09:05:00',0.00,'103.21.47.13','Mozilla/5.0 (Android)'),
(4,3,3,'2025-07-10 14:55:00',59.85,'103.21.48.14','Mozilla/5.0 (iPhone)'),
(5,15,15,'2025-06-20 18:40:00',124.75,'103.21.49.15','curl/7.68.0'),
(6,18,18,'2025-12-25 08:00:00',200.00,'103.21.50.16','PostmanRuntime/7.28.4'),
(7,9,9,'2025-02-02 15:10:00',99.90,'103.21.51.17','Mozilla/5.0 (Macintosh)'),
(8,11,11,'2025-05-09 11:45:00',150.00,'103.21.52.18','Mozilla/5.0 (Linux)'),
(9,13,13,'2025-06-12 13:22:00',92.60,'103.21.53.19','Mozilla/5.0 (Android)'),
(10,2,2,'2025-09-13 09:30:00',100.00,'103.21.54.20','Mozilla/5.0 (Windows)'),
(11,1,1,'2025-01-01 07:00:00',90.00,'103.21.55.21','Mozilla/5.0 (iOS)'),
(12,5,5,'2025-03-22 16:11:00',25.00,'103.21.56.22','Mozilla/5.0'),
(13,8,8,'2025-04-18 20:00:00',45.00,'103.21.57.23','Mozilla/5.0'),
(14,10,10,'2025-02-25 08:50:00',200.00,'103.21.58.24','Mozilla/5.0'),
(15,12,12,'2025-06-30 17:00:00',129.90,'103.21.59.25','PostmanRuntime/7.28.4'),
(16,14,14,'2025-07-15 12:00:00',75.00,'103.21.60.26','Mozilla/5.0'),
(17,16,16,'2025-09-05 09:10:00',60.00,'103.21.61.27','Mozilla/5.0'),
(18,17,17,'2025-11-11 21:20:00',40.00,'103.21.62.28','Mozilla/5.0'),
(19,19,19,'2025-08-08 14:40:00',20.00,'103.21.63.29','Mozilla/5.0'),
(20,20,20,'2025-09-01 10:10:00',100.00,'103.21.64.30','Mozilla/5.0');
select * from coupon_redemptions;

-- ---------------------------------------------------------
-- 18) carts
CREATE TABLE carts (
  cart_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  currency CHAR(3) DEFAULT 'INR',
  coupon_code VARCHAR(50),
  estimated_total DECIMAL(12,2) DEFAULT 0,
  items_count INT DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO carts (customer_id,created_at,updated_at,coupon_code,estimated_total,items_count,is_active)
VALUES
(1,'2025-09-01 09:00:00','2025-09-02 09:00:00','WELCOMEIN',17999.00,1,TRUE),
(2,'2025-09-02 10:00:00','2025-09-03 11:00:00',NULL,249.00,1,TRUE),
(3,'2025-09-03 08:30:00','2025-09-03 08:45:00','EMPLOYEE5',59999.00,1,TRUE),
(4,'2025-09-04 12:00:00','2025-09-05 12:00:00',NULL,2199.00,1,TRUE),
(5,'2025-09-05 13:00:00','2025-09-06 13:00:00','DIWALI50',349.00,1,TRUE),
(6,'2025-09-06 14:00:00','2025-09-06 14:30:00',NULL,79999.00,1,TRUE),
(7,'2025-09-07 15:20:00','2025-09-07 16:00:00',NULL,999.00,1,TRUE),
(8,'2025-09-08 09:40:00','2025-09-08 09:45:00','FREESHIP',4499.00,1,TRUE),
(9,'2025-09-09 11:10:00','2025-09-09 11:30:00',NULL,3499.00,1,TRUE),
(10,'2025-09-10 10:10:00','2025-09-10 10:20:00',NULL,2299.00,1,TRUE),
(11,'2025-09-11 09:00:00','2025-09-11 09:10:00',NULL,1299.00,1,TRUE),
(12,'2025-09-12 09:00:00','2025-09-12 09:40:00',NULL,599.00,1,TRUE),
(13,'2025-09-13 09:00:00','2025-09-13 09:05:00','STUDENT10',1799.00,1,TRUE),
(14,'2025-09-14 09:00:00','2025-09-14 09:50:00',NULL,499.00,1,TRUE),
(15,'2025-09-15 09:00:00','2025-09-15 09:25:00',NULL,999.00,1,TRUE),
(16,'2025-09-16 09:00:00','2025-09-16 09:30:00','GROC10',249.00,1,TRUE),
(17,'2025-09-17 09:00:00','2025-09-17 09:35:00',NULL,799.00,1,TRUE),
(18,'2025-09-18 09:00:00','2025-09-18 09:20:00','SUMMER25',129999.00,1,TRUE),
(19,'2025-09-19 09:00:00','2025-09-19 09:45:00',NULL,599.00,1,TRUE),
(20,'2025-09-20 09:00:00','2025-09-20 09:15:00',NULL,999.00,1,TRUE);
select * from carts;
-- Fetch all active carts
SELECT cart_id, user_id
FROM carts
WHERE is_active = TRUE;

-- Total number of carts
SELECT COUNT(*) AS total_carts
FROM carts;

-- Carts created today
SELECT *
FROM carts
WHERE DATE(created_at) = CURDATE();

-- Fetch cart along with user name
SELECT c.cart_id, u.full_name
FROM carts c
JOIN users u ON c.user_id = u.user_id;

-- Most recent cart
SELECT *
FROM carts
ORDER BY created_at DESC
LIMIT 1;



-- ---------------------------------------------------------
-- 19) cart_items
CREATE TABLE cart_items (
  cart_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  cart_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  sku VARCHAR(100),
  quantity INT DEFAULT 1 CHECK (quantity > 0),
  added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  price_at_add DECIMAL(12,2) NOT NULL,
  attributes JSON,
  row_total DECIMAL(12,2) GENERATED ALWAYS AS (quantity * price_at_add) STORED,
  is_saved_for_later BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO cart_items (cart_id, product_id, sku, quantity, added_at, price_at_add, attributes, is_saved_for_later)
VALUES
(1,19,'SKUIN019',1,'2025-09-01 09:00:00',17999.00,JSON_OBJECT('color','black'),0),
(2,6,'SKUIN006',1,'2025-09-02 10:00:00',249.00,JSON_OBJECT('size','100ml'),0),
(3,12,'SKUIN012',1,'2025-09-03 08:30:00',59999.00,JSON_OBJECT('ram','8GB'),0),
(4,5,'SKUIN005',1,'2025-09-04 12:00:00',2199.00,NULL,0),
(5,20,'SKUIN020',1,'2025-09-05 13:00:00',349.00,NULL,0),
(6,1,'SKUIN001',1,'2025-09-06 14:00:00',79999.00,JSON_OBJECT('warranty','1yr'),0),
(7,18,'SKUIN018',1,'2025-09-07 15:20:00',999.00,NULL,0),
(8,17,'SKUIN017',1,'2025-09-08 09:40:00',4499.00,JSON_OBJECT('color','blue'),0),
(9,16,'SKUIN016',1,'2025-09-09 11:10:00',3499.00,NULL,0),
(10,9,'SKUIN009',1,'2025-09-10 10:10:00',2299.00,NULL,0),
(11,4,'SKUIN004',1,'2025-09-11 09:00:00',1299.00,NULL,0),
(12,10,'SKUIN010',1,'2025-09-12 09:00:00',599.00,NULL,0),
(13,14,'SKUIN014',1,'2025-09-13 09:00:00',1799.00,NULL,0),
(14,7,'SKUIN007',1,'2025-09-14 09:00:00',499.00,NULL,0),
(15,18,'SKUIN018',1,'2025-09-15 09:00:00',999.00,NULL,0),
(16,6,'SKUIN006',1,'2025-09-16 09:00:00',249.00,NULL,0),
(17,13,'SKUIN013',1,'2025-09-17 09:00:00',799.00,NULL,0),
(18,2,'SKUIN002',1,'2025-09-18 09:00:00',129999.00,NULL,0),
(19,10,'SKUIN010',1,'2025-09-19 09:00:00',599.00,NULL,0),
(20,9,'SKUIN009',1,'2025-09-20 09:00:00',2299.00,NULL,0);

select * from cart_items;

-- Products added to a specific cart
SELECT product_id, quantity
FROM cart_items
WHERE cart_id = 1;

-- Calculate total value of cart
SELECT SUM(quantity * price_per_unit) AS cart_total
FROM cart_items
WHERE cart_id = 1;

-- Product added most frequently
SELECT product_id, SUM(quantity) AS total_quantity
FROM cart_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;

-- Average quantity
SELECT AVG(quantity) AS avg_quantity
FROM cart_items;

-- Join cart items with products
SELECT p.product_name, c.quantity
FROM cart_items c
JOIN products p ON c.product_id = p.product_id;

-- ---------------------------------------------------------
-- 20) wishlists
CREATE TABLE wishlists (
  wishlist_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  name VARCHAR(150) DEFAULT 'My Wishlist',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_public BOOLEAN DEFAULT FALSE,
  items_count INT DEFAULT 0,
  notes TEXT,
  slug VARCHAR(200) UNIQUE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO wishlists (customer_id,name,created_at,updated_at,is_public,items_count,notes,slug)
VALUES
(1,'Birthday Wishlist','2025-01-01 09:00:00','2025-01-01 09:00:00',FALSE,2,'Want gadgets','wish-arjun-1'),
(2,'Reading List','2025-01-03 10:00:00','2025-01-03 10:00:00',TRUE,3,'Books to buy','wish-riya-1'),
(3,'Electronics','2025-02-01 09:10:00','2025-02-01 09:10:00',FALSE,1,'Laptop only','wish-raj-1'),
(4,'Home Needs','2025-03-01 09:20:00','2025-03-01 09:20:00',TRUE,4,'Cookware list','wish-sneha-1'),
(5,'Gifts','2025-04-10 08:00:00','2025-04-10 08:00:00',FALSE,2,'Gift ideas','wish-amit-1'),
(6,'Weekly Grocery','2025-05-05 07:00:00','2025-05-05 07:00:00',FALSE,8,'Groceries','wish-neha-1'),
(7,'Kids Toys','2025-06-06 09:00:00','2025-06-06 09:00:00',FALSE,5,'Toys list','wish-rahul-1'),
(8,'Audio Gear','2025-07-07 09:10:00','2025-07-07 09:10:00',TRUE,2,'Speakers','wish-pooja-1'),
(9,'Sports Gear','2025-08-08 10:00:00','2025-08-08 10:00:00',FALSE,3,'Training items','wish-vijay-1'),
(10,'Office','2025-08-10 11:00:00','2025-08-10 11:00:00',FALSE,2,'Stationery','wish-kavya-1'),
(11,'Home Appliances','2025-08-11 12:00:00','2025-08-11 12:00:00',FALSE,1,'Pressure cooker','wish-suresh-1'),
(12,'Books to read','2025-08-12 13:00:00','2025-08-12 13:00:00',TRUE,6,'Non-fiction','wish-anita-1'),
(13,'Clothing','2025-08-13 14:00:00','2025-08-13 14:00:00',FALSE,3,'Shirts','wish-manish-1'),
(14,'Fitness','2025-08-14 15:00:00','2025-08-14 15:00:00',FALSE,4,'Rackets & balls','wish-priya-1'),
(15,'Pet Supplies','2025-08-15 16:00:00','2025-08-15 16:00:00',FALSE,2,'Dog food','wish-deepak-1'),
(16,'Beauty picks','2025-08-16 17:00:00','2025-08-16 17:00:00',TRUE,5,'Skincare','wish-aisha-1'),
(17,'Budget Buys','2025-08-17 18:00:00','2025-08-17 18:00:00',FALSE,6,'Under 500','wish-rohit-1'),
(18,'Luxury','2025-08-18 19:00:00','2025-08-18 19:00:00',FALSE,2,'High end','wish-isha-1'),
(19,'Study Aid','2025-08-19 20:00:00','2025-08-19 20:00:00',TRUE,3,'Study items','wish-vishal-1'),
(20,'Gadget Watchlist','2025-08-20 21:00:00','2025-08-20 21:00:00',FALSE,4,'Phones & watches','wish-meera-1');
select * from wishlists;

SELECT wishlist_id, wishlist_name
FROM wishlists
WHERE user_id = 1;

SELECT COUNT(*) AS total_wishlists
FROM wishlists;

SELECT wishlist_name
FROM wishlists
WHERE is_public = TRUE;

SELECT *
FROM wishlists
ORDER BY created_at DESC
LIMIT 1;



-- ---------------------------------------------------------
-- 21) wishlist_items
CREATE TABLE wishlist_items (
  wishlist_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  wishlist_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  note VARCHAR(255),
  desired_price DECIMAL(12,2),
  is_active BOOLEAN DEFAULT TRUE,
  priority INT DEFAULT 5 CHECK (priority BETWEEN 1 AND 10),
  product_snapshot JSON,
  FOREIGN KEY (wishlist_id) REFERENCES wishlists(wishlist_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO wishlist_items (wishlist_id, product_id, added_at, note, desired_price, is_active, priority, product_snapshot)
VALUES
(1,1,'2025-01-01 09:05:00','For birthday',17999.00,TRUE,1,JSON_OBJECT('title','Samsung Galaxy S24')),
(1,14,'2025-01-02 10:05:00','For cricket',1799.00,TRUE,3,JSON_OBJECT('title','Yonex Racket')),
(2,3,'2025-01-03 11:10:00','Must read',399.00,TRUE,2,JSON_OBJECT('title','Monk Who Sold His Ferrari')),
(2,20,'2025-01-04 12:15:00','Personal finance',349.00,TRUE,2,JSON_OBJECT('title','Rich Dad Poor Dad')),
(3,12,'2025-02-01 09:30:00','Laptop target',59999.00,TRUE,1,NULL),
(4,5,'2025-03-01 09:35:00','Pan for kitchen',2199.00,TRUE,4,NULL),
(5,6,'2025-04-10 08:05:00','Face cream',249.00,TRUE,5,NULL),
(6,7,'2025-05-05 07:20:00','Rice essential',499.00,TRUE,2,NULL),
(7,8,'2025-06-06 09:40:00','Shampoo for kids',189.00,TRUE,6,NULL),
(8,11,'2025-07-07 09:55:00','Headphones interest',1999.00,TRUE,3,NULL),
(9,9,'2025-08-08 10:10:00','Toys for son',2299.00,TRUE,2,NULL),
(10,10,'2025-08-10 11:20:00','Stationery pack',9.99,TRUE,7,NULL),
(11,4,'2025-08-11 12:30:00','Kurta set',1299.00,TRUE,5,NULL),
(12,13,'2025-08-12 13:40:00','Shirts',799.00,TRUE,4,NULL),
(13,15,'2025-08-13 14:50:00','Facewash try',199.00,TRUE,8,NULL),
(14,16,'2025-08-14 15:00:00','Mixer',3499.00,TRUE,3,NULL),
(15,17,'2025-08-15 16:10:00','Speaker interest',4499.00,TRUE,2,NULL),
(16,18,'2025-08-16 17:20:00','Doll set for niece',999.00,TRUE,6,NULL),
(17,19,'2025-08-17 18:30:00','Budget phone watch',17999.00,TRUE,3,NULL),
(18,2,'2025-08-18 19:40:00','Apple phone dream',129999.00,TRUE,1,NULL);


select * from wishlist_items ;

SELECT product_id, priority
FROM wishlist_items
WHERE wishlist_id = 1;

SELECT product_id
FROM wishlist_items
WHERE priority <= 3;

SELECT *
FROM wishlist_items
WHERE is_active = TRUE;

SELECT wishlist_id, COUNT(*) AS total_items
FROM wishlist_items
GROUP BY wishlist_id;





-- ---------------------------------------------------------
-- 22) support_tickets
CREATE TABLE support_tickets (
  ticket_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT,
  order_id BIGINT,
  subject VARCHAR(255),
  message TEXT,
  status ENUM('open','in_progress','resolved','closed') DEFAULT 'open',
  priority ENUM('low','medium','high') DEFAULT 'medium',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  resolved_at DATETIME,
  assigned_to VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO support_tickets (customer_id,order_id,subject,message,status,priority,created_at,assigned_to)
VALUES
(1,1,'Missing accessory','I did not receive the charger.','open','high','2025-09-13 09:00:00','Ramesh Iyer'),
(2,2,'Wrong color','Product color not as shown.','resolved','medium','2025-08-02 10:12:00','Sunita Patel'),
(3,3,'Warranty question','How to claim warranty?','in_progress','low','2025-07-05 11:05:00','Arun Reddy'),
(4,4,'Late delivery','Order delayed by 5 days.','resolved','high','2025-09-10 13:20:00','Kavita Jain'),
(5,5,'Refund status','When will refund process?','open','medium','2025-09-15 14:00:00','Vivek Gupta'),
(6,6,'Damage on arrival','Product damaged on delivery.','in_progress','high','2025-09-16 15:00:00','Sneha Mehta'),
(7,7,'Exchange request','Want to exchange for size L.','open','medium','2025-09-17 10:30:00','Harish Kumar'),
(8,8,'Invoice issue','Invoice not matching order.','resolved','low','2025-09-18 12:40:00','Priya Shah'),
(9,9,'Missing parts','Box missing parts', 'open','high','2025-09-19 09:22:00','Rohit Nair'),
(10,10,'Coupon not working','Coupon code shows invalid.','resolved','low','2025-09-20 11:35:00','Manju Das'),
(11,11,'Product not as described','Material quality poor.','open','medium','2025-09-21 08:00:00','Akash Roy'),
(12,12,'App crash','App crashes on checkout.','in_progress','high','2025-09-22 09:15:00','Lata Sen'),
(13,13,'Shipping address change','Need to change shipping address.','resolved','low','2025-09-23 10:50:00','Ankit Yadav'),
(14,14,'Size mismatch','Kurta size not correct.','open','medium','2025-09-24 16:10:00','Tanu Kaur'),
(15,15,'Refund delay','Refund taking too long.','in_progress','high','2025-09-25 17:20:00','Deepa Verma'),
(16,16,'Order cancellation','Cancel my order please.','resolved','low','2025-09-26 18:30:00','Rajat Chowdhury'),
(17,17,'Product inquiry','Is the camera lens glass?','open','low','2025-09-27 19:40:00','Swati Bose'),
(18,18,'Bulk order','Inquiry for bulk purchase','open','medium','2025-09-28 20:00:00','Neeraj Menon'),
(19,19,'Payment failure','Payment failed but money deducted.','in_progress','high','2025-09-29 09:55:00','Arpita Ghosh'),
(20,20,'Return pickup','Schedule pickup for return.','open','medium','2025-09-30 10:05:00','Ravi Pillai');

select * from support_tickets;

-- Fetch open tickets with high priority
SELECT ticket_id, subject, priority, assigned_to, created_at
FROM support_tickets
WHERE status = 'open'
  AND priority = 'high';

-- Number of tickets in each status
SELECT status, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY status;
-- Average days taken to resolve tickets
SELECT AVG(DATEDIFF(resolved_at, created_at)) AS avg_resolution_days
FROM support_tickets
WHERE resolved_at IS NOT NULL;

-- Mark a ticket as resolved
UPDATE support_tickets
SET status = 'resolved',
    resolved_at = CURRENT_TIMESTAMP
WHERE ticket_id = 1;



-- ---------------------------------------------------------
-- 23) notifications
CREATE TABLE notifications (
  notification_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT,
  title VARCHAR(200),
  body TEXT,
  is_read BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  channel ENUM('email','sms','push') DEFAULT 'email',
  entity_type VARCHAR(50),
  entity_id BIGINT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO notifications (customer_id,title,body,is_read,created_at,channel,entity_type,entity_id)
VALUES
(1,'Order shipped','Your order ORD-1 has been shipped',FALSE,'2025-09-12 10:00:00','push','order',1),
(2,'Price drop','Price dropped for item in your wishlist',FALSE,'2025-09-13 11:00:00','email','product',3),
(3,'Coupon applied','You used WELCOMEIN coupon',TRUE,'2025-09-14 12:00:00','email','coupon',1),
(4,'Delivery delayed','Delivery may be delayed due to weather',FALSE,'2025-09-15 13:00:00','sms','order',4),
(5,'Refund processed','Refund issued for your return',TRUE,'2025-09-16 14:00:00','email','return',1),
(6,'New message','Support replied to your ticket',FALSE,'2025-09-17 15:00:00','push','ticket',1),
(7,'Order delivered','Order delivered successfully',TRUE,'2025-09-18 16:00:00','email','order',7),
(8,'Low stock','An item in your cart is low in stock',FALSE,'2025-09-19 17:00:00','push','product',17),
(9,'Sale reminder','Weekend sale starts tomorrow!',FALSE,'2025-09-20 18:00:00','email','sale',NULL),
(10,'Wishlist alert','An item in wishlist is back in stock',FALSE,'2025-09-21 19:00:00','sms','product',14),
(11,'Payment success','Payment received for order',TRUE,'2025-09-22 20:00:00','email','order',11),
(12,'Policy update','New return policy effective',FALSE,'2025-09-23 09:00:00','email','policy',NULL),
(13,'Shipment info','Your order is out for delivery',FALSE,'2025-09-24 10:00:00','push','shipment',3),
(14,'Offer for you','Exclusive coupon for you',FALSE,'2025-09-25 11:00:00','email','coupon',9),
(15,'Recommendation','We think you may like this product',FALSE,'2025-09-26 12:00:00','push','product',2),
(16,'Security alert','New login from a new device',TRUE,'2025-09-27 13:00:00','email','security',NULL),
(17,'Subscription','Your Prime subscription renewed',FALSE,'2025-09-28 14:00:00','email','subscription',NULL),
(18,'Account note','Please verify your phone number',FALSE,'2025-09-29 15:00:00','sms','account',1),
(19,'Feedback request','Please rate your recent purchase',FALSE,'2025-09-30 16:00:00','push','order',9),
(20,'Cart reminder','Items in cart are waiting',FALSE,'2025-10-01 17:00:00','push','cart',1);
select * from notifications ;

-- Fetch unread notifications
SELECT notification_id, message
FROM notifications
WHERE is_read = FALSE;

-- Notifications for a specific user
SELECT message, created_at
FROM notifications
WHERE user_id = 1;

-- Recent notifications
SELECT *
FROM notifications
ORDER BY created_at DESC
LIMIT 5;

-- Update notification status
UPDATE notifications
SET is_read = TRUE
WHERE notification_id = 10;


-- ---------------------------------------------------------
-- 24) admin_users
CREATE TABLE admin_users (
  admin_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(128) NOT NULL,
  full_name VARCHAR(150),
  role ENUM('superadmin','admin','moderator','support') DEFAULT 'moderator',
  is_active BOOLEAN DEFAULT TRUE,
  last_login DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  two_factor_enabled BOOLEAN DEFAULT FALSE,
  notes TEXT
);

INSERT INTO admin_users (username,email,password_hash,full_name,role,is_active,last_login,two_factor_enabled,notes)
VALUES
('superadmin','super@ecom.in','hash_super','Arvind Menon','superadmin',TRUE,'2025-09-01 09:00:00',TRUE,'Full access'),
('ops_admin','ops@ecom.in','hash_ops','Priya Nair','admin',TRUE,'2025-09-10 10:00:00',FALSE,'Operations'),
('mod_raj','raj.mod@ecom.in','hash_mod','Rajesh Kumar','moderator',TRUE,'2025-09-11 11:00:00',FALSE,'Moderation'),
('support1','support1@ecom.in','hash_sup1','Meera Joshi','support',TRUE,'2025-09-12 12:00:00',FALSE,'Support team'),
('support2','support2@ecom.in','hash_sup2','Vikram Sinha','support',TRUE,'2025-09-13 13:00:00',FALSE,'Support team'),
('catalog_admin','catalog@ecom.in','hash_cat','Neha Bhatia','admin',TRUE,'2025-09-14 14:00:00',TRUE,'Catalog manager'),
('finance','finance@ecom.in','hash_fin','Anupam Roy','admin',TRUE,'2025-09-15 15:00:00',TRUE,'Finance'),
('logistics','logi@ecom.in','hash_log','Kiran Deshpande','admin',TRUE,'2025-09-16 16:00:00',FALSE,'Logistics'),
('hr_admin','hr@ecom.in','hash_hr','Sneha Kapoor','admin',TRUE,'2025-09-17 17:00:00',FALSE,'HR'),
('analytics','data@ecom.in','hash_data','Aakash Verma','admin',TRUE,'2025-09-18 18:00:00',TRUE,'Analytics'),
('qa1','qa1@ecom.in','hash_qa1','Divya Menon','moderator',TRUE,'2025-09-19 09:00:00',FALSE,'QA'),
('qa2','qa2@ecom.in','hash_qa2','Rohit Mehra','moderator',TRUE,'2025-09-20 10:00:00',FALSE,'QA'),
('devops','devops@ecom.in','hash_dev','Pranav Joshi','admin',TRUE,'2025-09-21 11:00:00',TRUE,'Infrastructure'),
('product','product@ecom.in','hash_prod','Sana Khan','admin',TRUE,'2025-09-22 12:00:00',FALSE,'Product'),
('marketing','mkt@ecom.in','hash_mkt','Ritu Jain','admin',TRUE,'2025-09-23 13:00:00',FALSE,'Marketing'),
('seller_support','seller@ecom.in','hash_seller','Amitabh Sen','support',TRUE,'2025-09-24 14:00:00',FALSE,'Seller support'),
('compliance','comp@ecom.in','hash_comp','Lalit Rao','admin',TRUE,'2025-09-25 15:00:00',TRUE,'Compliance'),
('security','sec@ecom.in','hash_sec','Rajiv Bhat','admin',TRUE,'2025-09-26 16:00:00',TRUE,'Security'),
('billing','billing@ecom.in','hash_bill','Geeta Reddy','admin',TRUE,'2025-09-27 17:00:00',FALSE,'Billing'),
('ops2','ops2@ecom.in','hash_ops2','Suresh Nair','moderator',TRUE,'2025-09-28 18:00:00',FALSE,'Operations');
select * from admin_users;
SELECT admin_id, username, full_name, role
FROM admin_users
WHERE is_active = TRUE
  AND role IN ('admin','superadmin');
  
  SELECT username, email, role
FROM admin_users
WHERE two_factor_enabled = TRUE;

SELECT username, last_login
FROM admin_users
WHERE last_login BETWEEN '2025-09-01' AND '2025-09-30';

SELECT role, COUNT(*) AS total_users
FROM admin_users
GROUP BY role;

UPDATE admin_users
SET is_active = FALSE
WHERE username = 'ops2';


-- ---------------------------------------------------------
-- 25) settings (simple key-value platform settings)
CREATE TABLE settings (
  setting_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  `key` VARCHAR(150) NOT NULL UNIQUE,
  `value` TEXT,
  description VARCHAR(255),
  env ENUM('prod','staging','dev') DEFAULT 'prod',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO settings (`key`,`value`,description,env,is_active)
VALUES
('site_name','Ecom India','Public site name','prod',TRUE),
('support_email','support@ecom.in','Support contact email','prod',TRUE),
('max_cart_items','50','Maximum items allowed in cart','prod',TRUE),
('default_currency','INR','Site currency','prod',TRUE),
('tax_rate','18','Default GST percent','prod',TRUE),
('free_shipping_min','299','Free shipping threshold','prod',TRUE),
('return_days','30','Default days allowed for return','prod',TRUE),
('shipment_provider','Delhivery','Primary shipment partner','prod',TRUE),
('items_per_page','20','Pagination items per page','prod',TRUE),
('maintenance_mode','false','Toggle maintenance','prod',TRUE),
('otp_expiry_minutes','10','OTP expiry time in minutes','prod',TRUE),
('password_min_length','8','Password minimum length','prod',TRUE),
('two_factor_required','false','Require 2FA for admin','prod',TRUE),
('default_language','en','Default site language','prod',TRUE),
('max_login_attempts','5','Max login attempts before lock','prod',TRUE),
('promotion_banner','Autumn Sale Live','Homepage banner text','prod',TRUE),
('analytics_enabled','true','Enable analytics collection','prod',TRUE),
('email_from_name','Ecom India Support','From name for emails','prod',TRUE),
('refund_policy_url','/policies/refund','Refund policy link','prod',TRUE),
('privacy_policy_url','/policies/privacy','Privacy policy link','prod',TRUE);
select * from settings;

SELECT `key`, `value`
FROM settings
WHERE `key` LIKE '%password%'
   OR `key` LIKE '%login%'
   OR `key` LIKE '%two_factor%';

SELECT `key`, `value`, description
FROM settings
WHERE env = 'prod' AND is_active = TRUE;

UPDATE settings
SET `value` = '20'
WHERE `key` = 'tax_rate';

SELECT `value`
FROM settings
WHERE `key` = 'maintenance_mode';

SELECT env, COUNT(*) AS total_settings
FROM settings
GROUP BY env;
-- -------------------------------------------------------------------------------------------------------------
-- PHASE3
-- LY JOINS (CUSTOMERS FOCUS)

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- FT JOIN – Customers without Orders
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;



SELECT o.order_id, c.customer_id, c.first_name
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_id, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- LF JOIN – Customers with Same Last Name
SELECT c1.first_name, c1.last_name, c2.first_name
FROM customers c1
JOIN customers c2
ON c1.last_name = c2.last_name
AND c1.customer_id <> c2.customer_id;

-- OSS JOIN – Customers × Products
SELECT c.first_name, p.product_name
FROM customers c
CROSS JOIN products p;

-- lti-Table JOIN – Customer → Orders → Payments
SELECT c.first_name, o.order_id, p.payment_method, p.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;


SELECT first_name, loyalty_points
FROM customers
WHERE loyalty_points = (SELECT MAX(loyalty_points) FROM customers);


-- stomers Who Placed Orders
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);


-- stomers Who Never Ordered
SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);





SELECT first_name, last_name
FROM customers c
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
);


SELECT first_name, birthdate
FROM customers
WHERE birthdate < ANY (
  SELECT birthdate
  FROM customers
  WHERE gender = 'female'
);


SELECT first_name, birthdate
FROM customers
WHERE birthdate <= ALL (SELECT birthdate FROM customers);


SELECT c.first_name, t.total_orders
FROM customers c
JOIN (
  SELECT customer_id, COUNT(*) AS total_orders
  FROM orders
  GROUP BY customer_id
) t
ON c.customer_id = t.customer_id;

SELECT first_name,
       (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS total_orders
FROM customers c;


SELECT first_name,
TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM customers;

SELECT UPPER(first_name), LENGTH(email)
FROM customers;


DELIMITER //
CREATE FUNCTION get_customer_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END //
DELIMITER ;

SELECT first_name, get_customer_age(birthdate) AS age
FROM customers;

-- -----------------------------------------------------------------------------------------------------------

-- 3.1 INNER JOIN – Sellers with Products
SELECT s.company_name, p.product_name, p.price
FROM sellers s
INNER JOIN products p ON s.seller_id = p.seller_id;

-- 3.2 LEFT JOIN – Sellers Without Products
SELECT s.company_name
FROM sellers s
LEFT JOIN products p ON s.seller_id = p.seller_id
WHERE p.product_id IS NULL;

-- 3.3 RIGHT JOIN – Products Without Seller Mapping
SELECT p.product_name, s.company_name
FROM sellers s
RIGHT JOIN products p ON s.seller_id = p.seller_id;

-- 3.4 FULL OUTER JOIN (MySQL workaround)
SELECT s.company_name, p.product_name
FROM sellers s
LEFT JOIN products p ON s.seller_id = p.seller_id
UNION
SELECT s.company_name, p.product_name
FROM sellers s
RIGHT JOIN products p ON s.seller_id = p.seller_id;

-- 3.5 SELF JOIN – Sellers with Same Rating
SELECT s1.company_name, s2.company_name, s1.rating
FROM sellers s1
JOIN sellers s2 ON s1.rating = s2.rating AND s1.seller_id <> s2.seller_id;

-- 3.6 CROSS JOIN – Sellers × Customers
SELECT s.company_name, c.first_name
FROM sellers s
CROSS JOIN customers c;

-- 3.7 Multi-Table JOIN – Seller → Product → Orders
SELECT s.company_name, o.order_id, o.order_date
FROM sellers s
JOIN products p ON s.seller_id = p.seller_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id;

-- 3.8 Seller Revenue Using Joins
SELECT s.company_name, SUM(oi.quantity * p.price) AS total_revenue
FROM sellers s
JOIN products p ON s.seller_id = p.seller_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY s.company_name;

-- 3.9 Scalar Subquery – Seller with Highest Rating
SELECT company_name, rating
FROM sellers
WHERE rating = (SELECT MAX(rating) FROM sellers);

-- 3.10 Subquery with IN – Sellers Who Have Products
SELECT company_name
FROM sellers
WHERE seller_id IN (SELECT seller_id FROM products);

-- 3.11 Subquery with NOT IN – Sellers Without Products
SELECT company_name
FROM sellers
WHERE seller_id NOT IN (SELECT seller_id FROM products);

-- 3.12 Correlated Subquery – Sellers with More Than Average Products
SELECT s.company_name
FROM sellers s
WHERE (SELECT COUNT(*) FROM products p WHERE p.seller_id = s.seller_id)
> (SELECT AVG(prod_count) FROM (SELECT COUNT(*) AS prod_count FROM products GROUP BY seller_id) t);

-- 3.13 EXISTS – Sellers Who Received Orders
SELECT company_name
FROM sellers s
WHERE EXISTS (
  SELECT 1
  FROM products p
  JOIN order_items oi ON p.product_id = oi.product_id
  WHERE p.seller_id = s.seller_id
);

-- 3.14 ANY – Sellers with Rating Higher Than Any Inactive Seller
SELECT company_name, rating
FROM sellers
WHERE rating > ANY (SELECT rating FROM sellers WHERE is_active = FALSE);

-- 3.15 ALL – Seller with Lowest Rating
SELECT company_name, rating
FROM sellers
WHERE rating <= ALL (SELECT rating FROM sellers);

-- 3.16 Subquery in FROM – Product Count Per Seller
SELECT s.company_name, t.total_products
FROM sellers s
JOIN (SELECT seller_id, COUNT(*) AS total_products FROM products GROUP BY seller_id) t
ON s.seller_id = t.seller_id;

-- 3.17 Subquery in SELECT – Seller Product Count
SELECT company_name,
(SELECT COUNT(*) FROM products p WHERE p.seller_id = s.seller_id) AS product_count
FROM sellers s;

-- 3.18 Built-in Functions – String & Numeric
SELECT UPPER(company_name) AS company,
ROUND(rating,1) AS rounded_rating,
LENGTH(contact_email) AS email_length
FROM sellers;

-- 3.19 User-Defined Function – Seller Rating Category
DELIMITER //
CREATE FUNCTION seller_rating_category(r DECIMAL(2,1))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF r >= 4.5 THEN
    RETURN 'Excellent';
  ELSEIF r >= 4.0 THEN
    RETURN 'Good';
  ELSE
    RETURN 'Average';
  END IF;
END //
DELIMITER ;

-- 3.20 Use the User-Defined Function
SELECT company_name, rating,
seller_rating_category(rating) AS rating_status
FROM sellers;
-- -------------------------------------------------------------------------------------------------------------------

-- 3.1 INNER JOIN – Products with Sellers
SELECT p.title, s.company_name, p.price
FROM products p
INNER JOIN sellers s ON p.seller_id = s.seller_id;

-- 3.2 LEFT JOIN – Products without Orders
SELECT p.title, p.price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- 3.3 RIGHT JOIN – Orders without Product (Data Integrity)
SELECT oi.order_id, p.title
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- 3.4 FULL OUTER JOIN – Products × Orders
SELECT p.title, oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
UNION
SELECT p.title, oi.order_id
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- 3.5 SELF JOIN – Products with Same Price
SELECT p1.title AS product1, p2.title AS product2, p1.price
FROM products p1
JOIN products p2 ON p1.price = p2.price AND p1.product_id <> p2.product_id;

-- 3.6 CROSS JOIN – Products × Customers (Promotions)
SELECT p.title, c.first_name
FROM products p
CROSS JOIN customers c;

-- 3.7 Multi-Table JOIN – Product → Order_Items → Orders → Customers
SELECT p.title, o.order_id, c.first_name, o.order_date
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

-- 3.8 Total Revenue Per Product
SELECT p.title, SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

-- 3.9 Scalar Subquery – Most Expensive Product
SELECT title, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- 3.10 Subquery with IN – Products Ordered
SELECT title
FROM products
WHERE product_id IN (SELECT product_id FROM order_items);

-- 3.11 Subquery with NOT IN – Products Never Ordered
SELECT title
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

-- 3.12 Correlated Subquery – Products Priced Above Average in Category
SELECT p.title, p.price
FROM products p
WHERE p.price > (
  SELECT AVG(p2.price)
  FROM products p2
  WHERE p2.category_id = p.category_id
);

-- 3.13 EXISTS – Products that Have Orders
SELECT title
FROM products p
WHERE EXISTS (
  SELECT 1
  FROM order_items oi
  WHERE oi.product_id = p.product_id
);

-- 3.14 ANY – Products Cheaper Than Any Product in Category 1
SELECT title, price
FROM products
WHERE price < ANY (SELECT price FROM products WHERE category_id = 1);

-- 3.15 ALL – Product with Lowest Price
SELECT title, price
FROM products
WHERE price <= ALL (SELECT price FROM products);

-- 3.16 Subquery in FROM – Total Orders Per Product
SELECT p.title, t.total_orders
FROM products p
JOIN (
  SELECT product_id, COUNT(*) AS total_orders
  FROM order_items
  GROUP BY product_id
) t ON p.product_id = t.product_id;

-- 3.17 Subquery in SELECT – Order Count Per Product
SELECT title, 
  (SELECT COUNT(*) FROM order_items oi WHERE oi.product_id = p.product_id) AS order_count
FROM products p;

-- 3.18 Built-in Functions – Price & String
SELECT UPPER(title) AS product_name, ROUND(price,2) AS rounded_price, LENGTH(title) AS name_length
FROM products;

-- 3.19 User-Defined Function – Product Price Category
DELIMITER //
CREATE FUNCTION product_price_category(p_price DECIMAL(12,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF p_price >= 50000 THEN
    RETURN 'Premium';
  ELSEIF p_price >= 1000 THEN
    RETURN 'Midrange';
  ELSE
    RETURN 'Budget';
  END IF;
END //
DELIMITER ;

-- 3.20 Use the User-Defined Function
SELECT title, price, product_price_category(price) AS price_category
FROM products;
-- ------------------------------------------------------------------------------------------------
-- 3.1 INNER JOIN – Products with Sellers
SELECT p.title, s.company_name, p.price
FROM products p
INNER JOIN sellers s ON p.seller_id = s.seller_id;

-- 3.2 LEFT JOIN – Products without Orders
SELECT p.title, p.price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- 3.3 RIGHT JOIN – Orders without Product (Data Integrity)
SELECT oi.order_id, p.title
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- 3.4 FULL OUTER JOIN – Products × Orders
SELECT p.title, oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
UNION
SELECT p.title, oi.order_id
FROM products p
RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- 3.5 SELF JOIN – Products with Same Price
SELECT p1.title AS product1, p2.title AS product2, p1.price
FROM products p1
JOIN products p2 ON p1.price = p2.price AND p1.product_id <> p2.product_id;

-- 3.6 CROSS JOIN – Products × Customers (Promotions)
SELECT p.title, c.first_name
FROM products p
CROSS JOIN customers c;

-- 3.7 Multi-Table JOIN – Product → Order_Items → Orders → Customers
SELECT p.title, o.order_id, c.first_name, o.order_date
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

-- 3.8 Total Revenue Per Product
SELECT p.title, SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

-- 3.9 Scalar Subquery – Most Expensive Product
SELECT title, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- 3.10 Subquery with IN – Products Ordered
SELECT title
FROM products
WHERE product_id IN (SELECT product_id FROM order_items);

-- 3.11 Subquery with NOT IN – Products Never Ordered
SELECT title
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

-- 3.12 Correlated Subquery – Products Priced Above Average in Category
SELECT p.title, p.price
FROM products p
WHERE p.price > (
  SELECT AVG(p2.price)
  FROM products p2
  WHERE p2.category_id = p.category_id
);

-- 3.13 EXISTS – Products that Have Orders
SELECT title
FROM products p
WHERE EXISTS (
  SELECT 1
  FROM order_items oi
  WHERE oi.product_id = p.product_id
);

-- 3.14 ANY – Products Cheaper Than Any Product in Category 1
SELECT title, price
FROM products
WHERE price < ANY (SELECT price FROM products WHERE category_id = 1);

-- 3.15 ALL – Product with Lowest Price
SELECT title, price
FROM products
WHERE price <= ALL (SELECT price FROM products);

-- 3.16 Subquery in FROM – Total Orders Per Product
SELECT p.title, t.total_orders
FROM products p
JOIN (
  SELECT product_id, COUNT(*) AS total_orders
  FROM order_items
  GROUP BY product_id
) t ON p.product_id = t.product_id;

-- 3.17 Subquery in SELECT – Order Count Per Product
SELECT title, 
  (SELECT COUNT(*) FROM order_items oi WHERE oi.product_id = p.product_id) AS order_count
FROM products p;

-- 3.18 Built-in Functions – Price & String
SELECT UPPER(title) AS product_name, ROUND(price,2) AS rounded_price, LENGTH(title) AS name_length
FROM products;

-- 3.19 User-Defined Function – Product Price Category
DELIMITER //
CREATE FUNCTION product_price_category(p_price DECIMAL(12,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF p_price >= 50000 THEN
    RETURN 'Premium';
  ELSEIF p_price >= 1000 THEN
    RETURN 'Midrange';
  ELSE
    RETURN 'Budget';
  END IF;
END //
DELIMITER ;

-- 3.20 Use the User-Defined Function
SELECT title, price, product_price_category(price) AS price_category
FROM products;
-- --------------------------------------------------------------------------------------------

-- 3.1 INNER JOIN – Addresses with Customers
SELECT a.street, a.city, c.first_name, c.last_name
FROM addresses a
INNER JOIN customers c ON a.customer_id = c.customer_id;

-- 3.2 LEFT JOIN – Customers Without Addresses
SELECT c.first_name, c.last_name
FROM customers c
LEFT JOIN addresses a ON c.customer_id = a.customer_id
WHERE a.address_id IS NULL;

-- 3.3 RIGHT JOIN – Addresses Without Customers (Data Integrity)
SELECT a.street, c.first_name
FROM addresses a
RIGHT JOIN customers c ON a.customer_id = c.customer_id;

-- 3.4 FULL OUTER JOIN – Addresses × Customers
SELECT a.street, c.first_name
FROM addresses a
LEFT JOIN customers c ON a.customer_id = c.customer_id
UNION
SELECT a.street, c.first_name
FROM addresses a
RIGHT JOIN customers c ON a.customer_id = c.customer_id;

-- 3.5 SELF JOIN – Customers with Same City
SELECT a1.customer_id AS cust1, a2.customer_id AS cust2, a1.city
FROM addresses a1
JOIN addresses a2 ON a1.city = a2.city AND a1.customer_id <> a2.customer_id;

-- 3.6 CROSS JOIN – Addresses × Orders
SELECT a.street, o.order_id
FROM addresses a
CROSS JOIN orders o;

-- 3.7 Multi-Table JOIN – Address → Customer → Orders
SELECT a.street, c.first_name, o.order_id, o.order_date
FROM addresses a
JOIN customers c ON a.customer_id = c.customer_id
JOIN orders o ON c.customer_id = o.customer_id;

-- 3.8 Count of Addresses per City
SELECT city, COUNT(*) AS total_addresses
FROM addresses
GROUP BY city;

-- 3.9 Scalar Subquery – Address in City with Most Customers
SELECT street, city
FROM addresses
WHERE city = (SELECT city FROM addresses GROUP BY city ORDER BY COUNT(customer_id) DESC LIMIT 1);

-- 3.10 Subquery with IN – Customers With Shipping Address
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM addresses WHERE address_type = 'shipping');

-- 3.11 Subquery with NOT IN – Customers Without Billing Address
SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM addresses WHERE address_type = 'billing');

-- 3.12 Correlated Subquery – Default Address of Each Customer
SELECT a.street, a.city, c.first_name
FROM addresses a
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.is_default = (
  SELECT MAX(is_default) FROM addresses a2 WHERE a2.customer_id = c.customer_id
);

-- 3.13 EXISTS – Customers Having At Least One Address
SELECT first_name, last_name
FROM customers c
WHERE EXISTS (SELECT 1 FROM addresses a WHERE a.customer_id = c.customer_id);

-- 3.14 ANY – Addresses in State Matching Any Billing Address State
SELECT street, state
FROM addresses
WHERE state = ANY (SELECT state FROM addresses WHERE address_type = 'billing');

-- 3.15 ALL – Address in State Matching All Shipping Address States
SELECT street, state
FROM addresses
WHERE state = ALL (SELECT state FROM addresses WHERE address_type = 'shipping');

-- 3.16 Subquery in FROM – Count of Addresses per Customer
SELECT c.first_name, t.address_count
FROM customers c
JOIN (SELECT customer_id, COUNT(*) AS address_count FROM addresses GROUP BY customer_id) t
ON c.customer_id = t.customer_id;

-- 3.17 Subquery in SELECT – Default Address Check
SELECT first_name,
  (SELECT street FROM addresses a WHERE a.customer_id = c.customer_id AND a.is_default = TRUE LIMIT 1) AS default_street
FROM customers c;

-- 3.18 Built-in Functions – String Functions
SELECT city, UPPER(street) AS street_upper, LENGTH(street) AS street_length
FROM addresses;

-- 3.19 User-Defined Function – Shorten Street Name
DELIMITER //
CREATE FUNCTION shorten_street(street_name VARCHAR(255))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  RETURN LEFT(street_name, 20);
END //
DELIMITER ;

-- 3.20 Use User-Defined Function
SELECT first_name, street, shorten_street(street) AS short_street
FROM addresses a
JOIN customers c ON a.customer_id = c.customer_id;
-- ---------------------------------------------------------------------

-- 3.1 INNER JOIN – Inventory with Products
SELECT i.inventory_id, p.title, i.stock_qty, i.shelf_location
FROM inventory i
INNER JOIN products p ON i.product_id = p.product_id;

-- 3.2 LEFT JOIN – Inventory without Orders
SELECT i.inventory_id, p.title
FROM inventory i
LEFT JOIN order_items oi ON i.product_id = oi.product_id
JOIN products p ON i.product_id = p.product_id
WHERE oi.order_id IS NULL;

-- 3.3 RIGHT JOIN – Orders without Inventory
SELECT oi.order_id, i.stock_qty
FROM inventory i
RIGHT JOIN order_items oi ON i.product_id = oi.product_id;

-- 3.4 FULL OUTER JOIN – Inventory × Orders
SELECT i.inventory_id, oi.order_id
FROM inventory i
LEFT JOIN order_items oi ON i.product_id = oi.product_id
UNION
SELECT i.inventory_id, oi.order_id
FROM inventory i
RIGHT JOIN order_items oi ON i.product_id = oi.product_id;

-- 3.5 SELF JOIN – Products in Inventory with Same Stock Qty
SELECT i1.inventory_id AS inv1, i2.inventory_id AS inv2, i1.stock_qty
FROM inventory i1
JOIN inventory i2 ON i1.stock_qty = i2.stock_qty AND i1.inventory_id <> i2.inventory_id;

-- 3.6 CROSS JOIN – Inventory × Warehouses
SELECT i.inventory_id, w.warehouse_name
FROM inventory i
CROSS JOIN warehouses w;

-- 3.7 Multi-Table JOIN – Inventory → Products → Sellers
SELECT i.inventory_id, p.title, s.company_name, i.stock_qty
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN sellers s ON p.seller_id = s.seller_id;

-- 3.8 Total Stock per Product
SELECT p.title, SUM(i.stock_qty) AS total_stock
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.product_id;

-- 3.9 Scalar Subquery – Inventory with Max Stock
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty = (SELECT MAX(stock_qty) FROM inventory);

-- 3.10 Subquery with IN – Products in Low Stock
SELECT product_id, stock_qty
FROM inventory
WHERE product_id IN (SELECT product_id FROM inventory WHERE stock_qty < 200);

-- 3.11 Subquery with NOT IN – Products Sufficient Stock
SELECT product_id, stock_qty
FROM inventory
WHERE product_id NOT IN (SELECT product_id FROM inventory WHERE stock_qty < 200);

-- 3.12 Correlated Subquery – Products Below Reorder Level
SELECT i.inventory_id, p.title, i.stock_qty, i.reorder_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.stock_qty < i.reorder_level;

-- 3.13 EXISTS – Inventory with Products
SELECT i.inventory_id, p.title
FROM inventory i
WHERE EXISTS (SELECT 1 FROM products p WHERE p.product_id = i.product_id);

-- 3.14 ANY – Inventory with Stock Greater Than Any Reorder Level
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty > ANY (SELECT reorder_level FROM inventory);

-- 3.15 ALL – Inventory with Minimum Stock
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty <= ALL (SELECT stock_qty FROM inventory);

-- 3.16 Subquery in FROM – Total Inventory per Warehouse
SELECT w.warehouse_name, t.total_stock
FROM warehouses w
JOIN (SELECT warehouse_id, SUM(stock_qty) AS total_stock FROM inventory GROUP BY warehouse_id) t
ON w.warehouse_id = t.warehouse_id;

-- 3.17 Subquery in SELECT – Last Restocked Date per Product
SELECT p.title, 
  (SELECT MAX(last_restocked) FROM inventory i WHERE i.product_id = p.product_id) AS last_restocked
FROM products p;

-- 3.18 Built-in Functions – Stock & Strings
SELECT shelf_location, UPPER(shelf_location) AS shelf_upper, LENGTH(shelf_location) AS shelf_length
FROM inventory;

-- 3.19 User-Defined Function – Stock Status
DELIMITER //
CREATE FUNCTION stock_status(qty INT, reorder INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF qty < reorder THEN
    RETURN 'Low';
  ELSEIF qty <= reorder*2 THEN
    RETURN 'Medium';
  ELSE
    RETURN 'High';
  END IF;
END //
DELIMITER ;

-- 3.20 Use User-Defined Function
SELECT i.inventory_id, p.title, i.stock_qty, i.reorder_level, stock_status(i.stock_qty, i.reorder_level) AS stock_category
FROM inventory i
JOIN products p ON i.product_id = p.product_id;
-- -----------------------------------------------------------------------------------------------------
-- 3.1 INNER JOIN – Inventory with Products
SELECT i.inventory_id, p.title, i.stock_qty, i.shelf_location
FROM inventory i
INNER JOIN products p ON i.product_id = p.product_id;

-- 3.2 LEFT JOIN – Inventory without Orders
SELECT i.inventory_id, p.title
FROM inventory i
LEFT JOIN order_items oi ON i.product_id = oi.product_id
JOIN products p ON i.product_id = p.product_id
WHERE oi.order_id IS NULL;

-- 3.3 RIGHT JOIN – Orders without Inventory
SELECT oi.order_id, i.stock_qty
FROM inventory i
RIGHT JOIN order_items oi ON i.product_id = oi.product_id;

-- 3.4 FULL OUTER JOIN – Inventory × Orders
SELECT i.inventory_id, oi.order_id
FROM inventory i
LEFT JOIN order_items oi ON i.product_id = oi.product_id
UNION
SELECT i.inventory_id, oi.order_id
FROM inventory i
RIGHT JOIN order_items oi ON i.product_id = oi.product_id;

-- 3.5 SELF JOIN – Products in Inventory with Same Stock Qty
SELECT i1.inventory_id AS inv1, i2.inventory_id AS inv2, i1.stock_qty
FROM inventory i1
JOIN inventory i2 ON i1.stock_qty = i2.stock_qty AND i1.inventory_id <> i2.inventory_id;

-- 3.6 CROSS JOIN – Inventory × Warehouses
SELECT i.inventory_id, w.warehouse_name
FROM inventory i
CROSS JOIN warehouses w;

-- 3.7 Multi-Table JOIN – Inventory → Products → Sellers
SELECT i.inventory_id, p.title, s.company_name, i.stock_qty
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN sellers s ON p.seller_id = s.seller_id;

-- 3.8 Total Stock per Product
SELECT p.title, SUM(i.stock_qty) AS total_stock
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.product_id;

-- 3.9 Scalar Subquery – Inventory with Max Stock
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty = (SELECT MAX(stock_qty) FROM inventory);

-- 3.10 Subquery with IN – Products in Low Stock
SELECT product_id, stock_qty
FROM inventory
WHERE product_id IN (SELECT product_id FROM inventory WHERE stock_qty < 200);

-- 3.11 Subquery with NOT IN – Products Sufficient Stock
SELECT product_id, stock_qty
FROM inventory
WHERE product_id NOT IN (SELECT product_id FROM inventory WHERE stock_qty < 200);

-- 3.12 Correlated Subquery – Products Below Reorder Level
SELECT i.inventory_id, p.title, i.stock_qty, i.reorder_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.stock_qty < i.reorder_level;

-- 3.13 EXISTS – Inventory with Products
SELECT i.inventory_id, p.title
FROM inventory i
WHERE EXISTS (SELECT 1 FROM products p WHERE p.product_id = i.product_id);

-- 3.14 ANY – Inventory with Stock Greater Than Any Reorder Level
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty > ANY (SELECT reorder_level FROM inventory);

-- 3.15 ALL – Inventory with Minimum Stock
SELECT inventory_id, stock_qty
FROM inventory
WHERE stock_qty <= ALL (SELECT stock_qty FROM inventory);

-- 3.16 Subquery in FROM – Total Inventory per Warehouse
SELECT w.warehouse_name, t.total_stock
FROM warehouses w
JOIN (SELECT warehouse_id, SUM(stock_qty) AS total_stock FROM inventory GROUP BY warehouse_id) t
ON w.warehouse_id = t.warehouse_id;

-- 3.17 Subquery in SELECT – Last Restocked Date per Product
SELECT p.title, 
  (SELECT MAX(last_restocked) FROM inventory i WHERE i.product_id = p.product_id) AS last_restocked
FROM products p;

-- 3.18 Built-in Functions – Stock & Strings
SELECT shelf_location, UPPER(shelf_location) AS shelf_upper, LENGTH(shelf_location) AS shelf_length
FROM inventory;

-- 3.19 User-Defined Function – Stock Status
DELIMITER //
CREATE FUNCTION stock_status(qty INT, reorder INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF qty < reorder THEN
    RETURN 'Low';
  ELSEIF qty <= reorder*2 THEN
    RETURN 'Medium';
  ELSE
    RETURN 'High';
  END IF;
END //
DELIMITER ;

-- 3.20 Use User-Defined Function
SELECT i.inventory_id, p.title, i.stock_qty, i.reorder_level, stock_status(i.stock_qty, i.reorder_level) AS stock_category
FROM inventory i
JOIN products p ON i.product_id = p.product_id;
-- -------------------------------------------------------------------------------------------
-- 3.1 INNER JOIN – Orders with Customers
SELECT o.order_id, c.first_name, c.last_name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 3.2 LEFT JOIN – Orders with Shipping Address
SELECT o.order_id, a.street, o.shipping_status
FROM orders o
LEFT JOIN addresses a ON o.shipping_address_id = a.address_id;

-- 3.3 RIGHT JOIN – Orders with Billing Address
SELECT o.order_id, a.street, o.payment_status
FROM orders o
RIGHT JOIN addresses a ON o.billing_address_id = a.address_id;

-- 3.4 FULL OUTER JOIN – Orders × Customers
SELECT o.order_id, c.first_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
UNION
SELECT o.order_id, c.first_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

-- 3.5 SELF JOIN – Orders with Same Total Amount
SELECT o1.order_id AS order1, o2.order_id AS order2, o1.total_amount
FROM orders o1
JOIN orders o2 ON o1.total_amount = o2.total_amount AND o1.order_id <> o2.order_id;

-- 3.6 CROSS JOIN – Orders × Warehouses
SELECT o.order_id, w.warehouse_name
FROM orders o
CROSS JOIN warehouses w;

-- 3.7 Multi-Table JOIN – Orders → Customers → Addresses
SELECT o.order_id, c.first_name, sa.street AS shipping, ba.street AS billing
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN addresses sa ON o.shipping_address_id = sa.address_id
JOIN addresses ba ON o.billing_address_id = ba.address_id;

-- 3.8 Total Orders per Customer
SELECT c.first_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 3.9 Scalar Subquery – Order with Max Amount
SELECT order_id, total_amount
FROM orders
WHERE total_amount = (SELECT MAX(total_amount) FROM orders);

-- 3.10 Subquery with IN – Orders Shipped
SELECT order_id, shipping_status
FROM orders
WHERE shipping_status IN (SELECT shipping_status FROM orders WHERE shipping_status='shipped');

-- 3.11 Subquery with NOT IN – Orders Not Delivered
SELECT order_id, shipping_status
FROM orders
WHERE shipping_status NOT IN (SELECT shipping_status FROM orders WHERE shipping_status='delivered');

-- 3.12 Correlated Subquery – Orders Above Customer Avg
SELECT o.order_id, o.total_amount, c.first_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > (
  SELECT AVG(total_amount)
  FROM orders o2
  WHERE o2.customer_id = c.customer_id
);

-- 3.13 EXISTS – Customers Who Have Orders
SELECT c.first_name, c.last_name
FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- 3.14 ANY – Orders Greater Than Any Order of Customer 1
SELECT order_id, total_amount
FROM orders
WHERE total_amount > ANY (SELECT total_amount FROM orders WHERE customer_id=1);

-- 3.15 ALL – Orders With Minimum Amount
SELECT order_id, total_amount
FROM orders
WHERE total_amount <= ALL (SELECT total_amount FROM orders);

-- 3.16 Subquery in FROM – Total Amount per Customer
SELECT c.first_name, t.total_amount
FROM customers c
JOIN (
  SELECT customer_id, SUM(total_amount) AS total_amount
  FROM orders
  GROUP BY customer_id
) t ON c.customer_id = t.customer_id;

-- 3.17 Subquery in SELECT – Max Order per Customer
SELECT c.first_name,
  (SELECT MAX(total_amount) FROM orders o WHERE o.customer_id = c.customer_id) AS max_order
FROM customers c;

-- 3.18 Built-in Functions – Total Amount Rounded & String
SELECT order_id, ROUND(total_amount,2) AS rounded_amount, CONCAT('Order_',order_id) AS order_label
FROM orders;

-- 3.19 User-Defined Function – Order Size Category
DELIMITER //
CREATE FUNCTION order_size_category(amount DECIMAL(12,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF amount >= 50000 THEN
    RETURN 'Large';
  ELSEIF amount >= 1000 THEN
    RETURN 'Medium';
  ELSE
    RETURN 'Small';
  END IF;
END //
DELIMITER ;

-- 3.20 Use User-Defined Function
SELECT order_id, total_amount, order_size_category(total_amount) AS order_category
FROM orders;
-- -----------------------------------------------------------------------------------

-- 3.1 INNER JOIN – Payments with Orders
SELECT p.payment_id, o.order_id, o.total_amount, p.amount, p.payment_method
FROM payments p
INNER JOIN orders o ON p.order_id = o.order_id;

-- 3.2 LEFT JOIN – Payments with Customers
SELECT p.payment_id, c.first_name, c.last_name, p.amount
FROM payments p
LEFT JOIN orders o ON p.order_id = o.order_id
LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- 3.3 RIGHT JOIN – Payments with Shipping Address
SELECT p.payment_id, a.street, p.payment_status
FROM payments p
RIGHT JOIN orders o ON p.order_id = o.order_id
RIGHT JOIN addresses a ON o.shipping_address_id = a.address_id;

-- 3.4 FULL OUTER JOIN – Payments × Orders
SELECT p.payment_id, o.order_id
FROM payments p
LEFT JOIN orders o ON p.order_id = o.order_id
UNION
SELECT p.payment_id, o.order_id
FROM payments p
RIGHT JOIN orders o ON p.order_id = o.order_id;

-- 3.5 SELF JOIN – Payments with Same Amount
SELECT p1.payment_id AS pay1, p2.payment_id AS pay2, p1.amount
FROM payments p1
JOIN payments p2 ON p1.amount = p2.amount AND p1.payment_id <> p2.payment_id;

-- 3.6 CROSS JOIN – Payments × Orders
SELECT p.payment_id, o.order_id
FROM payments p
CROSS JOIN orders o;

-- 3.7 Multi-Table JOIN – Payments → Orders → Customers
SELECT p.payment_id, o.order_id, c.first_name, c.last_name, p.amount
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

-- 3.8 Total Payments per Customer
SELECT c.first_name, SUM(p.amount) AS total_paid
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id;

-- 3.9 Scalar Subquery – Max Payment
SELECT payment_id, amount
FROM payments
WHERE amount = (SELECT MAX(amount) FROM payments);

-- 3.10 Subquery with IN – Payments by UPI
SELECT payment_id, amount
FROM payments
WHERE payment_method IN (SELECT DISTINCT payment_method FROM payments WHERE payment_method='upi');

-- 3.11 Subquery with NOT IN – Payments Not by Credit Card
SELECT payment_id, payment_method
FROM payments
WHERE payment_method NOT IN (SELECT DISTINCT payment_method FROM payments WHERE payment_method='credit_card');

-- 3.12 Correlated Subquery – Payments Greater Than Avg per Customer
SELECT p.payment_id, p.amount, c.first_name
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE p.amount > (
  SELECT AVG(p2.amount)
  FROM payments p2
  JOIN orders o2 ON p2.order_id = o2.order_id
  WHERE o2.customer_id = c.customer_id
);

-- 3.13 EXISTS – Customers With Payments
SELECT c.first_name, c.last_name
FROM customers c
WHERE EXISTS (
  SELECT 1 FROM orders o
  JOIN payments p ON o.order_id = p.order_id
  WHERE o.customer_id = c.customer_id
);

-- 3.14 ANY – Payments Greater Than Any Payment of TXN001
SELECT payment_id, amount
FROM payments
WHERE amount > ANY (SELECT amount FROM payments WHERE transaction_id='TXN001');

-- 3.15 ALL – Payments Less Than All of Customer 1
SELECT payment_id, amount
FROM payments
WHERE amount <= ALL (SELECT amount FROM payments p2 JOIN orders o2 ON p2.order_id=o2.order_id WHERE o2.customer_id=1);

-- 3.16 Subquery in FROM – Total Payments per Payment Method
SELECT t.payment_method, t.total_amount
FROM (
  SELECT payment_method, SUM(amount) AS total_amount
  FROM payments
  GROUP BY payment_method
) t;

-- 3.17 Subquery in SELECT – Max Payment per Customer
SELECT c.first_name,
  (SELECT MAX(p.amount) FROM payments p JOIN orders o ON p.order_id=o.order_id WHERE o.customer_id=c.customer_id) AS max_payment
FROM customers c;

-- 3.18 Built-in Functions – Amount Rounded & Label
SELECT payment_id, ROUND(amount,2) AS rounded_amount, CONCAT('PAY_',payment_id) AS payment_label
FROM payments;

-- 3.19 User-Defined Function – Payment Size Category
DELIMITER //
CREATE FUNCTION payment_size_category(amount DECIMAL(12,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF amount >= 50000 THEN
    RETURN 'Large';
  ELSEIF amount >= 1000 THEN
    RETURN 'Medium';
  ELSE
    RETURN 'Small';
  END IF;
END //
DELIMITER ;

-- 3.20 Use User-Defined Function
SELECT payment_id, amount, payment_size_category(amount) AS payment_category
FROM payments;
-- ------------------------ ---------------------------------------------------------




SELECT s.shipping_id, s.courier_name, s.status, o.order_id, o.total_amount, c.first_name, c.last_name
FROM shipping s
INNER JOIN orders o ON s.order_id = o.order_id
INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT s.shipping_id, s.tracking_number, p.payment_method, p.amount
FROM shipping s
LEFT JOIN orders o ON s.order_id = o.order_id
LEFT JOIN payments p ON o.order_id = p.order_id;


SELECT p.payment_id, p.amount, s.courier_name, s.status
FROM payments p
RIGHT JOIN shipping s ON p.order_id = s.order_id;


SELECT s1.shipping_id AS ship1, s2.shipping_id AS ship2, s1.courier_name, s1.ship_date
FROM shipping s1
JOIN shipping s2 
  ON s1.courier_name = s2.courier_name 
 AND s1.ship_date = s2.ship_date 
 AND s1.shipping_id <> s2.shipping_id;


SELECT s.shipping_id, c.customer_id, c.first_name, s.status
FROM shipping s
CROSS JOIN customers c;


SELECT courier_name,
       (SELECT MAX(ship_date) FROM shipping s2 WHERE s2.courier_name = s1.courier_name) AS latest_ship
FROM shipping s1
GROUP BY courier_name;


SELECT shipping_id, courier_name, actual_delivery, expected_delivery
FROM shipping s1
WHERE actual_delivery > (
  SELECT expected_delivery 
  FROM shipping s2 
  WHERE s2.shipping_id = s1.shipping_id
);

-- 3 Subquery with IN – Couriers with delivered shipments */
SELECT shipping_id, courier_name, status
FROM shipping
WHERE courier_name IN (
  SELECT DISTINCT courier_name
  FROM shipping
  WHERE status = 'delivered'
);


SELECT s.shipping_id, s.courier_name, o.total_amount
FROM shipping s
JOIN orders o ON s.order_id = o.order_id
WHERE EXISTS (
  SELECT 1
  FROM orders o2
  WHERE o2.order_id = o.order_id AND o2.total_amount > 50000
);


SELECT t.courier_name, t.total_cost
FROM (
    SELECT courier_name, SUM(shipping_cost) AS total_cost
    FROM shipping
    GROUP BY courier_name
) t;



-- String functions – Uppercase courier names */
SELECT shipping_id, UPPER(courier_name) AS courier_upper
FROM shipping;


SELECT shipping_id, ROUND(shipping_cost, 2) AS rounded_cost
FROM shipping;

-- Date functions – Days between ship and expected delivery */
SELECT shipping_id, DATEDIFF(expected_delivery, ship_date) AS days_to_expected
FROM shipping;

-- Aggregate functions – Total & Avg shipping cost per status */
SELECT status, SUM(shipping_cost) AS total_cost, AVG(shipping_cost) AS avg_cost
FROM shipping
GROUP BY status;


-- 1 UDF – Shipping delay in days */
DELIMITER //
CREATE FUNCTION shipping_delay(actual DATE, expected DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(actual, expected);
END //
DELIMITER ;

-- 2 Use UDF */
SELECT shipping_id, courier_name, actual_delivery, expected_delivery,
       shipping_delay(actual_delivery, expected_delivery) AS delay_days
FROM shipping;

-- bipping cost category 
DELIMITER //
CREATE FUNCTION shipping_cost_category(cost DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  IF cost >= 80 THEN
    RETURN 'High';
  ELSEIF cost >= 50 THEN
    RETURN 'Medium';
  ELSE
    RETURN 'Low';
  END IF;
END //
DELIMITER ;


SELECT shipping_id, shipping_cost, shipping_cost_category(shipping_cost) AS cost_category
FROM shipping;

--  mated delivery days 
DELIMITER //
CREATE FUNCTION estimated_delivery_days(ship_date DATE, expected_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN DATEDIFF(expected_date, ship_date);
END //
DELIMITER ;
-- ----------------------------------------------------------------------------------

-- 1. INNER JOIN: Show reviews with product name

SELECT r.review_id, p.product_name, r.rating, r.review_text
FROM reviews r
INNER JOIN products p ON r.product_id = p.product_id;


SELECT r.review_id, c.customer_name, r.rating, r.review_text
FROM reviews r
INNER JOIN customers c ON r.customer_id = c.customer_id;


SELECT p.product_name, r.rating
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id;


SELECT c.customer_name, r.review_text
FROM reviews r
RIGHT JOIN customers c ON r.customer_id = c.customer_id;


SELECT r.review_id, c.customer_name
FROM reviews r
CROSS JOIN customers c
LIMIT 5;


-- 6. SELF JOIN: Compare ratings for same product

SELECT r1.review_id AS Review1, r2.review_id AS Review2, r1.product_id
FROM reviews r1
JOIN reviews r2
ON r1.product_id = r2.product_id
AND r1.review_id <> r2.review_id;


-- 7. Scalar Subquery: Reviews above average rating

SELECT review_id, rating
FROM reviews
WHERE rating > (SELECT AVG(rating) FROM reviews);


-- 8. Subquery with IN: Customers who gave 5-star rating

SELECT customer_id
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM reviews
    WHERE rating = 5
);

-- 9. Correlated Subquery: Highest rating per product

SELECT r.product_id, r.rating
FROM reviews r
WHERE r.rating = (
    SELECT MAX(r2.rating)
    FROM reviews r2
    WHERE r2.product_id = r.product_id
);


-- 10. EXISTS Subquery: Products that have reviews

SELECT p.product_name
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM reviews r
    WHERE r.product_id = p.product_id
);

-- 11. Built-in Function: Uppercase review text

SELECT review_id, UPPER(review_text) AS review_caps
FROM reviews;


-- 12. Built-in Function: Rating statistics

SELECT 
    COUNT(*) AS total_reviews,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM reviews;


-- 13. Date Function: Reviews posted today
SELECT *
FROM reviews
WHERE review_date = CURDATE();

-- 14. String Function: Length of each review

SELECT review_id, LENGTH(review_text) AS review_length
FROM reviews;


-- 15. UDF: Classify rating sentiment

DELIMITER $$

CREATE FUNCTION GetRatingCategory(rating INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    RETURN (
        CASE
            WHEN rating = 5 THEN 'Excellent'
            WHEN rating = 4 THEN 'Good'
            WHEN rating = 3 THEN 'Average'
            ELSE 'Poor'
        END
    );
END$$

DELIMITER ;


-- 16. Use UDF: Show review sentiment

SELECT review_id, rating, GetRatingCategory(rating) AS review_category
FROM reviews;

-- 17. UDF: Check if review is positive

DELIMITER $$

CREATE FUNCTION IsPositiveReview(rating INT)
RETURNS BOOLEAN
DETERMINISTIC
RETURN rating >= 4;

DELIMITER ;


-- 18. Use UDF: Positive reviews only

SELECT review_id, rating
FROM reviews
WHERE IsPositiveReview(rating) = TRUE;


-- 19. Subquery in FROM: Average rating per product

SELECT product_id, avg_rating
FROM (
    SELECT product_id, AVG(rating) AS avg_rating
    FROM reviews
    GROUP BY product_id
) AS product_reviews;

--  20. Aggregate + HAVING: Products with avg rating >= 4
SELECT 
    product_id, AVG(rating) AS avg_rating
FROM
    reviews
GROUP BY product_id
HAVING AVG(rating) >= 4;

-- ---------------------------------------------------------------------
-- 1. Active customers
CREATE VIEW v_active_customers AS
SELECT customer_id, username, email
FROM customers WHERE is_active = TRUE;

-- 2. Customer order summary
CREATE VIEW v_customer_orders AS
SELECT c.customer_id, c.username, COUNT(o.order_id) total_orders, SUM(o.total_amount) total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 3. Product inventory status
CREATE VIEW v_product_inventory AS
SELECT p.product_id, p.title, SUM(i.stock_qty) total_stock
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id;

-- 4. Seller ratings
CREATE VIEW v_seller_ratings AS
SELECT seller_id, company_name, rating
FROM sellers;

-- 5. Delivered orders
CREATE VIEW v_delivered_orders AS
SELECT * FROM orders WHERE shipping_status = 'delivered';

-- 6. Pending shipments
CREATE VIEW v_pending_shipments AS
SELECT * FROM shipping WHERE status <> 'delivered';

-- 7. Top selling products
CREATE VIEW v_top_products AS
SELECT product_id, SUM(quantity) qty
FROM order_items GROUP BY product_id;

-- 8. Average product rating
CREATE VIEW v_avg_ratings AS
SELECT product_id, AVG(rating) avg_rating
FROM reviews GROUP BY product_id;

-- 9. Active coupons
CREATE VIEW v_active_coupons AS
SELECT * FROM coupons WHERE is_active = TRUE;

-- 10. Warehouse capacity usage
CREATE VIEW v_warehouse_usage AS
SELECT w.warehouse_id, w.name, SUM(i.stock_qty) used_capacity
FROM warehouses w
LEFT JOIN inventory i ON w.warehouse_id = i.warehouse_id
GROUP BY w.warehouse_id;

-- 1. Get customer orders
DELIMITER //
CREATE PROCEDURE sp_get_customer_orders(IN cid BIGINT)
BEGIN
  SELECT * FROM orders WHERE customer_id = cid;
END //
DELIMITER ;

-- 2. Add loyalty points
DELIMITER //
CREATE PROCEDURE sp_add_loyalty(IN cid BIGINT, IN pts INT)
BEGIN
  UPDATE customers SET loyalty_points = loyalty_points + pts
  WHERE customer_id = cid;
END //
DELIMITER ;

-- 3. Total sales by date
DELIMITER //
CREATE PROCEDURE sp_sales_by_date(IN d DATE)
BEGIN
  SELECT SUM(total_amount) FROM orders WHERE DATE(order_date) = d;
END //
DELIMITER ;

-- 4. Product stock check
DELIMITER //
CREATE PROCEDURE sp_check_stock(IN pid BIGINT)
BEGIN
  SELECT SUM(stock_qty) FROM inventory WHERE product_id = pid;
END //
DELIMITER ;

-- . Cursor to iterate customers
DELIMITER //
CREATE PROCEDURE sp_cursor_customers()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE cid BIGINT;
  DECLARE cur CURSOR FOR SELECT customer_id FROM customers;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO cid;
    IF done = 1 THEN LEAVE read_loop; END IF;
    UPDATE customers SET loyalty_points = loyalty_points + 1 WHERE customer_id = cid;
  END LOOP;
  CLOSE cur;
END //
DELIMITER ;
-- 1. Rank customers by spending
SELECT customer_id, total_amount,
RANK() OVER (ORDER BY total_amount DESC) rnk
FROM orders;

-- 2. Running total of sales
SELECT order_id, order_date,
SUM(total_amount) OVER (ORDER BY order_date) running_sales
FROM orders;

-- 3. Dense rank products by price
SELECT title, price,
DENSE_RANK() OVER (ORDER BY price DESC) dr
FROM products;

-- 4. Avg order value per customer
SELECT customer_id,
AVG(total_amount) OVER (PARTITION BY customer_id) avg_value
FROM orders;

-- 1. Reduce inventory after order
DELIMITER //
CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET stock_qty = stock_qty - NEW.quantity
  WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- 2. Update cart item count
DELIMITER //
CREATE TRIGGER trg_cart_count
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
  UPDATE carts SET items_count = items_count + 1
  WHERE cart_id = NEW.cart_id;
END //
DELIMITER ;









