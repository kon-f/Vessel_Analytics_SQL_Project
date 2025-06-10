WITH CargoShips AS (
    SELECT
        vt.code AS type_code,
        v.id AS vessel_id
    FROM
        VesselTypes vt
        JOIN Vessels v ON vt.code = v.type
    WHERE
        vt.description LIKE 'Cargo%'
)
SELECT DISTINCT
    cs.vessel_id
FROM
    CargoShips cs
JOIN Positions p ON cs.vessel_id = p.vessel_id
WHERE
    p.speed = 0 OR p.speed IS NULL
    AND p.t BETWEEN '2019-08-15' AND '2019-08-18';