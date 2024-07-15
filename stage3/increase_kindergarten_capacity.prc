CREATE OR REPLACE PROCEDURE increase_kindergarten_capacity(
    p_kindergarten_id IN NUMBER,
    p_increment IN NUMBER
)
IS
BEGIN
    -- Increase the capacity of the specified kindergarten
    UPDATE Kindergarten
    SET capacity = capacity + p_increment
    WHERE KindergartenID = p_kindergarten_id;

    -- Check if any rows were updated
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Kindergarten not found.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
