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
  c.first_name,
  c.last_name,
  k.k_name AS KindergartenName,
  EXTRACT(DAY FROM r.RegistrationDate) AS Day,
  EXTRACT(MONTH FROM r.RegistrationDate) AS Month,
  EXTRACT(YEAR FROM r.RegistrationDate) AS Year
FROM 
  Child c
JOIN 
  Registration r ON c.registrationid = r.registrationid_
JOIN 
  Kindergarten k ON r.KindergartenID = k.KindergartenID
ORDER BY 
  r.RegistrationDate;
  
SELECT 
  t.t_name AS TeacherName,
  FLOOR(MONTHS_BETWEEN(SYSDATE, t.experience_date) / 12) AS ExperienceYears,
  COUNT(r.registrationid_) AS NumberOfStudents
FROM 
  Teacher t
JOIN 
  Kindergarten k ON t.KindergartenID = k.KindergartenID
LEFT JOIN 
  Registration r ON t.KindergartenID = r.KindergartenID
GROUP BY 
  t.teacher_ID, t.t_name, t.experience_date
ORDER BY 
  ExperienceYears DESC;
  
SELECT 
  k.k_name AS KindergartenName,
  t.type_name AS TypeName,
  COUNT(DISTINCT t1.teacher_ID) AS NumberOfTeachers,
  COUNT(DISTINCT r.registrationid_) AS NumberOfChildren
FROM 
  Kindergarten k
JOIN 
  k_type t ON k.k_type_id = t.k_type_id
LEFT JOIN 
  Teacher t1 ON k.KindergartenID = t1.KindergartenID
LEFT JOIN 
  Registration r ON k.KindergartenID = r.KindergartenID
LEFT JOIN 
  Child c ON r.RegistrationID_ = c.RegistrationID
GROUP BY 
  k.k_name, t.type_name
ORDER BY 
  k.k_name;
  
DELETE FROM
  activitySchedule 
WHERE 
  activity_date < TO_DATE('01/04/2024', 'DD-MM-YYYY');
COMMIT;


DELETE FROM Buildings
WHERE b_num NOT IN (
    SELECT b_num
    FROM Kindergarten
);
COMMIT;

UPDATE Registration
SET status = 'rejected'
WHERE status = 'pending'
AND RegistrationDate < ADD_MONTHS(SYSDATE, -3);
COMMIT;

UPDATE Registration
SET status = 'Accepted'
WHERE RegistrationID_ IN (
    SELECT R.RegistrationID_
    FROM Registration R
    JOIN Child C ON R.REGISTRATIONID_ = C.REGISTRATIONID
    JOIN Kindergarten K ON R.KindergartenID = K.KindergartenID
    WHERE R.status = 'rejected'
);
COMMIT;
