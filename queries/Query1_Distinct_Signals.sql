SELECT
    signal_date,
    COUNT(*) AS distinct_signals_count
FROM (
    SELECT
        t::date AS signal_date,
        lon || '|' || lat AS lon_lat_combo
    FROM
        Positions
) AS subquery
GROUP BY
    signal_date
ORDER BY
    distinct_signals_count DESC;
