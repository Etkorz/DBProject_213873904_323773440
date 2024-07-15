CREATE OR REPLACE PROCEDURE RegisterChild(
    p_ChildID IN NUMBER,
    p_FirstName IN VARCHAR2,
    p_LastName IN VARCHAR2,
    p_DateOfBirth IN DATE,
    p_Allergies IN VARCHAR2,
    p_EmergencyContactName IN VARCHAR2,
    p_EmergencyContactPhone IN NUMBER,
    p_MedicalConditions IN VARCHAR2,
    p_KindergartenID IN NUMBER
)
IS
    v_Capacity INT;
    v_CurrentRegistration INT;
BEGIN
    -- Check the capacity of the kindergarten
    SELECT capacity INTO v_Capacity FROM Kindergarten WHERE KindergartenID = p_KindergartenID;
    
    -- Check the current number of registrations in the kindergarten
    SELECT COUNT(*) INTO v_CurrentRegistration FROM Registration WHERE KindergartenID = p_KindergartenID;

    -- Check if there is available capacity
    IF v_CurrentRegistration < v_Capacity THEN
        BEGIN
           
            
            -- Insert into Child table
            INSERT INTO Child (ChildID, first_name, last_name, DateOfBirth, Allergies, EmergencyContactName, EmergencyContactPhone, MedicalConditions)
            VALUES (p_ChildID, p_FirstName, p_LastName, p_DateOfBirth, p_Allergies, p_EmergencyContactName, p_EmergencyContactPhone, p_MedicalConditions);
            
            -- Commit the transaction if everything is successful
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                -- Rollback the transaction in case of any error
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20002, 'An error occurred while registering the child: ' || SQLERRM);
        END;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'The kindergarten is at full capacity');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Kindergarten not found');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'An unexpected error occurred: ' || SQLERRM);
END;
/
