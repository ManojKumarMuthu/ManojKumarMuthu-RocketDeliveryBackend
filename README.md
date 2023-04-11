# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# ManojKumarMuthu-RocketDeliveryBackend

What is SQL?
SQL (Structured Query Language) is a programming language used for managing and manipulating data stored in relational databases. It is widely used in database management systems such as MySQL, Oracle, PostgreSQL, and Microsoft SQL Server.
SQL allows users to create and modify database tables, insert, update, and delete data from those tables, and retrieve data based on specific criteria using queries. SQL statements are written in a declarative syntax that makes it easy for users to interact with databases without needing to understand complex programming concepts.
Overall, SQL is a powerful tool for managing and working with large amounts of data in a relational database environment.


What is the main difference between SQLite and MySQL?

SQLite and MySQL are both popular relational database management systems, but they have some key differences.
One of the main differences is their architecture. SQLite is a file-based database that operates locally on a single device, while MySQL is a client-server database that can handle multiple concurrent connections from different devices. This means that SQLite is more suitable for small-scale projects or applications that don't require a client-server architecture, while MySQL is more appropriate for larger-scale projects or applications that require a client-server architecture.
Another difference is their level of complexity. SQLite is a lightweight and easy-to-use database that doesn't require a separate server process or installation, making it more convenient for developers who want to quickly get started with a simple database. MySQL, on the other hand, is a more complex and powerful database that offers more advanced features and capabilities but also requires more setup and configuration.
Overall, the choice between SQLite and MySQL depends on the specific needs and requirements of the project or application. If you need a simple and lightweight database for a small-scale project, SQLite may be the better option. If you need a more robust and powerful database for a larger-scale project, MySQL may be the better choice.


What are Primary and Foreign Key? Give an example for each.

In a relational database management system, primary and foreign keys are important concepts that define the relationships between tables.
A primary key is a column or set of columns in a table that uniquely identifies each row in that table. It is used to enforce data integrity and ensure that there are no duplicate rows in the table. For example, in a table of customer orders, the order ID column might be designated as the primary key, since each order has a unique ID.
An example of a primary key in SQL:
CREATE TABLE customers (
   customer_id INT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(100)
);

In this example, the customer_id column is the primary key for the customer's table.
A foreign key, on the other hand, is a column in a table that refers to the primary key of another table. It is used to establish relationships between tables and enforce referential integrity. For example, in a table of customer orders, there might be a column called customer_id that refers to the primary key of the customer's table. This ensures that each order is associated with a valid customer ID.
An example of a foreign key in SQL:
CREATE TABLE orders (
   order_id INT PRIMARY KEY,
   customer_id INT,
   order_date DATE,
   total_amount DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
In this example, the orders table has a foreign key customer_id that references the customer_id primary key in the customer table. This ensures that each order is associated with a valid customer ID.


Identify a pair of tables that have a many-to-one relationship. Explain why they have such a relation.

The Orders table has a many-to-one relationship with both the Restaurants and Customers tables. This is because each order is placed by one customer at one restaurant, but many orders can be associated with the same customer or restaurant. The Orders table has foreign keys that reference the primary keys of the Restaurants and Customers tables, which enforce this many-to-one relationship.
Additionally, the Product and Order tables have a many-to-one relationship, as each order can include multiple products, but each product can only be associated with one order. The Order table has a foreign key that references the primary key of the Product table, which enforces this relationship.



Identify a pair of tables that have a one-to-one relationship. Explain why they have such a relation.

Orders and Order status have one to one relationship since they used to check the status of the order 

Restaurants and product has one to one relationship as well

Identify a many-to-many relationship in the diagram. Which tables are involved and why?
 the customer Chart has a many-to-many relationship with the address and user chart these two are used to create Customer charts but also to create Restaurant and employees charts.

