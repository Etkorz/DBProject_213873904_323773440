--view 1--

CREATE OR REPLACE VIEW KINDERGARTENVIEW AS
SELECT
    k.kindergartenid,
    k.k_name,
    k.capacity,
    k.k_language,
    k_type.type_name AS kindergarten_type,
    b.address AS building_address,
    COUNT(DISTINCT t.teacher_id) AS num_teachers,
    COUNT(DISTINCT c.childid) AS num_children
FROM
    KINDERGARTEN k
JOIN
    K_TYPE k_type ON k.k_type_id = k_type.k_type_id
JOIN
    BUILDINGS b ON k.b_num = b.b_num
LEFT JOIN
    TEACHER t ON k.kindergartenid = t.kindergartenid
LEFT JOIN
    REGISTRATION r ON k.kindergartenid = r.kindergartenid
LEFT JOIN
    CHILD c ON r.registrationid_ = c.registrationid
WHERE
    k_type.type_name LIKE '%kindergarten%'
    OR k_type.type_name LIKE '%Preschool%'
    OR k_type.type_name LIKE '%Nursery%'
GROUP BY
    k.kindergartenid, k.k_name, k.capacity, k.k_language, k_type.type_name, b.address;
    
--view 2--

CREATE OR REPLACE VIEW KINDERGARTEN_MEALS AS
SELECT
    k.kindergartenID,
    k.k_name AS kindergarten_name,
    m.Meal_ID,
    m.description AS meal_description,
    i.invitation_date,
    i.amount
FROM
    Kindergarten k
JOIN
    invitation i ON k.kindergartenID = i.GROUP_ID
JOIN
    Meal m ON i.Meal_ID = m.Meal_ID
ORDER BY
    k.kindergartenID, m.Meal_ID;
    
--queries view 1--

--details about kindergartens located at a specific building address, including their type and capacity.--
SELECT 
    kindergartenid, 
    k_name, 
    kindergarten_type, 
    capacity, 
    num_teachers, 
    num_children 
FROM 
    KindergartenView 
WHERE 
    building_address = '71st Street';



--identifies kindergartens that are approaching their full capacity--
SELECT 
    kindergartenid, 
    k_name, 
    capacity, 
    num_children,
    (capacity - num_children) AS available_spots,
    ROUND(((capacity - num_children) / capacity) * 100, 2) AS percentage_available
FROM 
    KindergartenView 
WHERE 
    (capacity - num_children) < (capacity * 0.3)
ORDER BY 
    percentage_available ASC;
    
--queries view 2--

SELECT 
    kindergarten_name,
    COUNT(DISTINCT Meal_ID) AS total_meals,
    SUM(amount) AS total_amount
FROM 
    kindergarten_meals
GROUP BY 
    kindergartenID, kindergarten_name
ORDER BY 
    total_meals DESC;


SELECT *
FROM (
    SELECT 
        meal_description,
        COUNT(DISTINCT kindergartenID) AS kindergartens_count,
        SUM(amount) AS total_amount
    FROM 
        kindergarten_meals
    GROUP BY 
        Meal_ID, meal_description
    ORDER BY 
        total_amount DESC
)
WHERE ROWNUM <= 5;

