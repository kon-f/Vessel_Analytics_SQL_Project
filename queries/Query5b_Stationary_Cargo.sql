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
WHERE NOT EXISTS (
    SELECT 1
    FROM
        Positions p
    WHERE
        cs.vessel_id = p.vessel_id
        AND p.t BETWEEN '2019-08-15' AND '2019-08-18'
        AND p.speed != 0
);	