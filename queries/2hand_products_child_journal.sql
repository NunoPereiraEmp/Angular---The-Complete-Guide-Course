

CREATE TABLE 2hand_products_child_journal (
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
product_child_id_old INT,
product_variant_id_old INT,
condition_id_old INT,
customer_id_old INT,
price_old DECIMAL(10,2),
created_at_old TIMESTAMP,
updated_at_old TIMESTAMP,
created_by_old  INT,
updated_by_old INT,
id_brand_old INT,
order_name_old VARCHAR(45),
product_child_id_status_old INT,
collection_id_old INT,
comment_old VARCHAR(255),
AddressID_old INT,
product_child_id_new INT,
product_variant_id_new INT,
condition_id_new INT,
customer_id_new INT,
price_new DECIMAL(10,2),
created_at_new TIMESTAMP,
updated_at_new TIMESTAMP,
created_by_new  INT,
updated_by_new INT,
id_brand_new INT,
order_name_new VARCHAR(45),
product_child_id_status_new INT,
collection_id_new INT,
comment_new VARCHAR(255),
AddressID_new INT
);
	
	
	


DELIMITER $$ 

CREATE TRIGGER 2hand_products_child_trigger_insert AFTER INSERT ON `2hand_products_child` 
 FOR EACH ROW BEGIN INSERT INTO 2hand_products_child_journal  (change_type, product_child_id_new, product_variant_id_new, condition_id_new, customer_id_new, price_new, created_at_new, updated_at_new, created_by_new, updated_by_new, id_brand_new, order_name_new, product_child_id_status_new, collection_id_new, comment_new, AddressID_new)
 VALUES('INSERT', NEW.product_child_id, NEW.product_variant_id, NEW.condition_id, NEW.customer_id, NEW.price, NEW.created_at, NEW.updated_at, NEW.created_by, NEW.updated_by, NEW.id_brand, NEW.order_name, NEW.product_child_id_status, NEW.collection_id, NEW.comment, NEW.AddressID);

	END$$


DELIMITER $$ 

CREATE TRIGGER 2hand_products_child_trigger_update AFTER UPDATE ON `2hand_products_child`
 FOR EACH ROW BEGIN INSERT INTO  2hand_products_child_journal  (change_type,  product_child_id_old, product_variant_id_old, condition_id_old, customer_id_old, price_old, created_at_old, updated_at_old, created_by_old, updated_by_old, id_brand_old, order_name_old, product_child_id_status_old, collection_id_old, comment_old, AddressID_old, product_child_id_new, product_variant_id_new, condition_id_new, customer_id_new, price_new, created_at_new, updated_at_new, created_by_new, updated_by_new, id_brand_new, order_name_new, product_child_id_status_new, collection_id_new, comment_new, AddressID_new)
VALUES('UPDATE', OLD.product_child_id, OLD.product_variant_id, OLD.condition_id, OLD.customer_id, OLD.price, OLD.created_at, OLD.updated_at, OLD.created_by, OLD.updated_by, OLD.id_brand, OLD.order_name, OLD.product_child_id_status, OLD.collection_id, OLD.comment, OLD.AddressID, NEW.product_child_id, NEW.product_variant_id, NEW.condition_id, NEW.customer_id, NEW.price, NEW.created_at, NEW.updated_at, NEW.created_by, NEW.updated_by, NEW.id_brand, NEW.order_name, NEW.product_child_id_status, NEW.collection_id, NEW.comment, NEW.AddressID);
 
END$$



CREATE TRIGGER 2hand_products_child_trigger_delete
AFTER DELETE ON `2hand_products_child`
FOR EACH ROW BEGIN INSERT INTO 2hand_products_child_journal (change_type, product_child_id_old, product_variant_id_old, condition_id_old, customer_id_old, price_old, created_at_old, updated_at_old, created_by_old, updated_by_old, id_brand_old, order_name_old, product_child_id_status_old, collection_id_old, comment_old, AddressID_old)
VALUES('DELETE',  OLD.product_child_id, OLD.product_variant_id, OLD.condition_id, OLD.customer_id, OLD.price, OLD.created_at, OLD.updated_at, OLD.created_by, OLD.updated_by, OLD.id_brand, OLD.order_name, OLD.product_child_id_status, OLD.collection_id, OLD.comment, OLD.AddressID);
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS 2hand_products_child_trigger_insert;
DROP TRIGGER IF EXISTS 2hand_products_child_trigger_delete;
DROP TRIGGER IF EXISTS 2hand_products_child_trigger_update;