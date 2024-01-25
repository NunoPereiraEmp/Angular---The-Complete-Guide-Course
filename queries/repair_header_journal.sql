

CREATE TABLE repair_header_journal (
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_repair_old INT,
order_id_old BIGINT,
order_name_old  VARCHAR(45),
order_date_old TIMESTAMP,
id_brand_old INT,
created_at_old TIMESTAMP,
repair_status_old INT,  
id_customer_old BIGINT,
first_name_old VARCHAR(255),
last_name_old VARCHAR(255),
email_address_old VARCHAR(255),
address_name_old VARCHAR(255),
address_line1_old VARCHAR(1000),
address_line2_old VARCHAR(1000),
phone_number_old VARCHAR(45),
zipcode_old VARCHAR(45),
province_old VARCHAR(45),
city_old VARCHAR(45),
id_country_old INT,
return_fee_id_old INT,
shipping_cost_old DECIMAL(10,2),
id_brands_warehouse_old INT,
label_1_old LONGBLOB,
tracking_number_1_old VARCHAR(255),
label_2_old LONGBLOB,
tracking_number_2_old VARCHAR(255),
id_repair_payment_old INT,
id_repair_new INT,
order_id_new BIGINT,
order_name_new  VARCHAR(45),
order_date_new TIMESTAMP,
id_brand_new INT,
created_at_new TIMESTAMP,
repair_status_new INT,  
id_customer_new BIGINT,
first_name_new VARCHAR(255),
last_name_new VARCHAR(255),
email_address_new VARCHAR(255),
address_name_new VARCHAR(255),
address_line1_new VARCHAR(1000),
address_line2_new VARCHAR(1000),
phone_number_new VARCHAR(45),
zipcode_new VARCHAR(45),
province_new VARCHAR(45),
city_new VARCHAR(45),
id_country_new INT,
return_fee_id_new INT,
shipping_cost_new DECIMAL(10,2),
id_brands_warehouse_new INT,
label_1_new LONGBLOB,
tracking_number_1_new VARCHAR(255),
label_2_new LONGBLOB,
tracking_number_2_new VARCHAR(255),
id_repair_payment_new INT
);
	





DELIMITER $$ 

CREATE TRIGGER repair_header_trigger_insert AFTER INSERT ON `repair_header` 
 FOR EACH ROW BEGIN INSERT INTO repair_header_journal  (change_type, id_repair_new, order_id_new, order_name_new, order_date_new, id_brand_new, created_at_new, repair_status_new,   id_customer_new, first_name_new, last_name_new, email_address_new, address_name_new, address_line1_new, address_line2_new, phone_number_new, zipcode_new, province_new, city_new, id_country_new, return_fee_id_new, shipping_cost_new, id_brands_warehouse_new, label_1_new, tracking_number_1_new, label_2_new, tracking_number_2_new, id_repair_payment_new )
 VALUES('INSERT', NEW.id_repair, NEW.order_id, NEW.order_name, NEW.order_date, NEW.id_brand, NEW.created_at, NEW.repair_status, NEW.id_customer, NEW.first_name, NEW.last_name, NEW.email_address, NEW.address_name, NEW.address_line1, NEW.address_line2, NEW.phone_number, NEW.zipcode, NEW.province, NEW.city, NEW.id_country, NEW.return_fee_id, NEW.shipping_cost, NEW.id_brands_warehouse, NEW.label_1, NEW.tracking_number_1, NEW.label_2, NEW.tracking_number_2, NEW.id_repair_payment  );

	END$$


DELIMITER $$ 

CREATE TRIGGER repair_header_trigger_update AFTER UPDATE ON `repair_header`
 FOR EACH ROW BEGIN INSERT INTO  repair_header_journal  (change_type, id_repair_old, order_id_old, order_name_old, order_date_old, id_brand_old, created_at_old, repair_status_old,   id_customer_old, first_name_old, last_name_old, email_address_old, address_name_old, address_line1_old, address_line2_old, phone_number_old, zipcode_old, province_old, city_old, id_country_old, return_fee_id_old, shipping_cost_old, id_brands_warehouse_old, label_1_old, tracking_number_1_old, label_2_old, tracking_number_2_old, id_repair_payment_old, id_repair_new, order_id_new, order_name_new, order_date_new, id_brand_new, created_at_new, repair_status_new,   id_customer_new, first_name_new, last_name_new, email_address_new, address_name_new, address_line1_new, address_line2_new, phone_number_new, zipcode_new, province_new, city_new, id_country_new, return_fee_id_new, shipping_cost_new, id_brands_warehouse_new, label_1_new, tracking_number_1_new, label_2_new, tracking_number_2_new, id_repair_payment_new)
VALUES('UPDATE', OLD.id_repair, OLD.order_id, OLD.order_name, OLD.order_date, OLD.id_brand, OLD.created_at, OLD.repair_status, OLD.id_customer, OLD.first_name, OLD.last_name, OLD.email_address, OLD.address_name, OLD.address_line1, OLD.address_line2, OLD.phone_number, OLD.zipcode, OLD.province, OLD.city, OLD.id_country, OLD.return_fee_id, OLD.shipping_cost, OLD.id_brands_warehouse, OLD.label_1, OLD.tracking_number_1, OLD.label_2, OLD.tracking_number_2, OLD.id_repair_payment, NEW.id_repair, NEW.order_id, NEW.order_name, NEW.order_date, NEW.id_brand, NEW.created_at, NEW.repair_status, NEW.id_customer, NEW.first_name, NEW.last_name, NEW.email_address, NEW.address_name, NEW.address_line1, NEW.address_line2, NEW.phone_number, NEW.zipcode, NEW.province, NEW.city, NEW.id_country, NEW.return_fee_id, NEW.shipping_cost, NEW.id_brands_warehouse, NEW.label_1, NEW.tracking_number_1, NEW.label_2, NEW.tracking_number_2, NEW.id_repair_payment );
 
END$$



CREATE TRIGGER repair_header_trigger_delete
AFTER DELETE ON `repair_header`
FOR EACH ROW BEGIN INSERT INTO repair_header_journal (change_type, id_repair_old, order_id_old, order_name_old, order_date_old, id_brand_old, created_at_old, repair_status_old,   id_customer_old, first_name_old, last_name_old, email_address_old, address_name_old, address_line1_old, address_line2_old, phone_number_old, zipcode_old, province_old, city_old, id_country_old, return_fee_id_old, shipping_cost_old, id_brands_warehouse_old, label_1_old, tracking_number_1_old, label_2_old, tracking_number_2_old, id_repair_payment_old)
VALUES('DELETE',  OLD.id_repair, OLD.order_id, OLD.order_name, OLD.order_date, OLD.id_brand, OLD.created_at, OLD.repair_status, OLD.id_customer, OLD.first_name, OLD.last_name, OLD.email_address, OLD.address_name, OLD.address_line1, OLD.address_line2, OLD.phone_number, OLD.zipcode, OLD.province, OLD.city, OLD.id_country, OLD.return_fee_id, OLD.shipping_cost, OLD.id_brands_warehouse, OLD.label_1, OLD.tracking_number_1, OLD.label_2, OLD.tracking_number_2, OLD.id_repair_payment);
END$$

DELIMITER ;





DROP TRIGGER IF EXISTS repair_header_trigger_insert;
DROP TRIGGER IF EXISTS repair_header_trigger_delete;
DROP TRIGGER IF EXISTS repair_header_trigger_update;

