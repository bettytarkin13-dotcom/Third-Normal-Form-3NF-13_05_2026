
CREATE TABLE  customers (
   customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
   customer_name TEXT NOT NULL,
   phone TEXT NOT NULL,
   address TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
   order_id INTEGER PRIMARY KEY AUTOINCREMENT,
   customer_id int NOT NULL,
   order_date datetime DEFAULT CURRENT_TIMESTAMP,
   order_type TEXT,
   total_price DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE pizzas (
   pizza_id INTEGER PRIMARY KEY AUTOINCREMENT,
   pizza_name TEXT NOT NULL,
   base_price DECIMAL(10,2) NOT NULL
);
 
CREATE TABLE toppings (
    topping_id INTEGER PRIMARY KEY AUTOINCREMENT,
	topping_name TEXT NOT NULL,
	extar_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE pizza_toppings (
     pizza_id INT NOT NULL,
	 topping_id INT NOT NULL,
	 topping_price_snapshot DECIMAL(10,2) NOT NULL,
	 PRIMARY KEY (pizza_id, topping_id),
	 FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id),
	 FOREIGN KEY (topping_id) REFERENCES toppings(topping_id)
);

CREATE TABLE order_items (
     order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
	 order_id INT NOT NULL,
	 pizza_id INT NOT NULL,
	 quantity INT NOT NULL DEFAULT 1,
	 pizza_price_snapshot DECIMAL(10,2) NOT NULL,
	 FOREIGN KEY (order_id) REFERENCES orders(order_id),
	 FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

CREATE TABLE drinks (
    drink_id INTEGER PRIMARY KEY AUTOINCREMENT,
	drink_name TEXT NOT NULL,
	price DECIMAL(10,2) NOT NULL
);

CREATE TABLE order_drinks(
    order_drink_id INTEGER PRIMARY KEY AUTOINCREMENT,
	order_id INT NOT NULL,
	drink_id INT NOT NULL,
	quantity INT NOT NULL DEFAULT 1,
	drink_price_snapshot DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY(drink_id) REFERENCES drinks(drink_id)
);
	
