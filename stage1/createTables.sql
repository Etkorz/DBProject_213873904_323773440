CREATE TABLE Buildings
(
  b_num number(3) NOT NULL,
  address VARCHAR(30),
  accesible VARCHAR(3),
  PRIMARY KEY (b_num)
);

CREATE TABLE Activity
(
  activityID number(3) NOT NULL,
  act_description VARCHAR(100),
  activity_name VARCHAR(100),
  PRIMARY KEY (activityID)
);

CREATE TABLE k_type
(
  k_type_id number(3) NOT NULL,
  type_name VARCHAR(30),
  age_groupe VARCHAR(5),
  PRIMARY KEY (k_type_id)
);

CREATE TABLE Kindergarten
(
  KindergartenID number(3) NOT NULL,
  k_name VARCHAR(30),
  capacity INT,
  k_language VARCHAR(20),
  b_num number(3),
  k_type_id number (3),
  PRIMARY KEY (KindergartenID),
  FOREIGN KEY (b_num) REFERENCES Buildings(b_num),
  FOREIGN KEY (k_type_id) REFERENCES k_type(k_type_id)
);

CREATE TABLE Teacher
(
  teacher_ID number(3) NOT NULL,
  t_name VARCHAR(20),
  phone number (10),
  experience_date DATE ,
  t_role VARCHAR(10) ,
  KindergartenID number(3) NOT NULL,
  PRIMARY KEY (teacher_ID),
  FOREIGN KEY (KindergartenID) REFERENCES Kindergarten(KindergartenID)
);

CREATE TABLE activitySchedule
(
  act_hour number (5) NOT NULL,
  activity_date DATE,
  activityID number(3) NOT NULL,
  KindergartenID number(3) NOT NULL,
  PRIMARY KEY (activityID, KindergartenID),
  FOREIGN KEY (activityID) REFERENCES Activity(activityID),
  FOREIGN KEY (KindergartenID) REFERENCES Kindergarten(KindergartenID)
);

CREATE TABLE Child
(
  ChildID number(3) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  DateOfBirth DATE,
  Allergies VARCHAR(30),
  EmergencyContactName VARCHAR(30),
  EmergencyContactPhone number (10),
  MedicalConditions VARCHAR(30),
  KindergartenID number(3) NOT NULL,
  PRIMARY KEY (ChildID),
  FOREIGN KEY (KindergartenID) REFERENCES Kindergarten(KindergartenID)
);

CREATE TABLE Registration
(
  RegistrationID_ number(3) NOT NULL,
  RegistrationDate DATE,
  r_language VARCHAR(20),
  status VARCHAR(20),
  ChildID number(3) NOT NULL,
  k_type_id number(3) NOT NULL,
  PRIMARY KEY (RegistrationID_),
  FOREIGN KEY (ChildID) REFERENCES Child(ChildID),
  FOREIGN KEY (k_type_id) REFERENCES k_type(k_type_id)
);
