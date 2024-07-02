ALTER TABLE Kindergarten
ADD CONSTRAINT chk_capacity_positive CHECK (capacity > 0);

ALTER TABLE Activity
MODIFY act_description DEFAULT 'No description provided';

ALTER TABLE Child
MODIFY EmergencyContactPhone NUMBER(10) NOT NULL;


