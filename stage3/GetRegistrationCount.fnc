CREATE OR REPLACE FUNCTION GetRegistrationCount(
    p_KindergartenID IN NUMBER,
    p_Year IN NUMBER
)
RETURN INT
IS
    v_Count INT; -- ����� ������ ���� �������
    v_KindergartenExists INT; -- ����� ����� �� ��� ����
BEGIN
    -- ����� �� ��� ����
    SELECT COUNT(*)
    INTO v_KindergartenExists
    FROM Kindergarten
    WHERE KindergartenID = p_KindergartenID;
    
    IF v_KindergartenExists = 0 THEN
        -- �� ��� �� ����, ���� �����
        RAISE_APPLICATION_ERROR(-20001, 'Kindergarten does not exist');
    END IF;

    -- ����� ���� ������� �� �� ���� �� ������ �����
    SELECT COUNT(*)
    INTO v_Count
    FROM Registration
    WHERE KindergartenID = p_KindergartenID
      AND EXTRACT(YEAR FROM RegistrationDate) = p_Year;

    DBMS_OUTPUT.PUT_LINE('Registration Count: ' || v_Count); -- ����� ���� �������
    RETURN v_Count; -- ����� ����� �������
EXCEPTION
    WHEN OTHERS THEN
        -- ����� ������� ������
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1; -- ����� ��� ����� �����
END;
/
