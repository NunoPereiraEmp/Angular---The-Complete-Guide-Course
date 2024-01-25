CREATE TABLE returns_journal (
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_return_old INT,
order_id_old BIGINT,
order_name_old VARCHAR(45),
id_brand_old INT,
started_at_old TIMESTAMP,
IDStatus_old INT,
id_customer_old BIGINT,
first_name_old VARCHAR(255),
last_name_old VARCHAR(255),
email_old  VARCHAR(255),
address1_old VARCHAR(1000),
address2_old VARCHAR(1000),
phone_old VARCHAR(45),
zipcode_old VARCHAR(45),
province_old VARCHAR(255),
country_old VARCHAR(45),
city_old VARCHAR(45),
order_created_at_old TIMESTAMP,
shipping_cost_old DECIMAL(16,2),
tracking_id_old VARCHAR(45),
currency_old VARCHAR(3),
id_return_payment_old INT,
mb_return_payment_old VARCHAR(255),
return_fee_id_old INT,
label_old LONGBLOB,
order_id_exc_old BIGINT,
order_name_exc_old VARCHAR(255),
id_brands_warehouses_old INT,
refund_total_old DECIMAL(10,2),
pre_return_old TINYINT,
id_carrier_old INT,
id_return_new INT,
order_id_new BIGINT,
order_name_new VARCHAR(45),
id_brand_new INT,
started_at_new TIMESTAMP,
IDStatus_new INT,
id_customer_new BIGINT,
first_name_new VARCHAR(255),
last_name_new VARCHAR(255),
email_new  VARCHAR(255),
address1_new VARCHAR(1000),
address2_new VARCHAR(1000),
phone_new VARCHAR(45),
zipcode_new VARCHAR(45),
province_new VARCHAR(255),
country_new VARCHAR(45),
city_new VARCHAR(45),
order_created_at_new TIMESTAMP,
shipping_cost_new DECIMAL(16,2),
tracking_id_new VARCHAR(45),
currency_new VARCHAR(3),
id_return_payment_new INT,
mb_return_payment_new VARCHAR(255),
return_fee_id_new INT,
label_new LONGBLOB,
order_id_exc_new BIGINT,
order_name_exc_new VARCHAR(255),
id_brands_warehouses_new INT,
refund_total_new DECIMAL(10,2),
pre_return_new TINYINT,
id_carrier_new INT
);


DELIMITER $$ 

CREATE TRIGGER returns_trigger_insert AFTER INSERT ON `returns` 
 FOR EACH ROW BEGIN INSERT INTO returns_journal  (change_type, id_return_new, order_id_new, order_name_new, id_brand_new, started_at_new, IDStatus_new, id_customer_new, first_name_new, last_name_new, email_new , address1_new, address2_new, phone_new, zipcode_new, province_new, country_new, city_new, order_created_at_new, shipping_cost_new, tracking_id_new, currency_new, id_return_payment_new, mb_return_payment_new, return_fee_id_new, label_new, order_id_exc_new, order_name_exc_new, id_brands_warehouses_new, refund_total_new, pre_return_new, id_carrier_new)
 VALUES('INSERT', NEW.id_return, NEW.order_id, NEW.order_name, NEW.id_brand, NEW.started_at, NEW.IDStatus, NEW.id_customer, NEW.first_name, NEW.last_name, NEW.email , NEW.address1, NEW.address2, NEW.phone, NEW.zipcode, NEW.province, NEW.country, NEW.city, NEW.order_created_at, NEW.shipping_cost, NEW.tracking_id, NEW.currency, NEW.id_return_payment, NEW.mb_return_payment, NEW.return_fee_id, NEW.label, NEW.order_id_exc, NEW.order_name_exc, NEW.id_brands_warehouses, NEW.refund_total, NEW.pre_return, NEW.id_carrier);
	END$$
 
 
 CREATE TRIGGER returns_trigger_update AFTER UPDATE ON `returns`
 FOR EACH ROW BEGIN INSERT INTO  returns_journal (change_type, id_return_old, order_id_old, order_name_old, id_brand_old, started_at_old, IDStatus_old, id_customer_old, first_name_old, last_name_old, email_old , address1_old, address2_old, phone_old, zipcode_old, province_old, country_old, city_old, order_created_at_old, shipping_cost_old, tracking_id_old, currency_old, id_return_payment_old, mb_return_payment_old, return_fee_id_old, label_old, order_id_exc_old, order_name_exc_old, id_brands_warehouses_old, refund_total_old, pre_return_old, id_carrier_old,id_return_new, order_id_new, order_name_new, id_brand_new, started_at_new, IDStatus_new, id_customer_new, first_name_new, last_name_new, email_new , address1_new, address2_new, phone_new, zipcode_new, province_new, country_new, city_new, order_created_at_new, shipping_cost_new, tracking_id_new, currency_new, id_return_payment_new, mb_return_payment_new, return_fee_id_new, label_new, order_id_exc_new, order_name_exc_new, id_brands_warehouses_new, refund_total_new, pre_return_new, id_carrier_new)
 VALUES('UPDATE',  OLD.id_return, OLD.order_id, OLD.order_name,  OLD.id_brand, OLD.started_at, OLD.IDStatus, OLD.id_customer, OLD.first_name, OLD.last_name, OLD.email , OLD.address1, OLD.address2, OLD.phone, OLD.zipcode, OLD.province, OLD.country, OLD.city, OLD.order_created_at, OLD.shipping_cost, OLD.tracking_id, OLD.currency, OLD.id_return_payment, OLD.mb_return_payment, OLD.return_fee_id, OLD.label, OLD.order_id_exc, OLD.order_name_exc, OLD.id_brands_warehouses, OLD.refund_total, OLD.pre_return, OLD.id_carrier, NEW.id_return, NEW.order_id, NEW.order_name, NEW.id_brand, NEW.started_at, NEW.IDStatus, NEW.id_customer, NEW.first_name, NEW.last_name, NEW.email , NEW.address1, NEW.address2, NEW.phone, NEW.zipcode, NEW.province, NEW.country, NEW.city, NEW.order_created_at, NEW.shipping_cost, NEW.tracking_id, NEW.currency, NEW.id_return_payment, NEW.mb_return_payment, NEW.return_fee_id, NEW.label, NEW.order_id_exc, NEW.order_name_exc, NEW.id_brands_warehouses, NEW.refund_total, NEW.pre_return, NEW.id_carrier);
END$$

CREATE TRIGGER returns_trigger_delete
AFTER DELETE ON `returns`
FOR EACH ROW BEGIN INSERT INTO returns_journal (change_type, id_return_old, order_id_old, order_name_old, id_brand_old, started_at_old, IDStatus_old, id_customer_old, first_name_old, last_name_old, email_old , address1_old, address2_old, phone_old, zipcode_old, province_old, country_old, city_old, order_created_at_old, shipping_cost_old, tracking_id_old, currency_old, id_return_payment_old, mb_return_payment_old, return_fee_id_old, label_old, order_id_exc_old, order_name_exc_old, id_brands_warehouses_old, refund_total_old, pre_return_old, id_carrier_old)
VALUES('DELETE', OLD.id_return, OLD.order_id, OLD.order_name,  OLD.id_brand, OLD.started_at, OLD.IDStatus, OLD.id_customer, OLD.first_name, OLD.last_name, OLD.email , OLD.address1, OLD.address2, OLD.phone, OLD.zipcode, OLD.province, OLD.country, OLD.city, OLD.order_created_at, OLD.shipping_cost, OLD.tracking_id, OLD.currency, OLD.id_return_payment, OLD.mb_return_payment, OLD.return_fee_id, OLD.label, OLD.order_id_exc, OLD.order_name_exc, OLD.id_brands_warehouses, OLD.refund_total, OLD.pre_return, OLD.id_carrier);
END$$

DELIMITER ;


INSERT INTO `returns` (`id_return`, `order_id`, `order_name`, `id_brand`, `started_at`, `IDStatus`, `id_customer`, `first_name`, `last_name`, `email`, `address1`, `address2`, `phone`, `zipcode`, `province`, `country`, `city`, `order_created_at`, `shipping_cost`, `tracking_id`, `currency`, `id_return_payment`, `mb_return_payment`, `return_fee_id`, `label`, `order_id_exc`, `order_name_exc`, `id_brands_warehouses`, `refund_total`, `pre_return`, `id_carrier`) VALUES (438, 5290657972530, '#1002', 2, '2023-02-24 15:27:31', 9, 6880666911026, 'eiei', 'e', 'joao.giesteira@valeriushub.com', 'rua xpto xpto xpto', '123', '+351912345876', '4423-234', 'Porto', 'PT', 'Barcelos', '2023-02-24 12:14:55', 0.00, 'DE118011531PT', 'EUR', 7, NULL, 5,NULL , NULL, NULL, NULL, 0.00, 0, 1);
 


DROP TRIGGER IF EXISTS returns_trigger_insert;
DROP TRIGGER IF EXISTS returns_trigger_delete;
DROP TRIGGER IF EXISTS returns_trigger_update



SELECT * FROM returns_journal
WHERE id_return_new = 439 ;

-- vai buscar tudo
SELECT *
FROM returns_journal
WHERE (id_return_new = 439 OR id_return_old = 439) ;



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
WHERE r.id_return_new = 438 OR r.id_return_old = 438;


SELECT r.*,
  rs_new.description AS description_new,
  rs_old.description AS description_old
FROM returns_journal r
LEFT JOIN returnStatus rs_new ON r.IDStatus_new = rs_new.IDStatus
LEFT JOIN returnStatus rs_old ON r.IDStatus_old = rs_old.IDStatus
WHERE r.id_return_new = 438 OR r.id_return_old = 438;




-- Se o id_return_new não for nulo, procura pelo id_return_new
SELECT *
FROM returns_journal
WHERE id_return_new = 439
  AND id_return_new IS NOT NULL;

-- Se o id_return_new for nulo, procura pelo id_return_old
SELECT *
FROM returns_journal
WHERE id_return_old = 439
  AND id_return_old IS NOT NULL;
	
	
	-- Para INSERT
SELECT id, change_type, change_timestamp, id_return_new, order_id_new, order_name_new, id_brand_new, started_at_new, IDStatus_new, id_customer_new, first_name_new, last_name_new, email_new, address1_new, address2_new, phone_new, zipcode_new, province_new, country_new, city_new, order_created_at_new, shipping_cost_new, tracking_id_new, currency_new, id_return_payment_new, mb_return_payment_new, return_fee_id_new, label_new, order_id_exc_new, order_name_exc_new, id_brands_warehouses_new, refund_total_new, pre_return_new, id_carrier_new
FROM returns_journal
WHERE id_return_new = 439 AND change_type = 'INSERT';

-- Para DELETE
SELECT id, change_type, change_timestamp, id_return_old, order_id_old, order_name_old, id_brand_old, started_at_old, IDStatus_old, id_customer_old, first_name_old, last_name_old, email_old, address1_old, address2_old, phone_old, zipcode_old, province_old, country_old, city_old, order_created_at_old, shipping_cost_old, tracking_id_old, currency_old, id_return_payment_old, mb_return_payment_old, return_fee_id_old, label_old, order_id_exc_old, order_name_exc_old, id_brands_warehouses_old, refund_total_old, pre_return_old, id_carrier_old
FROM returns_journal
WHERE id_return_new IS NULL AND id_return_old = 439 AND change_type = 'DELETE';

-- Para UPDATE
SELECT *
FROM returns_journal
WHERE (id_return_new = 439 OR id_return_old = 439) AND change_type = 'UPDATE';



SELECT id, change_type, change_timestamp, id_return_old, order_id_old, order_name_old, id_brand_old, started_at_old, IDStatus_old, id_customer_old, first_name_old, last_name_old, email_old, address1_old, address2_old, phone_old, zipcode_old, province_old, country_old, city_old, order_created_at_old, shipping_cost_old, tracking_id_old, currency_old, id_return_payment_old, mb_return_payment_old, return_fee_id_old, label_old, order_id_exc_old, order_name_exc_old, id_brands_warehouses_old, refund_total_old, pre_return_old, id_carrier_old
FROM returns_journal
WHERE id_return_old = 439
UNION
SELECT id, change_type, change_timestamp, id_return_new, order_id_new, order_name_new, id_brand_new, started_at_new, IDStatus_new, id_customer_new, first_name_new, last_name_new, email_new, address1_new, address2_new, phone_new, zipcode_new, province_new, country_new, city_new, order_created_at_new, shipping_cost_new, tracking_id_new, currency_new, id_return_payment_new, mb_return_payment_new, return_fee_id_new, label_new, order_id_exc_new, order_name_exc_new, id_brands_warehouses_new, refund_total_new, pre_return_new, id_carrier_new
FROM returns_journal
WHERE id_return_new = 439;



SELECT pb.title,
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
    where pv.sku = ?;



SELECT
  r.id_return,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
WHERE
  r.order_name = '#1016'
	AND rl.order_line_id IS NOT NULL;








SELECT
  pb.title,
  pvb.photo AS image_url,
  r.id_return,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name = '#1016'
  AND rl.order_line_id IS NOT NULL;
	
	
	
	SELECT
  pb.title,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'color',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'size',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_value',
  pvb.photo AS 'Image_url',
  r.id_return,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name = '#1016'
  AND rl.order_line_id IS NOT NULL;
	
	
	
	SELECT
  pb.title,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_value',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_value',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_value',
  pvb.photo AS 'Image_url',
  r.id_return AS idSubmission,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name = '#1016'
  AND rl.order_line_id IS NOT NULL;




SELECT * FROM 2hand_products_variant where sku = '001-01701-0002-020';


SELECT * FROM 2hand_products_child where order_name = '#1001';


SELECT
  pc.product_child_id AS idSubmission,
  pc.created_at AS date,
  pc.price,
  pc.product_child_id_status AS IDStatus,
  pcs.description AS statusDescription
FROM
  2hand_products_child pc
  LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
WHERE
  pc.order_name = '#1001';
	
	


SELECT
  pc.product_child_id AS idSubmission,
  pc.created_at AS date,
  pc.price,
  pc.product_child_id_status AS IDStatus,
  pcs.description AS statusDescription,
  c.code_currency AS currency,
  pv.sku
FROM
  2hand_products_child pc
  LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
  INNER JOIN 2hand_customers cust ON pc.customer_id = cust.CustomerID
  INNER JOIN currencies c ON cust.CurrencyID = c.id_currency
  LEFT JOIN 2hand_products_variant pv ON pc.product_variant_id = pv.product_variant_id
WHERE
  pc.order_name = '#1001';


SELECT * FROM 2hand_products_variant where sku = '001-01272-0002-015';




SELECT
  pc.product_child_id AS idSubmission,
  pc.created_at AS date,
  pc.price,
  pc.product_child_id_status AS IDStatus,
  pcs.description AS statusDescription,
  c.code_currency AS currency,
  pv.sku,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS option_1_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS color,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS option_2_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS size,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_value
FROM
  2hand_products_child pc
  LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
  INNER JOIN 2hand_customers cust ON pc.customer_id = cust.CustomerID
  INNER JOIN currencies c ON cust.CurrencyID = c.id_currency
  LEFT JOIN 2hand_products_variant pv ON pc.product_variant_id = pv.product_variant_id
WHERE
  pc.order_name = '#1001';
	
	
	
	
	
	
	
	
	
	
	SELECT
  pc.product_child_id AS idSubmission,
  pc.created_at AS date,
  pc.price,
  pc.product_child_id_status AS IDStatus,
  pcs.description AS statusDescription,
  c.code_currency AS currency,
  pv.sku,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS option_1_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS color,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS option_2_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS size,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_value,
  pcp.blob AS image_url
FROM
  2hand_products_child pc
  LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
  INNER JOIN 2hand_customers cust ON pc.customer_id = cust.CustomerID
  INNER JOIN currencies c ON cust.CurrencyID = c.id_currency
  LEFT JOIN 2hand_products_variant pv ON pc.product_variant_id = pv.product_variant_id
  LEFT JOIN 2hand_products_child_photos pcp ON pc.product_child_id = pcp.product_child_id
WHERE
  pc.order_name = '#1001';



SELECT
  pc.product_child_id AS idSubmission,
  pc.created_at AS date,
  pc.price,
  pc.product_child_id_status AS IDStatus,
  pcs.description AS statusDescription,
  c.code_currency AS currency,
  pv.sku,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS option_1_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS color,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS option_2_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS size,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_key,
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_value,
  pcp.blob AS image_url,
  pb.title
FROM
  2hand_products_child pc
  LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
  INNER JOIN 2hand_customers cust ON pc.customer_id = cust.CustomerID
  INNER JOIN currencies c ON cust.CurrencyID = c.id_currency
  LEFT JOIN 2hand_products_variant pv ON pc.product_variant_id = pv.product_variant_id
  LEFT JOIN 2hand_products_child_photos pcp ON pc.product_child_id = pcp.product_child_id
  LEFT JOIN 2hand_products_brand pb ON pv.product_id = pb.product_id
WHERE
  pc.order_name = '#1001';








SELECT
  pb.title,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'color',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'size',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_value',
  pvb.photo AS 'image_url',
  r.id_return AS idSubmission,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name =  '#1001'
  AND rl.order_line_id IS NOT NULL;
	
	
	
	
	
	SELECT * FROM repair_header WHERE order_name = '#1007'
	




UPDATE returns SET IDStatus = 1 AND refund_total=0 WHERE id_return = 440;




SELECT
  pb.title,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'color',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'size',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_value',
  pvb.photo AS 'image_url',
  r.id_return AS idSubmission,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  rl.IDStatus,
  rs.description AS statusDescription,
	r.id_brand
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON rl.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name = '#1016'  AND r.id_brand=1
  AND rl.order_line_id IS NOT NULL;



SELECT * FROM returns WHERE returns.order_name = '#1022';

	
	SELECT * FROM orders WHERE orders.id_order = '';
	
	
	
	

CREATE TABLE packingList_journal (
id INT PRIMARY KEY AUTO_INCREMENT, 
change_type VARCHAR(10), 
change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
IDPackingList_old INT,
creationDate_old TIMESTAMP,
id_brand_old INT,
id_supplier_old INT,
IDStatus_old INT,
identifier_old VARCHAR(45),
file_uploaded_old LONGBLOB,
transfer_old INT
IDPackingList_new INT,
creationDate_new TIMESTAMP,
id_brand_new INT,
id_supplier_new INT,
IDStatus_new INT,
identifier_new VARCHAR(45),
file_uploaded_new LONGBLOB,
transfer_new INT
);
	
	
	


DELIMITER $$ 

CREATE TRIGGER packingList_trigger_insert AFTER INSERT ON `packingList` 
 FOR EACH ROW BEGIN INSERT INTO packingList_journal  (change_type, IDPackingList_new, creationDate_new, id_brand_new, id_supplier_new, IDStatus_new, identifier_new, file_uploaded_new, transfer_new)
 VALUES('INSERT', NEW.IDPackingList, NEW.creationDate, NEW.id_brand, NEW.id_supplier, NEW.IDStatus, NEW.identifier, NEW.file_uploaded, NEW.transfer);

	END$$




CREATE TRIGGER packingList_trigger_update AFTER UPDATE ON `packingList`
 FOR EACH ROW BEGIN INSERT INTO  packingList_journal  (change_type,  IDPackingList_old, creationDate_old, id_brand_old, id_supplier_old, IDStatus_old, identifier_old, file_uploaded_old, transfer_old, IDPackingList_new, creationDate_new, id_brand_new, id_supplier_new, IDStatus_new, identifier_new, file_uploaded_new, transfer_new)
VALUES('UPDATE',  OLD.IDPackingList, OLD.creationDate, OLD.id_brand, OLD.id_supplier, OLD.IDStatus, OLD.identifier, OLD.file_uploaded, OLD.transfer, NEW.IDPackingList, NEW.creationDate, NEW.id_brand, NEW.id_supplier, NEW.IDStatus, NEW.identifier, NEW.file_uploaded, NEW.transfer);
 
END$$



CREATE TRIGGER packingList_trigger_delete
AFTER DELETE ON `packingList`
FOR EACH ROW BEGIN INSERT INTO packingList_journal (change_type, IDPackingList_old, creationDate_old, id_brand_old, id_supplier_old, IDStatus_old, identifier_old, file_uploaded_old, transfer_old)
VALUES('DELETE', OLD.IDPackingList, OLD.creationDate, OLD.id_brand, OLD.id_supplier, OLD.IDStatus, OLD.identifier, OLD.file_uploaded, OLD.transfer);
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS packingList_trigger_insert;
DROP TRIGGER IF EXISTS packingList_trigger_delete;
DROP TRIGGER IF EXISTS packingList_trigger_update;

INSERT INTO `packingList` (`IDPackingList`, `creationDate`, `id_brand`, `id_supplier`, `IDStatus`, `identifier`, `file_uploaded`, `transfer`) VALUES (48,'2023-02-24 15:27:31', 1, 1,5, 'JUN_2_20220801',NULL,0);







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


INSERT INTO `2hand_listings` (`listing_id`, `product_id`, `customer_id`, `brand_id`, `price`, `smart_pricing`, `archived`, `created_at`,`updated_at`, `created_by`, `updated_by`) VALUES (85,3, 25, 1,5,5,0, '2023-03-21 14:55:00','2023-03-21 14:55:00',1,0);





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



INSERT INTO `repair_header` (`id_repair`, `order_id`, `order_name`, `order_date`, `id_brand`, `created_at`, `repair_status`, `id_customer`, `first_name`, `last_name`, `email_address`, `address_name`, `address_line1`, `address_line2`, `phone_number`, `zipcode`, `province`, `city`, `id_country`, `return_fee_id`, `shipping_cost`, `id_brands_warehouse`, `label_1`, `tracking_number_1`, `label_2`, `tracking_number_2`, `id_repair_payment`) VALUES (259,5288372502824, '#1007','2023-04-05 15:15:54',1,'2023-04-13 14:38:42',1, 6830407909672,'ola','ola','ola@ola', 'olaaddress', 'olaaddressline1', 'olaaddressline2', NULL, 1123, 'provincia', 'city', 21,1,NULL, 1,NULL,NULL,NULL,NULL,1);






---------
	

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


DELIMITER $$ 

CREATE TRIGGER 2hand_products_child_trigger_delete
AFTER DELETE ON `2hand_products_child`
FOR EACH ROW BEGIN INSERT INTO 2hand_products_child_journal (change_type, product_child_id_old, product_variant_id_old, condition_id_old, customer_id_old, price_old, created_at_old, updated_at_old, created_by_old, updated_by_old, id_brand_old, order_name_old, product_child_id_status_old, collection_id_old, comment_old, AddressID_old)
VALUES('DELETE',  OLD.product_child_id, OLD.product_variant_id, OLD.condition_id, OLD.customer_id, OLD.price, OLD.created_at, OLD.updated_at, OLD.created_by, OLD.updated_by, OLD.id_brand, OLD.order_name, OLD.product_child_id_status, OLD.collection_id, OLD.comment, OLD.AddressID);
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS 2hand_products_child_trigger_insert;
DROP TRIGGER IF EXISTS 2hand_products_child_trigger_delete;
DROP TRIGGER IF EXISTS 2hand_products_child_trigger_update;

INSERT INTO `2hand_products_child` (`product_child_id`, `product_variant_id`, `condition_id`, `customer_id`, `price`,  `created_at`, `updated_at`, `created_by`, `updated_by`, `id_brand`, `order_name`, `product_child_id_status`, `collection_id`, `comment`, `AddressID`) VALUES (379, 419765, 2, 153, 24.00,'2023-02-24 15:27:31','2023-02-24 15:27:31',2,2,1,'#1025',1,1, NULL,26);


SELECT 
pc.product_child_id, 
pc.product_child_id_status,
cs.description
FROM 2hand_products_child pc
LEFT JOIN 2hand_products_child_status cs ON pc.product_child_id_status = cs.product_status_id
WHERE pc.product_child_id=308;




SELECT 
pc.change_type ,
pc.change_timestamp,
pc.product_child_id_new,
pc.product_child_id_status_new,
cs_new.description,
pc.product_child_id_old, 
pc.product_child_id_status_old,
cs_old.description
FROM 2hand_products_child_journal pc
LEFT JOIN 2hand_products_child_status cs_new ON pc.product_child_id_status_new = cs_new.product_status_id
LEFT JOIN 2hand_products_child_status cs_old ON pc.product_child_id_status_old = cs_old.product_status_id
WHERE pc.product_child_id_new=6 OR pc.product_child_id_old=6;




SELECT 
rp.change_type,
rp.change_timestamp,
rs_new.description as description_new,
rs_old.description as description_old
FROM repair_header_journal rp 
LEFT JOIN repair_status rs_new ON rp.repair_status_new = rs_new.id_repair_status
LEFT JOIN repair_status rs_old ON rp.repair_status_old = rs_old.id_repair_status
WHERE rp.id_repair_old = 259 OR rp.id_repair_new=259


UPDATE returns
SET IDStatus = ?,
    refund_total = ?
WHERE id_return = ?
  AND id_brand = ?
	
	
SELECT *
FROM return_options as ro
WHERE id_brand = 3 AND active = 1
ORDER BY position ASC;


ALTER TABLE return_comments
ADD COLUMN id INT;



SELECT 
rc.creation_date as date,
rc.comment_description as text,
u.username as author
FROM return_comments as rc
INNER JOIN users as u ON rc.id_user = u.id_user
WHERE id_return = 443;


SELECT id FROM comments ORDER BY id DESC LIMIT 1;



export async function get_last_id_comments() {
  return new Promise((resolve, reject) => {
    db.getConnection((err, connection) => {
      if (err) {
        // Tratar erros de conexão
        reject(err);
        return;
      }
      
      connection.beginTransaction((err) => {
        if (err) {
          // Tratar erros de transação
          connection.release();
          reject(err);
          return;
        }
        
        connection.query('SELECT id FROM comments ORDER BY id DESC LIMIT 1;', (err, rows) => {
          if (err) {
            // Tratar erros de consulta
            connection.rollback(() => {
              connection.release();
              reject(err);
            });
          } else {
            const lastId = rows[0].id;
            const nextId = lastId + 1;
            
            // Executar ação com o próximo ID disponível
            
            connection.commit((err) => {
              if (err) {
                // Tratar erros de confirmação da transação
                connection.rollback(() => {
                  connection.release();
                  reject(err);
                });
              } else {
                // Concluir a transação com sucesso
                connection.release();
                resolve(nextId);
              }
            });
          }
        });
      });
    });
  });
}



DELETE FROM return_comments
WHERE id_comment = 31;


SELECT MAX(id_comment) AS max_id FROM return_comments

SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'nome_do_banco_de_dados' AND TABLE_NAME = 'return_comments'


DELETE FROM return_comments WHERE id_return =? AND id_user =? AND creation_date=?


SELECT pb.title,
pb.product_id,
pv.price,
pv.sku,
pv.ean,
pv.product_id as idV
FROM  2hand_products_brand as pb
INNER JOIN 2hand_products_variant as pv on pv.product_id = pb.product_id
WHERE pb.product_id = 20964;





SELECT
    pb.product_id,
    pb.title,
    pv.product_variant_id,
    pc.product_child_id,
    l.price,
    c.condition_id,
    c.description AS condition_description,
    o1.option_description AS O1,
    c1.option_child_description AS O1Child,
    GROUP_CONCAT(DISTINCT c2.option_child_description) AS O2Children,
    GROUP_CONCAT(DISTINCT pv.product_variant_id) AS variant_ids
    FROM 2hand_listings l
    INNER JOIN 2hand_products_child pc ON pc.product_child_id = l.product_id
    INNER JOIN 2hand_products_variant pv ON pv.product_variant_id = pc.product_variant_id
    INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
    INNER JOIN 2hand_condition c ON c.condition_id = pc.condition_id
    INNER JOIN 2hand_products_variant_options_child c1 ON c1.option_child_id = pv.product_variant_option1_id
    INNER JOIN 2hand_products_variant_options o1 ON o1.variant_option_id = c1.variant_option_id
    INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID
    INNER JOIN countries AS cc ON 2hand_addresses.CountryID = cc.country_id
    LEFT JOIN 2hand_products_variant_options_child c2 ON c2.option_child_id = pv.product_variant_option2_id
    LEFT JOIN 2hand_products_variant_options o2 ON o2.variant_option_id = c2.variant_option_id
    LEFT JOIN 2hand_products_variant_options_child c3 ON c3.option_child_id = pv.product_variant_option3_id
    LEFT JOIN 2hand_products_variant_options o3 ON o3.variant_option_id = c3.variant_option_id
    WHERE l.archived = 0



//queryDistinct

SELECT
    pb.product_id,
    pb.title,
    pv.product_variant_id,
    pv.price,
    o1.option_description AS O1,
    c1.option_child_description AS O1Child,
    GROUP_CONCAT(DISTINCT c2.option_child_description) AS O2Children,
    GROUP_CONCAT(DISTINCT pv.product_variant_id) AS variant_ids
    FROM 2hand_products_brand pb
    INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
    INNER JOIN 2hand_products_variant_options_child c1 ON c1.option_child_id = pv.product_variant_option1_id
    INNER JOIN 2hand_products_variant_options o1 ON o1.variant_option_id = c1.variant_option_id
		   INNER JOIN countries AS cc ON 2hand_addresses.CountryID = cc.country_id
    LEFT JOIN 2hand_products_variant_options_child c2 ON c2.option_child_id = pv.product_variant_option2_id
    LEFT JOIN 2hand_products_variant_options o2 ON o2.variant_option_id = c2.variant_option_id
    LEFT JOIN 2hand_products_variant_options_child c3 ON c3.option_child_id = pv.product_variant_option3_id
    LEFT JOIN 2hand_products_variant_options o3 ON o3.variant_option_id = c3.variant_option_id
    WHERE pb.id_status = 1
		
		
		

		
		
		1. //queryDistinct feito
		
		
		
		
		
		
		
		
		
		
		import { Connection } from 'your-database-library'; // Importe a biblioteca do seu banco de dados

async function searchProducts(searchTerm: string): Promise<any[]> {
  const connection = new Connection(); // Crie uma nova conexão com o banco de dados

  try {
    await connection.connect(); // Conecte-se ao banco de dados

    const query = `
      SELECT
        pb.product_id,
        pb.title,
        pv.product_variant_id,
        pv.sku,
        pv.ean
      FROM
        2hand_products_brand pb
        INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
      WHERE
        pb.title LIKE '%${searchTerm}%'
        OR pv.sku = '${searchTerm}'
        OR pv.ean = '${searchTerm}'
    `;

    const results = await connection.query(query); // Execute a consulta no banco de dados

    return results; // Retorne os resultados da pesquisa
  } catch (error) {
    throw error;
  } finally {
    await connection.close(); // Feche a conexão com o banco de dados
  }
}

		
		
		 SELECT
        pb.product_id,
        pb.title,
        pv.product_variant_id,
        pv.sku,
        pv.ean
      FROM
        2hand_products_brand pb
        INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
      WHERE
				pb.id_status = 1 AND
        pb.title LIKE '%PRIDE SOCKS%'
				
		
SELECT  pb.product_id,  pb.title,  pv.product_variant_id,  pv.sku,  pv.ean 
FROM  2hand_products_brand pb 
 INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id   WHERE  pb.id_status = 1  AND pb.title LIKE '%ZETA-ALPH47-BEI2%' OR pv.sku LIKE '%ZETA-ALPH47-BEI2%' OR pv.ean LIKE '%ZETA-ALPH47-BEI2%'
 
 
 SELECT
  pb.product_id,
  pb.title,
  MAX(pv.product_variant_id) AS product_variant_id,
  MAX(pv.sku) AS sku,
  MAX(pv.ean) AS ean
FROM
  2hand_products_brand pb
  INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
WHERE
  pb.id_status = 1
  AND (pb.title LIKE '%over%' OR pv.sku LIKE '%over%' OR pv.ean LIKE '%over%')
GROUP BY
  pb.product_id,
  pb.title
		
		
	
	
	SELECT * FROM 2hand_products_brand as pb  WHERE pb.title = 'Oversize Shirt'
	
	SELECT
  pb.product_id,
  pb.title,
  MAX(pv.product_variant_id) AS product_variant_id,
  MAX(pv.sku) AS sku,
  MAX(pv.ean) AS ean,
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'variant_id', pv.product_variant_id,
      'variant_sku', pv.sku,
      'variant_ean', pv.ean
    )
  ) AS variants
FROM
  2hand_products_brand pb
  INNER JOIN (
    SELECT
      pv2.product_id,
      pv2.product_variant_id,
      pv2.sku,
      pv2.ean
    FROM
      2hand_products_variant pv2
    WHERE
      pv2.product_id IN (
        SELECT pb2.product_id
        FROM 2hand_products_brand pb2
        WHERE pb2.id_status = 1
          AND (pb2.title LIKE '%pride%' OR pv2.sku LIKE '%pride%' OR pv2.ean LIKE '%pride%')
      )
  ) pv ON pb.product_id = pv.product_id
WHERE
  pb.id_status = 1
  AND (pb.title LIKE '%pride%' OR pv.sku LIKE '%pride%' OR pv.ean LIKE '%pride%')
GROUP BY
  pb.product_id,
  pb.title



SELECT
  pb.product_id,
  pb.title,
  pv.product_variant_id,
  pv.sku,
  pv.ean
FROM
  2hand_products_brand pb
  INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
WHERE
  pb.id_status = 1
  AND (pb.title LIKE '%Spritiual Oversized Hoodie%' OR pv.sku LIKE '%Spritiual Oversized Hoodie%' OR pv.ean LIKE '%Spritiual Oversized Hoodie%')
	
	
	SELECT
  pb.product_id,
  pb.title,
  MAX(pv.product_variant_id) AS product_variant_id,
  MAX(pv.sku) AS sku,
  MAX(pv.ean) AS ean,
  GROUP_CONCAT(
    CONCAT(
      '[{"variant_id": ', pv.product_variant_id,
      ', "variant_sku": "', pv.sku,
      '", "variant_ean": "', pv.ean,
      '"}]'
    )
    SEPARATOR ', '
  ) AS variants
FROM
  2hand_products_brand pb
  INNER JOIN 2hand_products_variant pv ON pb.product_id = pv.product_id
WHERE
  pb.id_status = 1
  AND (pb.title LIKE '%PRIDE SOCKS%' OR pv.sku LIKE '%PRIDE SOCKS%' OR pv.ean LIKE '%PRIDE SOCKS%')
GROUP BY
  pb.product_id,
  pb.title



SELECT
  pb.product_id,
  pb.title,
  MAX(pv.product_variant_id) AS product_variant_id,
  MAX(pv.sku) AS sku,
  MAX(pv.ean) AS ean,
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'variant_id', pv3.product_variant_id,
      'variant_sku', pv3.sku,
      'variant_ean', pv3.ean
    )
  ) AS variants
FROM
  2hand_products_brand pb
  INNER JOIN (
    SELECT
      pv2.product_id,
      pv2.product_variant_id,
      pv2.sku,
      pv2.ean
    FROM
      2hand_products_variant pv2
    WHERE
      pv2.product_id IN (
        SELECT pb2.product_id
        FROM 2hand_products_brand pb2
        WHERE pb2.id_status = 1
          AND (pb2.title LIKE '%over%' OR pv2.sku LIKE '%over%' OR pv2.ean LIKE '%over%')
      )
  ) pv ON pb.product_id = pv.product_id
	 LEFT JOIN 2hand_products_variant pv3 ON pv.product_id = pv3.product_id
WHERE
  pb.id_status = 1
  AND (pb.title LIKE '%over%' OR pv.sku LIKE '%over%' OR pv.ean LIKE '%over%')
GROUP BY
  pb.product_id,
  pb.title


	



SELECT *, pb.title
FROM 2hand_products_variant as pv2
INNER JOIN 2hand_products_brand as pb on pb.product_id= pv2.product_id
WHERE pv2.product_id = (
  SELECT pv3.product_id
  FROM 2hand_products_variant as pv3
  WHERE pv3.sku = 'LUD0003003000002'
)



SELECT pb.title, pb.product_id FROM 2hand_products_brand as pb where pb.title= 'Chroma Capsule Oversized T-shirt'

SELECT * FROM 2hand_products_variant as pv where pv.sku = '007-02082-0070-020'



    SELECT *
    FROM 2hand_products_variant as pv2
    WHERE pv2.product_id = (
      SELECT product_id
      FROM 2hand_products_variant as pv3
      WHERE status_id = 1 and (pv3.sku LIKE '%5056395603604%' OR pv3.ean LIKE '%5056395603604%')
    )

SELECT * from 2hand_products_brand as pb where pb.product_id ='21138'







SELECT
pb.title,
pb.product_id,
ph.photo as image_url,
case when (select count(*) from 2hand_products_variant where 2hand_products_variant.sku like '%jeans%' or 2hand_products_variant.ean like '%jeans%') > 0 then pv.sku  else '' end as sku,
case when (select count(*) from 2hand_products_variant where 2hand_products_variant.ean like '%jeans%' or 2hand_products_variant.sku like '%jeans%') > 0 then pv.ean  else '' end as ean,
case when (select count(*) from 2hand_products_variant where 2hand_products_variant.sku like '%jeans%' or 2hand_products_variant.ean like '%jeans%' ) > 0 then pv.price  else '' end as price,
case when (select count(*) from 2hand_products_variant where 2hand_products_variant.sku like '%jeans%' or 2hand_products_variant.ean like '%jeans%' ) > 0 then pvoc1.option_child_description  else '' end as color,
case when (select count(*) from 2hand_products_variant where 2hand_products_variant.sku like '%jeans%' or 2hand_products_variant.ean like '%jeans%' ) > 0 then pvoc2.option_child_description  else '' end as size,
( select JSON_ARRAYAGG(t1.variant) from (select 
    JSON_OBJECT(
      'product_variant_id', pv2.product_variant_id,
      'sku', pv2.sku,
      'ean', pv2.ean,
			'image_url', ph2.photo,
			'price', pv2.price,
			'size', pvocs2.option_child_description,
			'color', pvocs1.option_child_description 
  ) as 'variant'  FROM 2hand_products_variant pv2
      LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position=2
			LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
			LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
      WHERE pv2.product_id = pb.product_id ) t1
) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
WHERE pb.id_status = 1 and pb.id_brand = 1
AND (pb.title LIKE '%jeans%' OR pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%')
GROUP BY pb.product_id, pb.title


order by pb.product_id






SELECT
  pb.title,
  ph.photo AS image_url,
  CASE WHEN pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%' THEN pv.sku ELSE '' END AS sku,
  CASE WHEN pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%' THEN pv.ean ELSE '' END AS ean,
  CASE WHEN pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%' THEN pv.price ELSE '' END AS price,
  CASE WHEN pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%' THEN pvoc1.option_child_description ELSE '' END AS color,
  CASE WHEN pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%' THEN pvoc2.option_child_description ELSE '' END AS size,
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'product_variant_id', pv2.product_variant_id,
      'sku', pv2.sku,
      'ean', pv2.ean,
      'image_url', ph2.photo,
      'price', pv2.price,
      'size', pvocs2.option_child_description,
      'color', pvoc1.option_child_description
    )
  ) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id = ph.product_variant_id AND ph.position = 1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
LEFT JOIN 2hand_products_variant pv2 ON pv2.product_id = pb.product_id
LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id AND ph2.position = 2
LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
WHERE pb.id_status = 1 AND pb.id_brand = 1
AND (pb.title LIKE '%KOW0009002000009%' OR pv.sku LIKE '%KOW0009002000009%' OR pv.ean LIKE '%KOW0009002000009%')
GROUP BY pb.product_id, pb.title;






SELECT
  pb.title,
	pb.product_id,
  ph.photo AS image_url,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.sku, '') AS sku,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.ean, '') AS ean,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.price, '') AS price,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pvoc1.option_child_description, '') AS color,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pvoc2.option_child_description, '') AS size,
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'product_variant_id', pv2.product_variant_id,
      'sku', pv2.sku,
      'ean', pv2.ean,
      'image_url', ph2.photo,
      'price', pv2.price,
      'size', pvocs2.option_child_description,
      'color', pvocs1.option_child_description
    )
  ) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id = ph.product_variant_id AND ph.position = 1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
LEFT JOIN 2hand_products_variant pv2 ON pv2.product_id = pb.product_id
LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id AND ph2.position = 1
LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
WHERE pb.id_status = 1 AND pb.id_brand = 1
AND (pb.title LIKE '%jeans%' OR pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%')
GROUP BY pb.product_id, pb.title;









SELECT
pb.title,
ph.photo as image_url,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.sku, '') AS sku,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.ean, '') AS ean,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pv.price, '') AS price,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pvoc1.option_child_description, '') AS color,
  IF(pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%', pvoc2.option_child_description, '') AS size,
( select JSON_ARRAYAGG(t1.variant) from (select 
    JSON_OBJECT(
      'product_variant_id', pv2.product_variant_id,
      'sku', pv2.sku,
      'ean', pv2.ean,
			'image_url', ph2.photo,
			'price', pv2.price,
			'size', pvocs2.option_child_description,
			'color', pvocs1.option_child_description 
  ) as 'variant'  FROM 2hand_products_variant pv2
      LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position=2
			LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
			LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
      WHERE pv2.product_id = pb.product_id ) t1
) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
WHERE pb.id_status = 1 and pb.id_brand = 1
AND (pb.title LIKE '%jeans%' OR pv.sku LIKE '%jeans%' OR pv.ean LIKE '%jeans%')
GROUP BY pb.product_id, pb.title








SELECT photo
FROM 2hand_products_variant_photos
WHERE product_variant_id = 394310 




select count(*) from 2hand_products_variant where 2hand_products_variant.ean like '%4063582981507%'



SELECT price from 2hand_products_variant where 2hand_products_variant.sku = 'LUD0001003000006'


	
SELECT
pv.ean,
pv.sku,
pvoc1.option_child_description AS 'color',
pvoc2.option_child_description AS 'size'
FROM 2hand_products_variant AS pv
INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
WHERE pv.sku = 'LUD0001003000006'
	
	
	
	SELECT pvoc. option_child_description FROM  2hand_products_variant as pv
	INNER JOIN 2hand_products_variant_options_child as pvoc on  pvoc.option_child_id = pv.product_variant_option1_id
	inner join 2hand_products_brand as pb on pb.product_id = pv.product_id
  left join 2hand_products_variant_photos as pvb on pvb.product_variant_id = pv.product_variant_id and pvb.position = 1
  where pv.sku = 'LUD0001003000006'
	
	
	
	
	
	
	
	
	
	
SELECT
pb.title,
pb.product_id,
ph.photo as image_url,
( select JSON_ARRAYAGG(t1.variant) from (select 
    JSON_OBJECT(
      'sku', pv2.sku,
      'ean', pv2.ean,
			'price', pv2.price,
			'size', pvocs2.option_child_description,
			'color', pvocs1.option_child_description,
			 'image_url', ph2.photo
  ) as 'variant'  FROM 2hand_products_variant pv2
			LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
			LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
			 LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position = 1
      WHERE pv2.product_id = pb.product_id ) t1
) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
WHERE pb.id_status = 1 and pb.id_brand = 1
AND (
      (pb.title LIKE '%jean%' AND LENGTH('%jean%') >= 5)
      OR (pv.sku LIKE 'jean%' AND LENGTH('jean%') >= 4)
      OR (pv.ean LIKE 'jean%' AND LENGTH('jean%') >= 4)
      )
    GROUP BY pb.product_id, pb.title;




	
	
	
	SELECT
    pb.title,
    pb.product_id,
    ph.photo AS image_url,
    (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'sku', pv2.sku,
                'ean', pv2.ean,
                'price', pv2.price,
                'size', pvocs2.option_child_description,
                'color', pvocs1.option_child_description,
                'image_url', ph2.photo
            )
        )
        FROM 2hand_products_variant pv2
        LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
        LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
        LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id AND ph2.position = 1
        WHERE pv2.product_id = pb.product_id
    ) AS variants
FROM 2hand_products_variant pv
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id = ph.product_variant_id AND ph.position = 1
LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
WHERE pb.id_status = 1
    AND pb.id_brand = 1
    AND (
        (pb.title LIKE '%LUD001200200001%' AND LENGTH('%LUD001200200001%') >= 5)
        OR (pv.sku LIKE 'LUD001200200001%' AND LENGTH('LUD001200200001%') >= 4 AND pv.ean NOT LIKE 'LUD001200200001%')
        OR (pv.ean LIKE 'LUD001200200001%' AND LENGTH('LUD001200200001%') >= 4 AND pv.sku NOT LIKE 'LUD001200200001%')
    )
GROUP BY pb.product_id, pb.title;


ALTER TABLE return_comments
DROP COLUMN id;



SELECT CONVERT(label USING utf8) as label FROM orders WHERE id_order = 4297699917963 AND id_brand =1

SELECT CONVERT(pod USING utf8) as pod FROM orders WHERE id_order = 5263712780583 AND id_brand =1




SELECT 
    rh.id_repair,
    rh.order_name,
    rh.created_at,
    concat(rh.first_name, ' ' , rh.last_name) as 'customer',
    rh.email_address as 'email',
    rh.address_name,
    rh.address_line1,
    rh.address_line2,
    rh.phone_number,
    rh.zipcode,
    rh.province,
    rh.city,
    c.country_code,
    rp.amount,
    rp.currency,
    rh.repair_status,
    rs.description as 'repair_status_dscpt',
    ifnull(rh.shipping_cost,0) as 'shipping_cost',
    rf.value as 'fee',
    rh.tracking_number_1,
    rh.tracking_number_2,
    (select c.track_link from carriers as c 
      inner join brands_carriers_country as bcc on bcc.id_carrier = c.id_carrier where bcc.id_brand = rh.id_brand and bcc.id_country = rh.id_country) as 'tracking_link',
    (select sum(total_price_line) from repair_line where id_repair = rh.id_repair) as 'subtotal'
    FROM repair_header as rh
    inner join repair_payments as rp on rp.id_repair_payment = rh.id_repair_payment
    inner join countries as c on c.country_id = rh.id_country
    inner join return_fees as rf on rf.return_fee_id = rh.return_fee_id
    inner join repair_status as rs on rs.id_repair_status = rh.repair_status
    where rh.id_repair = 285
		
		
		
		
		SELECT
	rh.created_at as date,
	rh.id_repair as idSubmission,
	rh.repair_status as IDStatus,
	rs.description as statusDescription,
	rh.id_repair_payment,
	pvp.photo as image_url,
	(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS option_1_key,
(SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
  WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS color,
(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS option_2_key,
(SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
  WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS size,
(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_key,
	pb.title	
	FROM  repair_header rh
	LEFT JOIN repair_status rs ON rh.repair_status = rs.id_repair_status
	LEFT JOIN repair_line rl ON rl.id_repair = rh.id_repair
	LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
	LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
	LEFT JOIN 2hand_products_variant_photos pvp ON pv.product_variant_id = pvp.product_variant_id
	WHERE rh.order_name = '#1007' AND rh.id_brand =1 AND rh.id_repair_payment IS NOT NULL
  ORDER BY rh.created_at DESC
		
		
		
		SELECT
pc.product_child_id AS idSubmission,
pc.created_at AS date,
pc.price,
pc.product_child_id_status AS IDStatus,
pcs.description AS statusDescription,
c.code_currency AS currency,
pv.sku,
(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS option_1_key,
(SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
  WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS color,
(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS option_2_key,
(SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
  WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS size,
(SELECT option_description FROM 2hand_products_variant_options AS pvo
  INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
  WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_key,
(SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
  WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS option_3_value,
pcp.blob AS image_url,
pb.title
FROM
2hand_products_child pc
LEFT JOIN 2hand_products_child_status pcs ON pc.product_child_id_status = pcs.product_status_id
INNER JOIN 2hand_customers cust ON pc.customer_id = cust.CustomerID
INNER JOIN currencies c ON cust.CurrencyID = c.id_currency
LEFT JOIN 2hand_products_variant pv ON pc.product_variant_id = pv.product_variant_id
LEFT JOIN 2hand_products_child_photos pcp ON pc.product_child_id = pcp.product_child_id
LEFT JOIN 2hand_products_brand pb ON pv.product_id = pb.product_id
WHERE
pc.order_name = '#123456'  AND pc.id_brand=1
ORDER BY pc.product_child_id DESC




SELECT
  pb.title,
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'option_1_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option1_id) AS 'color',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'option_2_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option2_id) AS 'size',
  (SELECT option_description FROM 2hand_products_variant_options AS pvo
    INNER JOIN 2hand_products_variant_options_child AS pvoc ON pvoc.variant_option_id = pvo.variant_option_id
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_key',
  (SELECT option_child_description FROM 2hand_products_variant_options_child AS pvoc
    WHERE pvoc.option_child_id = pv.product_variant_option3_id) AS 'option_3_value',
  pvb.photo AS 'image_url',
  r.id_return AS idSubmission,
  r.order_name,
  r.currency,
  DATE(r.order_created_at) AS date,
  rl.sku,
  rl.total AS price,
  r.IDStatus,
  rs.description AS statusDescription
FROM
  returns r
  INNER JOIN returns_lines rl ON r.id_return = rl.id_return
  LEFT JOIN returnStatus rs ON r.IDStatus = rs.IDStatus
  LEFT JOIN 2hand_products_variant pv ON pv.sku = rl.sku
  LEFT JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
  LEFT JOIN 2hand_products_variant_photos pvb ON pvb.product_variant_id = pv.product_variant_id AND pvb.position = 1
WHERE
  r.order_name = '#1015' AND r.id_brand=1
  AND rl.order_line_id IS NOT NULL
	ORDER BY r.started_at DESC
	
	
	
	
	SELECT country_name, country_code from countries
	
	
	
	
	
	
	
	
	
	select distinct ols.id_label, count(ols.id_label) as count_listings, ifnull(ls.id_carrier,1) as id_carrier,
    (
        select JSON_OBJECT(
            'customer_id', 2hand_customers.CustomerID,
            'firstName', 2hand_addresses.FirstName,
            'lastName', 2hand_addresses.LastName,
            'addressLine1', 2hand_addresses.AddressLine1,
            'addressLine2', 2hand_addresses.AddressLine2,
            'city', 2hand_addresses.City,
            'zipcode', 2hand_addresses.ZIPCode,
            'country_code', countries.country_code,
            'phone', 2hand_addresses.PhoneNumber,
            'emailAddress', 2hand_customers.EmailAddress
        )
        from 2hand_listings 
        inner join 2hand_shoppingbags_line on 2hand_shoppingbags_line.listing_id = 2hand_listings.listing_id
        inner join 2hand_order_lines on 2hand_order_lines.id_shoppingbag_line = 2hand_shoppingbags_line.shopping_bag_line_id
        inner join 2hand_order_labels on 2hand_order_labels.id_order_line = 2hand_order_lines.id_order_line
        inner join 2hand_customers on 2hand_customers.CustomerID = 2hand_listings.customer_id
        inner join 2hand_products_child on 2hand_products_child.product_child_id = 2hand_listings.product_id
        inner join 2hand_addresses on 2hand_addresses.AddressID = 2hand_products_child.AddressID
        inner join countries on countries.country_id = 2hand_addresses.CountryID
        where 2hand_order_labels.id_label = ols.id_label limit 1
    ) as seller
    from 2hand_order_labels ols
    inner join 2hand_labels ls on ls.id_label = ols.id_label
   where  ols.id_order_line in  (select ol.id_order_line from 2hand_order_lines ol where ol.id_order_header = 231) 
    and ols.id_label_type = 1
    group by ols.id_label, ifnull(ls.id_carrier,1)
	
	
	
	select 
	2hand_shoppingbags_line.listing_id 
	
	-- 2hand_customers.CustomerID, 
	-- 2hand_addresses.FirstName, 
	-- 2hand_addresses.LastName,
	-- 2hand_addresses.AddressLine1, 
	-- 2hand_addresses.AddressLine2,
	--  2hand_addresses.City, 
	-- 2hand_addresses.ZIPCode, 
	-- countries.country_code, 
	-- 2hand_addresses.PhoneNumber, 
	-- 2hand_customers.EmailAddress
        from 2hand_listings 
        inner join 2hand_shoppingbags_line on 2hand_shoppingbags_line.listing_id = 2hand_listings.listing_id
      inner join 2hand_order_lines on 2hand_order_lines.id_shoppingbag_line = 2hand_shoppingbags_line.shopping_bag_line_id
     inner join 2hand_order_labels on 2hand_order_labels.id_order_line = 2hand_order_lines.id_order_line
--         inner join 2hand_customers on 2hand_customers.CustomerID = 2hand_listings.customer_id
--         inner join 2hand_products_child on 2hand_products_child.product_child_id = 2hand_listings.product_id
--         inner join 2hand_addresses on 2hand_addresses.AddressID = 2hand_products_child.AddressID
--         inner join countries on countries.country_id = 2hand_addresses.CountryID
        where 2hand_order_labels.id_label = 403
	
	
	
	
	SELECT country_name FROM countries
	WHERE coutry_id = null OR country_code = AT 
	
	
	SELECT country_name 
FROM countries 
WHERE (country_id = ? OR ? IS NULL) OR (country_code = ? OR ? IS NULL);




SELECT email_template_offer_request, email_template_offer_accepted FROM 2hand_email_templates



SELECT started_at FROM 2hand_order_header;


SELECT 2h.id_order_header, 2h.id_brand, 2h.created_at, 2h.id_order_status, 2h.id_customer, 
2h.shipping_first_name as first_name, 2h.shipping_last_name, 2hp.payment_email, 2h.shipping_address_line_1 as adress1,
2h.shipping_address_line_2 as adress2, 2h.shipping_phone_number as phone, 2h.shipping_zipcode as zipcode, 2h.shipping_city as city, 2hp.payment_status as payment_description, 2h.amount, 2h.id_currency, ct.country_code, code_currency, 2hs.description
FROM 2hand_order_header as 2h
LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
WHERE id_brand= 1
and (2h.created_at between "2021-06-02 12:08:54" and "2024-06-02 12:08:54" );





SELECT DISTINCT 2h.id_order_header, 2h.id_brand, 2h.created_at, 2h.id_order_status, 2h.id_customer, 
2hc.FirstName as first_name, 2hc.LastName as last_name, 2h.amount,ct.country_code, cc.code_currency as currency, 2hs.description,
2hc.EmailAddress as email, 2h.shipping_address_line_1, 2h.shipping_address_line_2, 2h.billing_address_line_1, 2h.billing_address_line_2,
(SELECT COUNT(*) FROM 2hand_order_lines AS 2hol WHERE 2hol.id_order_header = 2h.id_order_header) as order_lines_count
FROM 2hand_order_header as 2h
LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2
and (2h.created_at between "2021-06-02 12:08:54" and "2024-06-02 12:08:54");


SELECT * from 2hand_order_status;


SELECT * from 2hand_order_header WHERE id_brand=1



-- COUNT(DISTINCT 2hol.id_order_line) AS lenght_lines


SELECT DISTINCT 2hol.id_order_line,
2hoh.id_order_header,
2hol.id_order_line_status,
2hos.description,
2hpv.price AS originalPrice,
2hl.price AS secondHandPrice,
2hpv.sku,
2hpv.ean,
2hpb.title,
2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size,
2hpvp.photo AS originalPhoto,
2hc.EmailAddress,
2hc.FirstName,
2hc.LastName,
2hl.price,
2hoh.amount,
2hoh.processing_fee,
2hoh.shipping_cost,
(
SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'url_link', 2hpcp.blob
        )
    ) FROM 2hand_products_child_photos 2hpcp WHERE 2hpcp.product_child_id = 2hpc.product_child_id
) as photos
FROM 2hand_order_lines 2hol
INNER JOIN 2hand_order_header 2hoh ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_payments 2hpay ON 2hpay.id_order_payment = 2hoh.id_order_payment
INNER JOIN 2hand_shoppingbags_line 2hsbl ON 2hsbl.shopping_bag_line_id = 2hol.id_shoppingbag_line
INNER JOIN 2hand_shoppingbags 2hsb ON 2hsb.shopping_bag_id = 2hsbl.shopping_bag_id
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = 2hsbl.listing_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_order_status 2hos ON 2hos.id_order_status = 2hoh.id_order_status
INNER JOIN 2hand_customers 2hc ON 2hoh.id_customer = 2hc.CustomerID
WHERE 2hol.id_order_header =223 and 2hl.brand_id=1











SELECT DISTINCT 2hol.id_order_line,
2hoh.id_order_header,
2hol.id_order_line_status,
2hos.description,
2hpv.price AS originalPrice,
2hl.price AS secondHandPrice,
2hpv.sku,
2hpv.ean,
2hpb.title,
2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size,
2hpvp.photo AS originalPhoto,
2hc.EmailAddress,
2hc.FirstName,
2hc.LastName,
   2pvoc3.option_child_description AS option3,
(select option_description from 2hand_products_variant_options as pvo
      inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
      where pvoc.option_child_id = 2hpv.product_variant_option1_id
) as 'option_1_key',
(select option_description from 2hand_products_variant_options as pvo
      inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
      where pvoc.option_child_id = 2hpv.product_variant_option2_id
) as 'option_2_key',
 (select option_description from 2hand_products_variant_options as pvo
      inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
      where pvoc.option_child_id = 2hpv.product_variant_option3_id
) as 'option_3_key',
(
SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'url_link', 2hpcp.blob
        )
    ) FROM 2hand_products_child_photos 2hpcp WHERE 2hpcp.product_child_id = 2hpc.product_child_id
) as photos
FROM 2hand_order_lines 2hol
INNER JOIN 2hand_order_header 2hoh ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_payments 2hpay ON 2hpay.id_order_payment = 2hoh.id_order_payment
INNER JOIN 2hand_shoppingbags_line 2hsbl ON 2hsbl.shopping_bag_line_id = 2hol.id_shoppingbag_line
INNER JOIN 2hand_shoppingbags 2hsb ON 2hsb.shopping_bag_id = 2hsbl.shopping_bag_id
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = 2hsbl.listing_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
LEFT JOIN 2hand_products_variant_options_child 2pvoc3 ON 2hpv.product_variant_option3_id = 2pvoc3.option_child_id
INNER JOIN 2hand_order_status 2hos ON 2hos.id_order_status = 2hoh.id_order_status
INNER JOIN 2hand_customers 2hc ON 2hoh.id_customer = 2hc.CustomerID
WHERE 2hol.id_order_header =218 and 2hl.brand_id=1








SELECT DISTINCT 2hol.id_order_line,
2hoh.id_order_header,
2hol.id_order_line_status,
2hpv.sku,
2hpv.ean
FROM 2hand_order_lines 2hol
INNER JOIN 2hand_order_header 2hoh ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_payments 2hpay ON 2hpay.id_order_payment = 2hoh.id_order_payment
INNER JOIN 2hand_shoppingbags_line 2hsbl ON 2hsbl.shopping_bag_line_id = 2hol.id_shoppingbag_line
INNER JOIN 2hand_shoppingbags 2hsb ON 2hsb.shopping_bag_id = 2hsbl.shopping_bag_id
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = 2hsbl.listing_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
WHERE 2hol.id_order_header =218 and 2hl.brand_id=1



SELECT r.id_return, r.order_id, r.order_name, r.id_brand, r.order_created_at, r.started_at, r.IDStatus, r.id_customer, r.first_name, r.last_name, r.email, r.address1,
      r.address2, r.phone, r.zipcode, r.province, r.country, r.city, rpo.description as "payment_description", r.order_name_exc, r.order_id_exc, r.refund_total, r.currency
      from returns as r
      inner join return_payment_options as rpo on rpo.id_return_payment = r.id_return_payment
      WHERE r.id_brand = 1
      and (r.started_at between "2021-06-02 12:08:54" and "2024-06-02 12:08:54" );



SELECT rl.id_return, rl.id_return_line, rl.order_line_id, rl.IDStatus, rl.id_product, rl.sku, rl.ean, rl.quantity, 
      rl.return_reason_id, rl.return_reason_note, ro.option
      from returns_lines as rl
      left join return_options as ro on ro.option_id = rl.return_reason_id
      WHERE rl.id_return = 512;
	
	
	
	
	
SELECT sb.shopping_bag_id,
sbl.shopping_bag_line_id,
oh.created_at,
oh.id_order_status,
2hpv.sku,
2hpv.ean,
2hpb.title
FROM 2hand_shoppingbags_line sbl 
INNER JOIN 2hand_shoppingbags sb ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0;







SELECT sb.shopping_bag_id,
sbl.shopping_bag_line_id,
sb.CreatedAt,
2hpv.sku,
2hpv.ean,
2hpb.title,
2ha.AddressLine1,
2hl.price,
FROM 2hand_shoppingbags_line sbl 
INNER JOIN 2hand_shoppingbags sb ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0;








-- teste query


SELECT DISTINCT sb.shopping_bag_id,
sbl.shopping_bag_line_id,
sb.CreatedAt,
2hpv.sku,
2hpv.ean,
2hpb.title,
2ha.AddressLine1,
2hl.price,
2hc.FirstName,
(SELECT Count(*) FROM 2hand_shoppingbags_line  as 2hsbl WHERE 2hsbl.shopping_bag_id = sb.shopping_bag_id)AS count
FROM 2hand_shoppingbags_line sbl 
INNER JOIN 2hand_shoppingbags sb ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
LEFT JOIN 2hand_customers 2hc on 2hl.customer_id = 2hc.CustomerID
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0;






-- teste



SELECT sb.shopping_bag_id,
sbl.shopping_bag_line_id,
sb.CreatedAt,
2hpv.sku,
2hpv.ean,
2hpb.title,
2ha.AddressLine1,
2hl.price,
2hc.FirstName,
2hc.EmailAddress as email,
cc.code_currency,
(SELECT Count(*) FROM 2hand_shoppingbags_line  as 2hsbl WHERE 2hsbl.shopping_bag_id = sb.shopping_bag_id)AS count
FROM  2hand_shoppingbags sb
INNER JOIN 2hand_shoppingbags_line sbl  ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
LEFT JOIN 2hand_customers 2hc on 2hl.customer_id = 2hc.CustomerID
INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0
GROUP BY sb.shopping_bag_id;



-- final 


SELECT sb.shopping_bag_id,
sb.CreatedAt as created_at,
2hl.price,
2hc.EmailAddress as email,
cc.code_currency,
ct.country_code,
(SELECT Count(*) FROM 2hand_shoppingbags_line  as 2hsbl WHERE 2hsbl.shopping_bag_id = sb.shopping_bag_id)AS count
FROM  2hand_shoppingbags sb
INNER JOIN 2hand_shoppingbags_line sbl  ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
LEFT JOIN 2hand_customers 2hc on 2hl.customer_id = 2hc.CustomerID
LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
LEFT JOIN countries ct on 2ha.CountryID= ct.country_id
INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0 and (sb.CreatedAt between '2021-07-25 12:23:55' and '2024-07-25 12:23:55')
GROUP BY sb.shopping_bag_id;


-- LINES





SELECT sb.shopping_bag_id, sbl.shopping_bag_line_id,
sb.CreatedAt as created_at,
2hl.price,
2hc.EmailAddress,
cc.code_currency,
ct.country_code,
2hpv.sku,
2hpv.ean,
2hpb.title as productName,
2ha.AddressLine1,
2ha.AddressLine2,
2ha.City,
2ha.Province,
2ha.ZIPCode,
2hc.FirstName,
2hc.LastName,
2hpvp.photo AS originalPhoto,
2hpvoc.option_child_description as color,
2pvoc2.option_child_description AS size,
2pvoc3.option_child_description AS option3,
(select option_description from 2hand_products_variant_options as pvo
        inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
        where pvoc.option_child_id = 2hpv.product_variant_option1_id
  ) as 'product_variant_option1',
  (select option_description from 2hand_products_variant_options as pvo
        inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
        where pvoc.option_child_id = 2hpv.product_variant_option2_id
  ) as 'product_variant_option2',
  (select option_description from 2hand_products_variant_options as pvo
    inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
    where pvoc.option_child_id = 2hpv.product_variant_option3_id
) as 'product_variant_option3',
  (
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'url_link', 2hpcp.blob
            )
        ) FROM 2hand_products_child_photos 2hpcp WHERE 2hpcp.product_child_id = 2hpc.product_child_id
    ) as photos
FROM  2hand_shoppingbags_line sbl
INNER JOIN 2hand_shoppingbags sb  ON sb.shopping_bag_id = sbl.shopping_bag_id
LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
INNER JOIN 2hand_customers 2hc on sb.customer_id = 2hc.CustomerID
LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
LEFT JOIN countries ct on 2ha.CountryID= ct.country_id
INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
LEFT JOIN 2hand_products_variant_options_child 2pvoc3 ON 2hpv.product_variant_option3_id = 2pvoc3.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
WHERE c.IDBrand = 1) AND sb.archived = 0 and sb.shopping_bag_id =81
GROUP BY sbl.shopping_bag_line_id







SELECT sb.shopping_bag_id,
    sb.CreatedAt as created_at,
    2hl.price as amount,
    2hc.EmailAddress as email,
    cc.code_currency,
    ct.country_code,
		2hc.FirstName as first_name,
    2hc.LastName as last_name,
		cc.code_currency as currency,
		2ha.AddressLine1,
		2ha.AddressLine2,
		2ha.City,
		2ha.Province,
		2ha.ZIPCode
    FROM  2hand_shoppingbags sb
    INNER JOIN 2hand_shoppingbags_line sbl  ON sb.shopping_bag_id = sbl.shopping_bag_id
    LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
    LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
    INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
    INNER JOIN 2hand_customers 2hc on sb.customer_id = 2hc.CustomerID
    LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
    LEFT JOIN countries ct on 2ha.CountryID= ct.country_id
    INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
    WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
    INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
    WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
    AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
    WHERE c.IDBrand = 1) AND sb.archived = 0 and sb.shopping_bag_id=87
    GROUP BY sb.shopping_bag_id





 SELECT sb.shopping_bag_id, sbl.shopping_bag_line_id,
    sb.CreatedAt as created_at,
    2hl.price,
    cc.code_currency,
    2hpv.sku,
    2hpv.ean,
    2hpb.title as productName,
    2hpvp.photo AS originalPhoto,
    2hpvoc.option_child_description as color,
    2pvoc2.option_child_description AS size,
    2pvoc3.option_child_description AS option3,
    (select option_description from 2hand_products_variant_options as pvo
            inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
            where pvoc.option_child_id = 2hpv.product_variant_option1_id
      ) as 'product_variant_option1',
      (select option_description from 2hand_products_variant_options as pvo
            inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
            where pvoc.option_child_id = 2hpv.product_variant_option2_id
      ) as 'product_variant_option2',
      (select option_description from 2hand_products_variant_options as pvo
        inner join 2hand_products_variant_options_child as pvoc on pvoc.variant_option_id = pvo.variant_option_id
        where pvoc.option_child_id = 2hpv.product_variant_option3_id
    ) as 'product_variant_option3',
      (
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'url_link', 2hpcp.blob
                )
            ) FROM 2hand_products_child_photos 2hpcp WHERE 2hpcp.product_child_id = 2hpc.product_child_id
        ) as photos
    FROM  2hand_shoppingbags_line sbl
    INNER JOIN 2hand_shoppingbags sb  ON sb.shopping_bag_id = sbl.shopping_bag_id
    LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
    LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
    INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
    INNER JOIN 2hand_customers 2hc on sb.customer_id = 2hc.CustomerID
    INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
    INNER JOIN 2hand_products_child 2hpc ON 2hpc.product_child_id = 2hl.product_id
    INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
    INNER JOIN 2hand_products_brand 2hpb ON 2hpb.product_id = 2hpv.product_id
    INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
    INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
    LEFT JOIN 2hand_products_variant_options_child 2pvoc3 ON 2hpv.product_variant_option3_id = 2pvoc3.option_child_id
    INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
    WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
    INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
    WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
    AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
    WHERE c.IDBrand = 1) AND sb.archived = 0 and sb.shopping_bag_id = 81
    GROUP BY sbl.shopping_bag_line_id
		
		
		
		
		
		
		SELECT sb.shopping_bag_id, sbl.shopping_bag_line_id,
    sb.CreatedAt as created_at,
    2hc.EmailAddress as email,
    cc.code_currency,
		price.total_price as price,
    (SELECT Count(*) FROM 2hand_shoppingbags_line  as 2hsbl WHERE 2hsbl.shopping_bag_id = sb.shopping_bag_id) as count
    FROM  2hand_shoppingbags sb
    INNER JOIN 2hand_shoppingbags_line sbl  ON sb.shopping_bag_id = sbl.shopping_bag_id
    LEFT JOIN 2hand_order_lines ol ON ol.id_shoppingbag_line = sbl.shopping_bag_line_id
    LEFT JOIN 2hand_order_header oh ON oh.id_order_header = ol.id_order_header
    INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
    INNER JOIN 2hand_customers 2hc on sb.customer_id = 2hc.CustomerID
    LEFT JOIN 2hand_addresses 2ha on 2ha.CustomerID = sb.customer_id
    INNER JOIN currencies as cc on cc.id_currency = 2hc.CurrencyID
		LEFT JOIN
    (
		SELECT
            sbl.shopping_bag_id,
            SUM(2hl.price) as total_price
        FROM
            2hand_shoppingbags_line sbl
        INNER JOIN
            2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
        GROUP BY
            sbl.shopping_bag_id
    ) price ON sb.shopping_bag_id = price.shopping_bag_id 
    WHERE sbl.shopping_bag_line_id NOT IN (SELECT ol2.id_shoppingbag_line FROM 2hand_order_lines ol2
    INNER JOIN 2hand_order_header oh2 ON oh2.id_order_header = ol2.id_order_header
    WHERE oh2.id_order_payment IS NOT NULL AND oh2.paid_at IS NOT NULL)
    AND sb.customer_id IN (SELECT c.CustomerID FROM 2hand_customers c
    WHERE c.IDBrand = 1) AND sb.archived = 0 
    GROUP BY sb.shopping_bag_id;



LEFT JOIN
    (
        SELECT
            sbl.shopping_bag_id,
            SUM(2hl.price) as total_price
        FROM
            2hand_shoppingbags_line sbl
        INNER JOIN
            2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
        GROUP BY
            sbl.shopping_bag_id
    )  prices ON sb.shopping_bag_id = prices.shopping_bag_id
		
		
		(SELECT
				  SUM(2hl.price) as total_price
        FROM
            2hand_shoppingbags_line sbl
        INNER JOIN
            2hand_listings 2hl ON 2hl.listing_id = sbl.listing_id
        GROUP BY
            sbl.shopping_bag_id) as price,
		
		
		
		 SELECT DISTINCT 2h.id_order_header, 2h.created_at, 2h.id_order_status,
    2h.amount, ct.country_code, cc.code_currency as currency, 2hs.description,
    2hc.EmailAddress as email,
    (SELECT COUNT(*) FROM 2hand_order_lines AS 2hol WHERE 2hol.id_order_header = 2h.id_order_header) as order_lines_count
    FROM 2hand_order_header as 2h
    LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
    INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
    INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
    INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
    INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
		INNER JOIN 2hand_order_lines 2hol ON 2h.id_order_header = 2hol.id_order_header
		INNER JOIN 2hand_shoppingbags_line 2hsbl ON 2hsbl.shopping_bag_line_id = 2hol.id_shoppingbag_line
    INNER JOIN 2hand_shoppingbags 2hsb ON 2hsb.shopping_bag_id = 2hsbl.shopping_bag_id
    INNER JOIN 2hand_listings 2hl ON 2hl.listing_id = 2hsbl.listing_id
    WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2 
		


 SELECT DISTINCT 2h.id_order_header, 2h.created_at, 2h.id_order_status,
    2h.amount, ct.country_code, cc.code_currency as currency, 2hs.description,
    2hc.EmailAddress as email,
    (SELECT COUNT(*) FROM 2hand_order_lines AS 2hol WHERE 2hol.id_order_header = 2h.id_order_header) as order_lines_count
    FROM 2hand_order_header as 2h
    LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
    INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
    INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
    INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
    INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
    WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2
		
		
		
		
		
		   SELECT DISTINCT 2h.id_order_header, 2h.id_brand, 2h.created_at, 2h.id_order_status, 2h.id_customer, 
    2hc.FirstName as first_name, 2hc.LastName as last_name, 2h.amount,ct.country_code, cc.code_currency as currency, 2hs.description, 2h.shipping_zipcode, 2h.shipping_city, 2h.billing_zipcode, 2h.billing_city, ctb.country_code as country_codeB,
    2hc.EmailAddress as email, 2h.shipping_address_line_1, 2h.shipping_address_line_2, 2h.billing_address_line_1, 2h.billing_address_line_2,  2h.shipping_cost, 2h.processing_fee
    FROM 2hand_order_header as 2h
    LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
    INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
    INNER JOIN countries as ctb on  2h.billing_idcountry = ctb.country_id
    INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
    INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
    INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
    WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2 and 2h.id_order_header =223
		
		
		
		
SELECT r.id_return, r.order_id, r.order_name, r.id_brand, r.order_created_at, r.started_at, r.IDStatus, r.id_customer, r.first_name, r.last_name, r.email, r.address1,
    r.address2, r.phone, r.zipcode, r.province, r.country, r.city, rpo.description as "payment_description", r.order_name_exc, r.order_id_exc, r.refund_total, r.currency
    from returns as r
    inner join return_payment_options as rpo on rpo.id_return_payment = r.id_return_payment
    WHERE r.id_brand = 1
    and (r.started_at between "2023-07-21" and "2023-08-21" )  ORDER BY r.started_at DESC;
		
		
		
		
		SELECT
      2hand_products_child.*, 
      2hand_customers.FirstName, 
      2hand_customers.LastName, 
      2hand_products_child_status.description AS status_description,
      currencies.code_currency
    FROM
      2hand_products_child
      INNER JOIN
      2hand_products_child_status
      ON 
        2hand_products_child.product_child_id_status = 2hand_products_child_status.product_status_id
      INNER JOIN
      2hand_customers
      ON 
        2hand_products_child.customer_id = 2hand_customers.CustomerID
        INNER JOIN currencies ON 2hand_customers.CurrencyID = currencies.id_currency
        WHERE id_brand=1 ORDER BY 2hand_products_child.created_at DESC
				
				
				
				
				
				
				
SELECT e.replyTo, e.from FROM brands_smtp as e WHERE id_brand=1



SELECT COUNT(*) FROM 2hand_customers WHERE guest=0


SELECT COUNT(*) FROM 2hand_listings WHERE archived =0



SELECT COUNT(*) as nSales FROM 2hand_order_header as 2hoh
WHERE id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL

SELECT SUM(amount) as aSales, c.code_currency FROM 2hand_order_header as 2hoh
LEFT JOIN currencies as c on c.id_currency = 2hoh.id_currency
WHERE id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL


SELECT SUM(amount) as aSales FROM 2hand_order_header as 2hoh
WHERE id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL



SELECT COUNT(*) as nListings, 2hl.product_id  FROM 2hand_listings as 2hl
INNER JOIN 2hand_products_child as 2hpc ON 2hpc.product_child_id = 2hl.product_id
WHERE 2hpc.id_brand = 1
ORDER BY nListings DESC limit 3



SELECT (SELECT COUNT(*) FROM 2hand_listings) as nListings, 2hl.product_id  FROM 2hand_listings as 2hl
INNER JOIN 2hand_products_child as 2hpc ON 2hpc.product_child_id = 2hl.product_id
WHERE 2hpc.id_brand = 1
ORDER BY nListings DESC limit 3



SELECT title, count(*) as nProducts, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpv.sku,2hpvp.photo 
FROM 2hand_products_brand
INNER JOIN 2hand_products_variant as 2hpv  ON 2hpv.product_id = 2hand_products_brand.product_id
INNER JOIN 2hand_products_child ON 2hand_products_child.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_listings ON 2hand_listings.product_id = 2hand_products_child.product_child_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
WHERE 2hand_products_child.id_brand = 1
GROUP BY 2hand_products_brand.product_id
ORDER BY nProducts DESC LIMIT 3


SELECT COUNT(*) as bSProducts, c.country_code,2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpv.sku, 2hpvp.photo 
FROM 2hand_order_header as 2hoh
INNER JOIN 2hand_order_lines as 2hol ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = 2hsbl.shopping_bag_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id = 2hl.listing_id
INNER JOIN 2hand_products_child as 2hpc ON 2hl.product_id = 2hpc.product_child_id
INNER JOIN 2hand_products_variant as 2hpv ON 2hpc.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand AS 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN countries as c ON 2hoh.shipping_idcountry = c.country_id
WHERE 2hoh.id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL
GROUP BY 2hpb.product_id
ORDER BY bsProducts DESC LIMIT 3





SELECT 2hpb.title, COUNT(*) as bSProducts, c.country_code, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpv.sku, 2hpvp.photo 
FROM 2hand_order_header as 2hoh
INNER JOIN 2hand_order_lines as 2hol ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = 2hsbl.shopping_bag_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id = 2hl.listing_id
INNER JOIN 2hand_products_child as 2hpc ON 2hl.product_id = 2hpc.product_child_id
INNER JOIN 2hand_products_variant as 2hpv ON 2hpc.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand AS 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN countries as c ON 2hoh.shipping_idcountry = c.country_id
WHERE 2hoh.id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL
GROUP BY 2hpb.product_id
ORDER BY bsProducts DESC LIMIT 3



SELECT COUNT(*) as nSales FROM 2hand_order_header as 2hoh
WHERE id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL


INNER JOIN 2hand_listings as 2hl ON 2hl.product_id = 2hpc.product_child_id

SELECT COUNT(*) as nSales,c.country_code
FROM 2hand_order_header as 2hoh
INNER JOIN countries as c ON 2hoh.shipping_idcountry = c.country_id
WHERE id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL
GROUP BY c.country_code
ORDER BY c.country_code DESC
		
		
SELECT  
FLOOR(average_selling_time) AS dias,
AVG(DATEDIFF(2hoh.paid_at, 2hl.created_at))as average_selling_time 
FROM 2hand_order_header as 2hoh
INNER JOIN 2hand_order_lines as 2hol ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = 2hsbl.shopping_bag_line_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id = 2hl.listing_id
WHERE 2hoh.paid_at IS NOT NULL


2hl.created_at
2hoh.paid_at


SELECT
  ceiling(average_selling_time) AS days,
  ceiling(MOD(average_selling_time * 24, 24)) AS hours,
  ceiling(MOD(average_selling_time * 24 * 60, 60)) AS minutes
FROM
(
  (SELECT AVG(DATEDIFF(2hoh.paid_at, 2hl.created_at)) AS average_selling_time
  FROM
    2hand_order_header AS 2hoh
  INNER JOIN
    2hand_order_lines AS 2hol ON 2hoh.id_order_header = 2hol.id_order_header
  INNER JOIN
    2hand_shoppingbags_line AS 2hsbl ON 2hol.id_shoppingbag_line = 2hsbl.shopping_bag_line_id
  INNER JOIN
    2hand_listings AS 2hl ON 2hsbl.listing_id = 2hl.listing_id
  WHERE
    2hoh.paid_at IS NOT NULL AND 2hoh.id_order_payment IS NOT NULL AND id_brand=1)
) AS q;




SELECT 2hol.value,  2hpv.price,
 ((2hpv.price - 2hol.value) / 2hpv.price) * 100 AS percent_below_retail
FROM 2hand_order_lines as 2hol 
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = shopping_bag_line_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id= 2hl.listing_id
INNER JOIN 2hand_products_child as 2hpc ON 2hl.product_id= 2hpc.product_child_id
INNER JOIN 2hand_products_variant as 2hpv ON 2hpc.product_variant_id = 2hpv.product_variant_id
WHERE id_brand=1



SELECT 
 AVG(((2hpv.price - 2hol.value) / 2hpv.price) * 100) AS percent_below_retail
FROM 2hand_order_lines as 2hol 
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = shopping_bag_line_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id= 2hl.listing_id
INNER JOIN 2hand_products_child as 2hpc ON 2hl.product_id= 2hpc.product_child_id
INNER JOIN 2hand_products_variant as 2hpv ON 2hpc.product_variant_id = 2hpv.product_variant_id
WHERE id_brand=1


SELECT 2hpb.title, COUNT(*) as bSProducts, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpv.sku, 2hpvp.photo 
FROM 2hand_order_header as 2hoh
INNER JOIN 2hand_order_lines 2hol ON 2hoh.id_order_header = 2hol.id_order_header
INNER JOIN 2hand_shoppingbags_line as 2hsbl ON 2hol.id_shoppingbag_line = shopping_bag_line_id
INNER JOIN 2hand_listings as 2hl ON 2hsbl.listing_id= 2hl.listing_id
INNER JOIN 2hand_products_child as 2hpc ON 2hl.product_id= 2hpc.product_child_id
INNER JOIN 2hand_products_variant as 2hpv ON 2hpc.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand AS 2hpb ON 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
WHERE 2hoh.id_brand=1 AND 2hoh.paid_at IS NOT NULL and 2hoh.id_order_payment IS NOT NULL
GROUP BY 2hpb.product_id
ORDER BY bSProducts DESC LIMIT 3


SELECT COUNT(*) as nRepairs FROM repair_header as rh
WHERE repair_status=2 and id_brand=1 and id_repair_payment IS NOT NULL


SELECT SUM(total_price_line) as tVRepairs FROM repair_header as rh
INNER JOIN repair_line as rl ON  rh.id_repair = rl.id_repair
WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL



SELECT 2hpv.sku, 2hpb.title, COUNT(*) as nRepairs, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpvp.photo,
(
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'sDescription', rsa.description
                )
            ) 
        ) as sDescriptions
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
-- WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY 2hpb.product_id
ORDER BY nRepairs  DESC -- LIMIT 1




SELECT rsa.description, COUNT(*) as nServices,
 (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
						'id', id,
						'title', title
						)
        )
        FROM (
            SELECT 2hpb.product_id as id, 2hpb.title as title
            FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
GROUP BY 2hpb.product_id
        ) as q
    ) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
-- WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC -- LIMIT 1





SELECT  DISTINCT rsa.description, COUNT(*) as nServices,
(
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'title', 2hpb.title,
										'id', 2hpb.product_id
                )
            ) 
        ) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
-- WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC -- LIMIT 1




SELECT
    rsa.description,
    COUNT(*) as nServices,
    (
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'title', subquery.title,
                    'id', subquery.product_id,
                    'sku', subquery.sku
                )
            ) 
        FROM (
            SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku
            FROM repair_header as rh
            INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
            INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
            INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
            INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
            INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
            INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
            INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
						WHERE rsas.id_service = rl.id_service
        ) AS subquery
    ) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1;


SELECT 2hpv.sku, 2hpb.title FROM 2hand_products_variant as 2hpv
INNER JOIN 2hand_products_brand as 2hpb ON 2hpv.product_id=2hpb.product_id
WHERE 2hpv.sku='001-01606-0002-009'


SELECT 2hpv.sku, 2hpb.title FROM 2hand_products_variant as 2hpv
INNER JOIN 2hand_products_brand as 2hpb ON 2hpv.product_id=2hpb.product_id
WHERE 2hpv.sku='001-01606-0002-008'





SELECT
    rsa.description,
    COUNT(*) as nServices,
    (
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'title', subquery.title,
                    'id', subquery.product_id,
                    'sku', subquery.sku,
										'color', subquery.color,
										'size', subquery.size,
										'photo', subquery.photo
                )
            ) 
        FROM (
            SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpvp.photo
            FROM repair_header as rh
            INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
            INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
            INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
            INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
            INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
            INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
            INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
						WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
						
        ) AS subquery
    ) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1;




SELECT SUM(total_price_line) as tVRepairs, rh.id_repair FROM repair_header as rh
      INNER JOIN repair_line as rl ON  rh.id_repair = rl.id_repair
      WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
			
			
			
			
SELECT DISTINCT CONVERT(label USING utf8) AS label,2holi.id_order_line, 2holi.id_order_header  FROM  2hand_order_header as 2hoh 
INNER JOIN 2hand_order_lines as 2holi ON 2hoh.id_order_header = 2holi.id_order_header
INNER JOIN 2hand_order_labels as 2hol ON  2hol.id_order_line = 2holi.id_order_line
INNER JOIN 2hand_labels as 2hl ON 2hol.id_label = 2hl.id_label
WHERE 2hoh.id_order_header =232  AND 2hoh.id_brand=1 AND  2hl.label IS NOT NULL


	SELECT CONVERT(label USING utf8) as label FROM 2hand_labels  WHERE label IS NOT NULL LIMIT 1
			
			
			




    SELECT DISTINCT 2h.id_order_header, 2h.id_brand, 2h.created_at, 2h.id_order_status, 2h.id_customer, 
    2hc.FirstName as first_name, 2hc.LastName as last_name, 2h.amount,ct.country_code, cc.code_currency as currency, 2hs.description, 2h.shipping_zipcode, 2h.shipping_city, 2h.billing_zipcode, 2h.billing_city, ctb.country_code as country_codeB,
    2hc.EmailAddress as email, 2h.shipping_address_line_1, 2h.shipping_address_line_2, 2h.billing_address_line_1, 2h.billing_address_line_2,  2h.shipping_cost, 2h.processing_fee, 2hl.tracking_number
    FROM 2hand_order_header as 2h
    LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
    INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
    INNER JOIN countries as ctb on  2h.billing_idcountry = ctb.country_id
    INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
    INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
    INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
    LEFT JOIN 2hand_order_lines as 2holi ON 2h.id_order_header = 2holi.id_order_header
    LEFT JOIN 2hand_order_labels as 2hol ON  2hol.id_order_line = 2holi.id_order_line
    LEFT JOIN 2hand_labels as 2hl ON 2hol.id_label = 2hl.id_label
    WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2 and 2h.id_order_header =232
		
		
		
		
		
		
		
		
	 SELECT DISTINCT 2h.id_order_header, 2h.id_brand, 2h.created_at, 2h.id_order_status, 2h.id_customer, 
    2hc.FirstName as first_name, 2hc.LastName as last_name, 2h.amount,ct.country_code, cc.code_currency as currency, 2hs.description, 2h.shipping_zipcode, 2h.shipping_city, 2h.billing_zipcode, 2h.billing_city, ctb.country_code as country_codeB,
    2hc.EmailAddress as email, 2h.shipping_address_line_1, 2h.shipping_address_line_2, 2h.billing_address_line_1, 2h.billing_address_line_2,  2h.shipping_cost, 2h.processing_fee, 2hl.tracking_number, 2hl.label
    FROM 2hand_order_header as 2h
    LEFT JOIN  2hand_payments as 2hp on 2hp.id_order_header= 2h.id_order_header 
    INNER JOIN countries as ct on  2h.shipping_idcountry = ct.country_id
    INNER JOIN countries as ctb on  2h.billing_idcountry = ctb.country_id
    INNER JOIN currencies as cc on 2h.id_currency = cc.id_currency
    INNER JOIN 2hand_order_status 2hs on 2h.id_order_status = 2hs.id_order_status
    INNER JOIN 2hand_customers 2hc on 2h.id_customer= 2hc.CustomerID
    LEFT JOIN 2hand_order_lines as 2holi ON 2h.id_order_header = 2holi.id_order_header
    LEFT JOIN 2hand_order_labels as 2hol ON  2hol.id_order_line = 2holi.id_order_line
    LEFT JOIN 2hand_labels as 2hl ON 2hol.id_label = 2hl.id_label
    WHERE 2h.id_brand= 1 and 2hs.id_order_status = 2 and 2h.id_order_header =232
		
		
		
		

		
		
		
SELECT count(*) as nProducts, pb.product_id, listing_id, title
FROM 2hand_listings l
INNER JOIN 2hand_products_child pc ON pc.product_child_id = l.product_id
INNER JOIN 2hand_products_variant pv ON pv.product_variant_id = pc.product_variant_id
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
GROUP BY pb.product_id
ORDER BY nProducts DESC  LIMIT 3 









SELECT count(*) as nProducts, title, 2hpv.sku,
 (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
 (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
 (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo
FROM 2hand_listings l
INNER JOIN 2hand_products_child pc ON pc.product_child_id = l.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = pc.product_variant_id
INNER JOIN 2hand_products_brand pb ON pb.product_id = 2hpv.product_id
WHERE pc.id_brand = 1
GROUP BY pb.product_id
ORDER BY nProducts DESC LIMIT 3;





 (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size

INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id


(SELECT photos from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id) as photo



SELECT count(*) as bSProducts, pb.title, 2hpv.sku,
 (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
 (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
 (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo
FROM 2hand_order_header oh
INNER JOIN 2hand_order_lines ol ON ol.id_order_header = oh.id_order_header
INNER JOIN 2hand_shoppingbags_line sbl ON sbl.shopping_bag_line_id = ol.id_shoppingbag_line
INNER JOIN 2hand_listings l ON l.listing_id = sbl.listing_id
INNER JOIN 2hand_products_child pc ON pc.product_child_id = l.product_id
INNER JOIN 2hand_products_variant 2hpv ON 2hpv.product_variant_id = pc.product_variant_id
INNER JOIN 2hand_products_brand pb ON pb.product_id = 2hpv.product_id
WHERE oh.id_brand=1 AND oh.id_order_payment IS NOT NULL AND oh.paid_at IS NOT NULL
GROUP BY pb.product_id
ORDER BY bSProducts DESC LIMIT 3;
		
		
		
		
		
SELECT count(*), pb.product_id, l.listing_id, pb.title
FROM 2hand_order_header oh
INNER JOIN 2hand_order_lines ol ON ol.id_order_header = oh.id_order_header
INNER JOIN 2hand_shoppingbags_line sbl ON sbl.shopping_bag_line_id = ol.id_shoppingbag_line
INNER JOIN 2hand_listings l ON l.listing_id = sbl.listing_id
INNER JOIN 2hand_products_child pc ON pc.product_child_id = l.product_id
INNER JOIN 2hand_products_variant pv ON pv.product_variant_id = pc.product_variant_id
INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
WHERE oh.id_order_payment IS NOT NULL AND oh.paid_at IS NOT NULL
GROUP BY pb.product_id
ORDER BY pb.product_id;




SELECT 2hpv.sku, 2hpb.title, COUNT(*) as nRepairs, (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
       (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
       (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo,
      (
              SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                          'sDescription', rsa.description
                      )
                  ) 
              ) as sDescriptions
      FROM repair_header as rh
      INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
      INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
      INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
      INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
      WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
      GROUP BY 2hpb.product_id
      ORDER BY nRepairs DESC LIMIT 1





SELECT
rsa.description,
COUNT(*) as nServices,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
                'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku,(SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
      (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
      (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
WHERE rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1









SELECT 2hpv.sku, 2hpb.title, COUNT(*) as nRepairs, (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
      (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
      (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo,
      (
              SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                          'sDescription', rsa.description
                      )
                  ) 
              ) as sDescriptions
      FROM repair_header as rh
      INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
      INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
      INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
      INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
      WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
      GROUP BY 2hpb.product_id
      ORDER BY nRepairs DESC LIMIT 1
			
			
			
			
			
			
			
			
			
			
			
			
			SELECT
rsa.description,
COUNT(*) as nServices, (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
      (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
      (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
                'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option1_id  ) as color, 
      (SELECT option_child_description FROM 2hand_products_variant_options_child  as 2hpvoc where 2hpvoc.option_child_id = 2hpv.product_variant_option2_id  ) as size,
      (SELECT photo from 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1) as photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
-- WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
-- ORDER BY nServices DESC LIMIT 1






SELECT
rsa.description,
COUNT(*) as nServices,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
								 -- 'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size-- , 2hpvp.photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
        INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
       --   INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        -- WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
 -- INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
-- WHERE rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
-- ORDER BY nServices DESC LIMIT 1







SELECT 2hpv.sku, 2hpb.title, COUNT(*) as nRepairs, 2hpvoc.option_child_description AS color,
      2pvoc2.option_child_description AS size, 2hpvp.photo,
      (
              SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                          'sDescription', rsa.description
                      )
                  ) 
              ) as sDescriptions
      FROM repair_header as rh
      INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
      INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
      INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
      INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
      INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
      INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
      INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
   --   WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
      GROUP BY 2hpb.product_id
      ORDER BY nRepairs DESC LIMIT 1
			
			
			
	

SELECT 2hpv.sku, 2hpb.title, COUNT(*) as nRepairs, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, (SELECT photo FROM 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1 ) AS photo,
(
        SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'sDescription', rsa.description
                )
            ) 
        ) as sDescriptions
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
 WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY 2hpb.product_id
ORDER BY nRepairs DESC LIMIT 1
			
			
			
			
			
			
			
			
			
			
			SELECT
rsa.description,
COUNT(*) as nServices,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
                'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpvp.photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
        INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
        INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
WHERE rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1
			
			
			
			



			
			
			SELECT
rsa.description,
COUNT(*) as nServices,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
                'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, (SELECT photo FROM 2hand_products_variant_photos 2hpvp WHERE 2hpvp.product_variant_id = 2hpv.product_variant_id LIMIT 1 ) AS photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
        INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
 WHERE rh.repair_status=2 and rh.id_brand=? and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1
			
			
			
			
			
			
			





SELECT
rsa.description,
COUNT(*) as nServices,
(
    SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', subquery.title,
                'id', subquery.product_id,
                'sku', subquery.sku,
                'color', subquery.color,
                'size', subquery.size,
                'photo', subquery.photo
            )
        ) 
    FROM (
        SELECT DISTINCT 2hpb.title, 2hpb.product_id, 2hpv.sku, 2hpvoc.option_child_description AS color,
2pvoc2.option_child_description AS size, 2hpvp.photo
        FROM repair_header as rh
        INNER JOIN repair_line as rls ON rh.id_repair = rls.id_repair
        INNER JOIN 2hand_products_variant as 2hpv ON rls.product_variant_id = 2hpv.product_variant_id
        INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
        INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
        INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
        INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
        INNER JOIN repair_servicesavailable as rsas ON rls.id_service = rsas.id_service
        WHERE rsas.id_service = rl.id_service and rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
    ) AS subquery
) as products
FROM repair_header as rh
INNER JOIN repair_line as rl ON rh.id_repair = rl.id_repair
INNER JOIN 2hand_products_variant as 2hpv ON rl.product_variant_id = 2hpv.product_variant_id
INNER JOIN 2hand_products_brand as 2hpb on 2hpb.product_id = 2hpv.product_id
INNER JOIN 2hand_products_variant_options_child 2hpvoc on 2hpv.product_variant_option1_id = 2hpvoc.option_child_id
INNER JOIN 2hand_products_variant_options_child 2pvoc2 ON 2hpv.product_variant_option2_id = 2pvoc2.option_child_id
INNER JOIN 2hand_products_variant_photos 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id
INNER JOIN repair_servicesavailable as rsa ON rl.id_service = rsa.id_service
 WHERE rh.repair_status=2 and rh.id_brand=1 and rh.id_repair_payment IS NOT NULL
GROUP BY rsa.id_service
ORDER BY nServices DESC LIMIT 1


DROP TABLE watc_all_orders_monday

CREATE TABLE watc_all_orders_monday (
	id_order BIGINT
)


INSERT INTO watc_all_orders_monday (id_order) VALUE (5397900919095)


SELECT id_order FROM watc_all_orders_monday



Select id_order from watc_all_orders_monday where  id_order= 5397900919095




SELECT *FROM orders where id_brand = 6 and id_order=5756102017366





SELECT rsv.description, rsv.price, rsv.id_service, rsv.product_tag   FROM repair_servicesavailable AS rsv 
      WHERE rsv.id_brand = 1
			
			
			
	SELECT
    CASE
        WHEN (SELECT COUNT(*) FROM repair_servicesavailable AS rsv2 WHERE rsv2.description = rsv.description AND rsv2.id_brand = rsv.id_brand AND rsv2.id_service < rsv.id_service) > 0
        THEN NULL
        ELSE rsv.description
    END AS descriptionAux,
    rsv.price,
    rsv.id_service,
    rsv.product_tag,
		rsv.description
FROM repair_servicesavailable AS rsv
WHERE rsv.id_brand = 1
			
			
			SELECT DISTINCT 2hpv.sku, 2hpv.ean, 2hpv.product_variant_id, 2hpv.price, 2hp.title, 2hp.category_id, 2hpvp.photo AS image_url, 2hp.product_id, 
      ( SELECT option_child_description FROM 2hand_products_variant_options_child AS 2hpvoc WHERE 2hpvoc.option_child_id = 2hpv.product_variant_option2_id LIMIT 1 ) AS size, 
      ( SELECT option_child_description FROM 2hand_products_variant_options_child AS 2hpvoc WHERE 2hpvoc.option_child_id = 2hpv.product_variant_option1_id LIMIT 1 ) AS color 
      FROM 2hand_products_brand AS 2hp 
      INNER JOIN 2hand_products_variant AS 2hpv ON 2hp.product_id = 2hpv.product_id 
      INNER JOIN 2hand_products_variant_photos AS 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id AND 2hpvp.position = 1 
			INNER JOIN repair_line as rp ON 2hpv.product_variant_id = rp.product_variant_id
      INNER JOIN repair_servicesavailable AS rsa ON rsa.id_service = rp.id_service
      WHERE 2hpv.sku = '001-01269-0081-008' AND 2hp.category_id IS NOT NULL AND rsa.id_service IS NOT NULL AND rsa.id_brand = 1
			
			
			
			SELECT 2hpv.sku, 2hpv.ean, 2hpv.product_variant_id, 2hpv.price, 2hp.title, 2hp.Tags, 2hpvp.photo AS image_url, 2hp.product_id, 
      ( SELECT option_child_description FROM 2hand_products_variant_options_child AS 2hpvoc WHERE 2hpvoc.option_child_id = 2hpv.product_variant_option2_id LIMIT 1 ) AS size, 
      ( SELECT option_child_description FROM 2hand_products_variant_options_child AS 2hpvoc WHERE 2hpvoc.option_child_id = 2hpv.product_variant_option1_id LIMIT 1 ) AS color 
      FROM 2hand_products_brand AS 2hp 
      INNER JOIN 2hand_products_variant AS 2hpv ON 2hp.product_id = 2hpv.product_id 
      INNER JOIN 2hand_products_variant_photos AS 2hpvp ON 2hpvp.product_variant_id = 2hpv.product_variant_id AND 2hpvp.position = 1 
      INNER JOIN repair_servicesavailable AS rsc ON 2hp.Tags LIKE CONCAT('%',rsc.product_tag,'%')
      WHERE 2hpv.sku = '001-01269-0081-008' AND 2hp.Tags IS NOT NULL AND rsc.id_service IS NOT NULL AND rsc.id_brand = 1
			
			
			
			
			
SELECT * FROM 2hand_products_brand WHERE Tags is not NULL


SELECT * FROM repair_servicesavailable AS rsv 
     WHERE rsv.id_brand = 1 AND rsv.product_tag LIKE '%dress%'


SELECT * FROM repair_servicesavailable AS rsv 
WHERE rsv.id_brand = 1 
AND (rsv.product_tag LIKE CONCAT('%', SUBSTRING_INDEX('dress,kleit', ',', -1), '%'))


SELECT * from returns where order_id=5461595586856


UPDATE 2hand_products_child set 2hand_products_child.comment = NULL
WHERE 2hand_products_child.product_child_id =422;


SELECT b.main_link, 2hl.listing_id as listing, 2hpc.product_variant_id as variant, 2hpv.product_id
FROM brands as b
INNER JOIN 2hand_listings as 2hl ON 2hl.product_id = 48 AND 2hl.brand_id = 1
INNER JOIN 2hand_products_child as 2hpc ON 2hpc.product_child_id = 48
INNER JOIN 2hand_products_variant as 2hpv ON 2hpv.product_variant_id = 2hpc.product_variant_id
WHERE b.id_brand = 1;




SELECT
    pb.title,
    pb.product_id,
    pb.Tags,
    ph.photo as image_url,
        CASE WHEN pb.id_status = 1 THEN 1 ELSE 0 END AS 2hand,
        CASE WHEN (SELECT DISTINCT id_service
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE title = 'PRIDE SOCKS' AND id_brand=1
    AND FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ', ', ','))
) LIMIT 1) THEN 1 ELSE 0 END AS repair,
    ( select JSON_ARRAYAGG(t1.variant) from (select DISTINCT
      JSON_OBJECT(
        'sku', pv2.sku,
        'ean', pv2.ean,
        'product_variant_id', pv2.product_variant_id,
        'price', pv2.price,
        'option1', LOWER(pvocss1.option_description),
        'option1_value', pvocs1.option_child_description,
        'option2', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE LOWER(pvocss2.option_description) END,
         'option2_value', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE pvocs2.option_child_description END,
        'image_url', ph2.photo
    ) as 'variant'  FROM 2hand_products_variant pv2
        LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
        LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
        LEFT JOIN 2hand_products_variant_options AS pvocss1 ON pvocs1.variant_option_id = pvocss1.variant_option_id
        LEFT JOIN 2hand_products_variant_options AS pvocss2 ON pvocs2.variant_option_id = pvocss2.variant_option_id
        LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position = 1
        WHERE pv2.product_id = pb.product_id ) t1
  ) AS variants
    FROM 2hand_products_variant pv
    INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
    LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
    LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
    LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
    WHERE ((pb.id_status = 1 and pb.id_brand = 1) or EXISTS(SELECT id_service
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT 1
  FROM 2hand_products_brand b
  WHERE title = 'PRIDE SOCKS' AND id_brand=1
    AND FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ', ', ','))
) LIMIT 1 ))
    AND (
      (pb.title LIKE '%PRIDE SOCKS%' AND LENGTH('%PRIDE SOCKS%') >= 3)
      OR (pv.sku LIKE '%PRIDE SOCKS%' AND LENGTH('%PRIDE SOCKS%') >= 3)
      OR (pv.ean LIKE '%PRIDE SOCKS%' AND LENGTH('%PRIDE SOCKS%') >=3)
      )
    GROUP BY pb.product_id, pb.title




 
SELECT Tags  FROM 2hand_products_brand WHERE title = 'PRIDE SOCKS'





SELECT DISTINCT *
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE title = 'Pride Socks' AND id_brand=1
    AND FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ', ', ','))
)


SELECT DISTINCT *
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE title = 'Pride Socks' AND id_brand = 1
    AND (
      FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ' ', '')) OR
      FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ', ', ',')) OR
			 FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ' , ', ',')) OR 
			 FIND_IN_SET(r.product_tag, REPLACE(b.Tags, ' ,', ','))
    )
)



SELECT DISTINCT *
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE title = 'Pride Socks' AND id_brand = 1
    AND FIND_IN_SET(r.product_tag, REPLACE(TRIM(BOTH '' FROM b.Tags), ',', ','))
)



SELECT DISTINCT *
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE title = 'Pride Socks' AND id_brand = 1
    AND FIND_IN_SET(r.product_tag, REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
)




SELECT * from 2hand_products_brand  where title = 'Sun Socks'








SELECT
    pb.title,
    pb.product_id,
		(
  SELECT JSON_ARRAYAGG(
    JSON_OBJECT(
      'id_service', r.id_service,
      'description', r.description,
      'id_brand', r.id_brand,
      'price', r.price
    )
  )
  FROM repair_servicesavailable r
  WHERE EXISTS (
    SELECT id_service
    FROM 2hand_products_brand b
    WHERE product_id = pb.product_id AND id_brand = 1
      AND FIND_IN_SET(r.product_tag, REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
  )
) as services
,
    ph.photo as image_url,
        CASE WHEN pb.id_status = 1 THEN 1 ELSE 0 END AS 2hand,
        CASE WHEN (SELECT DISTINCT id_service
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE product_id = pb.product_id AND id_brand=1
    AND FIND_IN_SET(r.product_tag, REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
) LIMIT 1) THEN 1 ELSE 0 END AS repair,
    ( select JSON_ARRAYAGG(t1.variant) from (select DISTINCT
      JSON_OBJECT(
        'sku', pv2.sku,
        'ean', pv2.ean,
        'product_variant_id', pv2.product_variant_id,
        'price', pv2.price,
        'option1', LOWER(pvocss1.option_description),
        'option1_value', pvocs1.option_child_description,
        'option2', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE LOWER(pvocss2.option_description) END,
         'option2_value', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE pvocs2.option_child_description END,
        'image_url', ph2.photo
    ) as 'variant'  FROM 2hand_products_variant pv2
        LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
        LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
        LEFT JOIN 2hand_products_variant_options AS pvocss1 ON pvocs1.variant_option_id = pvocss1.variant_option_id
        LEFT JOIN 2hand_products_variant_options AS pvocss2 ON pvocs2.variant_option_id = pvocss2.variant_option_id
        LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position = 1
        WHERE pv2.product_id = pb.product_id ) t1
  ) AS variants
    FROM 2hand_products_variant pv
    INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
    LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
    LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
    LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
    WHERE ((pb.id_status = 1 and pb.id_brand = 1) or EXISTS(SELECT id_service
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE b.product_id = pb.product_id AND id_brand=1
    AND FIND_IN_SET(r.product_tag, REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
) LIMIT 1 ))
    AND (
      (pb.title LIKE '% SOCKS%' AND LENGTH('% SOCKS%') >= 3)
      OR (pv.sku LIKE '% SOCKS%' AND LENGTH('% SOCKS%') >= 3)
      OR (pv.ean LIKE '% SOCKS%' AND LENGTH('% SOCKS%') >=3)
      )
    GROUP BY pb.product_id, pb.title












SELECT
    pb.title,
    pb.product_id,
    ph.photo as image_url,
		(
  SELECT JSON_ARRAYAGG(
    JSON_OBJECT(
      'id_service', r.id_service,
      'description', r.description,
      'id_brand', r.id_brand,
      'price', r.price
    )
  )
  FROM repair_servicesavailable r
  WHERE EXISTS (
    SELECT id_service
    FROM 2hand_products_brand b
    WHERE product_id = pb.product_id AND r.id_brand = 1
      AND FIND_IN_SET(r.product_tag, REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
  )
) as services,
    ( select JSON_ARRAYAGG(t1.variant) from (select DISTINCT
      JSON_OBJECT(
        'sku', pv2.sku,
        'ean', pv2.ean,
        'product_variant_id', pv2.product_variant_id,
        'price', pv2.price,
        'option1', LOWER(pvocss1.option_description),
        'option1_value', pvocs1.option_child_description,
        'option2', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE LOWER(pvocss2.option_description) END,
         'option2_value', CASE WHEN LOWER(pvocss2.option_description) = 'default' THEN NULL ELSE pvocs2.option_child_description END,
        'image_url', ph2.photo
    ) as 'variant'  FROM 2hand_products_variant pv2
        LEFT JOIN 2hand_products_variant_options_child AS pvocs1 ON pvocs1.option_child_id = pv2.product_variant_option1_id
        LEFT JOIN 2hand_products_variant_options_child AS pvocs2 ON pvocs2.option_child_id = pv2.product_variant_option2_id
        LEFT JOIN 2hand_products_variant_options AS pvocss1 ON pvocs1.variant_option_id = pvocss1.variant_option_id
        LEFT JOIN 2hand_products_variant_options AS pvocss2 ON pvocs2.variant_option_id = pvocss2.variant_option_id
        LEFT JOIN 2hand_products_variant_photos ph2 ON pv2.product_variant_id = ph2.product_variant_id and ph2.position = 1
        WHERE pv2.product_id = pb.product_id ) t1
  ) AS variants
    FROM 2hand_products_variant pv
    INNER JOIN 2hand_products_brand pb ON pb.product_id = pv.product_id
    LEFT JOIN 2hand_products_variant_photos ph ON pv.product_variant_id  = ph.product_variant_id and ph.position=1
    LEFT JOIN 2hand_products_variant_options_child AS pvoc1 ON pvoc1.option_child_id = pv.product_variant_option1_id
    LEFT JOIN 2hand_products_variant_options_child AS pvoc2 ON pvoc2.option_child_id = pv.product_variant_option2_id
    WHERE pb.id_brand = 1
      AND EXISTS(SELECT id_service
FROM repair_servicesavailable r
WHERE EXISTS (
  SELECT id_service
  FROM 2hand_products_brand b
  WHERE b.product_id = pb.product_id AND r.id_brand=1
    AND FIND_IN_SET(r.product_tag,  REGEXP_REPLACE(b.Tags, '[[:space:]]+', ''))
) LIMIT 1 )
      AND (
      (pb.title LIKE '%SOCKS%' AND LENGTH('%SOCKS%') >= 3)
      OR (pv.sku LIKE '%SOCKS%' AND LENGTH('%SOCKS%') >= 3)
      OR (pv.ean LIKE '%SOCKS%' AND LENGTH('%SOCKS%') >= 3)
      )
    GROUP BY pb.product_id, pb.title






select order_status_ship, case when ifnull(label,'') = '' THEN 0 else 1 end as label,case when ifnull(pod,'') = '' THEN 0 else 1 end as pod 
        from orders where id_order =  5573901615400 and id_brand = 1
				
				
	
SELECT * FROM orders WHERE id_order=5356668977448




	1084
	
	
SELECT CONVERT(label USING utf8) as label FROM orders WHERE id_order = 5573901615400 AND id_brand = 1


Order #1010
Order ID: 5282071871784






SELECT * FROM orders WHERE id_order= 17743





ALTER TABLE brands_socials
ADD COLUMN social_link_icon VARCHAR(255);


SELECT email  from returns where id_brand= 2



ALTER TABLE brands
ADD privacy_policy varchar(255);


ALTER TABLE brands
ADD terms_conditions varchar(255);



SELECT email_sender, email_replyTo, email_name FROM 2hand_brands_smtp WHERE id_brand=1

SELECT social_link, social_link_icon FROM brands_socials WHERE id_brand = 1

SELECT email_sender, email_name, email_replyTo FROM 2hand_brands_smtp WHERE id_brand = 1



UPDATE 2hand_order_lines
SET delivered_comments = NULL
WHERE id_order_line= 568;


SELECT `blob`, position FROM 2hand_products_child_photos WHERE product_child_id = 504 and position = 1 
504

SHOW TRIGGERS

SHOW TRIGGERS LIKE 'returns_journal';

SELECT * from returns_journal;



SELECT sell from brands


SELECT * from permissions




IF EXISTS (SELECT * FROM 2hand_products_collection WHERE id_brand = 1 AND sample_condition = 1) THEN
    SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_condition = 1
ELSE
    -- A linha não existe, criar uma nova row com valores específicos
    INSERT INTO 2hand_products_collection (id_brand, sample_condition, outros_campos) VALUES (?, 1, outros_valores);


IF (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_condition = 1) > 0 THEN
    -- A linha existe, você pode fazer algo aqui se necessário
    SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_condition = 1;
ELSE
   SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_condition = 1;
END IF;



SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN (SELECT * FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0)
        ELSE (SELECT * FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 1)
    END AS collection_id;


SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN JSON_OBJECT('id_brand', id_brand, 'sample_collection', sample_collection, 'name', name) 
        ELSE JSON_OBJECT('id_brand', id_brand, 'sample_collection', sample_collection, 'name', name)
    END AS collection_data
FROM 2hand_products_collection
WHERE id_brand = 1 AND sample_collection IN (0, 1);




SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN CONVERT((SELECT * FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0), CHAR)
        ELSE CONVERT((SELECT * FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 1), CHAR)
    END AS collection_data;



SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN JSON_OBJECT('id_brand', t.id_brand, 'sample_collection', t.sample_collection, 'name', t.name)
        ELSE JSON_OBJECT('id_brand', t.id_brand, 'sample_collection', t.sample_collection, 'name', t.name)
    END AS collection_data
FROM 2hand_products_collection t
WHERE id_brand = 1 AND sample_collection IN (0, 1);







SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN (SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0)
        ELSE (SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 1)
    END AS colection_id;
		
		
		
SELECT 
    CASE
        WHEN (SELECT COUNT(*) FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0) > 0 
        THEN (SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 0)
        ELSE (
						BEGIN
							(INSERT INTO 2hand_products_collection (name, created_at, updated_at, created_by, updated_by, id_brand, sample_collection) values ('nuin-samples',
							'2023-10-23 15:57:30', '2023-10-23 15:57:30', 1,1,1,1 ))
							
								(SELECT collection_id FROM 2hand_products_collection WHERE id_brand = 1 AND sample_collection = 1)
						END)
			
    END AS colection_id;



INSERT INTO 2hand_products_collection (name, created_at, updated_at, created_by, updated_by, id_brand, sample_collection) values ('nuin-samples',
							CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1,1,1,1 )
							
							
SELECT brand_name FROM brands WHERE id_brand=1




SELECT l.price, c.condition_id, c.description AS condition_description,  c.sample_condition as sample, CASE WHEN o1.option_description = 'DEFAULT' THEN NULL ELSE o1.option_description END AS O1, c1.option_child_id AS O1_id, c1.option_child_description AS O1Child, p1.position AS O1Position, CASE WHEN o2.option_description = 'DEFAULT' THEN NULL ELSE o2.option_description END AS O2, p2.position AS O2Position, c2.option_child_id AS O2_id, c2.option_child_description AS O2Child, o3.option_description AS O3, c3.option_child_description AS O3Child, c3.option_child_id AS O3_id, cc.country_name, pb.Genre, coll.`name` AS collection_name, coll.collection_id, cc.country_id, cat.description AS category_description, cat.id_category FROM 2hand_listings AS l INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id INNER JOIN 2hand_condition AS c ON c.condition_id = pc.condition_id INNER JOIN 2hand_products_variant_options_child AS c1 ON c1.option_child_id = pv.product_variant_option1_id INNER JOIN 2hand_products_variant_options AS o1 ON o1.variant_option_id = c1.variant_option_id LEFT JOIN 2hand_products_variant_options_child AS p1 ON p1.option_child_id = pv.product_variant_option1_id LEFT JOIN 2hand_products_variant_options_child AS c2 ON c2.option_child_id = pv.product_variant_option2_id LEFT JOIN 2hand_products_variant_options AS o2 ON o2.variant_option_id = c2.variant_option_id LEFT JOIN 2hand_products_variant_options_child AS p2 ON p2.option_child_id = pv.product_variant_option2_id LEFT JOIN 2hand_products_variant_options_child AS c3 ON c3.option_child_id = pv.product_variant_option3_id LEFT JOIN 2hand_products_variant_options AS o3 ON o3.variant_option_id = c3.variant_option_id INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID INNER JOIN countries AS cc ON 2hand_addresses.CountryID = cc.country_id INNER JOIN 2hand_products_collection AS coll ON pc.collection_id = coll.collection_id INNER JOIN 2hand_products_categories cat ON pb.category_id = cat.id_category
where l.archived = 0 AND l.brand_id = 1




SELECT
		pb.product_id,
		pb.title,
		pv.product_variant_id,
		pc.product_child_id,
		'\\\u20AC' AS currency_symb_code,
		l.price,
		l.listing_id,
		c.condition_id,
		c.description,
		o1.option_description AS O1,
		c1.option_child_description AS O1Child,
		p1.position AS O1Position,
		o2.option_description AS O2,
		c2.option_child_description AS O2Child,
		p2.position AS O2Position,
		o3.option_description AS O3,
		c3.option_child_description AS O3Child,
		cc.country_name,
		2hand_customers.FirstName,
		2hand_customers.LastName,
		l.created_at,
		cc.country_id,
		cat.description AS category_description, cat.id_category 
	FROM
		2hand_listings AS l
		INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id
		INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id
		INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
		INNER JOIN 2hand_condition AS c ON c.condition_id = pc.condition_id
		INNER JOIN 2hand_products_variant_options_child AS c1 ON c1.option_child_id = pv.product_variant_option1_id
		INNER JOIN 2hand_products_variant_options AS o1 ON o1.variant_option_id = c1.variant_option_id
		LEFT JOIN 2hand_products_variant_options_child AS p1 ON p1.option_child_id = pv.product_variant_option1_id
		LEFT JOIN 2hand_products_variant_options_child AS c2 ON c2.option_child_id = pv.product_variant_option2_id
		LEFT JOIN 2hand_products_variant_options AS o2 ON o2.variant_option_id = c2.variant_option_id
		LEFT JOIN 2hand_products_variant_options_child AS p2 ON p2.option_child_id = pv.product_variant_option2_id
		LEFT JOIN 2hand_products_variant_options_child AS c3 ON c3.option_child_id = pv.product_variant_option3_id
		LEFT JOIN 2hand_products_variant_options AS o3 ON o3.variant_option_id = c3.variant_option_id
		INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID
		INNER JOIN countries AS cc ON 2hand_addresses.CountryID = cc.country_id
		INNER JOIN 2hand_customers ON l.customer_id = 2hand_customers.CustomerID
		INNER JOIN 2hand_products_categories cat ON pb.category_id = cat.id_category WHERE l.archived = 0
		
		
		
		
		SELECT*  from 2hand_products_child where product_variant_id = 393601





SELECT
    l.price,
    c.condition_id,
    c.description AS condition_description,
    c.sample_condition as sample,
    c.weight,
    CASE
        WHEN o1.option_description = 'DEFAULT' THEN NULL
        ELSE o1.option_description
    END AS O1,
    c1.option_child_id AS O1_id,
    c1.option_child_description AS O1Child,
    p1.position AS O1Position,
    CASE
        WHEN o2.option_description = 'DEFAULT' THEN NULL
        ELSE o2.option_description
    END AS O2,
    p2.position AS O2Position,
    c2.option_child_id AS O2_id,
    c2.option_child_description AS O2Child,
    o3.option_description AS O3,
    c3.option_child_description AS O3Child,
    c3.option_child_id AS O3_id,
    cc.country_name,
    pb.Genre,
    coll.`name` AS collection_name,
    coll.collection_id,
    cc.country_id,
    cat.description AS category_description,
    cat.id_category
FROM
    2hand_listings AS l
    INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id
    INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id
    INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
    INNER JOIN 2hand_condition AS c ON c.condition_id = pc.condition_id
    INNER JOIN 2hand_products_variant_options_child AS c1 ON c1.option_child_id = pv.product_variant_option1_id
    INNER JOIN 2hand_products_variant_options AS o1 ON o1.variant_option_id = c1.variant_option_id
    LEFT JOIN 2hand_products_variant_options_child AS p1 ON p1.option_child_id = pv.product_variant_option1_id
    LEFT JOIN 2hand_products_variant_options_child AS c2 ON c2.option_child_id = pv.product_variant_option2_id
    LEFT JOIN 2hand_products_variant_options AS o2 ON o2.variant_option_id = c2.variant_option_id
    LEFT JOIN 2hand_products_variant_options_child AS p2 ON p2.option_child_id = pv.product_variant_option2_id
    LEFT JOIN 2hand_products_variant_options_child AS c3 ON c3.option_child_id = pv.product_variant_option3_id
    LEFT JOIN 2hand_products_variant_options AS o3 ON o3.variant_option_id = c3.variant_option_id
    INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID
    INNER JOIN countries AS cc ON 2hand_addresses.CountryID = cc.country_id
    INNER JOIN 2hand_products_collection AS coll ON pc.collection_id = coll.collection_id
    INNER JOIN 2hand_products_categories cat ON pb.category_id = cat.id_category
where
    l.archived = 0
    AND l.brand_id = 1 
		 ORDER BY c.weight ASC



SELECT *  from 2hand_products_child WHERE product_variant_id = 393451


SELECT * FROM 2hand_condition




SELECT * from 2hand_customers where 2hand_customers.FirstName= "nu-in"





SELECT
	pb.product_id,
	pb.title,
	pv.product_variant_id,
	pv.price AS original_price,
	pc.product_child_id,
	pcc.description,
	l.price,
	l.listing_id,
	l.customer_id,
	l.created_at,
	c.FirstName,
	c.LastName,
	(select if(count(*) > 0, 1, 0) from brands_2hand_admins b2a where b2a.CustomerID = l.customer_id and b2a.id_brand = l.brand_id) as brand_admin,
	2hpc.sample_collection,
	'\\\u20AC' AS currency_symb_code,
	( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) AS min_price,
	( pv.price * ( 100 - ifnull( b.2hand_max_price, 0 )) / 100 ) AS max_price,
	CASE WHEN ( l.price * 50 / 100 ) < ( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) THEN
		( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) ELSE ( l.price * 50 / 100 ) 
	END AS min_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ),( l.price * 95 / 100 )) as max_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),0,1) as can_offer,
	pc.comment
	FROM 2hand_listings AS l
	INNER JOIN 2hand_customers AS c ON c.CustomerID = l.customer_id
	INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id
	INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id
	INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
	INNER JOIN 2hand_condition AS pcc ON pcc.condition_id = pc.condition_id
	INNER JOIN brands b ON b.id_brand = pb.id_brand
	LEFT JOIN 2hand_products_collection AS 2hpc ON 2hpc.collection_id = pc.collection_id
	WHERE pb.product_id = 393437
	ORDER BY pb.product_id ASC



SELECT 2hand_products_brand.product_id, 2hand_products_variant.product_variant_id
FROM 2hand_products_variant
inner JOIN 2hand_products_brand ON 2hand_products_variant.product_id = 2hand_products_brand.product_id;




SELECT
	pb.product_id,
	pb.title,
	pv.product_variant_id,
	pv.price AS original_price,
	pc.product_child_id,
	pcc.description,
	l.price,
	l.listing_id,
	l.customer_id,
	l.created_at,
	c.FirstName,
	c.LastName,
	(select if(count(*) > 0, 1, 0) from brands_2hand_admins b2a where b2a.CustomerID = l.customer_id and b2a.id_brand = l.brand_id) as brand_admin,
	o1.option_description AS O1,
	c1.option_child_description AS O1Child,
	p1.position AS O1Position,
	o2.option_description AS O2,
	c2.option_child_description AS O2Child,
	p2.position AS O2Position,
	o3.option_description AS O3,
	c3.option_child_description AS O3Child,
	countries.country_name,
	'\\\u20AC' AS currency_symb_code,
	( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) AS min_price,
	( pv.price * ( 100 - ifnull( b.2hand_max_price, 0 )) / 100 ) AS max_price,
	CASE WHEN ( l.price * 50 / 100 ) < ( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) THEN
		( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) ELSE ( l.price * 50 / 100 ) 
	END AS min_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ),( l.price * 95 / 100 )) as max_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),0,1) as can_offer,
	pc.comment
	FROM 2hand_listings AS l
	INNER JOIN 2hand_customers AS c ON c.CustomerID = l.customer_id
	INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id
	INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id
	INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
	INNER JOIN 2hand_condition AS pcc ON pcc.condition_id = pc.condition_id
	INNER JOIN 2hand_products_variant_options_child AS c1 ON c1.option_child_id = pv.product_variant_option1_id
	INNER JOIN 2hand_products_variant_options AS o1 ON o1.variant_option_id = c1.variant_option_id
	LEFT JOIN 2hand_products_variant_options_child AS p1 ON p1.option_child_id = pv.product_variant_option1_id
	LEFT JOIN 2hand_products_variant_options_child AS c2 ON c2.option_child_id = pv.product_variant_option2_id
	LEFT JOIN 2hand_products_variant_options AS o2 ON o2.variant_option_id = c2.variant_option_id
	LEFT JOIN 2hand_products_variant_options_child AS p2 ON p2.option_child_id = pv.product_variant_option2_id
	LEFT JOIN 2hand_products_variant_options_child AS c3 ON c3.option_child_id = pv.product_variant_option3_id
	LEFT JOIN 2hand_products_variant_options AS o3 ON o3.variant_option_id = c3.variant_option_id
	INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID
	INNER JOIN countries ON 2hand_addresses.CountryID = countries.country_id
	INNER JOIN brands b ON b.id_brand = pb.id_brand
	WHERE l.archived = 0 AND pb.product_id = 20965
	ORDER BY pb.product_id ASC








select * from 2hand_products_variant where 2hand_products_variant.sku = "KNRS23_seablue"

8132415684904

396781
select * from 2hand_products_variant where product_variant_id = 396781


SELECT
	pb.product_id,
	pb.title,
	pv.product_variant_id,
	pv.price AS original_price,
	pc.product_child_id,
	pcc.description,
	l.price,
	l.listing_id,
	l.customer_id,
	l.created_at,
	c.FirstName,
	c.LastName,
	(select if(count(*) > 0, 1, 0) from brands_2hand_admins b2a where b2a.CustomerID = l.customer_id and b2a.id_brand = l.brand_id) as brand_admin,
	o1.option_description AS O1,
	c1.option_child_description AS O1Child,
	p1.position AS O1Position,
	o2.option_description AS O2,
	c2.option_child_description AS O2Child,
	p2.position AS O2Position,
	o3.option_description AS O3,
	c3.option_child_description AS O3Child,
	countries.country_name,
	COALESCE(1) AS sample_collection,
	pc.collection_id,
	2hpc.name as collection_name,
	'\\\u20AC' AS currency_symb_code,
	( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) AS min_price,
	( pv.price * ( 100 - ifnull( b.2hand_max_price, 0 )) / 100 ) AS max_price,
	CASE WHEN ( l.price * 50 / 100 ) < ( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) THEN
		( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ) ELSE ( l.price * 50 / 100 ) 
	END AS min_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 ),( l.price * 95 / 100 )) as max_price_offer,
	if(( pv.price * ( 100 - ifnull( b.2hand_min_price, 0 )) / 100 )  >= ( l.price * 95 / 100 ),0,1) as can_offer,
	pc.comment
	FROM 2hand_listings AS l
	INNER JOIN 2hand_customers AS c ON c.CustomerID = l.customer_id
	INNER JOIN 2hand_products_child AS pc ON pc.product_child_id = l.product_id
	INNER JOIN 2hand_products_variant AS pv ON pv.product_variant_id = pc.product_variant_id
	INNER JOIN 2hand_products_brand AS pb ON pb.product_id = pv.product_id
	INNER JOIN 2hand_condition AS pcc ON pcc.condition_id = pc.condition_id
	INNER JOIN 2hand_products_variant_options_child AS c1 ON c1.option_child_id = pv.product_variant_option1_id
	INNER JOIN 2hand_products_variant_options AS o1 ON o1.variant_option_id = c1.variant_option_id
	LEFT JOIN 2hand_products_variant_options_child AS p1 ON p1.option_child_id = pv.product_variant_option1_id
	LEFT JOIN 2hand_products_variant_options_child AS c2 ON c2.option_child_id = pv.product_variant_option2_id
	LEFT JOIN 2hand_products_variant_options AS o2 ON o2.variant_option_id = c2.variant_option_id
	LEFT JOIN 2hand_products_variant_options_child AS p2 ON p2.option_child_id = pv.product_variant_option2_id
	LEFT JOIN 2hand_products_variant_options_child AS c3 ON c3.option_child_id = pv.product_variant_option3_id
	LEFT JOIN 2hand_products_variant_options AS o3 ON o3.variant_option_id = c3.variant_option_id
	INNER JOIN 2hand_addresses ON pc.AddressID = 2hand_addresses.AddressID
	INNER JOIN countries ON 2hand_addresses.CountryID = countries.country_id
	INNER JOIN brands b ON b.id_brand = pb.id_brand
	LEFT JOIN 2hand_products_collection AS 2hpc ON 2hpc.collection_id = pc.collection_id
	WHERE l.archived = 0 AND pb.product_id = 21800
	ORDER BY pb.product_id ASC
	
	
	
	
	
	
	SELECT product_variant_id FROM 2hand_products_brand as 2hpb
	INNER JOIN 2hand_products_variant as 2hpv ON 2hpv.product_id = 2hpb.product_id
	where id_brand=4 and sku = "KNRS23_seablue"
	
	
		SELECT product_variant_id FROM 2hand_products_brand as 2hpb
	INNER JOIN 2hand_products_variant as 2hpv ON 2hpv.product_id = 2hpb.product_id
	where id_brand=1
	
	
	
	
	
	SELECT collection_id, name, sample_collection  FROM 2hand_products_collection WHERE id_brand=1
	
	
	
	SELECT collection_id FROM 2hand_products_collection WHERE id_brand=1 and sample_collection = 0
	
	
	
	
	SELECT * FROM 2hand_products_brand  as pb
	INNER JOIN 2hand_products_variant as  2hpv on 2hpv.product_id = pb.product_id
	WHERE title = "100% Organic Tie Back Ribbed Knitted Mini Dress"
	
	
	
	
	SELECT rl.id_return, rl.id_return_line, rl.order_line_id, rl.IDStatus, rl.id_product, rl.sku, rl.ean, rl.quantity, rl.return_reason_id, rl.return_reason_note, ro.option
  from returns_lines as rl
  JOIN return_options as ro ON rl.return_reason_id = ro.option_id
  WHERE rl.id_return = 444 AND rl.IDStatus IN(2,50);
	

SELECT 2hand_products_variant.*,
      2hand_products_status.description AS 'status'
      FROM 2hand_products_variant
      INNER JOIN 2hand_products_status ON  2hand_products_variant.status_id = 2hand_products_status.product_status_id
			  LEFT JOIN 2hand_products_brand as 2hpb ON 2hand_products_variant.product_id= 2hpb.product_id
      WHERE 2hand_products_variant.product_id = 20964
      ORDER BY product_variant_option2_id ASC


SELECT Tags from 2hand_products_brand WHERE product_id= 27045





SELECT
    2hand_products_brand.product_id, 
    2hand_products_brand.identifier_id, 
    2hand_products_brand.title, 
    2hand_products_categories.description AS category_description, 
    2hand_products_brand.id_status, 
    2hand_products_brand.Genre, 
    2hand_products_collection.name AS collection_name,   
    (
        SELECT JSON_ARRAYAGG(
            JSON_UNQUOTE(
                JSON_EXTRACT(
                    JSON_OBJECT(
                        'sku', 2hpv.sku
                    ),
                    '$.sku'
                )
            )
        ) 
        FROM 2hand_products_variant as 2hpv 
        WHERE 2hpv.product_id = 2hand_products_brand.product_id 
        AND 2hand_products_brand.id_brand = 2
    ) as arr_sku
FROM
    2hand_products_brand
INNER JOIN
    2hand_products_categories
ON 
    2hand_products_brand.category_id = 2hand_products_categories.id_category
INNER JOIN
    2hand_products_collection
ON 
    2hand_products_brand.collection_id = 2hand_products_collection.collection_id
WHERE 2hand_products_brand.id_brand = 2
LIMIT 5;







SELECT * FROM 2hand_products_variant  WHERE product_id = 27045



SELECT * FROM rto_return_lines WHERE order_line_id = 5680223224104


SELECT order_id FROM rto_returns as rto
INNER JOIN rto_return_lines as rtol ON rtol.id_rto = rto.id_rto
where id_brand = 1

SELECT * FROM rto_returns
  INNER JOIN rto_return_lines  ON rto_return_lines.id_rto = rto_returns.id_rto
  AND id_brand = 1
