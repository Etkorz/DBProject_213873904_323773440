CREATE OR REPLACE FUNCTION GetRegistrationCount(
    p_KindergartenID IN NUMBER,
    p_Year IN NUMBER
)
RETURN INT
IS
    v_Count INT; -- משתנה להחזקת כמות ההרשמות
    v_KindergartenExists INT; -- משתנה לבדוק אם הגן קיים
BEGIN
    -- בדיקה אם הגן קיים
    SELECT COUNT(*)
    INTO v_KindergartenExists
    FROM Kindergarten
    WHERE KindergartenID = p_KindergartenID;
    
    IF v_KindergartenExists = 0 THEN
        -- אם הגן לא קיים, זרוק חריגה
        RAISE_APPLICATION_ERROR(-20001, 'Kindergarten does not exist');
    END IF;

    -- חישוב כמות ההרשמות על פי מספר גן הילדים והשנה
    SELECT COUNT(*)
    INTO v_Count
    FROM Registration
    WHERE KindergartenID = p_KindergartenID
      AND EXTRACT(YEAR FROM RegistrationDate) = p_Year;

    DBMS_OUTPUT.PUT_LINE('Registration Count: ' || v_Count); -- הדפסת כמות ההרשמות
    RETURN v_Count; -- החזרת הכמות המחושבת
EXCEPTION
    WHEN OTHERS THEN
        -- טיפול בשגיאות כלליות
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1; -- החזרת ערך מציין שגיאה
END;
/
