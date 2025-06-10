WITH PassengerShips AS (
    SELECT
        vt.code AS type_code,
        v.id AS vessel_id
    FROM
        VesselTypes vt
        JOIN Vessels v ON vt.code = v.type
    WHERE
        vt.description LIKE 'Passenger%'
)
SELECT
    p.t::date AS appearance_date,
    COUNT(*) AS total_passenger_ships
FROM
    PassengerShips ps
    JOIN Positions p ON ps.vessel_id = p.vessel_id
WHERE
    p.t BETWEEN '2019-08-14' AND '2019-08-18'
GROUP BY
    appearance_date
ORDER BY
    appearance_date;