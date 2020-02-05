CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_sale_items`(IN order_no bigint)
BEGIN
	SELECT si.id, i.size, i.description from consignment_development.sale_items si 
	JOIN items i ON si.id = i.sale_item_id
	WHERE si.order_no = order_no;
END