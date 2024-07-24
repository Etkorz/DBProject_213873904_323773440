INSERT INTO k_type (k_type_id, type_name, age_groupe) VALUES (4, 'Infants daycare', '3-4');

INSERT INTO k_type (k_type_id, type_name, age_groupe) VALUES (5, 'Toddlers daycare', '4-5');

INSERT INTO k_type (k_type_id, type_name, age_groupe) VALUES (6, 'Preschoolers daycare', '5-6');

commit;
-------------------------------------------------------------------------------------------------
--changing the group_id numbers so they will fit with our tables--
-- Disable the constraint
ALTER TABLE CHILDREN DISABLE CONSTRAINT SYS_C008043; --foreighn key
ALTER TABLE INVITATION DISABLE CONSTRAINT SYS_C008051;--foreighn key


CREATE SEQUENCE new_group_id_seq START WITH 151 INCREMENT BY 1;

ALTER TABLE GROUPS ADD old_group_id INTEGER;

UPDATE GROUPS SET old_group_id = group_id;

COMMIT;

--updating related tables--
UPDATE GROUPS
SET group_id = new_group_id_seq.NEXTVAL;
COMMIT;

UPDATE CHILDREN c
SET c.group_id = (
  SELECT g.group_id 
  FROM GROUPS g 
  WHERE g.old_group_id = c.group_id
);

UPDATE INVITATION i
SET i.group_id = (
  SELECT g.group_id 
  FROM GROUPS g 
  WHERE g.old_group_id = i.group_id
);

COMMIT;

ALTER TABLE GROUPS DROP COLUMN old_group_id;
DROP SEQUENCE new_group_id_seq;

ALTER TABLE CHILDREN ENABLE CONSTRAINT SYS_C008043;
ALTER TABLE INVITATION ENABLE CONSTRAINT SYS_C008051;
COMMIT;

-----------------------------------------------------------------------
--add to the activity table the classes of the daycare--

--add colloms to activity table--
ALTER TABLE activity ADD(guide_name VARCHAR2(20));
ALTER TABLE activity ADD(guide_phone VARCHAR2(15));

--inserting data--
INSERT INTO activity (activityId, activity_name, guide_name, guide_phone)
SELECT class_id, class_name, guide, guide_phone
FROM class
WHERE NOT EXISTS (
    SELECT 1
    FROM activity
    WHERE activity_name = class_name
        AND guide_name = guide
        AND guide_phone = guide_phone
);
COMMIT;

-------------------------------------------------------------------------
-- merging the daycare (groups table) with the kindergarten table-- 
INSERT INTO kindergarten (KindergartenID, k_name, capacity, k_language, b_num, k_type_id)
SELECT
    g.group_id AS KindergartenID,
    g.group_name AS k_name,
    FLOOR(DBMS_RANDOM.VALUE(15, 30)) AS capacity, 
    'hebrew' AS k_language,
    NULL AS b_num,
    CASE
        WHEN g.age_group BETWEEN 1 AND 4 THEN 4 
        WHEN g.age_group BETWEEN 4 AND 7 THEN 5
        WHEN g.age_group BETWEEN 7 AND 10 THEN 6 
    END AS k_type_id
FROM Groups g
WHERE g.group_name not in (select k.k_name from kindergarten k);
COMMIT;

-------------------------------------------------------------------------------
--משבץ לתוך מערכת הפעילויות את הפעילויות של הצהרונים 
--תוך החלפת היום בשבוע לתאריך 
INSERT INTO ACTIVITYSCHEDULE (act_hour, activity_date, activityID, KindergartenID)
SELECT 
    LPAD(g.hour, 2, '0') || ':00' AS act_hour,
    TO_DATE('23-07-2024', 'dd-mm-yyyy') + 
    (CASE UPPER(g.class_day)
        WHEN 'SUNDAY' THEN 0
        WHEN 'MONDAY' THEN 1
        WHEN 'TUESDAY' THEN 2
        WHEN 'WEDNESDAY' THEN 3
        WHEN 'THURSDAY' THEN 4
        WHEN 'FRUDAY' THEN 5
        WHEN 'SATURDAY' THEN 6
    END) AS activity_date,
    g.class_id AS activityID,
    g.group_id AS KindergartenID
FROM GROUPS g
WHERE NOT EXISTS (
      SELECT 1
      FROM ACTIVITYSCHEDULE
      WHERE g.group_id = KindergartenID
      AND g.class_id = activityID);

COMMIT;
------------------------------------------------------------------
--insert kindergarten teachers into teacher table--
BEGIN
  FOR r IN (
    SELECT DISTINCT 
      kt.kteacher_id, 
      kt.first_name || ' ' || kt.last_name AS t_name,
      kt.phone_number,
      g.group_id
    FROM KINDERGARTEN_TEACHER kt
    INNER JOIN GROUPS g ON kt.kteacher_id = g.kteacher_id
    ORDER BY kt.kteacher_id
  ) LOOP
    BEGIN
      INSERT INTO TEACHER (teacher_id, t_name, phone, kindergartenid)
      VALUES (
        TO_NUMBER(r.kteacher_id),
        r.t_name,
        TO_NUMBER(r.phone_number),
        r.group_id
      );
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting kteacher_id: ' || r.kteacher_id || ' - ' || SQLERRM);
    END;
  END LOOP;
END;
/
COMMIT;
----------------------------------------------------------------------------------------------
--making group_id in INVITATION to reference KINDERGARTENS 

--removing group_id foreighn key
ALTER TABLE INVITATION
DROP CONSTRAINT SYS_C008051; 
--adding group_id as foreighn key that references KINDERGARTEN
ALTER TABLE INVITATION
ADD CONSTRAINT FK_INVITATION_KINDERGARTEN
FOREIGN KEY (group_id)
REFERENCES KINDERGARTEN (kindergartenid);

commit;
-----------------------------------------------------------------------------------------------

--changing the trigger--
ALTER SEQUENCE seq
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9999999999
    CYCLE;
    commit;
    
CREATE OR REPLACE TRIGGER trg_set_registration_id
BEFORE INSERT ON CHILD
FOR EACH ROW
DECLARE
    v_registration_id NUMBER;
BEGIN
    -- Use a loop to handle potential race conditions
    LOOP
        -- Get the next sequence value
        SELECT seq.NEXTVAL INTO v_registration_id FROM dual;
        -- Try to insert into Registration
        BEGIN
            INSERT INTO Registration (
                RegistrationID_,
                RegistrationDate,
                r_language,
                status,
                KindergartenID,
                Daycareid
            ) VALUES (
                v_registration_id,
                SYSDATE,
                'hebrew',
                'pending',
                NULL,
                NULL
            );
            -- If insert succeeds, exit the loop
            EXIT;
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                -- If a duplicate is found, continue the loop to get a new ID
                CONTINUE;
        END;
    END LOOP;
    -- Assign the successful Registration ID to the Child record
    :NEW.RegistrationID := v_registration_id;
END;

-----------------------------------------------------------------------------------------------
--adding daycareid column--
ALTER TABLE Registration 
ADD daycareid INT;

ALTER TABLE Registration
ADD CONSTRAINT fk_registration_daycare
FOREIGN KEY (daycareid) REFERENCES Kindergarten(KindergartenID);

--adding address to child--
ALTER TABLE Child
ADD address VARCHAR2(20);

ALTER TABLE CHILD
MODIFY (childid NUMBER(10));
ALTER TABLE registration
MODIFY (registrationid_ NUMBER(10));
ALTER TABLE child
MODIFY (registrationid NUMBER(10));
commit;
--moving the data from children table to child table
INSERT INTO Child (
    ChildID,
    first_name,
    last_name,
    DateOfBirth,
    EMERGENCYCONTACTNAME,
    EmergencyContactPhone,
    address
)
SELECT 
    c.child_id,
    c.first_name,
    c.last_name,
    c.date_of_birth,
    c.parent_name,
    c.phone_number,
    c.address
FROM CHILDREN c
LEFT JOIN Child ch ON c.child_id = ch.ChildID
WHERE ch.ChildID IS NULL;

commit;


--updating the registration table--

UPDATE Registration r
SET 
    r.daycareid = (
        SELECT ch.group_id
        FROM children ch
        JOIN Child c ON ch.child_id = c.ChildID 
        WHERE c.RegistrationID = r.RegistrationID_
    )
WHERE r.RegistrationID_ IN (
    SELECT c.RegistrationID
    FROM Child c
    WHERE c.ChildID IN (SELECT child_id FROM CHILDREN)
);
commit;


--adding the k_type_id to the new records--
UPDATE Registration r
SET r.k_type_id = (
    SELECT k.k_type_id
    FROM Kindergarten k
    WHERE k.KindergartenID = r.daycareid
)
WHERE r.daycareid IS NOT NULL;

commit;

-----------------------------------------------------

--deleting the table we dont need abymore--

DROP TABLE Children;
DROP TABLE Groups;
DROP TABLE Class;
DROP TABLE Kindergarten_Teacher;
