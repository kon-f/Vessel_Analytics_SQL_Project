SELECT
    type,
    COUNT(*) AS greece_flags_count
FROM
    Vessels
WHERE
    flag = 'Greece'
GROUP BY
    type