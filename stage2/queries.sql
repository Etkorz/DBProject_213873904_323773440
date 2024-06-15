SELECT 
  c.first_name,
  c.last_name,
  k.k_name AS KindergartenName,
  EXTRACT(DAY FROM r.RegistrationDate) AS Day,
  EXTRACT(MONTH FROM r.RegistrationDate) AS Month,
  EXTRACT(YEAR FROM r.RegistrationDate) AS Year
FROM 
  Child c
JOIN 
  Registration r ON c.ChildID = r.ChildID
JOIN 
  Kindergarten k ON c.KindergartenID = k.KindergartenID
ORDER BY 
  r.RegistrationDate;
  
 SELECT 
  a.activity_name,
  k.k_name AS KindergartenName,
  s.activity_date AS ActivityDate,
  TO_CHAR(s.activity_date, 'Day') AS ActivityDay,
  s.act_hour AS ActivityHour
FROM 
  activitySchedule s
JOIN 
  Activity a ON s.activityID = a.activityID
JOIN 
  Kindergarten k ON s.KindergartenID = k.KindergartenID
WHERE 
  s.activity_date BETWEEN TRUNC(SYSDATE, 'IW') + 7 AND TRUNC(SYSDATE, 'IW') + 13
ORDER BY 
  ActivityDate, ActivityHour;

SELECT 
  t.t_name AS TeacherName,
  FLOOR(MONTHS_BETWEEN(SYSDATE, t.experience_date) / 12) AS ExperienceYears,
  COUNT(c.ChildID) AS NumberOfChildren
FROM 
  Teacher t
JOIN 
  Kindergarten k ON t.KindergartenID = k.KindergartenID
LEFT JOIN 
  Child c ON k.KindergartenID = c.KindergartenID
GROUP BY 
  t.teacher_ID, t.t_name, t.experience_date
ORDER BY 
  ExperienceYears DESC;

SELECT 
  k.k_name AS KindergartenName,
  t.type_name AS TypeName,
  COUNT(DISTINCT t1.teacher_ID) AS NumberOfTeachers,
  COUNT(DISTINCT c.ChildID) AS NumberOfChildren
FROM 
  Kindergarten k
JOIN 
  k_type t ON k.k_type_id = t.k_type_id
LEFT JOIN 
  Teacher t1 ON k.KindergartenID = t1.KindergartenID
LEFT JOIN 
  Child c ON k.KindergartenID = c.KindergartenID
GROUP BY 
  k.k_name, t.type_name
ORDER BY 
  k.k_name;
  
DELETE FROM 
  Child
WHERE 
  ChildID IN (
    SELECT 
      r.ChildID 
    FROM 
      Registration r
    WHERE 
      r.status = 'rejected'
  );

DELETE FROM 
  Registration
WHERE 
  status = 'rejected';


DELETE FROM
  activitySchedule 
WHERE 
  activity_date < TO_DATE('01/02/2024', 'DD-MM-YYYY');
COMMIT;

UPDATE Registration
SET status = 'rejected'
WHERE status = 'pending'
AND RegistrationDate < ADD_MONTHS(SYSDATE, -3);
COMMIT;



