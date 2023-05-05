WITH metals (metal) AS (
SELECT
    CASE WHEN type = 'Metal' THEN symbol END AS metal
FROM
    elements e
),
nonmetals (nonmetal) AS (
SELECT
    CASE WHEN type = 'Nonmetal' THEN symbol END AS nonmetal
FROM
    elements e)
SELECT 
    m.metal,
    n.nonmetal
FROM
    metals m,
    nonmetals n
WHERE m.metal IS NOT NULL
AND n.nonmetal IS NOT NULL;