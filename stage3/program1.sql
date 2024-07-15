DECLARE
    v_ChildID NUMBER := 871;
    v_FirstName VARCHAR2(20) := 'daneil';
    v_LastName VARCHAR2(20) := 'choen';
    v_DateOfBirth DATE := TO_DATE('29/10/2020', 'DD/MM/YYYY');
    v_Allergies VARCHAR2(30) := 'None';
    v_EmergencyContactName VARCHAR2(30) := 'rachel choen';
    v_EmergencyContactPhone NUMBER := 1234567890;
    v_MedicalConditions VARCHAR2(30) := 'None';
    v_KindergartenID NUMBER := 58;
    v_Year NUMBER := EXTRACT(YEAR FROM SYSDATE);
     v_RegistrationCount INT;
BEGIN
    -- ניסיון קריאה לפרוצדורה לרישום ילד
    BEGIN
        RegisterChild(
            v_ChildID, v_FirstName, v_LastName, v_DateOfBirth, v_Allergies, v_EmergencyContactName,
            v_EmergencyContactPhone, v_MedicalConditions, v_KindergartenID
        );
        DBMS_OUTPUT.PUT_LINE('Child registered successfully');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error during child registration: ' || SQLERRM);
    END;
    
    -- ניסיון קריאה לפונקציה לקבלת כמות הרשמות לשנה הנוכחית
    BEGIN
        v_RegistrationCount := GetRegistrationCount(v_KindergartenID, v_Year);
        IF v_RegistrationCount = -1 THEN
            DBMS_OUTPUT.PUT_LINE('Error during getting registration count.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Registration count for kindergarten ' || v_KindergartenID || ' in year ' || v_Year || ' is ' || v_RegistrationCount);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error during getting registration count: ' || SQLERRM);
    END;

    -- ניסיון קריאה לפרוצדורה להצגת המורים בגן
    BEGIN
        kindergartens_teachers(v_KindergartenID);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error during getting kindergarten teachers: ' || SQLERRM);
    END;
END;

