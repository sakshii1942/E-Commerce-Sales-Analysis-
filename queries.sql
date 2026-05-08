mysql> SELECT * FROM orders;
+----------+-------------+------------+----------+------------+
| order_id | customer_id | product_id | quantity | order_date |
+----------+-------------+------------+----------+------------+
|     1001 |           1 |        101 |        1 | 2025-01-10 |
|     1002 |           2 |        102 |        2 | 2025-01-15 |
|     1003 |           1 |        103 |        3 | 2025-02-01 |
|     1004 |           3 |        101 |        1 | 2025-02-10 |
+----------+-------------+------------+----------+------------+
4 rows in set (0.01 sec)

mysql> SELECT SUM(products.price * orders.quantity) AS total_revenue
    -> FROM orders
    -> JOIN products
    -> ON orders.product_id = products.product_id;
+---------------+
| total_revenue |
+---------------+
|     166000.00 |
+---------------+
1 row in set (0.04 sec)

mysql> SELECT products.product_name,
    -> SUM(orders.quantity) AS total_quantity
    -> FROM orders
    -> JOIN products
    -> ON orders.product_id = products.product_id
    -> GROUP BY products.product_name
    -> ORDER BY total_quantity DESC;
+--------------+----------------+
| product_name | total_quantity |
+--------------+----------------+
| Shoes        |              3 |
| Laptop       |              2 |
| Phone        |              2 |
+--------------+----------------+
3 rows in set (0.02 sec)


mysql> SELECT customers.customer_name,
    -> SUM(products.price * orders.quantity) AS total_spent
    -> FROM orders
    -> JOIN customers
    -> ON orders.customer_id = customers.customer_id
    -> JOIN products
    -> ON orders.product_id = products.product_id
    -> GROUP BY customers.customer_name
    -> ORDER BY total_spent DESC;
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Rahul         |    60000.00 |
| Sakshi        |    56000.00 |
| Amit          |    50000.00 |
+---------------+-------------+
3 rows in set (0.02 sec)

mysql> SELECT products.category,
    -> SUM(products.price * orders.quantity) AS revenue
    -> FROM orders
    -> JOIN products
    -> ON orders.product_id = products.product_id
    -> GROUP BY products.category;
+-------------+-----------+
| category    | revenue   |
+-------------+-----------+
| Electronics | 160000.00 |
| Fashion     |   6000.00 |
+-------------+-----------+
2 rows in set (0.01 sec)

mysql> SELECT MONTH(order_date) AS month,
    -> SUM(products.price * orders.quantity) AS revenue
    -> FROM orders
    -> JOIN products
    -> ON orders.product_id = products.product_id
    -> GROUP BY MONTH(order_date);
+-------+-----------+
| month | revenue   |
+-------+-----------+
|     1 | 110000.00 |
|     2 |  56000.00 |
+-------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT customers.customer_name,
    -> COUNT(orders.order_id) AS total_orders
    -> FROM orders
    -> JOIN customers
    -> ON orders.customer_id = customers.customer_id
    -> GROUP BY customers.customer_name;
+---------------+--------------+
| customer_name | total_orders |
+---------------+--------------+
| Sakshi        |            2 |
| Rahul         |            1 |
| Amit          |            1 |
+---------------+--------------+
3 rows in set (0.00 sec)
