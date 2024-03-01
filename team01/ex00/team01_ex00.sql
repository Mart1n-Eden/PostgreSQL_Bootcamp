WITH dwh AS (SELECT COALESCE("user".name, 'not defined')     AS name,
                    COALESCE("user".lastname, 'not defined') AS lastname,
                    "balance".type                           AS type,
                    COALESCE(SUM("balance".money), 0)        AS volume,
                    "balance".currency_id
             FROM "balance"
                      FULL JOIN "user" ON "user".id = "balance".user_id
             GROUP BY "user".id,
                      "balance".type,
                      "balance".currency_id),
     last_currency AS (SELECT tmp.id,
                              MAX(tmp.name)        AS name,
                              MAX(tmp.rate_to_usd) AS rate_to_usd
                       FROM (SELECT id,
                                    name,
                                    rate_to_usd,
                                    updated,
                                    MAX(updated) OVER (PARTITION BY id) as max_updated
                             FROM "currency") tmp
                       WHERE tmp.updated = tmp.max_updated
                       GROUP BY tmp.id,
                                tmp.updated)
SELECT dwh.name,
       dwh.lastname,
       dwh.type,
       dwh.volume,
       COALESCE(last_currency.name, 'not defined') AS currency_name,
       COALESCE(last_currency.rate_to_usd, 1)      AS last_rate_to_usd,
       (
           dwh.volume * COALESCE(last_currency.rate_to_usd, 1)
           ) :: real                               AS total_volume_in_usd
FROM dwh
         LEFT JOIN last_currency ON last_currency.id = dwh.currency_id
ORDER BY dwh.name DESC,
         dwh.lastname ASC,
         dwh.type ASC;