-- 1. Get all customers and their addresses.
SELECT * FROM customers LEFT JOIN addresses ON customers.id=addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM orders LEFT JOIN line_items ON orders.id=line_items.order_id;

-- 3. Which warehouses have cheetos?
SELECT * FROM warehouse 
LEFT JOIN warehouse_product 
ON warehouse.id = warehouse_product.warehouse_id
LEFT JOIN products ON product_id=products.id WHERE products.id=5;

-- 4. Which warehouses have diet pepsi?
SELECT * FROM warehouse 
LEFT JOIN warehouse_product 
ON warehouse.id = warehouse_product.warehouse_id
LEFT JOIN products ON product_id=products.id WHERE products.id=6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, customers.first_name, customers.last_name, count(orders.id) 
FROM customers
LEFT JOIN addresses ON customers.id=addresses.customer_id
LEFT JOIN orders ON addresses.id=orders.address_id
GROUP BY customers.id, customers.first_name, customers.last_name;
 
-- 6. How many customers do we have?
SELECT count(*) FROM customers;

-- 7. How many products do we carry?
SELECT count(*) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(on_hand) FROM products
LEFT JOIN warehouse_product ON warehouse_product.product_id=products.id WHERE products.id = 6;
