CREATE DEFINER=`root`@`localhost` PROCEDURE `select_all`()
BEGIN
	SELECT * FROM stpdemoland.webbookmarks;
END