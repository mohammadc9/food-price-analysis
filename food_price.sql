ALTER TABLE FoodPrices
DROP COLUMN `index`;

-- change percents in each year 
INSERT INTO `2012_changes`
SELECT
	`year`,
	commodity,
	MIN(price) 'FirstPrice',
	MAX(price) AS 'LastPrice',
	ROUND((MAX(Price) - Min(Price)) / MIN(price)* 100, 2)  AS 'ChangePCT'
FROM
	FoodPrices
WHERE
	`year` = 2012 -- its have to change by each year 
GROUP BY
	commodity
 ORDER BY 
 	ChangePCT DESC
LIMIT 5 ;
