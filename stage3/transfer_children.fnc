CREATE OR REPLACE FUNCTION transfer_children(
    p_source_kindergarten_id IN NUMBER,
    p_target_kindergarten_id IN NUMBER
) RETURN VARCHAR2
IS
    v_source_count NUMBER;
    v_target_count NUMBER := 0;
    v_target_capacity NUMBER;
BEGIN
    -- Get the number of children in the source kindergarten
    SELECT COUNT(*)
    INTO v_source_count
    FROM Child c
    JOIN Registration r ON c.RegistrationID = r.RegistrationID_
    WHERE r.KindergartenID = p_source_kindergarten_id;

    -- Get the number of children and capacity in the target kindergarten
    SELECT COALESCE(COUNT(*), 0), k.capacity
    INTO v_target_count, v_target_capacity
    FROM Kindergarten k
    LEFT JOIN Registration r ON k.KindergartenID = r.KindergartenID
    LEFT JOIN Child c ON c.RegistrationID = r.RegistrationID_
    WHERE k.KindergartenID = p_target_kindergarten_id
    GROUP BY k.KindergartenID, k.capacity;

    -- Check if the target kindergarten has enough capacity
    IF (v_target_count + v_source_count) <= v_target_capacity THEN
        -- Transfer children
        UPDATE Registration
        SET KindergartenID = p_target_kindergarten_id
        WHERE RegistrationID_ IN (
            SELECT c.RegistrationID
            FROM Child c
            JOIN Registration r ON c.RegistrationID = r.RegistrationID_
            WHERE r.KindergartenID = p_source_kindergarten_id
        );
        COMMIT;
        RETURN 'Children transferred successfully.';
    ELSE
        RETURN 'Target kindergarten does not have enough capacity.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RETURN 'Error: ' || SQLERRM;
END;
/
