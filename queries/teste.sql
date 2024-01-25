

-- Create the table
CREATE TABLE employees (
 id INT PRIMARY KEY AUTO_INCREMENT, 
 name VARCHAR(100), salary DECIMAL(10, 2), 
 department VARCHAR(50));


-- Create the journal table
CREATE TABLE employees_journal ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 id_old INT, name_old VARCHAR(100),
	salary_old DECIMAL(10, 2), 
	department_old VARCHAR(50), 
	id_new INT, 
	name_new VARCHAR(100), 
	salary_new DECIMAL(10, 2), 
	department_new VARCHAR(50));
	
	
	-- Create the trigger
    --INSERT
	DELIMITER $$
	 CREATE TRIGGER 
	 employees_trigger_insert 
	 AFTER INSERT ON employees
		FOR EACH ROW BEGIN INSERT INTO employees_journal (change_type, id_new, name_new, salary_new, department_new)
		 VALUES ('INSERT', NEW.id, NEW.name, NEW.salary, NEW.department);
		END$$
		
--UPDATE
CREATE TRIGGER employees_trigger_update
 AFTER UPDATE ON employees 
 FOR EACH ROW
	BEGIN INSERT INTO employees_journal (change_type, id_old, name_old, salary_old, department_old, id_new, name_new, salary_new, department_new) 
	VALUES ('UPDATE', OLD.id, OLD.name, OLD.salary, OLD.department, NEW.id, NEW.name, NEW.salary, NEW.department);
	END$$
	
--DELETE
	CREATE TRIGGER employees_trigger_delete 
    AFTER DELETE ON employees 
    FOR EACH ROW BEGIN INSERT INTO employees_journal (change_type, id_old, name_old, salary_old, department_old) 
    VALUES ('DELETE', OLD.id, OLD.name, OLD.salary, OLD.department);
    END$$ 
    DELIMITER ;


	INSERT INTO `returns` (`id_return`, `order_id`, `order_name`, `id_brand`, `started_at`, `IDStatus`, `id_customer`, `first_name`, `last_name`, `email`, `address1`, `address2`, `phone`, `zipcode`, `province`, `country`, `city`, `order_created_at`, `shipping_cost`, `tracking_id`, `currency`, `id_return_payment`, `mb_return_payment`, `return_fee_id`, `label`, `order_id_exc`, `order_name_exc`, `id_brands_warehouses`, `refund_total`, `pre_return`, `id_carrier`) VALUES (439, 5290657972530, '#1002', 2, '2023-02-24 15:27:31', 9, 6880666911026, 'João', 'Giesteira', 'joao.giesteira@valeriushub.com', 'rua xpto xpto xpto', '123', '+351912345876', '4423-234', 'Porto', 'PT', 'Barcelos', '2023-02-24 12:14:55', 0.00, 'DE118011531PT', 'EUR', 7, NULL, 5,NULL , NULL, NULL, NULL, 0.00, 0, 1);


    id_return_old, order_id_old, order_name_old, id_brand_old, started_at_old, IDStatus_old, id_customer_old, first_name_old, last_name_old, email_old, address1_old, address2_old, phone_old, zipcode_old, province_old, country_old, city_old, order_created_at_old, shipping_cost_old, tracking_id_old, currency_old, id_return_payment_old, mb_return_payment_old, return_fee_id_old, label_old, order_id_exc_old, order_name_exc_old, id_brands_warehouses_old, refund_total_old, pre_return_old, id_carrier_old, id_return_new, order_id_new, order_name_new, id_brand_new, started_at_new, IDStatus_new, id_customer_new, first_name_new, last_name_new, email_new, address1_new, address2_new, phone_new, zipcode_new, province_new, country_new, city_new, order_created_at_new, shipping_cost_new, tracking_id_new, currency_new, id_return_payment_new, mb_return_payment_new, return_fee_id_new, label_new, order_id_exc_new, order_name_exc_new, id_brands_warehouses_new, refund_total_new, pre_return_new, id_carrier_new

	
	DROP TRIGGER IF EXISTS returns_trigger_insert;
	DROP TRIGGER IF EXISTS returns_trigger_delete;
	DROP TRIGGER IF EXISTS returns_trigger_update


tenho esta base de dados SELECT *
FROM returns_journal
WHERE (id_return_new = 439 OR id_return_old = 439) ; queria ir buscar também á tabela returnStatus o description que depende da IDStatus da tabela returns_journal,



SELECT r.*,
  CASE
    WHEN r.IDStatus_new IS NOT NULL THEN rs.description
    ELSE rs2.description
  END AS description_new,
  CASE
    WHEN r.IDStatus_old IS NOT NULL THEN rs.description
    ELSE rs2.description
  END AS description_old
FROM returns_journal r
LEFT JOIN returnStatus rs ON r.IDStatus_new = rs.IDStatus
LEFT JOIN returnStatus rs2 ON r.IDStatus_old = rs2.IDStatus
WHERE r.id_return_new = 439 OR r.id_return_old = 439;





`SELECT pb.title,
    (select option_description from 2hand_products_variant_options as pvo
      inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
      where pvoc.option_child_id = pv.product_variant_option1_id
    ) as 'option_1_key',
    (select option_child_description from 2hand_products_variant_options_child as pvoc 
      where pvoc.option_child_id = pv.product_variant_option3_id) as 'option_3_value',
    pvb.photo as 'Image_url'
    from 2hand_products_variant as pv
    inner join 2hand_products_brand as pb on pb.product_id = pv.product_id
    left join 2hand_products_variant_photos as pvb on pvb.product_variant_id = pv.product_variant_id and pvb.position = 1
    where pv.sku = ?;`;