
UPDATE consignment_development.items SET `clerk`= ELT(FLOOR(RAND()*7)+1,
        'Shaun', 'Laura', 'Ben', 'Alex', 'Elizabeth', 'Maddie', 'Mocha')
        where id > 0;

UPDATE consignment_development.items SET `item_status`= ELT(FLOOR(RAND()*5)+1,
        'fs', 'sold', 'po', 'mtd', 'rtc')\
        where id > 0;

UPDATE consignment_development.items
		SET `owing_client` = 0.00
        where id > 0;

UPDATE consignment_development.items
		SET `paid_client` = 0.00
        where id > 0;

UPDATE consignment_development.items
		SET `payout_pct` = 0.50
        where id > 0;

UPDATE consignment_development.items
		SET `takein_date` = created_at
        where id > 0;

UPDATE consignment_development.items
		SET `pickup_date` = "2019-9-9"
        where id > 0;