DECLARE
    v_result VARCHAR2(100);
BEGIN
    -- Transfer children from kindergarten 1 to kindergarten 2
    v_result := transfer_children(91, 90);
    DBMS_OUTPUT.PUT_LINE(v_result);

    -- Increase the capacity of kindergarten 2 by 10
    increase_kindergarten_capacity(10, 1);
    DBMS_OUTPUT.PUT_LINE('Capacity increased successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
