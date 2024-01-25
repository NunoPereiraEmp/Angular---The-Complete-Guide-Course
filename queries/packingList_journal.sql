

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


DELIMITER $$ 

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