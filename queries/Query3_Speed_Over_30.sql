WITH SpeedAbove30 AS (
    SELECT DISTINCT
        p.vessel_id,
        v.type
    FROM
        Positions p
        JOIN Vessels v ON p.vessel_id = v.id
    WHERE
        p.speed > 30
)
SELECT
    type,
    COUNT(*) AS ships_count
FROM
    SpeedAbove30
GROUP BY
    type
