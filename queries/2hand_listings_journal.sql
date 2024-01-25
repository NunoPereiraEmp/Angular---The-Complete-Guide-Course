

CREATE TABLE 2hand_listings_journal (
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
listing_id_old INT, 
product_id_old INT,
customer_id_old INT,
brand_id_old INT,
price_old DECIMAL(10,2),
smart_pricing_old CHAR(1),
archived_old CHAR(1),
created_at_old TIMESTAMP,
updated_at_old TIMESTAMP,
created_by_old VARCHAR(100),
updated_by_old VARCHAR(100),
listing_id_new INT, 
product_id_new INT,
customer_id_new INT,
brand_id_new INT,
price_new DECIMAL(10,2),
smart_pricing_new CHAR(1),
archived_new CHAR(1),
created_at_new TIMESTAMP,
updated_at_new TIMESTAMP,
created_by_new VARCHAR(100),
updated_by_new VARCHAR(100)
);
	


DELIMITER $$ 

CREATE TRIGGER 2hand_listings_trigger_insert AFTER INSERT ON `2hand_listings` 
 FOR EACH ROW BEGIN INSERT INTO 2hand_listings_journal  (change_type, listing_id_new, product_id_new, customer_id_new, brand_id_new, price_new, smart_pricing_new, archived_new, created_at_new, updated_at_new, created_by_new, updated_by_new)
 VALUES('INSERT', NEW.listing_id, NEW.product_id, NEW.customer_id, NEW.brand_id, NEW.price, NEW.smart_pricing, NEW.archived, NEW.created_at, NEW.updated_at, NEW.created_by, NEW.updated_by);

	END$$


DELIMITER $$ 

CREATE TRIGGER 2hand_listings_trigger_update AFTER UPDATE ON `2hand_listings`
 FOR EACH ROW BEGIN INSERT INTO  2hand_listings_journal  (change_type,  listing_id_old, product_id_old, customer_id_old, brand_id_old, price_old, smart_pricing_old, archived_old, created_at_old, updated_at_old, created_by_old, updated_by_old, listing_id_new, product_id_new, customer_id_new, brand_id_new, price_new, smart_pricing_new, archived_new, created_at_new, updated_at_new, created_by_new, updated_by_new)
VALUES('UPDATE',  OLD.listing_id, OLD.product_id, OLD.customer_id, OLD.brand_id, OLD.price, OLD.smart_pricing, OLD.archived, OLD.created_at, OLD.updated_at, OLD.created_by, OLD.updated_by, NEW.listing_id, NEW.product_id, NEW.customer_id, NEW.brand_id, NEW.price, NEW.smart_pricing, NEW.archived, NEW.created_at, NEW.updated_at, NEW.created_by, NEW.updated_by);
 
END$$



CREATE TRIGGER 2hand_listings_trigger_delete
AFTER DELETE ON `2hand_listings`
FOR EACH ROW BEGIN INSERT INTO 2hand_listings_journal (change_type, listing_id_old, product_id_old, customer_id_old, brand_id_old, price_old, smart_pricing_old, archived_old, created_at_old, updated_at_old, created_by_old, updated_by_old)
VALUES('DELETE', OLD.listing_id, OLD.product_id, OLD.customer_id, OLD.brand_id, OLD.price, OLD.smart_pricing, OLD.archived, OLD.created_at, OLD.updated_at, OLD.created_by, OLD.updated_by);
END$$

DELIMITER ;



DROP TRIGGER IF EXISTS 2hand_listings_trigger_insert;
DROP TRIGGER IF EXISTS 2hand_listings_trigger_delete;
DROP TRIGGER IF EXISTS 2hand_listings_trigger_update;
