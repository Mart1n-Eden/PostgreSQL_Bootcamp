WITH m_balance AS (SELECT ROW_NUMBER() OVER () AS balance_row_number,
                          user_id,
                          money,
                          currency_id,
                          updated              AS b_updated
                   FROM "balance"),
     m_balance_t1 AS (SELECT balance_row_number,
                             user_id,
                             money,
                             "currency".updated AS c_updated,
                             "currency".name,
                             "currency".rate_to_usd
                      FROM m_balance
                               JOIN "currency" ON "currency".id = m_balance.currency_id
                          AND "currency".updated <= b_updated),
     m_balance_t2 AS (SELECT balance_row_number,
                             user_id,
                             money,
                             "currency".updated AS c_updated,
                             "currency".name,
                             "currency".rate_to_usd
                      FROM m_balance
                               JOIN "currency" ON "currency".id = m_balance.currency_id
                          AND "currency".updated > b_updated),
     m_balance_with_rate_t1 AS (SELECT balance_row_number,
                                       MAX(user_id)     AS user_id,
                                       MAX(money)       AS money,
                                       MAX(name)        AS currency_name,
                                       MAX(rate_to_usd) AS rate_to_usd
                                FROM (SELECT *,
                                             MAX(c_updated) OVER (PARTITION BY balance_row_number) as max_updated
                                      FROM m_balance_t1) tmp
                                WHERE tmp.c_updated = tmp.max_updated
                                GROUP BY balance_row_number,
                                         tmp.c_updated),
     m_balance_with_rate_t2 AS (SELECT balance_row_number,
                                       MAX(user_id)     AS user_id,
                                       MAX(money)       AS money,
                                       MAX(name)        AS currency_name,
                                       MAX(rate_to_usd) AS rate_to_usd
                                FROM (SELECT *,
                                             MIN(c_updated) OVER (PARTITION BY balance_row_number) as min_updated
                                      FROM m_balance_t2) tmp
                                WHERE tmp.c_updated = tmp.min_updated
                                GROUP BY balance_row_number,
                                         tmp.c_updated),
     ex01_result AS (SELECT *
                     FROM m_balance_with_rate_t1
                     UNION
                     SELECT *
                     FROM m_balance_with_rate_t2
                     WHERE (
                                   balance_row_number NOT IN (SELECT balance_row_number
                                                              FROM m_balance_with_rate_t1)
                               ))
SELECT COALESCE("user".name, 'not defined')        AS name,
       COALESCE("user".lastname, 'not defined')    AS lastname,
       ex01_result.currency_name                   AS currency_name,
       ex01_result.money * ex01_result.rate_to_usd AS currency_in_usd
FROM ex01_result
         LEFT JOIN "user" ON "user".id = ex01_result.user_id
ORDER BY name DESC,
         lastname ASC,
         currency_name ASC;

