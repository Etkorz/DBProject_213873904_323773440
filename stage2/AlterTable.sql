ALTER TABLE Child ADD (RegistrationID NUMBER(3));
ALTER TABLE Registration ADD (KindergartenID NUMBER(3));


UPDATE Child c
SET RegistrationID = (
    SELECT r.RegistrationID_
    FROM Registration r
    WHERE r.ChildID = c.ChildID
);

UPDATE Registration r
SET KindergartenID = (
    SELECT c.KindergartenID
    FROM Child c
    WHERE c.ChildID = r.ChildID
);

ALTER TABLE Child DROP COLUMN KindergartenID;
ALTER TABLE Registration DROP COLUMN ChildID;

CREATE SEQUENCE seq
START WITH 1  
INCREMENT BY 1
MAXVALUE 999
CYCLE
NOCACHE;

CREATE OR REPLACE TRIGGER trg_set_registration_id
BEFORE INSERT ON Child
FOR EACH ROW
DECLARE
  v_registration_id NUMBER;
BEGIN
  SELECT seq.NEXTVAL INTO v_registration_id FROM dual;

  INSERT INTO Registration (RegistrationID_, RegistrationDate, r_language, status, KindergartenID)
  VALUES (
    v_registration_id,
    SYSDATE,
    'Hebrew',  
    'Pending',           
    NULL  
  );

  :NEW.RegistrationID := v_registration_id;
END;
/


ALTER TABLE Child
ADD CONSTRAINT fk_child_registration
FOREIGN KEY (RegistrationID)
REFERENCES Registration(RegistrationID_);

ALTER TABLE Registration
ADD CONSTRAINT fk_registration_kindergarten
FOREIGN KEY (KindergartenID)
REFERENCES Kindergarten(KindergartenID);
