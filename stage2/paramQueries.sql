SELECT C.ChildID, C.first_name, C.last_name, C.EmergencyContactName, C.EmergencyContactPhone, R.KindergartenID, K.k_name
FROM Child C
JOIN Registration R ON C.RegistrationID = R.RegistrationID_
JOIN Kindergarten K ON R.KindergartenID = K.KindergartenID
WHERE c.first_name = &<name="child first name" type="string"> 
AND C.last_name = &<name="child last name" type="string"> 
AND K.k_name= &<name="kindergarten name" type="string">;

select * 
from kindergarten
join buildings ON Kindergarten.b_num=Buildings.b_num
where buildings.address=&<name="address" list="select address from buildings group by address" type="string">;

SELECT C.ChildID, C.first_name, C.last_name, C.DateOfBirth, C.Allergies, C.EmergencyContactName, C.EmergencyContactPhone, C.MedicalConditions, C.RegistrationID
FROM Child C
JOIN Registration R ON C.REGISTRATIONID = R.REGISTRATIONID_
JOIN Kindergarten K ON R.KINDERGARTENID = K.KINDERGARTENID
WHERE K.K_NAME = &<name="kindergarten name" hint="List of children in kindergarten" type="string">;

SELECT C.ChildID, C.first_name, C.last_name, C.DateOfBirth, C.Allergies, k.k_name
FROM Child C
JOIN Registration R ON C.REGISTRATIONID = R.REGISTRATIONID_
JOIN Kindergarten K ON R.KINDERGARTENID = K.KINDERGARTENID 
WHERE Allergies = &<name="medical condition" type="string" list="SELECT DISTINCT C.Allergies
                                                                 FROM Child C
                                                                 JOIN Registration R ON C.RegistrationID = R.RegistrationID_
                                                                 JOIN Kindergarten K ON R.KindergartenID = K.KindergartenID">
Order by K.k_name;                
