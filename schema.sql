mysql> CREATE TABLE customers (
    ->     customer_id INT PRIMARY KEY,
    ->     customer_name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE products (
    ->     product_id INT PRIMARY KEY,
    ->     product_name VARCHAR(50),
    ->     category VARCHAR(50),
    ->     price DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     product_id INT,
    ->     quantity INT,
    ->     order_date DATE,
    ->
    ->     FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO customers VALUES
    -> (1, 'Sakshi', 'Bangalore'),
    -> (2, 'Rahul', 'Mumbai'),
    -> (3, 'Amit', 'Delhi');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO products VALUES
    -> (101, 'Laptop', 'Electronics', 50000),
    -> (102, 'Phone', 'Electronics', 30000),
    -> (103, 'Shoes', 'Fashion', 2000);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO orders VALUES
    -> (1001, 1, 101, 1, '2025-01-10'),
    -> (1002, 2, 102, 2, '2025-01-15'),
    -> (1003, 1, 103, 3, '2025-02-01'),
    -> (1004, 3, 101, 1, '2025-02-10');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0