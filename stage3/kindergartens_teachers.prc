create or replace procedure kindergartens_teachers(p_kindergarten_id IN NUMBER)  IS
    CURSOR teacher_cursor IS
        SELECT t.teacher_ID, t.t_name, t.phone, t.experience_date, t.t_role
        FROM Teacher t
        WHERE t.KindergartenID = p_kindergarten_id;

    v_teacher_record teacher_cursor%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Teachers in kindergarten ' || p_kindergarten_id || '
    ');
    OPEN teacher_cursor;

    LOOP
        FETCH teacher_cursor INTO v_teacher_record;
        EXIT WHEN teacher_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Teacher ID: ' || v_teacher_record.teacher_ID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_teacher_record.t_name);
        DBMS_OUTPUT.PUT_LINE('Phone: ' || v_teacher_record.phone);
        DBMS_OUTPUT.PUT_LINE('Experience Date: ' || v_teacher_record.experience_date);
        DBMS_OUTPUT.PUT_LINE('Role: ' || v_teacher_record.t_role);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;

    CLOSE teacher_cursor;
END;
/
