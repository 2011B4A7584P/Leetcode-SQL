SELECT
    p.patient_id,
    p.patient_name,
    p.conditions
FROM
    patients p
WHERE
    p.conditions LIKE '% DIAB1%'
OR  p.conditions LIKE 'DIAB1%';