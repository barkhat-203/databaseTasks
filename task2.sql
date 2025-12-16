CREATE TABLE `transactions` (
	`id` INT PRIMARY KEY,
	`account_id` INT,
	`amount` DECIMAL(10,2),
	`type` ENUM('debit','credit')
);

SET SESSION cte_max_recursion_depth = 500000;

INSERT INTO `transactions` (id, account_id, amount, type)
WITH RECURSIVE numbers(n) AS (
	SELECT 0
	UNION ALL
	SELECT n+1 FROM numbers WHERE n<499999
)
SELECT 
	n+1,
	FLOOR(RAND()*1000),
	ROUND(RAND()*10000,2),
	CASE WHEN RAND()>0.5 THEN 'debit' ELSE 'credit' END
FROM numbers;

SELECT * FROM `transactions` WHERE `account_id` = 333 AND `type`='debit';
EXPLAIN SELECT * FROM `transactions` WHERE `account_id` = 333 AND `type`='debit';

/*
Выполнение запроса без индекса заняло 0.176 с. 
MySQL проверил все 500000 строк
*/

CREATE INDEX `idxAccID` ON `transactions`(account_id);
CREATE INDEX `idxType` ON `transactions`(type);
SELECT * FROM `transactions` WHERE `account_id` = 333 AND `type`='debit';
EXPLAIN SELECT * FROM `transactions` WHERE `account_id` = 333 AND `type`='debit';

/*
Выполнение запроса с индексами заняло 0.014 с (примерно в 12.5 раз быстрее)
MySQL проверил примерно 488 строк
Был использован индекс idxAccID по account_id
possible_keys: idxAccID,idxType (какие индексы могут быть использованы для запроса)
key: idxAccID (используется idxAccID, который отфильтрует большее кол-во строк)
*/