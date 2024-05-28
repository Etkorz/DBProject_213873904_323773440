prompt PL/SQL Developer import file
prompt Created on יום שלישי 28 מאי 2024 by לקוח
set feedback off
set define off
prompt Creating ACTIVITY...
create table ACTIVITY
(
  activityid      NUMBER(3) not null,
  act_description VARCHAR2(100),
  activity_name   VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add primary key (ACTIVITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating K_TYPE...
create table K_TYPE
(
  k_type_id  NUMBER(3) not null,
  type_name  VARCHAR2(30),
  age_groupe VARCHAR2(5)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table K_TYPE
  add primary key (K_TYPE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BUILDINGS...
create table BUILDINGS
(
  b_num     NUMBER(3) not null,
  address   VARCHAR2(30),
  accesible VARCHAR2(3)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BUILDINGS
  add primary key (B_NUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating KINDERGARTEN...
create table KINDERGARTEN
(
  kindergartenid NUMBER(3) not null,
  k_name         VARCHAR2(30),
  capacity       INTEGER,
  k_language     VARCHAR2(20),
  b_num          NUMBER(3),
  k_type_id      NUMBER(3)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KINDERGARTEN
  add primary key (KINDERGARTENID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KINDERGARTEN
  add foreign key (B_NUM)
  references BUILDINGS (B_NUM);
alter table KINDERGARTEN
  add foreign key (K_TYPE_ID)
  references K_TYPE (K_TYPE_ID);

prompt Creating ACTIVITYSCHEDULE...
create table ACTIVITYSCHEDULE
(
  act_hour       VARCHAR2(5) not null,
  activity_date  DATE,
  activityid     NUMBER(3) not null,
  kindergartenid NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITYSCHEDULE
  add primary key (ACTIVITYID, KINDERGARTENID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITYSCHEDULE
  add foreign key (ACTIVITYID)
  references ACTIVITY (ACTIVITYID);
alter table ACTIVITYSCHEDULE
  add foreign key (KINDERGARTENID)
  references KINDERGARTEN (KINDERGARTENID);

prompt Creating CHILD...
create table CHILD
(
  childid               NUMBER(3) not null,
  first_name            VARCHAR2(20) not null,
  last_name             VARCHAR2(20) not null,
  dateofbirth           DATE,
  allergies             VARCHAR2(30),
  emergencycontactname  VARCHAR2(30),
  emergencycontactphone NUMBER(10),
  medicalconditions     VARCHAR2(30),
  kindergartenid        NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHILD
  add primary key (CHILDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHILD
  add foreign key (KINDERGARTENID)
  references KINDERGARTEN (KINDERGARTENID);

prompt Creating REGISTRATION...
create table REGISTRATION
(
  registrationid_  NUMBER(3) not null,
  registrationdate DATE,
  r_language       VARCHAR2(20),
  status           VARCHAR2(20),
  childid          NUMBER(3) not null,
  k_type_id        NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REGISTRATION
  add primary key (REGISTRATIONID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REGISTRATION
  add foreign key (CHILDID)
  references CHILD (CHILDID);
alter table REGISTRATION
  add foreign key (K_TYPE_ID)
  references K_TYPE (K_TYPE_ID);

prompt Creating TEACHER...
create table TEACHER
(
  teacher_id      NUMBER(3) not null,
  t_name          VARCHAR2(20),
  phone           NUMBER(10),
  experience_date DATE,
  t_role          VARCHAR2(10),
  kindergartenid  NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEACHER
  add primary key (TEACHER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEACHER
  add foreign key (KINDERGARTENID)
  references KINDERGARTEN (KINDERGARTENID);

prompt Disabling triggers for ACTIVITY...
alter table ACTIVITY disable all triggers;
prompt Disabling triggers for K_TYPE...
alter table K_TYPE disable all triggers;
prompt Disabling triggers for BUILDINGS...
alter table BUILDINGS disable all triggers;
prompt Disabling triggers for KINDERGARTEN...
alter table KINDERGARTEN disable all triggers;
prompt Disabling triggers for ACTIVITYSCHEDULE...
alter table ACTIVITYSCHEDULE disable all triggers;
prompt Disabling triggers for CHILD...
alter table CHILD disable all triggers;
prompt Disabling triggers for REGISTRATION...
alter table REGISTRATION disable all triggers;
prompt Disabling triggers for TEACHER...
alter table TEACHER disable all triggers;
prompt Disabling foreign key constraints for KINDERGARTEN...
alter table KINDERGARTEN disable constraint SYS_C007189;
alter table KINDERGARTEN disable constraint SYS_C007190;
prompt Disabling foreign key constraints for ACTIVITYSCHEDULE...
alter table ACTIVITYSCHEDULE disable constraint SYS_C007448;
alter table ACTIVITYSCHEDULE disable constraint SYS_C007449;
prompt Disabling foreign key constraints for CHILD...
alter table CHILD disable constraint SYS_C007467;
prompt Disabling foreign key constraints for REGISTRATION...
alter table REGISTRATION disable constraint SYS_C007484;
alter table REGISTRATION disable constraint SYS_C007485;
prompt Disabling foreign key constraints for TEACHER...
alter table TEACHER disable constraint SYS_C007238;
prompt Deleting TEACHER...
delete from TEACHER;
commit;
prompt Deleting REGISTRATION...
delete from REGISTRATION;
commit;
prompt Deleting CHILD...
delete from CHILD;
commit;
prompt Deleting ACTIVITYSCHEDULE...
delete from ACTIVITYSCHEDULE;
commit;
prompt Deleting KINDERGARTEN...
delete from KINDERGARTEN;
commit;
prompt Deleting BUILDINGS...
delete from BUILDINGS;
commit;
prompt Deleting K_TYPE...
delete from K_TYPE;
commit;
prompt Deleting ACTIVITY...
delete from ACTIVITY;
commit;
prompt Loading ACTIVITY...
insert into ACTIVITY (activityid, act_description, activity_name)
values (1, ' Exploring outdoors ', ' Field trips');
insert into ACTIVITY (activityid, act_description, activity_name)
values (2, ' Hiking or exploring local trails ', ' Nature walks');
insert into ACTIVITY (activityid, act_description, activity_name)
values (3, 'exercises to develop gross motor skills', ' Gross motor activities');
insert into ACTIVITY (activityid, act_description, activity_name)
values (4, ' ', ' Outdoor play');
insert into ACTIVITY (activityid, act_description, activity_name)
values (5, 'Singing dancing and playing instruments ', ' Music & movement');
insert into ACTIVITY (activityid, act_description, activity_name)
values (6, 'creating plays to foster creativity', ' Dramatic play');
insert into ACTIVITY (activityid, act_description, activity_name)
values (7, ' ', ' Cooperative games');
insert into ACTIVITY (activityid, act_description, activity_name)
values (8, ' Programs focusing on managing emotions ', ' Social-emotional learning');
insert into ACTIVITY (activityid, act_description, activity_name)
values (9, ' activities with basic science concepts ', ' Science experiments');
insert into ACTIVITY (activityid, act_description, activity_name)
values (10, ' ', ' Water play');
insert into ACTIVITY (activityid, act_description, activity_name)
values (11, ' ', ' Storytime');
insert into ACTIVITY (activityid, act_description, activity_name)
values (12, ' painting and drawing ', ' Arts and crafts');
insert into ACTIVITY (activityid, act_description, activity_name)
values (13, null, ' Circle time');
insert into ACTIVITY (activityid, act_description, activity_name)
values (14, null, ' Puppet shows');
insert into ACTIVITY (activityid, act_description, activity_name)
values (15, ' Early exposure to a second language', ' Second language ');
insert into ACTIVITY (activityid, act_description, activity_name)
values (16, ' basic food prep and cooking skills', ' Cooking classes');
insert into ACTIVITY (activityid, act_description, activity_name)
values (17, 'lessons on nature', ' Gardening');
insert into ACTIVITY (activityid, act_description, activity_name)
values (18, ' ', ' Animal encounters');
insert into ACTIVITY (activityid, act_description, activity_name)
values (19, null, ' Fire safety education');
insert into ACTIVITY (activityid, act_description, activity_name)
values (20, null, ' Themed days');
commit;
prompt 20 records loaded
prompt Loading K_TYPE...
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (123, ' Therapeutic-Preschool', ' 4-5');
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (124, ' Preschool', ' 4-5');
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (135, '  Therapeutic-Nursery-school', '3-4');
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (136, ' nursery-school', ' 3-4');
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (142, ' Therapeutic-Kindergarten', ' 5-6');
insert into K_TYPE (k_type_id, type_name, age_groupe)
values (143, ' kindergarten', ' 5-6');
commit;
prompt 6 records loaded
prompt Loading BUILDINGS...
insert into BUILDINGS (b_num, address, accesible)
values (1, '1 Stiers Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (2, '31 Lakeville Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (3, '535 Melrose park Ave', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (4, '62nd Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (5, '55 Russell Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (6, '40 Morse Road', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (7, '75 Ronny Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (8, '80 Fairbanks Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (9, '98 Cruise Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (10, '69 Tara Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (11, '25 Fountain Hills Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (12, '28 Portland Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (13, '62 Moriarty Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (14, '518 Hunter', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (15, '96 Myles', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (16, '22 Gallant Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (17, '29 Forster Road', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (18, '13 McKellen Blvd', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (19, '79 Midler Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (20, '25 Diffie Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (21, '816 Freda Ave', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (22, '172 Karachi Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (23, '51st Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (24, '73 Etta', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (25, '83rd Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (26, '17 Hatchet Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (27, '58 Craig Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (28, '44 Pierce Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (29, '71st Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (30, '1 Speaks Blvd', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (31, '87 Mississauga Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (32, '10 Pat Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (33, '47 Lee Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (34, '861 Dan Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (35, '89 Price Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (36, '795 Vince Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (37, '44 Carolyn Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (38, '85 Dolenz Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (39, '17 Coyote Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (40, '13 Bragg Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (41, '30 Eckhart Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (42, '650 Stiles Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (43, '88 Pusan-city Drive', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (44, '21st Street', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (45, '77 Anjelica Road', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (46, '92 Franco Road', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (47, '24 Key Biscayne Drive', 'yes');
insert into BUILDINGS (b_num, address, accesible)
values (48, '47 Terrence Blvd', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (49, '862 Burstyn Street', 'no');
insert into BUILDINGS (b_num, address, accesible)
values (50, '82nd Street', 'yes');
commit;
prompt 50 records loaded
prompt Loading KINDERGARTEN...
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (1, 'Jann kindergarten', 30, 'russian', 29, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (2, 'Ritchie kindergarten', 25, 'russian', 37, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (3, 'Chubby kindergarten', 15, 'hebrew', 38, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (4, 'Bill kindergarten', 20, 'english', 50, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (5, 'Maggie kindergarten', 20, 'hebrew', 2, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (6, 'Chalee kindergarten', 25, 'hebrew', 5, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (7, 'Geoff kindergarten', 15, 'hebrew', 29, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (8, 'First kindergarten', 20, 'english', 6, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (9, 'Grace kindergarten', 20, 'english', 16, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (10, 'Udo kindergarten', 30, 'english', 3, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (11, 'Davis kindergarten', 25, 'english', 6, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (12, 'Rick kindergarten', 30, 'english', 47, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (13, 'Henry kindergarten', 30, 'russian', 12, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (14, 'Cliff kindergarten', 20, 'english', 31, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (15, 'Jessica kindergarten', 15, 'russian', 14, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (16, 'Mickey kindergarten', 25, 'hebrew', 44, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (17, 'Sophie kindergarten', 30, 'english', 43, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (18, 'James kindergarten', 25, 'hebrew', 37, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (19, 'Avril kindergarten', 15, 'hebrew', 40, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (20, 'Gabrielle kindergarten', 15, 'english', 46, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (21, 'Hal kindergarten', 15, 'russian', 23, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (22, 'Grant kindergarten', 25, 'hebrew', 31, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (23, 'Lance kindergarten', 25, 'hebrew', 10, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (24, 'Wes kindergarten', 25, 'english', 7, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (25, 'Kylie kindergarten', 25, 'russian', 9, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (26, 'Katrin kindergarten', 20, 'russian', 28, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (27, 'Edgar kindergarten', 25, 'russian', 49, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (28, 'Bret kindergarten', 30, 'hebrew', 39, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (29, 'Kasey kindergarten', 15, 'hebrew', 45, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (30, 'Shirley kindergarten', 20, 'english', 40, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (31, 'Philip kindergarten', 25, 'english', 8, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (32, 'Hugo kindergarten', 25, 'hebrew', 2, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (33, 'Sinead kindergarten', 30, 'english', 12, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (34, 'Robin kindergarten', 25, 'russian', 10, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (35, 'Amanda kindergarten', 20, 'hebrew', 5, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (36, 'Cary kindergarten', 15, 'russian', 20, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (37, 'Dean kindergarten', 15, 'russian', 11, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (38, 'Darius kindergarten', 25, 'russian', 50, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (39, 'Tommy kindergarten', 20, 'english', 47, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (40, 'Horace kindergarten', 15, 'english', 30, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (41, 'Rick kindergarten', 15, 'russian', 27, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (42, 'Lois kindergarten', 20, 'english', 42, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (43, 'Hector kindergarten', 25, 'english', 3, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (44, 'Renee kindergarten', 20, 'russian', 50, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (45, 'Meredith kindergarten', 20, 'hebrew', 28, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (46, 'Talvin kindergarten', 25, 'english', 45, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (47, 'Night kindergarten', 30, 'russian', 36, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (48, 'Ossie kindergarten', 15, 'hebrew', 44, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (49, 'Jarvis kindergarten', 15, 'english', 25, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (50, 'Cornell kindergarten', 30, 'russian', 31, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (51, 'Naomi kindergarten', 20, 'english', 20, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (52, 'Davis kindergarten', 15, 'hebrew', 33, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (53, 'Lydia kindergarten', 25, 'hebrew', 19, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (54, 'Crispin kindergarten', 15, 'english', 33, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (55, 'Suzy kindergarten', 30, 'russian', 34, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (56, 'Salma kindergarten', 30, 'english', 23, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (57, 'Raymond kindergarten', 15, 'hebrew', 50, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (58, 'Mary kindergarten', 25, 'russian', 41, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (59, 'Jeanne kindergarten', 30, 'russian', 35, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (60, 'Freda kindergarten', 15, 'russian', 10, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (61, 'Jean-Claude kindergarten', 20, 'russian', 28, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (62, 'Scott kindergarten', 30, 'english', 10, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (63, 'Delbert kindergarten', 30, 'hebrew', 26, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (64, 'Selma kindergarten', 15, 'english', 10, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (65, 'Denise kindergarten', 15, 'hebrew', 44, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (66, 'Anne kindergarten', 15, 'english', 45, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (67, 'Heather kindergarten', 20, 'hebrew', 45, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (68, 'Debby kindergarten', 15, 'russian', 15, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (69, 'Minnie kindergarten', 30, 'english', 21, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (70, 'Alessandro kindergarten', 25, 'english', 28, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (71, 'Hal kindergarten', 15, 'english', 10, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (72, 'Caroline kindergarten', 15, 'english', 18, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (73, 'Sal kindergarten', 20, 'russian', 31, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (74, 'Jeffery kindergarten', 30, 'english', 20, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (75, 'Vondie kindergarten', 20, 'hebrew', 38, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (76, 'Javon kindergarten', 15, 'english', 8, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (77, 'Jesus kindergarten', 15, 'english', 48, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (78, 'Bobby kindergarten', 30, 'hebrew', 39, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (79, 'Eileen kindergarten', 25, 'hebrew', 31, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (80, 'Geraldine kindergarten', 25, 'hebrew', 48, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (81, 'Jason kindergarten', 30, 'hebrew', 46, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (82, 'Ernest kindergarten', 20, 'hebrew', 32, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (83, 'Bridgette kindergarten', 20, 'english', 21, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (84, 'Jack kindergarten', 15, 'english', 6, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (85, 'Renee kindergarten', 25, 'russian', 45, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (86, 'Pat kindergarten', 20, 'russian', 37, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (87, 'Roddy kindergarten', 25, 'russian', 19, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (88, 'Davey kindergarten', 25, 'english', 27, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (89, 'Keanu kindergarten', 25, 'english', 29, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (90, 'Gord kindergarten', 20, 'english', 3, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (91, 'Christopher kindergarten', 25, 'hebrew', 45, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (92, 'Samantha kindergarten', 20, 'russian', 46, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (93, 'Milla kindergarten', 30, 'hebrew', 11, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (94, 'Terence kindergarten', 30, 'russian', 45, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (95, 'Rebeka kindergarten', 20, 'hebrew', 36, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (96, 'Pam kindergarten', 20, 'hebrew', 8, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (97, 'Andre kindergarten', 30, 'hebrew', 6, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (98, 'Josh kindergarten', 25, 'russian', 36, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (99, 'Jeffrey kindergarten', 25, 'russian', 36, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (100, 'Harold kindergarten', 25, 'russian', 4, 136);
commit;
prompt 100 records committed...
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (101, 'Taye kindergarten', 15, 'hebrew', 8, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (102, 'Vondie kindergarten', 15, 'hebrew', 32, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (103, 'Cathy kindergarten', 25, 'english', 18, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (104, 'Tori kindergarten', 30, 'hebrew', 38, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (105, 'Taye kindergarten', 15, 'english', 45, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (106, 'Jimmy kindergarten', 20, 'hebrew', 10, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (107, 'Pete kindergarten', 30, 'hebrew', 34, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (108, 'Toni kindergarten', 30, 'russian', 34, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (109, 'Stockard kindergarten', 30, 'russian', 49, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (110, 'Robbie kindergarten', 25, 'english', 29, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (111, 'Marina kindergarten', 25, 'hebrew', 23, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (112, 'Frances kindergarten', 30, 'english', 41, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (113, 'Heath kindergarten', 20, 'hebrew', 36, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (114, 'William kindergarten', 15, 'russian', 34, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (115, 'Julio kindergarten', 20, 'russian', 27, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (116, 'Murray kindergarten', 30, 'hebrew', 17, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (117, 'Anthony kindergarten', 25, 'russian', 2, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (118, 'Bobby kindergarten', 30, 'english', 32, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (119, 'Maxine kindergarten', 25, 'english', 36, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (120, 'Miriam kindergarten', 20, 'hebrew', 15, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (121, 'Colm kindergarten', 15, 'hebrew', 7, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (122, 'Nik kindergarten', 15, 'hebrew', 29, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (123, 'Trini kindergarten', 15, 'english', 42, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (124, 'Jackie kindergarten', 25, 'russian', 36, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (125, 'Danny kindergarten', 25, 'russian', 33, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (126, 'Leonardo kindergarten', 25, 'english', 46, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (127, 'Karon kindergarten', 20, 'russian', 23, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (128, 'Oliver kindergarten', 25, 'russian', 47, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (129, 'Leonardo kindergarten', 15, 'english', 12, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (130, 'Daryle kindergarten', 20, 'hebrew', 8, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (131, 'Seann kindergarten', 30, 'hebrew', 42, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (132, 'Marianne kindergarten', 25, 'english', 4, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (133, 'Nils kindergarten', 30, 'english', 24, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (134, 'Harris kindergarten', 30, 'russian', 20, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (135, 'Tori kindergarten', 20, 'hebrew', 38, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (136, 'Angela kindergarten', 30, 'english', 42, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (137, 'Will kindergarten', 25, 'hebrew', 1, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (138, 'Daryl kindergarten', 15, 'russian', 40, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (139, 'Janeane kindergarten', 15, 'english', 21, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (140, 'Andie kindergarten', 20, 'hebrew', 17, 142);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (141, 'Howie kindergarten', 20, 'russian', 11, 123);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (142, 'Kay kindergarten', 25, 'hebrew', 26, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (143, 'Tracy kindergarten', 30, 'english', 33, 135);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (144, 'Norm kindergarten', 30, 'russian', 19, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (145, 'Scott kindergarten', 20, 'russian', 15, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (146, 'Orlando kindergarten', 20, 'hebrew', 15, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (147, 'Kathleen kindergarten', 15, 'hebrew', 3, 136);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (148, 'Ron kindergarten', 15, 'english', 21, 124);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (149, 'Geggy kindergarten', 15, 'hebrew', 16, 143);
insert into KINDERGARTEN (kindergartenid, k_name, capacity, k_language, b_num, k_type_id)
values (150, 'Diamond kindergarten', 30, 'english', 20, 123);
commit;
prompt 150 records loaded
prompt Loading ACTIVITYSCHEDULE...
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('30-03-2024', 'dd-mm-yyyy'), 4, 138);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('04-06-2024', 'dd-mm-yyyy'), 14, 140);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('27-02-2024', 'dd-mm-yyyy'), 16, 102);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('04-09-2024', 'dd-mm-yyyy'), 9, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('14-04-2024', 'dd-mm-yyyy'), 5, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('27-07-2024', 'dd-mm-yyyy'), 14, 52);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('13-01-2024', 'dd-mm-yyyy'), 10, 60);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('01-09-2024', 'dd-mm-yyyy'), 15, 135);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('04-05-2024', 'dd-mm-yyyy'), 10, 22);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('30-06-2024', 'dd-mm-yyyy'), 9, 20);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('25-05-2024', 'dd-mm-yyyy'), 14, 106);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('05-05-2024', 'dd-mm-yyyy'), 2, 22);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('29-02-2024', 'dd-mm-yyyy'), 2, 126);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('12-06-2024', 'dd-mm-yyyy'), 18, 106);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('01-05-2024', 'dd-mm-yyyy'), 5, 38);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('30-06-2024', 'dd-mm-yyyy'), 5, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('15-06-2024', 'dd-mm-yyyy'), 18, 83);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('02-05-2024', 'dd-mm-yyyy'), 20, 48);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('23-01-2024', 'dd-mm-yyyy'), 20, 57);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('03-04-2024', 'dd-mm-yyyy'), 5, 138);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('14-09-2024', 'dd-mm-yyyy'), 14, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('27-01-2024', 'dd-mm-yyyy'), 14, 146);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('21-02-2024', 'dd-mm-yyyy'), 9, 54);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('10-01-2024', 'dd-mm-yyyy'), 4, 80);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('21-08-2024', 'dd-mm-yyyy'), 1, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('05-08-2024', 'dd-mm-yyyy'), 18, 111);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('23-05-2024', 'dd-mm-yyyy'), 15, 101);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('20-09-2024', 'dd-mm-yyyy'), 16, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('17-08-2024', 'dd-mm-yyyy'), 2, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('21-04-2024', 'dd-mm-yyyy'), 13, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('08-03-2024', 'dd-mm-yyyy'), 10, 29);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('27-03-2024', 'dd-mm-yyyy'), 4, 104);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('15-07-2024', 'dd-mm-yyyy'), 20, 79);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('21-04-2024', 'dd-mm-yyyy'), 20, 67);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('15-05-2024', 'dd-mm-yyyy'), 6, 93);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('14-08-2024', 'dd-mm-yyyy'), 10, 67);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('01-06-2024', 'dd-mm-yyyy'), 1, 19);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('08-01-2024', 'dd-mm-yyyy'), 1, 92);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('22-08-2024', 'dd-mm-yyyy'), 13, 43);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('16-09-2024', 'dd-mm-yyyy'), 1, 100);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('24-01-2024', 'dd-mm-yyyy'), 12, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('15-03-2024', 'dd-mm-yyyy'), 14, 39);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('02-02-2024', 'dd-mm-yyyy'), 13, 133);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('02-02-2024', 'dd-mm-yyyy'), 1, 44);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('13-08-2024', 'dd-mm-yyyy'), 15, 27);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('26-02-2024', 'dd-mm-yyyy'), 12, 73);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('25-06-2024', 'dd-mm-yyyy'), 18, 66);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('06-01-2024', 'dd-mm-yyyy'), 11, 67);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('19-02-2024', 'dd-mm-yyyy'), 5, 100);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('21-08-2024', 'dd-mm-yyyy'), 13, 23);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('19-03-2024', 'dd-mm-yyyy'), 7, 45);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('19-04-2024', 'dd-mm-yyyy'), 5, 59);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('22-01-2024', 'dd-mm-yyyy'), 7, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('23-04-2024', 'dd-mm-yyyy'), 3, 53);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('13-08-2024', 'dd-mm-yyyy'), 4, 117);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('13-07-2024', 'dd-mm-yyyy'), 17, 108);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('30-01-2024', 'dd-mm-yyyy'), 16, 1);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('10-05-2024', 'dd-mm-yyyy'), 16, 65);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('21-06-2024', 'dd-mm-yyyy'), 1, 70);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('20-01-2024', 'dd-mm-yyyy'), 16, 105);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('11-04-2024', 'dd-mm-yyyy'), 7, 87);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('15-01-2024', 'dd-mm-yyyy'), 14, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('04-01-2024', 'dd-mm-yyyy'), 1, 116);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('01-09-2024', 'dd-mm-yyyy'), 5, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('29-01-2024', 'dd-mm-yyyy'), 8, 46);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('07-01-2024', 'dd-mm-yyyy'), 19, 17);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('14-01-2024', 'dd-mm-yyyy'), 6, 8);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('15-03-2024', 'dd-mm-yyyy'), 4, 95);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('23-01-2024', 'dd-mm-yyyy'), 7, 60);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('18-08-2024', 'dd-mm-yyyy'), 8, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('20-07-2024', 'dd-mm-yyyy'), 3, 122);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('29-03-2024', 'dd-mm-yyyy'), 19, 113);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('28-05-2024', 'dd-mm-yyyy'), 16, 18);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('27-01-2024', 'dd-mm-yyyy'), 10, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('28-08-2024', 'dd-mm-yyyy'), 12, 87);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('07-03-2024', 'dd-mm-yyyy'), 4, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('16-03-2024', 'dd-mm-yyyy'), 19, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('20-03-2024', 'dd-mm-yyyy'), 5, 109);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('14-02-2024', 'dd-mm-yyyy'), 14, 86);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('09-07-2024', 'dd-mm-yyyy'), 17, 44);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('23-02-2024', 'dd-mm-yyyy'), 16, 3);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('02-06-2024', 'dd-mm-yyyy'), 14, 150);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('21-02-2024', 'dd-mm-yyyy'), 2, 10);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('10-04-2024', 'dd-mm-yyyy'), 2, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('15-04-2024', 'dd-mm-yyyy'), 10, 58);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('10-05-2024', 'dd-mm-yyyy'), 13, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('08-05-2024', 'dd-mm-yyyy'), 14, 87);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('03-01-2024', 'dd-mm-yyyy'), 1, 89);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('12-02-2024', 'dd-mm-yyyy'), 17, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('18-06-2024', 'dd-mm-yyyy'), 16, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('24-06-2024', 'dd-mm-yyyy'), 12, 55);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('21-08-2024', 'dd-mm-yyyy'), 7, 131);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('01-02-2024', 'dd-mm-yyyy'), 17, 145);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('17-08-2024', 'dd-mm-yyyy'), 18, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('11-05-2024', 'dd-mm-yyyy'), 14, 128);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('28-03-2024', 'dd-mm-yyyy'), 18, 74);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('19-04-2024', 'dd-mm-yyyy'), 19, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('06-03-2024', 'dd-mm-yyyy'), 7, 53);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('19-05-2024', 'dd-mm-yyyy'), 10, 141);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('05-02-2024', 'dd-mm-yyyy'), 3, 148);
commit;
prompt 100 records committed...
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('23-05-2024', 'dd-mm-yyyy'), 13, 101);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('05-03-2024', 'dd-mm-yyyy'), 17, 1);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('19-03-2024', 'dd-mm-yyyy'), 4, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('04-06-2024', 'dd-mm-yyyy'), 16, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('26-04-2024', 'dd-mm-yyyy'), 14, 114);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('21-04-2024', 'dd-mm-yyyy'), 4, 42);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('04-06-2024', 'dd-mm-yyyy'), 4, 40);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('25-04-2024', 'dd-mm-yyyy'), 14, 14);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('23-07-2024', 'dd-mm-yyyy'), 19, 118);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('20-08-2024', 'dd-mm-yyyy'), 7, 148);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('08-01-2024', 'dd-mm-yyyy'), 9, 93);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('13-06-2024', 'dd-mm-yyyy'), 13, 114);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('04-05-2024', 'dd-mm-yyyy'), 8, 80);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('11-03-2024', 'dd-mm-yyyy'), 6, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('18-02-2024', 'dd-mm-yyyy'), 14, 109);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('06-08-2024', 'dd-mm-yyyy'), 20, 36);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('27-02-2024', 'dd-mm-yyyy'), 8, 82);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('27-09-2024', 'dd-mm-yyyy'), 19, 22);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('10-07-2024', 'dd-mm-yyyy'), 16, 99);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('26-05-2024', 'dd-mm-yyyy'), 8, 72);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('29-02-2024', 'dd-mm-yyyy'), 19, 139);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('03-09-2024', 'dd-mm-yyyy'), 14, 8);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('08-04-2024', 'dd-mm-yyyy'), 17, 17);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('20-04-2024', 'dd-mm-yyyy'), 8, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('24-04-2024', 'dd-mm-yyyy'), 20, 39);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('02-06-2024', 'dd-mm-yyyy'), 15, 149);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('20-01-2024', 'dd-mm-yyyy'), 12, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('12-03-2024', 'dd-mm-yyyy'), 8, 12);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('19-02-2024', 'dd-mm-yyyy'), 10, 139);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('24-09-2024', 'dd-mm-yyyy'), 4, 105);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('08-04-2024', 'dd-mm-yyyy'), 7, 58);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('06-05-2024', 'dd-mm-yyyy'), 19, 116);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('02-06-2024', 'dd-mm-yyyy'), 8, 43);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('01-05-2024', 'dd-mm-yyyy'), 4, 17);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('26-08-2024', 'dd-mm-yyyy'), 12, 149);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('03-02-2024', 'dd-mm-yyyy'), 20, 83);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('19-09-2024', 'dd-mm-yyyy'), 3, 123);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('12-02-2024', 'dd-mm-yyyy'), 2, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('18-04-2024', 'dd-mm-yyyy'), 18, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('21-07-2024', 'dd-mm-yyyy'), 19, 110);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('26-03-2024', 'dd-mm-yyyy'), 14, 113);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('09-08-2024', 'dd-mm-yyyy'), 1, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('29-05-2024', 'dd-mm-yyyy'), 8, 9);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('27-03-2024', 'dd-mm-yyyy'), 15, 93);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('05-06-2024', 'dd-mm-yyyy'), 11, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('03-09-2024', 'dd-mm-yyyy'), 13, 81);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('31-07-2024', 'dd-mm-yyyy'), 13, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('11-06-2024', 'dd-mm-yyyy'), 2, 99);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('27-02-2024', 'dd-mm-yyyy'), 8, 86);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('06-08-2024', 'dd-mm-yyyy'), 6, 133);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('17-09-2024', 'dd-mm-yyyy'), 15, 82);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('13-01-2024', 'dd-mm-yyyy'), 18, 2);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('26-07-2024', 'dd-mm-yyyy'), 20, 9);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('18-08-2024', 'dd-mm-yyyy'), 10, 84);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('07-07-2024', 'dd-mm-yyyy'), 5, 12);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('09-02-2024', 'dd-mm-yyyy'), 15, 116);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('13-01-2024', 'dd-mm-yyyy'), 9, 48);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('13-05-2024', 'dd-mm-yyyy'), 14, 105);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('11-06-2024', 'dd-mm-yyyy'), 12, 35);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('26-02-2024', 'dd-mm-yyyy'), 1, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('14-06-2024', 'dd-mm-yyyy'), 10, 101);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('03-07-2024', 'dd-mm-yyyy'), 16, 37);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('22-08-2024', 'dd-mm-yyyy'), 5, 20);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('13-01-2024', 'dd-mm-yyyy'), 3, 133);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('05-07-2024', 'dd-mm-yyyy'), 14, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('08-01-2024', 'dd-mm-yyyy'), 7, 24);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('27-08-2024', 'dd-mm-yyyy'), 15, 9);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('29-01-2024', 'dd-mm-yyyy'), 3, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('23-07-2024', 'dd-mm-yyyy'), 5, 145);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('26-04-2024', 'dd-mm-yyyy'), 3, 124);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('21-07-2024', 'dd-mm-yyyy'), 16, 78);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('06-09-2024', 'dd-mm-yyyy'), 17, 140);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('06-04-2024', 'dd-mm-yyyy'), 9, 23);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('27-02-2024', 'dd-mm-yyyy'), 7, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('30-08-2024', 'dd-mm-yyyy'), 5, 128);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('05-01-2024', 'dd-mm-yyyy'), 8, 90);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('05-09-2024', 'dd-mm-yyyy'), 19, 66);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('11-03-2024', 'dd-mm-yyyy'), 9, 150);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('07-06-2024', 'dd-mm-yyyy'), 10, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('07-09-2024', 'dd-mm-yyyy'), 13, 67);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('07-04-2024', 'dd-mm-yyyy'), 5, 51);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('18-06-2024', 'dd-mm-yyyy'), 17, 18);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('07-06-2024', 'dd-mm-yyyy'), 20, 2);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('17-07-2024', 'dd-mm-yyyy'), 17, 122);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('25-05-2024', 'dd-mm-yyyy'), 4, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('26-01-2024', 'dd-mm-yyyy'), 15, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('24-01-2024', 'dd-mm-yyyy'), 6, 42);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('24-03-2024', 'dd-mm-yyyy'), 3, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('13-05-2024', 'dd-mm-yyyy'), 17, 149);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('14-08-2024', 'dd-mm-yyyy'), 3, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('05-09-2024', 'dd-mm-yyyy'), 8, 146);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('01-04-2024', 'dd-mm-yyyy'), 1, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('04-06-2024', 'dd-mm-yyyy'), 7, 22);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('02-06-2024', 'dd-mm-yyyy'), 6, 124);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('04-09-2024', 'dd-mm-yyyy'), 17, 89);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('14-08-2024', 'dd-mm-yyyy'), 16, 41);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('26-04-2024', 'dd-mm-yyyy'), 10, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('20-01-2024', 'dd-mm-yyyy'), 1, 14);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('29-04-2024', 'dd-mm-yyyy'), 16, 74);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('23-01-2024', 'dd-mm-yyyy'), 8, 18);
commit;
prompt 200 records committed...
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('09-09-2024', 'dd-mm-yyyy'), 12, 1);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('05-02-2024', 'dd-mm-yyyy'), 19, 2);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('15-06-2024', 'dd-mm-yyyy'), 12, 84);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('23-04-2024', 'dd-mm-yyyy'), 20, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('16-09-2024', 'dd-mm-yyyy'), 20, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('30-03-2024', 'dd-mm-yyyy'), 19, 83);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('24-07-2024', 'dd-mm-yyyy'), 10, 148);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('16-01-2024', 'dd-mm-yyyy'), 6, 40);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('01-04-2024', 'dd-mm-yyyy'), 17, 103);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('05-09-2024', 'dd-mm-yyyy'), 5, 137);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('24-02-2024', 'dd-mm-yyyy'), 5, 108);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('30-08-2024', 'dd-mm-yyyy'), 14, 17);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('07-01-2024', 'dd-mm-yyyy'), 12, 37);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('02-01-2024', 'dd-mm-yyyy'), 2, 51);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('26-05-2024', 'dd-mm-yyyy'), 9, 73);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('09-05-2024', 'dd-mm-yyyy'), 16, 61);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('20-04-2024', 'dd-mm-yyyy'), 18, 113);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('06-09-2024', 'dd-mm-yyyy'), 1, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('12-06-2024', 'dd-mm-yyyy'), 7, 65);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('14-08-2024', 'dd-mm-yyyy'), 20, 72);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('15-01-2024', 'dd-mm-yyyy'), 2, 118);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('20-03-2024', 'dd-mm-yyyy'), 3, 46);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('07-07-2024', 'dd-mm-yyyy'), 12, 7);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('21-06-2024', 'dd-mm-yyyy'), 1, 107);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('20-08-2024', 'dd-mm-yyyy'), 6, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('23-05-2024', 'dd-mm-yyyy'), 6, 77);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('31-05-2024', 'dd-mm-yyyy'), 5, 2);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('27-06-2024', 'dd-mm-yyyy'), 3, 42);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('08-06-2024', 'dd-mm-yyyy'), 17, 136);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('07-05-2024', 'dd-mm-yyyy'), 9, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('01-09-2024', 'dd-mm-yyyy'), 15, 123);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('11-03-2024', 'dd-mm-yyyy'), 15, 83);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('08-08-2024', 'dd-mm-yyyy'), 10, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('20-01-2024', 'dd-mm-yyyy'), 4, 13);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('11-01-2024', 'dd-mm-yyyy'), 1, 141);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('19-01-2024', 'dd-mm-yyyy'), 8, 125);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('24-08-2024', 'dd-mm-yyyy'), 19, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('25-03-2024', 'dd-mm-yyyy'), 8, 89);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('20-04-2024', 'dd-mm-yyyy'), 13, 19);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('02-08-2024', 'dd-mm-yyyy'), 9, 32);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('19-07-2024', 'dd-mm-yyyy'), 12, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('18-02-2024', 'dd-mm-yyyy'), 19, 14);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('21-03-2024', 'dd-mm-yyyy'), 17, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('02-01-2024', 'dd-mm-yyyy'), 18, 27);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('17-07-2024', 'dd-mm-yyyy'), 6, 5);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('23-09-2024', 'dd-mm-yyyy'), 7, 77);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('25-05-2024', 'dd-mm-yyyy'), 18, 54);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('13-06-2024', 'dd-mm-yyyy'), 9, 102);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('25-03-2024', 'dd-mm-yyyy'), 1, 128);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('31-03-2024', 'dd-mm-yyyy'), 13, 24);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('03-07-2024', 'dd-mm-yyyy'), 4, 126);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('03-06-2024', 'dd-mm-yyyy'), 11, 135);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('26-01-2024', 'dd-mm-yyyy'), 5, 19);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('18-02-2024', 'dd-mm-yyyy'), 13, 142);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('16-04-2024', 'dd-mm-yyyy'), 10, 127);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('22-05-2024', 'dd-mm-yyyy'), 18, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('26-02-2024', 'dd-mm-yyyy'), 12, 44);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('08-09-2024', 'dd-mm-yyyy'), 9, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('08-06-2024', 'dd-mm-yyyy'), 16, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('06-05-2024', 'dd-mm-yyyy'), 3, 126);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('17-07-2024', 'dd-mm-yyyy'), 9, 136);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('24-05-2024', 'dd-mm-yyyy'), 13, 105);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('27-05-2024', 'dd-mm-yyyy'), 13, 60);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('05-04-2024', 'dd-mm-yyyy'), 7, 121);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('17-06-2024', 'dd-mm-yyyy'), 2, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('19-08-2024', 'dd-mm-yyyy'), 6, 80);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('19-02-2024', 'dd-mm-yyyy'), 2, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('25-06-2024', 'dd-mm-yyyy'), 12, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('12-01-2024', 'dd-mm-yyyy'), 13, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('23-07-2024', 'dd-mm-yyyy'), 1, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('11-01-2024', 'dd-mm-yyyy'), 4, 54);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('19-07-2024', 'dd-mm-yyyy'), 14, 19);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('06-05-2024', 'dd-mm-yyyy'), 15, 65);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('28-01-2024', 'dd-mm-yyyy'), 16, 149);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('14-05-2024', 'dd-mm-yyyy'), 3, 104);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('16-08-2024', 'dd-mm-yyyy'), 1, 60);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('21-05-2024', 'dd-mm-yyyy'), 16, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('06-07-2024', 'dd-mm-yyyy'), 10, 125);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('24-09-2024', 'dd-mm-yyyy'), 8, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('25-08-2024', 'dd-mm-yyyy'), 11, 21);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('13-02-2024', 'dd-mm-yyyy'), 17, 70);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('29-03-2024', 'dd-mm-yyyy'), 10, 109);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('25-03-2024', 'dd-mm-yyyy'), 17, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('15-08-2024', 'dd-mm-yyyy'), 10, 132);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('20-08-2024', 'dd-mm-yyyy'), 18, 102);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('15-07-2024', 'dd-mm-yyyy'), 19, 79);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('17-05-2024', 'dd-mm-yyyy'), 1, 104);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('12-04-2024', 'dd-mm-yyyy'), 11, 78);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('23-05-2024', 'dd-mm-yyyy'), 4, 49);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('05-05-2024', 'dd-mm-yyyy'), 15, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('30-01-2024', 'dd-mm-yyyy'), 12, 64);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('10-03-2024', 'dd-mm-yyyy'), 18, 90);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('12-05-2024', 'dd-mm-yyyy'), 7, 15);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('26-02-2024', 'dd-mm-yyyy'), 19, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('21-02-2024', 'dd-mm-yyyy'), 12, 80);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('07-09-2024', 'dd-mm-yyyy'), 18, 133);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('09-02-2024', 'dd-mm-yyyy'), 16, 128);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('16-06-2024', 'dd-mm-yyyy'), 14, 74);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('08-02-2024', 'dd-mm-yyyy'), 10, 122);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('02-05-2024', 'dd-mm-yyyy'), 6, 1);
commit;
prompt 300 records committed...
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('25-03-2024', 'dd-mm-yyyy'), 6, 150);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('25-07-2024', 'dd-mm-yyyy'), 3, 3);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('15-06-2024', 'dd-mm-yyyy'), 5, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('23-08-2024', 'dd-mm-yyyy'), 18, 57);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('18-06-2024', 'dd-mm-yyyy'), 11, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('10-09-2024', 'dd-mm-yyyy'), 12, 107);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('26-08-2024', 'dd-mm-yyyy'), 19, 46);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('06-07-2024', 'dd-mm-yyyy'), 1, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('26-04-2024', 'dd-mm-yyyy'), 17, 71);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('04-03-2024', 'dd-mm-yyyy'), 17, 27);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('06-05-2024', 'dd-mm-yyyy'), 10, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('29-05-2024', 'dd-mm-yyyy'), 4, 4);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('07-06-2024', 'dd-mm-yyyy'), 8, 22);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('19-08-2024', 'dd-mm-yyyy'), 13, 62);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('05-08-2024', 'dd-mm-yyyy'), 20, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('12-05-2024', 'dd-mm-yyyy'), 5, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('08-09-2024', 'dd-mm-yyyy'), 9, 146);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('15-06-2024', 'dd-mm-yyyy'), 7, 96);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('17-08-2024', 'dd-mm-yyyy'), 6, 102);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('04-01-2024', 'dd-mm-yyyy'), 8, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('12-05-2024', 'dd-mm-yyyy'), 15, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('31-05-2024', 'dd-mm-yyyy'), 6, 92);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('20-03-2024', 'dd-mm-yyyy'), 14, 116);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('11-02-2024', 'dd-mm-yyyy'), 8, 39);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('07-07-2024', 'dd-mm-yyyy'), 1, 109);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('03-08-2024', 'dd-mm-yyyy'), 18, 45);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('10-07-2024', 'dd-mm-yyyy'), 1, 30);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('09-03-2024', 'dd-mm-yyyy'), 1, 21);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('23-03-2024', 'dd-mm-yyyy'), 7, 35);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('24-04-2024', 'dd-mm-yyyy'), 13, 48);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('02-02-2024', 'dd-mm-yyyy'), 17, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('24-03-2024', 'dd-mm-yyyy'), 15, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('09-09-2024', 'dd-mm-yyyy'), 5, 91);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('24-07-2024', 'dd-mm-yyyy'), 15, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('12-02-2024', 'dd-mm-yyyy'), 19, 96);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('13-05-2024', 'dd-mm-yyyy'), 16, 144);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('07-06-2024', 'dd-mm-yyyy'), 2, 92);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('10-05-2024', 'dd-mm-yyyy'), 7, 128);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('26-06-2024', 'dd-mm-yyyy'), 17, 73);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:00', to_date('17-07-2024', 'dd-mm-yyyy'), 3, 41);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('02-08-2024', 'dd-mm-yyyy'), 3, 146);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('14-08-2024', 'dd-mm-yyyy'), 14, 67);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('02-04-2024', 'dd-mm-yyyy'), 1, 111);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('28-05-2024', 'dd-mm-yyyy'), 17, 49);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('29-02-2024', 'dd-mm-yyyy'), 20, 68);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('25-04-2024', 'dd-mm-yyyy'), 6, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('22-08-2024', 'dd-mm-yyyy'), 15, 73);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('02-06-2024', 'dd-mm-yyyy'), 18, 75);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('16-05-2024', 'dd-mm-yyyy'), 9, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('30-01-2024', 'dd-mm-yyyy'), 4, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('27-01-2024', 'dd-mm-yyyy'), 16, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('30-05-2024', 'dd-mm-yyyy'), 11, 3);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('14-04-2024', 'dd-mm-yyyy'), 12, 46);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('18-04-2024', 'dd-mm-yyyy'), 7, 129);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('24-03-2024', 'dd-mm-yyyy'), 20, 28);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('24-03-2024', 'dd-mm-yyyy'), 16, 7);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:30', to_date('21-03-2024', 'dd-mm-yyyy'), 19, 130);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('12-06-2024', 'dd-mm-yyyy'), 6, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('23-06-2024', 'dd-mm-yyyy'), 11, 125);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('10-02-2024', 'dd-mm-yyyy'), 17, 43);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('17-01-2024', 'dd-mm-yyyy'), 15, 142);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('17-05-2024', 'dd-mm-yyyy'), 5, 132);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('01-05-2024', 'dd-mm-yyyy'), 9, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('28-05-2024', 'dd-mm-yyyy'), 19, 59);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('26-06-2024', 'dd-mm-yyyy'), 9, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('21-05-2024', 'dd-mm-yyyy'), 13, 136);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('25-08-2024', 'dd-mm-yyyy'), 6, 68);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('18-02-2024', 'dd-mm-yyyy'), 9, 61);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('10-01-2024', 'dd-mm-yyyy'), 11, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('25-03-2024', 'dd-mm-yyyy'), 7, 76);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('24-09-2024', 'dd-mm-yyyy'), 13, 112);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('11-08-2024', 'dd-mm-yyyy'), 12, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('25-03-2024', 'dd-mm-yyyy'), 4, 101);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('21-04-2024', 'dd-mm-yyyy'), 17, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('26-02-2024', 'dd-mm-yyyy'), 14, 46);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('28-05-2024', 'dd-mm-yyyy'), 8, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('22-02-2024', 'dd-mm-yyyy'), 8, 68);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('02-05-2024', 'dd-mm-yyyy'), 9, 99);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('23-09-2024', 'dd-mm-yyyy'), 17, 39);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('06-07-2024', 'dd-mm-yyyy'), 19, 148);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('08-08-2024', 'dd-mm-yyyy'), 10, 43);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('22-08-2024', 'dd-mm-yyyy'), 10, 100);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('12-08-2024', 'dd-mm-yyyy'), 19, 47);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('28-01-2024', 'dd-mm-yyyy'), 4, 52);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('05-08-2024', 'dd-mm-yyyy'), 7, 57);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('19-09-2024', 'dd-mm-yyyy'), 6, 97);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('22-07-2024', 'dd-mm-yyyy'), 5, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('09-07-2024', 'dd-mm-yyyy'), 7, 55);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('22-02-2024', 'dd-mm-yyyy'), 4, 11);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('28-02-2024', 'dd-mm-yyyy'), 14, 88);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('08-07-2024', 'dd-mm-yyyy'), 18, 99);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('05-05-2024', 'dd-mm-yyyy'), 6, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('17-06-2024', 'dd-mm-yyyy'), 13, 107);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('12-01-2024', 'dd-mm-yyyy'), 2, 31);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('27-06-2024', 'dd-mm-yyyy'), 15, 148);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('11-01-2024', 'dd-mm-yyyy'), 2, 136);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('03-02-2024', 'dd-mm-yyyy'), 18, 96);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('23-02-2024', 'dd-mm-yyyy'), 4, 90);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('16-02-2024', 'dd-mm-yyyy'), 11, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('16-04-2024', 'dd-mm-yyyy'), 20, 15);
commit;
prompt 400 records committed...
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('24-03-2024', 'dd-mm-yyyy'), 14, 93);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('11-05-2024', 'dd-mm-yyyy'), 18, 34);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('22-03-2024', 'dd-mm-yyyy'), 6, 132);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('06-08-2024', 'dd-mm-yyyy'), 3, 17);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('20-04-2024', 'dd-mm-yyyy'), 12, 59);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('20-06-2024', 'dd-mm-yyyy'), 17, 97);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('11-07-2024', 'dd-mm-yyyy'), 12, 33);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:00', to_date('05-08-2024', 'dd-mm-yyyy'), 8, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('05-06-2024', 'dd-mm-yyyy'), 19, 127);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('26-02-2024', 'dd-mm-yyyy'), 13, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('12-05-2024', 'dd-mm-yyyy'), 10, 77);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('13-09-2024', 'dd-mm-yyyy'), 17, 117);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('04-01-2024', 'dd-mm-yyyy'), 11, 137);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('06-03-2024', 'dd-mm-yyyy'), 19, 69);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('24-06-2024', 'dd-mm-yyyy'), 11, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('27-07-2024', 'dd-mm-yyyy'), 19, 15);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('14-06-2024', 'dd-mm-yyyy'), 3, 33);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('11-09-2024', 'dd-mm-yyyy'), 9, 78);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('18-05-2024', 'dd-mm-yyyy'), 10, 104);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:15', to_date('28-07-2024', 'dd-mm-yyyy'), 1, 15);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('26-04-2024', 'dd-mm-yyyy'), 11, 32);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('28-05-2024', 'dd-mm-yyyy'), 2, 58);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('02-08-2024', 'dd-mm-yyyy'), 20, 87);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('26-03-2024', 'dd-mm-yyyy'), 12, 139);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:15', to_date('29-01-2024', 'dd-mm-yyyy'), 8, 74);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('03-04-2024', 'dd-mm-yyyy'), 1, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('12-01-2024', 'dd-mm-yyyy'), 20, 94);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:15', to_date('08-02-2024', 'dd-mm-yyyy'), 19, 7);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('21-04-2024', 'dd-mm-yyyy'), 16, 24);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('24-05-2024', 'dd-mm-yyyy'), 1, 101);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('25-08-2024', 'dd-mm-yyyy'), 16, 124);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('23-05-2024', 'dd-mm-yyyy'), 1, 9);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:00', to_date('23-02-2024', 'dd-mm-yyyy'), 6, 63);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('17-04-2024', 'dd-mm-yyyy'), 6, 104);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('03-05-2024', 'dd-mm-yyyy'), 3, 106);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:00', to_date('25-05-2024', 'dd-mm-yyyy'), 2, 78);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('21-03-2024', 'dd-mm-yyyy'), 20, 120);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('02-08-2024', 'dd-mm-yyyy'), 20, 80);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('03-08-2024', 'dd-mm-yyyy'), 2, 88);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('16-04-2024', 'dd-mm-yyyy'), 13, 26);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('13-05-2024', 'dd-mm-yyyy'), 9, 13);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:45', to_date('03-02-2024', 'dd-mm-yyyy'), 17, 24);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('13-05-2024', 'dd-mm-yyyy'), 11, 134);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:45', to_date('09-05-2024', 'dd-mm-yyyy'), 7, 78);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('30-07-2024', 'dd-mm-yyyy'), 19, 136);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('03-03-2024', 'dd-mm-yyyy'), 17, 69);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:15', to_date('18-07-2024', 'dd-mm-yyyy'), 2, 113);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('27-08-2024', 'dd-mm-yyyy'), 18, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:00', to_date('11-06-2024', 'dd-mm-yyyy'), 6, 13);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('02-03-2024', 'dd-mm-yyyy'), 15, 61);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('08-03-2024', 'dd-mm-yyyy'), 16, 45);
commit;
prompt 451 records loaded
prompt Loading CHILD...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (1, 'Harper', 'Miller', to_date('04-10-2022', 'dd-mm-yyyy'), 'Gluten', 'Madeline Miller', 588847873, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (2, 'Lila', 'Clark', to_date('15-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Nora Clark', 574842398, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (3, 'Madison', 'Ramirez', to_date('06-12-2018', 'dd-mm-yyyy'), 'Peanuts', 'John Ramirez', 517582087, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (4, 'Dylan', 'Johnson', to_date('06-12-2023', 'dd-mm-yyyy'), 'Gluten', 'David Johnson', 534016128, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (5, 'Jack', 'Thomas', to_date('24-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Aurora Thomas', 532572143, null, 37);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (6, 'Gregory', 'Rogers', to_date('03-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Amelia Rogers', 587717904, null, 88);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (7, 'Aubree', 'Robinson', to_date('19-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Aaliyah Robinson', 592101363, null, 65);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (8, 'Juan', 'Evans', to_date('25-03-2021', 'dd-mm-yyyy'), null, 'Kinsley Evans', 520604331, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (9, 'Leilani', 'Miller', to_date('20-11-2020', 'dd-mm-yyyy'), null, 'Piper Miller', 551767273, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (10, 'Cameron', 'Diaz', to_date('11-05-2020', 'dd-mm-yyyy'), 'Dairy', 'Maya Diaz', 566202456, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (11, 'Rosalie', 'Garcia', to_date('05-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Gabriel Garcia', 540570590, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (12, 'Sloane', 'Nguyen', to_date('06-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Lucy Nguyen', 545214792, null, 20);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (13, 'Brianna', 'Miller', to_date('21-10-2021', 'dd-mm-yyyy'), null, 'Elena Miller', 596031271, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (14, 'Leonardo', 'Campbell', to_date('29-12-2020', 'dd-mm-yyyy'), null, 'Charlotte Campbell', 531389515, null, 36);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (15, 'Ava', 'Wilson', to_date('03-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Juan Wilson', 545262964, null, 88);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (16, 'Eva', 'Clark', to_date('26-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Dustin Clark', 524562705, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (17, 'Ezekiel', 'Carter', to_date('27-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Juan Carter', 585414418, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (18, 'Autumn', 'Walker', to_date('17-04-2018', 'dd-mm-yyyy'), null, 'Adalyn Walker', 537264958, null, 69);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (19, 'Olivia', 'Johnson', to_date('25-03-2022', 'dd-mm-yyyy'), null, 'Felipe Johnson', 536018837, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (20, 'Alexandra', 'Thompson', to_date('07-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Douglas Thompson', 594226641, null, 130);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (21, 'Daniel', 'Walker', to_date('29-09-2018', 'dd-mm-yyyy'), null, 'Gregory Walker', 539049290, null, 1);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (22, 'Lucy', 'Rodriguez', to_date('03-04-2023', 'dd-mm-yyyy'), null, 'Allison Rodriguez', 569980433, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (23, 'Luna', 'Hernandez', to_date('07-05-2022', 'dd-mm-yyyy'), 'Dairy', 'Callie Hernandez', 529556355, null, 79);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (24, 'Amelia', 'Carter', to_date('17-08-2023', 'dd-mm-yyyy'), null, 'Nathan Carter', 565330607, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (25, 'Serenity', 'Robinson', to_date('25-12-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madilyn Robinson', 561405746, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (26, 'Naomi', 'Clark', to_date('14-05-2018', 'dd-mm-yyyy'), null, 'Cora Clark', 565628708, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (27, 'Mia', 'Nelson', to_date('30-11-2021', 'dd-mm-yyyy'), 'Peanuts', 'Daisy Nelson', 546208389, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (28, 'Rylee', 'Scott', to_date('01-09-2023', 'dd-mm-yyyy'), null, 'Emma Scott', 584067767, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (29, 'Andrea', 'Anderson', to_date('13-02-2018', 'dd-mm-yyyy'), null, 'Nora Anderson', 513023771, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (30, 'Jack', 'Scott', to_date('22-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Joan Scott', 512708817, null, 32);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (31, 'Leilani', 'Rogers', to_date('07-12-2019', 'dd-mm-yyyy'), 'Dairy', 'Dustin Rogers', 510690950, null, 69);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (32, 'Alexis', 'Cruz', to_date('03-08-2020', 'dd-mm-yyyy'), null, 'Adeline Cruz', 590769216, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (33, 'Nora', 'Nguyen', to_date('26-03-2023', 'dd-mm-yyyy'), null, 'Isabelle Nguyen', 540231576, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (34, 'Avery', 'Rodriguez', to_date('23-06-2021', 'dd-mm-yyyy'), null, 'Samantha Rodriguez', 560032805, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (35, 'Antonio', 'Clark', to_date('06-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Vivienne Clark', 560907331, null, 97);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (36, 'Jordan', 'Campbell', to_date('15-01-2021', 'dd-mm-yyyy'), null, 'Callie Campbell', 543464520, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (37, 'Samantha', 'Allen', to_date('22-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Andrea Allen', 598205958, null, 137);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (38, 'Brian', 'Carter', to_date('21-04-2021', 'dd-mm-yyyy'), 'Dairy', 'Peyton Carter', 549650000, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (39, 'Harper', 'Hall', to_date('22-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Paisley Hall', 598347962, null, 10);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (40, 'Nathan', 'Harris', to_date('07-11-2023', 'dd-mm-yyyy'), 'Peanuts', 'Teagan Harris', 548123208, null, 117);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (41, 'Henry', 'Allen', to_date('12-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Gracie Allen', 512571173, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (42, 'Keira', 'Kim', to_date('28-06-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Kim', 533854435, null, 32);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (43, 'Juan', 'Scott', to_date('21-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Addison Scott', 562529742, null, 53);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (44, 'Emery', 'Wright', to_date('30-03-2018', 'dd-mm-yyyy'), 'Gluten', 'Andrew Wright', 513899954, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (45, 'Joshua', 'Hall', to_date('02-08-2019', 'dd-mm-yyyy'), 'Gluten', 'Molly Hall', 560859403, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (46, 'Jayden', 'Anderson', to_date('16-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Anderson', 599558177, null, 84);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (47, 'Isabelle', 'Moore', to_date('01-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Jack Moore', 537224781, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (48, 'Aurora', 'Walker', to_date('11-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Sadie Walker', 586474668, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (49, 'Adeline', 'Kim', to_date('11-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Kim', 564328212, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (50, 'Adalyn', 'Brown', to_date('15-06-2020', 'dd-mm-yyyy'), 'Dairy', 'Adeline Brown', 552273227, null, 24);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (51, 'Melanie', 'Thomas', to_date('23-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Natalie Thomas', 577515662, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (52, 'Isabelle', 'Mitchell', to_date('24-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Dylan Mitchell', 565490836, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (53, 'Alexis', 'Miller', to_date('06-11-2023', 'dd-mm-yyyy'), null, 'Piper Miller', 590171539, null, 36);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (54, 'Vivienne', 'Hernandez', to_date('15-03-2023', 'dd-mm-yyyy'), null, 'Lydia Hernandez', 529003172, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (55, 'Riley', 'Allen', to_date('20-04-2023', 'dd-mm-yyyy'), 'Peanuts', 'Aria Allen', 555764266, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (56, 'Mackenzie', 'Hernandez', to_date('18-02-2022', 'dd-mm-yyyy'), null, 'Antonio Hernandez', 584316069, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (57, 'Luke', 'Clark', to_date('04-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Clark', 574352333, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (58, 'Juliet', 'Garcia', to_date('05-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Christopher Garcia', 549520620, null, 130);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (59, 'Amelia', 'Wright', to_date('15-04-2021', 'dd-mm-yyyy'), 'Peanuts', 'Maya Wright', 560491684, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (60, 'Molly', 'Adams', to_date('17-07-2020', 'dd-mm-yyyy'), 'Gluten', 'Chloe Adams', 524885320, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (61, 'Alice', 'Robinson', to_date('26-04-2022', 'dd-mm-yyyy'), null, 'Ivy Robinson', 562515890, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (62, 'Teagan', 'Allen', to_date('26-04-2018', 'dd-mm-yyyy'), 'Gluten', 'Aaliyah Allen', 518300471, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (63, 'Eliana', 'Clark', to_date('18-09-2019', 'dd-mm-yyyy'), 'Dairy', 'Lillian Clark', 540737888, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (64, 'Ivy', 'Moore', to_date('14-03-2023', 'dd-mm-yyyy'), null, 'Isaiah Moore', 565196838, null, 95);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (65, 'Ruby', 'Walker', to_date('13-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Derek Walker', 558605350, null, 77);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (66, 'Claire', 'Robinson', to_date('28-02-2019', 'dd-mm-yyyy'), null, 'Juan Robinson', 553821900, null, 85);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (67, 'Addison', 'Garcia', to_date('29-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Lucy Garcia', 555337890, null, 42);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (68, 'Amelia', 'Adams', to_date('17-10-2019', 'dd-mm-yyyy'), 'Dairy', 'Jayden Adams', 561829258, null, 10);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (69, 'Luke', 'Thomas', to_date('01-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Allison Thomas', 592711488, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (70, 'Diego', 'Wilson', to_date('10-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Joshua Wilson', 520971921, null, 80);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (71, 'Austin', 'Scott', to_date('10-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Riley Scott', 517315934, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (72, 'Abraham', 'Thompson', to_date('13-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Alaina Thompson', 516638606, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (73, 'Adalyn', 'Phillips', to_date('06-01-2023', 'dd-mm-yyyy'), null, 'Gabriel Phillips', 536133010, null, 69);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (74, 'Scarlett', 'Young', to_date('08-04-2020', 'dd-mm-yyyy'), null, 'Hazel Young', 588523956, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (75, 'Gabriel', 'Scott', to_date('17-05-2020', 'dd-mm-yyyy'), null, 'Natalia Scott', 557488948, null, 119);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (76, 'Allison', 'Jones', to_date('08-06-2021', 'dd-mm-yyyy'), 'Gluten', 'Emery Jones', 567655148, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (77, 'Ava', 'Rodriguez', to_date('02-06-2022', 'dd-mm-yyyy'), null, 'Mia Rodriguez', 562033122, null, 90);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (78, 'Henry', 'Clark', to_date('03-10-2018', 'dd-mm-yyyy'), 'Dairy', 'Harper Clark', 590485288, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (79, 'Javier', 'Young', to_date('03-09-2022', 'dd-mm-yyyy'), null, 'Alice Young', 534656300, null, 97);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (80, 'Lawrence', 'Rogers', to_date('07-05-2019', 'dd-mm-yyyy'), null, 'Eliana Rogers', 527334370, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (81, 'Evelyn', 'Clark', to_date('09-08-2018', 'dd-mm-yyyy'), null, 'Leonardo Clark', 553870768, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (82, 'Ariana', 'Scott', to_date('23-03-2022', 'dd-mm-yyyy'), 'Peanuts', 'Edward Scott', 517985037, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (83, 'Aurora', 'Taylor', to_date('25-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Serenity Taylor', 586920851, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (84, 'Joshua', 'Wilson', to_date('19-03-2023', 'dd-mm-yyyy'), 'Gluten', 'Eliza Wilson', 527869846, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (85, 'Olivia', 'Hernandez', to_date('30-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Charlotte Hernandez', 529146047, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (86, 'Josephine', 'Nelson', to_date('11-01-2019', 'dd-mm-yyyy'), null, 'Penelope Nelson', 594548438, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (87, 'Rose', 'Hernandez', to_date('18-04-2022', 'dd-mm-yyyy'), 'Dairy', 'Isabella Hernandez', 557636365, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (88, 'Cora', 'Walker', to_date('12-12-2021', 'dd-mm-yyyy'), null, 'Dennis Walker', 582480874, null, 75);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (89, 'Diego', 'Rogers', to_date('23-08-2021', 'dd-mm-yyyy'), null, 'Madison Rogers', 578274445, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (90, 'Harper', 'Harris', to_date('12-11-2022', 'dd-mm-yyyy'), null, 'Kevin Harris', 592280631, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (91, 'Kaitlyn', 'Hernandez', to_date('11-06-2023', 'dd-mm-yyyy'), null, 'Clara Hernandez', 599957387, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (92, 'Luna', 'Miller', to_date('19-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Alexis Miller', 547501127, null, 84);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (93, 'Leonardo', 'Hernandez', to_date('24-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Hernandez', 590995731, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (94, 'Aurora', 'Allen', to_date('03-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Jacob Allen', 523992563, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (95, 'Eric', 'Walker', to_date('03-07-2019', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Walker', 591846409, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (96, 'Lucy', 'Smith', to_date('07-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Smith', 567261881, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (97, 'Adalyn', 'Garcia', to_date('10-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Jade Garcia', 520489344, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (98, 'Lillian', 'Hernandez', to_date('12-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Austin Hernandez', 582262945, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (99, 'Kyle', 'Hernandez', to_date('24-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Brian Hernandez', 586344651, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (100, 'Daisy', 'Rogers', to_date('29-10-2020', 'dd-mm-yyyy'), 'Peanuts', 'Sarah Rogers', 511357835, null, 92);
commit;
prompt 100 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (101, 'Dustin', 'Lewis', to_date('02-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Lucas Lewis', 542052286, null, 28);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (102, 'Leilani', 'Davis', to_date('05-10-2019', 'dd-mm-yyyy'), null, 'Anthony Davis', 596566574, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (103, 'Amaya', 'Sanchez', to_date('13-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Teagan Sanchez', 539091978, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (104, 'Caroline', 'Lee', to_date('01-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Alice Lee', 566988890, null, 92);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (105, 'Callie', 'Nelson', to_date('17-12-2019', 'dd-mm-yyyy'), null, 'Adeline Nelson', 590632990, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (106, 'Lila', 'Lopez', to_date('17-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Elena Lopez', 584024462, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (107, 'Nicole', 'Hernandez', to_date('28-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Eloise Hernandez', 574392735, null, 76);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (108, 'Zoey', 'Rogers', to_date('20-01-2018', 'dd-mm-yyyy'), 'Peanuts', 'Lila Rogers', 566413855, null, 12);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (109, 'Zoey', 'Jones', to_date('19-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Brooklyn Jones', 544078891, null, 46);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (110, 'Grace', 'Moore', to_date('21-01-2022', 'dd-mm-yyyy'), null, 'Felipe Moore', 559722260, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (111, 'Carlos', 'Adams', to_date('13-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Maya Adams', 515893255, null, 60);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (112, 'Eloise', 'Davis', to_date('18-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Eva Davis', 515084382, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (113, 'Chloe', 'Anderson', to_date('01-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Lillian Anderson', 535973306, null, 90);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (114, 'Jayden', 'Walker', to_date('31-03-2023', 'dd-mm-yyyy'), null, 'Cora Walker', 590404617, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (115, 'Vivian', 'Rogers', to_date('17-06-2018', 'dd-mm-yyyy'), 'Dairy', 'Taylor Rogers', 590337353, null, 70);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (116, 'Ellie', 'Scott', to_date('22-07-2022', 'dd-mm-yyyy'), null, 'Grace Scott', 534261828, null, 11);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (117, 'Keira', 'Jones', to_date('21-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Clara Jones', 592709469, null, 76);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (118, 'Jayden', 'Young', to_date('02-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Clara Young', 538885685, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (119, 'Skylar', 'Moore', to_date('08-02-2020', 'dd-mm-yyyy'), 'Dairy', 'Joseph Moore', 582716826, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (120, 'John', 'Johnson', to_date('09-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Henry Johnson', 518122540, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (121, 'Samantha', 'Miller', to_date('26-03-2021', 'dd-mm-yyyy'), 'Gluten', 'Kaitlyn Miller', 555740243, null, 76);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (122, 'Vivian', 'Nelson', to_date('15-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Ezekiel Nelson', 575527737, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (123, 'Autumn', 'Cruz', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Isaac Cruz', 517823424, null, 93);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (124, 'Serenity', 'Green', to_date('12-03-2021', 'dd-mm-yyyy'), null, 'Paisley Green', 562651693, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (125, 'Delilah', 'Young', to_date('06-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Everly Young', 547664211, null, 86);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (126, 'Sadie', 'Rogers', to_date('18-04-2020', 'dd-mm-yyyy'), null, 'Ivy Rogers', 582144323, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (127, 'Everly', 'Garcia', to_date('02-09-2019', 'dd-mm-yyyy'), 'Dairy', 'Justin Garcia', 561409207, null, 20);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (128, 'Juliet', 'Allen', to_date('24-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Justin Allen', 574966456, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (129, 'Luna', 'Wright', to_date('05-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Keira Wright', 577263236, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (130, 'Valentina', 'Watson', to_date('24-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Abigail Watson', 532191280, null, 74);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (131, 'Madeline', 'Davis', to_date('25-02-2018', 'dd-mm-yyyy'), null, 'Eric Davis', 510383295, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (132, 'Jacob', 'Diaz', to_date('11-06-2019', 'dd-mm-yyyy'), null, 'Mackenzie Diaz', 557010880, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (133, 'Valentina', 'Watson', to_date('03-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Ella Watson', 579648817, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (134, 'Ava', 'Lopez', to_date('26-04-2022', 'dd-mm-yyyy'), null, 'Javier Lopez', 541035924, null, 17);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (135, 'Valentina', 'Campbell', to_date('16-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Isla Campbell', 567119206, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (136, 'Joseph', 'Robinson', to_date('08-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Robinson', 519654379, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (137, 'Justin', 'Campbell', to_date('03-05-2020', 'dd-mm-yyyy'), 'Dairy', 'Taylor Campbell', 535206449, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (138, 'Jayden', 'Nelson', to_date('04-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Nicole Nelson', 559206635, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (139, 'Ruby', 'Hernandez', to_date('28-04-2020', 'dd-mm-yyyy'), null, 'Josephine Hernandez', 557083711, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (140, 'Eliana', 'Allen', to_date('03-07-2020', 'dd-mm-yyyy'), null, 'Ethan Allen', 595595574, null, 139);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (141, 'Alyssa', 'Evans', to_date('28-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Edward Evans', 522031324, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (142, 'Caroline', 'Lewis', to_date('13-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Cole Lewis', 511685028, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (143, 'Eva', 'Garcia', to_date('17-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Brandon Garcia', 552800683, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (144, 'Alexis', 'Lewis', to_date('22-06-2021', 'dd-mm-yyyy'), null, 'Josephine Lewis', 539176965, null, 136);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (145, 'Claire', 'Campbell', to_date('20-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Campbell', 550252300, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (146, 'Serenity', 'Mitchell', to_date('29-04-2020', 'dd-mm-yyyy'), null, 'Lucy Mitchell', 551982965, null, 148);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (147, 'Amaya', 'Young', to_date('07-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Adalyn Young', 519961217, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (148, 'Madeline', 'Brown', to_date('08-07-2020', 'dd-mm-yyyy'), 'Dairy', 'Madison Brown', 554807251, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (149, 'Everly', 'Diaz', to_date('06-05-2021', 'dd-mm-yyyy'), null, 'Scarlett Diaz', 586326229, null, 124);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (150, 'Addison', 'Allen', to_date('07-01-2020', 'dd-mm-yyyy'), null, 'David Allen', 550727962, null, 116);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (151, 'Aaliyah', 'Miller', to_date('01-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Grace Miller', 542247393, null, 98);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (152, 'Rylee', 'Thomas', to_date('21-12-2021', 'dd-mm-yyyy'), null, 'Sophie Thomas', 548870108, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (153, 'Isaac', 'Robinson', to_date('15-08-2020', 'dd-mm-yyyy'), 'Gluten', 'Everly Robinson', 577193168, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (154, 'Arabella', 'Robinson', to_date('14-04-2019', 'dd-mm-yyyy'), null, 'Alyssa Robinson', 571889772, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (155, 'Rose', 'Taylor', to_date('23-05-2023', 'dd-mm-yyyy'), null, 'Kyle Taylor', 517282462, null, 32);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (156, 'Andrea', 'Johnson', to_date('22-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Cora Johnson', 589969056, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (157, 'Naomi', 'Hernandez', to_date('29-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Eliza Hernandez', 596811489, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (158, 'Emery', 'Robinson', to_date('01-02-2022', 'dd-mm-yyyy'), null, 'Chloe Robinson', 582816652, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (159, 'Mila', 'Sanchez', to_date('29-08-2018', 'dd-mm-yyyy'), null, 'Piper Sanchez', 553868356, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (160, 'Aaliyah', 'Sanchez', to_date('17-03-2020', 'dd-mm-yyyy'), null, 'Sloane Sanchez', 524648281, null, 92);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (161, 'Antonio', 'Lewis', to_date('02-06-2019', 'dd-mm-yyyy'), null, 'Amelia Lewis', 588099850, null, 45);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (162, 'Delilah', 'Johnson', to_date('16-09-2022', 'dd-mm-yyyy'), null, 'Piper Johnson', 562222759, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (163, 'Kaitlyn', 'Nguyen', to_date('17-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Aurora Nguyen', 514438751, null, 37);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (164, 'David', 'Jones', to_date('03-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabelle Jones', 552938437, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (165, 'Rose', 'Hernandez', to_date('30-10-2021', 'dd-mm-yyyy'), 'Dairy', 'Hope Hernandez', 597009499, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (166, 'Madelyn', 'Allen', to_date('05-08-2021', 'dd-mm-yyyy'), null, 'Lola Allen', 570748233, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (167, 'Paisley', 'Rogers', to_date('24-02-2018', 'dd-mm-yyyy'), null, 'Scarlett Rogers', 598457872, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (168, 'Callie', 'Campbell', to_date('19-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Natalie Campbell', 566638853, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (169, 'Sarah', 'Moore', to_date('28-03-2022', 'dd-mm-yyyy'), null, 'Valentina Moore', 540375882, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (170, 'Ella', 'Clark', to_date('30-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Olivia Clark', 572519572, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (171, 'Claire', 'Lewis', to_date('03-04-2023', 'dd-mm-yyyy'), null, 'Brandon Lewis', 589694966, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (172, 'Gracie', 'Mitchell', to_date('25-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Quinn Mitchell', 513184783, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (173, 'Lillian', 'Hall', to_date('28-02-2020', 'dd-mm-yyyy'), null, 'Autumn Hall', 549043349, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (174, 'Nicole', 'Garcia', to_date('14-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Adeline Garcia', 550111833, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (175, 'George', 'Hernandez', to_date('21-11-2022', 'dd-mm-yyyy'), null, 'Charlotte Hernandez', 548652440, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (176, 'Lola', 'Moore', to_date('10-10-2020', 'dd-mm-yyyy'), 'Dairy', 'Harper Moore', 582355503, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (177, 'Ariana', 'Roberts', to_date('23-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Roberts', 540311238, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (178, 'Genevieve', 'Rogers', to_date('13-03-2020', 'dd-mm-yyyy'), null, 'Caleb Rogers', 580471597, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (179, 'Vivian', 'Nguyen', to_date('22-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Nguyen', 573938837, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (180, 'Sophie', 'Davis', to_date('02-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Caleb Davis', 594633382, null, 37);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (181, 'Jasmine', 'Wilson', to_date('11-03-2018', 'dd-mm-yyyy'), null, 'Claire Wilson', 533350500, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (182, 'Alice', 'Rogers', to_date('15-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Caleb Rogers', 584989537, null, 32);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (183, 'Alice', 'Ramirez', to_date('25-03-2021', 'dd-mm-yyyy'), null, 'Lily Ramirez', 553718172, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (184, 'Juliet', 'Hernandez', to_date('01-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Quinn Hernandez', 520191602, null, 79);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (185, 'Joshua', 'Campbell', to_date('24-07-2020', 'dd-mm-yyyy'), null, 'Charlotte Campbell', 585686586, null, 33);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (186, 'Luna', 'Jones', to_date('24-11-2023', 'dd-mm-yyyy'), 'Dairy', 'Reagan Jones', 571029455, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (187, 'Chloe', 'Campbell', to_date('02-12-2022', 'dd-mm-yyyy'), 'Gluten', 'Peyton Campbell', 522172435, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (188, 'Adalyn', 'Walker', to_date('28-09-2020', 'dd-mm-yyyy'), null, 'Addison Walker', 536491070, null, 140);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (189, 'David', 'Martinez', to_date('18-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Adrian Martinez', 543931725, null, 68);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (190, 'Chloe', 'Moore', to_date('14-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Lillian Moore', 521115014, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (191, 'Cole', 'Kim', to_date('02-04-2020', 'dd-mm-yyyy'), null, 'Brandon Kim', 543493359, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (192, 'Brielle', 'Anderson', to_date('27-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Amelia Anderson', 536222394, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (193, 'Leah', 'Nelson', to_date('25-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Isabella Nelson', 544021005, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (194, 'Emery', 'Rogers', to_date('01-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Bella Rogers', 550657017, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (195, 'Miguel', 'Allen', to_date('19-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Dylan Allen', 521764740, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (196, 'Leonardo', 'Brown', to_date('12-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Gracie Brown', 560180520, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (197, 'Adam', 'Rogers', to_date('22-11-2023', 'dd-mm-yyyy'), 'Peanuts', 'Lawrence Rogers', 549884169, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (198, 'Diego', 'Nguyen', to_date('28-04-2023', 'dd-mm-yyyy'), 'Gluten', 'Emery Nguyen', 565632963, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (199, 'John', 'Watson', to_date('01-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Lucas Watson', 592973176, null, 13);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (200, 'Brian', 'Cruz', to_date('08-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Caroline Cruz', 527677051, null, 48);
commit;
prompt 200 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (201, 'Autumn', 'Evans', to_date('18-03-2023', 'dd-mm-yyyy'), null, 'Lila Evans', 594186487, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (202, 'Miguel', 'Campbell', to_date('29-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Emilia Campbell', 579738087, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (203, 'Olivia', 'Watson', to_date('19-08-2022', 'dd-mm-yyyy'), 'Dairy', 'Bella Watson', 592270731, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (204, 'Adrian', 'Hernandez', to_date('02-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Rosalie Hernandez', 580107527, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (205, 'Ellie', 'Garcia', to_date('01-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Garcia', 553331266, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (206, 'Juliet', 'Thomas', to_date('02-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Penelope Thomas', 566498130, null, 14);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (207, 'Justin', 'Lee', to_date('20-06-2018', 'dd-mm-yyyy'), null, 'Douglas Lee', 574821944, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (208, 'Molly', 'Moore', to_date('20-05-2018', 'dd-mm-yyyy'), null, 'Brian Moore', 574917352, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (209, 'Ruby', 'Harris', to_date('11-12-2021', 'dd-mm-yyyy'), 'Gluten', 'Lucas Harris', 598930873, null, 10);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (210, 'Elena', 'Allen', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Claire Allen', 542065490, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (211, 'Keira', 'Sanchez', to_date('04-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Antonio Sanchez', 528140566, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (212, 'Luke', 'Nguyen', to_date('23-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Madeline Nguyen', 547462633, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (213, 'Adalyn', 'Walker', to_date('22-05-2021', 'dd-mm-yyyy'), null, 'Josephine Walker', 553969988, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (214, 'Eliana', 'Clark', to_date('16-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Gabriella Clark', 588733279, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (215, 'Emilia', 'Allen', to_date('26-11-2021', 'dd-mm-yyyy'), null, 'Albert Allen', 527818412, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (216, 'Willow', 'Young', to_date('11-09-2022', 'dd-mm-yyyy'), null, 'Sophie Young', 513483423, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (217, 'Javier', 'Roy', to_date('26-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Daniel Roy', 565990827, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (218, 'Brianna', 'Diaz', to_date('18-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Leilani Diaz', 586182802, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (219, 'Dennis', 'Lewis', to_date('05-11-2022', 'dd-mm-yyyy'), null, 'Lily Lewis', 545227182, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (220, 'Natalie', 'Moore', to_date('18-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Kaitlyn Moore', 597057673, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (221, 'Ivy', 'Miller', to_date('11-02-2019', 'dd-mm-yyyy'), 'Peanuts', 'Harold Miller', 577608301, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (222, 'Mackenzie', 'Young', to_date('14-05-2022', 'dd-mm-yyyy'), null, 'Rosalie Young', 545203523, null, 137);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (223, 'Jonathan', 'Hernandez', to_date('15-04-2022', 'dd-mm-yyyy'), null, 'Elena Hernandez', 534897789, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (224, 'Aria', 'Campbell', to_date('04-03-2020', 'dd-mm-yyyy'), null, 'Aurora Campbell', 519873300, null, 13);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (225, 'Mackenzie', 'Walker', to_date('09-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Chloe Walker', 514074744, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (226, 'Genevieve', 'Robinson', to_date('11-03-2018', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Robinson', 527310445, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (227, 'Carlos', 'Robinson', to_date('16-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Makenna Robinson', 565617958, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (228, 'Millie', 'Williams', to_date('23-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Maya Williams', 515153842, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (229, 'Alice', 'Walker', to_date('21-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Mila Walker', 554318993, null, 74);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (230, 'Avery', 'Johnson', to_date('04-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Bella Johnson', 587865739, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (231, 'Piper', 'Hernandez', to_date('18-12-2021', 'dd-mm-yyyy'), null, 'Lola Hernandez', 583054162, null, 119);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (232, 'Sloane', 'Campbell', to_date('21-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Leilani Campbell', 530019130, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (233, 'Violet', 'Scott', to_date('14-05-2020', 'dd-mm-yyyy'), null, 'Madilyn Scott', 566601524, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (234, 'Adrian', 'Hernandez', to_date('05-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Cameron Hernandez', 570085654, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (235, 'Teagan', 'Lewis', to_date('05-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Valentina Lewis', 596801959, null, 146);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (236, 'Gracie', 'Scott', to_date('30-08-2018', 'dd-mm-yyyy'), null, 'Isaiah Scott', 582724410, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (237, 'Aaliyah', 'Moore', to_date('19-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Alice Moore', 574301277, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (238, 'Bailey', 'Martinez', to_date('04-08-2019', 'dd-mm-yyyy'), 'Gluten', 'Amelia Martinez', 578595711, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (239, 'Josephine', 'Rodriguez', to_date('07-11-2021', 'dd-mm-yyyy'), 'Peanuts', 'Sadie Rodriguez', 592805661, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (240, 'George', 'Robinson', to_date('17-02-2022', 'dd-mm-yyyy'), null, 'Henry Robinson', 595917890, null, 12);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (241, 'Lillian', 'Hernandez', to_date('06-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Eloise Hernandez', 586453604, null, 54);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (242, 'David', 'Lewis', to_date('26-09-2018', 'dd-mm-yyyy'), 'Peanuts', 'George Lewis', 525399546, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (243, 'Cameron', 'Walker', to_date('18-08-2022', 'dd-mm-yyyy'), null, 'Layla Walker', 573589985, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (244, 'Isla', 'Allen', to_date('07-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Jayden Allen', 554070821, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (245, 'Serenity', 'Lopez', to_date('06-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Nora Lopez', 548919814, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (246, 'Skylar', 'Wilson', to_date('14-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Arabella Wilson', 560337842, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (247, 'Grace', 'Lee', to_date('15-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Ariana Lee', 599539404, null, 100);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (248, 'Jonathan', 'Hernandez', to_date('04-03-2021', 'dd-mm-yyyy'), null, 'Albert Hernandez', 594443739, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (249, 'Brianna', 'Nguyen', to_date('09-01-2023', 'dd-mm-yyyy'), null, 'Allison Nguyen', 518532960, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (250, 'Ava', 'Phillips', to_date('16-10-2019', 'dd-mm-yyyy'), null, 'Harold Phillips', 556910314, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (251, 'Joan', 'Adams', to_date('24-06-2022', 'dd-mm-yyyy'), null, 'Sloane Adams', 578813040, null, 12);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (252, 'Madilyn', 'Moore', to_date('07-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Douglas Moore', 598043541, null, 63);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (253, 'Bailey', 'Mitchell', to_date('03-04-2023', 'dd-mm-yyyy'), 'Dairy', 'Andrew Mitchell', 556542361, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (254, 'Leilani', 'Mitchell', to_date('03-11-2018', 'dd-mm-yyyy'), null, 'Emilia Mitchell', 532976801, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (255, 'Bailey', 'Williams', to_date('08-09-2019', 'dd-mm-yyyy'), null, 'Nicole Williams', 561829909, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (256, 'Javier', 'Robinson', to_date('04-02-2020', 'dd-mm-yyyy'), 'Gluten', 'Austin Robinson', 582704326, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (257, 'Cody', 'Wilson', to_date('11-01-2018', 'dd-mm-yyyy'), null, 'Mia Wilson', 517882756, null, 58);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (258, 'Lydia', 'Lopez', to_date('19-12-2019', 'dd-mm-yyyy'), null, 'Peyton Lopez', 594109782, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (259, 'Kinsley', 'Clark', to_date('19-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Abigail Clark', 533159408, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (260, 'Stella', 'Scott', to_date('18-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Lillian Scott', 557916105, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (261, 'Joshua', 'Wright', to_date('22-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Eva Wright', 595512890, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (262, 'Aurora', 'Thomas', to_date('16-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Felipe Thomas', 565145292, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (263, 'Hazel', 'Walker', to_date('25-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Violet Walker', 581737423, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (264, 'Gianna', 'Harris', to_date('08-08-2022', 'dd-mm-yyyy'), null, 'Anthony Harris', 592392226, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (265, 'Andrea', 'Young', to_date('22-10-2020', 'dd-mm-yyyy'), null, 'Rose Young', 567718942, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (266, 'Aaron', 'Brown', to_date('24-09-2021', 'dd-mm-yyyy'), null, 'Madilyn Brown', 554570020, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (267, 'Diego', 'Williams', to_date('19-07-2020', 'dd-mm-yyyy'), null, 'Henry Williams', 537864059, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (268, 'Paisley', 'Mitchell', to_date('02-06-2021', 'dd-mm-yyyy'), 'Dairy', 'John Mitchell', 513960949, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (269, 'Luke', 'Carter', to_date('19-10-2023', 'dd-mm-yyyy'), null, 'Derek Carter', 596700609, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (270, 'Lucas', 'Lopez', to_date('22-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Paisley Lopez', 557843438, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (271, 'Brian', 'Miller', to_date('07-05-2022', 'dd-mm-yyyy'), null, 'Aaron Miller', 597378243, null, 41);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (272, 'Andrew', 'Allen', to_date('15-05-2022', 'dd-mm-yyyy'), null, 'Catalina Allen', 513620217, null, 97);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (273, 'Andrea', 'Walker', to_date('13-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Scarlett Walker', 519849522, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (274, 'Elena', 'Clark', to_date('10-02-2020', 'dd-mm-yyyy'), null, 'Gregory Clark', 567403393, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (275, 'Allison', 'Davis', to_date('03-12-2018', 'dd-mm-yyyy'), null, 'Scarlett Davis', 555218270, null, 14);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (276, 'Alaina', 'Anderson', to_date('20-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Mila Anderson', 549075977, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (277, 'Juliet', 'Hernandez', to_date('05-11-2018', 'dd-mm-yyyy'), 'Peanuts', 'Avery Hernandez', 546984031, null, 17);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (278, 'Kyle', 'Campbell', to_date('28-10-2023', 'dd-mm-yyyy'), null, 'Diego Campbell', 560514378, null, 142);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (279, 'Piper', 'Miller', to_date('10-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Julia Miller', 563360457, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (280, 'Kyle', 'Garcia', to_date('26-10-2020', 'dd-mm-yyyy'), 'Peanuts', 'Lola Garcia', 546871949, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (281, 'Alexis', 'Lopez', to_date('05-12-2022', 'dd-mm-yyyy'), 'Peanuts', 'Makenna Lopez', 599941137, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (282, 'Vivian', 'Roy', to_date('08-06-2020', 'dd-mm-yyyy'), null, 'Charles Roy', 518364624, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (283, 'Skylar', 'Rogers', to_date('25-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Andrea Rogers', 599818425, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (284, 'Natalia', 'Carter', to_date('07-02-2022', 'dd-mm-yyyy'), 'Gluten', 'John Carter', 590463076, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (285, 'Keira', 'Lopez', to_date('21-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Genevieve Lopez', 588023643, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (286, 'Isla', 'Brown', to_date('18-11-2018', 'dd-mm-yyyy'), 'Peanuts', 'Cameron Brown', 537254253, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (287, 'Lawrence', 'Campbell', to_date('23-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Daniel Campbell', 537593553, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (288, 'Edward', 'Robinson', to_date('19-05-2022', 'dd-mm-yyyy'), null, 'Amelia Robinson', 536577471, null, 74);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (289, 'Isla', 'Lee', to_date('22-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Claire Lee', 558243740, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (290, 'Charlotte', 'Anderson', to_date('08-11-2021', 'dd-mm-yyyy'), 'Dairy', 'Adalyn Anderson', 541791326, null, 93);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (291, 'Emma', 'Phillips', to_date('18-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Phillips', 569257714, null, 14);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (292, 'Nathan', 'Williams', to_date('25-11-2022', 'dd-mm-yyyy'), null, 'Cody Williams', 572389874, null, 11);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (293, 'Aurora', 'Lopez', to_date('26-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Stella Lopez', 517859890, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (294, 'Julian', 'Thomas', to_date('10-09-2018', 'dd-mm-yyyy'), null, 'Genevieve Thomas', 525460162, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (295, 'Andrew', 'Hernandez', to_date('18-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Reagan Hernandez', 550826712, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (296, 'Luke', 'Clark', to_date('28-03-2019', 'dd-mm-yyyy'), null, 'Natalie Clark', 544692839, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (297, 'Quinn', 'Hernandez', to_date('12-10-2020', 'dd-mm-yyyy'), null, 'Skylar Hernandez', 587973408, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (298, 'Bailey', 'Cruz', to_date('12-06-2022', 'dd-mm-yyyy'), 'Dairy', 'Kinsley Cruz', 577823059, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (299, 'Natalia', 'Campbell', to_date('20-04-2022', 'dd-mm-yyyy'), null, 'Kinsley Campbell', 518779677, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (300, 'Juan', 'Allen', to_date('27-10-2021', 'dd-mm-yyyy'), 'Dairy', 'Aria Allen', 561349540, null, 17);
commit;
prompt 300 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (301, 'Millie', 'Taylor', to_date('28-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Gianna Taylor', 560815172, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (302, 'Millie', 'Allen', to_date('24-08-2021', 'dd-mm-yyyy'), 'Peanuts', 'Bella Allen', 540082725, null, 85);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (303, 'Ivy', 'Wright', to_date('22-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Jack Wright', 587101839, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (304, 'Mila', 'Thomas', to_date('08-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Andrea Thomas', 522777009, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (305, 'Ezekiel', 'Wilson', to_date('09-01-2018', 'dd-mm-yyyy'), null, 'Millie Wilson', 584092203, null, 86);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (306, 'David', 'Hernandez', to_date('30-06-2020', 'dd-mm-yyyy'), 'Dairy', 'Riley Hernandez', 598722217, null, 136);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (307, 'Cody', 'Mitchell', to_date('19-02-2020', 'dd-mm-yyyy'), null, 'Eva Mitchell', 558933461, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (308, 'Isabella', 'Rogers', to_date('15-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Olivia Rogers', 581351383, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (309, 'Madeline', 'Wilson', to_date('17-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Riley Wilson', 549215425, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (310, 'Daniel', 'Moore', to_date('07-01-2020', 'dd-mm-yyyy'), null, 'Lola Moore', 560154336, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (311, 'Adalyn', 'Allen', to_date('18-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Claire Allen', 553934751, null, 33);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (312, 'Juliet', 'Scott', to_date('20-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Benjamin Scott', 534030524, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (313, 'Catalina', 'Anderson', to_date('22-12-2023', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Anderson', 587157296, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (314, 'Nora', 'Rogers', to_date('24-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Kinsley Rogers', 514052490, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (315, 'Chloe', 'Robinson', to_date('19-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Naomi Robinson', 540091002, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (316, 'Alexis', 'Lopez', to_date('08-02-2021', 'dd-mm-yyyy'), 'Peanuts', 'Paisley Lopez', 572961998, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (317, 'Caroline', 'Garcia', to_date('14-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Henry Garcia', 555835552, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (318, 'Isaac', 'Rodriguez', to_date('01-08-2018', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Rodriguez', 558680279, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (319, 'Juan', 'Lee', to_date('20-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Alexis Lee', 525140800, null, 100);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (320, 'Charlotte', 'Moore', to_date('09-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Moore', 525085861, null, 39);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (321, 'Emery', 'Rogers', to_date('15-02-2022', 'dd-mm-yyyy'), null, 'Justin Rogers', 510917394, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (322, 'Luna', 'Moore', to_date('03-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Keith Moore', 599785749, null, 82);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (323, 'Vivian', 'Miller', to_date('25-10-2021', 'dd-mm-yyyy'), null, 'Keith Miller', 513301123, null, 20);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (324, 'Aubree', 'Walker', to_date('06-09-2018', 'dd-mm-yyyy'), 'Dairy', 'Juan Walker', 547153829, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (325, 'Keith', 'Allen', to_date('11-02-2020', 'dd-mm-yyyy'), null, 'Melanie Allen', 576096187, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (326, 'Harold', 'Mitchell', to_date('11-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Eva Mitchell', 579973789, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (327, 'Samantha', 'Anderson', to_date('09-05-2022', 'dd-mm-yyyy'), null, 'Brielle Anderson', 529575762, null, 85);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (328, 'Bella', 'Nguyen', to_date('08-06-2019', 'dd-mm-yyyy'), null, 'Hazel Nguyen', 512574503, null, 98);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (329, 'Josephine', 'Carter', to_date('15-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Molly Carter', 551146245, null, 117);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (330, 'Bella', 'Wilson', to_date('16-01-2021', 'dd-mm-yyyy'), null, 'Amaya Wilson', 548053321, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (331, 'Gracie', 'Sanchez', to_date('23-11-2020', 'dd-mm-yyyy'), null, 'Bailey Sanchez', 557738458, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (332, 'Lucas', 'Allen', to_date('05-02-2019', 'dd-mm-yyyy'), null, 'Charlotte Allen', 550947155, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (333, 'Delilah', 'King', to_date('28-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Autumn King', 539768119, null, 141);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (334, 'Skylar', 'Nelson', to_date('07-12-2023', 'dd-mm-yyyy'), 'Peanuts', 'Arabella Nelson', 587031810, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (335, 'Eliza', 'Thomas', to_date('22-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Mackenzie Thomas', 583738494, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (336, 'Chloe', 'Rogers', to_date('21-05-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Rogers', 522706090, null, 79);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (337, 'Dustin', 'Hernandez', to_date('29-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Alyssa Hernandez', 518193967, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (338, 'Edward', 'Allen', to_date('11-05-2019', 'dd-mm-yyyy'), 'Peanuts', 'Layla Allen', 537242544, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (339, 'Joshua', 'Allen', to_date('23-06-2020', 'dd-mm-yyyy'), null, 'Dustin Allen', 590579127, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (340, 'Samantha', 'Lewis', to_date('01-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Isla Lewis', 540747430, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (341, 'Chloe', 'Young', to_date('30-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Maya Young', 540643961, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (342, 'Natalie', 'King', to_date('26-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Daniel King', 514619349, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (343, 'Joseph', 'Davis', to_date('30-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Dustin Davis', 516463287, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (344, 'Callie', 'Robinson', to_date('28-09-2020', 'dd-mm-yyyy'), 'Peanuts', 'Abraham Robinson', 550726262, null, 1);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (345, 'Penelope', 'Lewis', to_date('07-11-2022', 'dd-mm-yyyy'), null, 'Keith Lewis', 518641062, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (346, 'Eliana', 'Campbell', to_date('09-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Juliet Campbell', 579469475, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (347, 'Isaac', 'Wright', to_date('04-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Charlotte Wright', 540935049, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (348, 'Aaron', 'Allen', to_date('13-06-2022', 'dd-mm-yyyy'), null, 'Chad Allen', 529524046, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (349, 'Jasmine', 'Moore', to_date('20-09-2020', 'dd-mm-yyyy'), null, 'Clara Moore', 565150433, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (350, 'Rosalie', 'Scott', to_date('22-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Dylan Scott', 552686733, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (351, 'Adalyn', 'Clark', to_date('29-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Brandon Clark', 592034206, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (352, 'Abraham', 'Rodriguez', to_date('23-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Rose Rodriguez', 531470420, null, 124);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (353, 'Lila', 'Hernandez', to_date('23-04-2023', 'dd-mm-yyyy'), 'Dairy', 'Valentina Hernandez', 575538684, null, 11);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (354, 'Aria', 'Allen', to_date('09-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Taylor Allen', 570987440, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (355, 'Skylar', 'Taylor', to_date('01-02-2022', 'dd-mm-yyyy'), 'Dairy', 'Luna Taylor', 553295136, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (356, 'Stella', 'Garcia', to_date('05-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Garcia', 583550358, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (357, 'Antonio', 'Nelson', to_date('05-04-2022', 'dd-mm-yyyy'), null, 'Luna Nelson', 510766150, null, 70);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (358, 'Ivy', 'Rodriguez', to_date('12-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Molly Rodriguez', 528274297, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (359, 'Joseph', 'Lee', to_date('27-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Millie Lee', 549095539, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (360, 'Lucas', 'Anderson', to_date('16-12-2021', 'dd-mm-yyyy'), null, 'Alexis Anderson', 554945668, null, 96);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (361, 'Evelyn', 'Lewis', to_date('31-03-2018', 'dd-mm-yyyy'), 'Dairy', 'Ruby Lewis', 544185285, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (362, 'Kaitlyn', 'Harris', to_date('21-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Andrea Harris', 532288948, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (363, 'Eden', 'Mitchell', to_date('14-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Sophie Mitchell', 512989387, null, 74);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (364, 'Ava', 'Robinson', to_date('09-03-2023', 'dd-mm-yyyy'), 'Gluten', 'Joseph Robinson', 541400445, null, 139);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (365, 'Anna', 'Young', to_date('16-07-2019', 'dd-mm-yyyy'), null, 'Adalyn Young', 595736864, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (366, 'Mackenzie', 'Lewis', to_date('30-07-2019', 'dd-mm-yyyy'), null, 'Mila Lewis', 539864282, null, 107);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (367, 'Keith', 'Wright', to_date('17-01-2021', 'dd-mm-yyyy'), null, 'Isaac Wright', 539777152, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (368, 'Javier', 'Lopez', to_date('29-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Madelyn Lopez', 535399909, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (369, 'Leah', 'Scott', to_date('18-03-2021', 'dd-mm-yyyy'), 'Peanuts', 'Samantha Scott', 567009302, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (370, 'Christopher', 'Johnson', to_date('02-03-2020', 'dd-mm-yyyy'), null, 'Alexandra Johnson', 591567143, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (371, 'Layla', 'Clark', to_date('27-10-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabella Clark', 586967796, null, 116);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (372, 'Douglas', 'Williams', to_date('10-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Henry Williams', 558315389, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (373, 'Eliana', 'Scott', to_date('02-02-2021', 'dd-mm-yyyy'), null, 'Abraham Scott', 513648837, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (374, 'Emma', 'Moore', to_date('08-05-2022', 'dd-mm-yyyy'), null, 'Caleb Moore', 529591137, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (375, 'Taylor', 'Garcia', to_date('01-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Madeline Garcia', 532693335, null, 77);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (376, 'David', 'Hernandez', to_date('24-05-2020', 'dd-mm-yyyy'), null, 'Eloise Hernandez', 513377811, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (377, 'Daisy', 'Robinson', to_date('31-10-2022', 'dd-mm-yyyy'), null, 'Stella Robinson', 513416027, null, 42);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (378, 'Savannah', 'Lee', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Amelia Lee', 596910755, null, 89);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (379, 'Eliza', 'Hernandez', to_date('04-01-2022', 'dd-mm-yyyy'), null, 'Lily Hernandez', 563023088, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (380, 'Alice', 'Brown', to_date('11-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Caleb Brown', 599093750, null, 85);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (381, 'Lydia', 'Rodriguez', to_date('23-01-2019', 'dd-mm-yyyy'), null, 'Juliet Rodriguez', 585558865, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (382, 'Eric', 'Harris', to_date('15-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Harris', 513561765, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (383, 'Leilani', 'Walker', to_date('13-10-2019', 'dd-mm-yyyy'), null, 'Zoey Walker', 523774075, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (384, 'Molly', 'Robinson', to_date('03-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'Ethan Robinson', 552538531, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (385, 'Dennis', 'Rodriguez', to_date('26-04-2020', 'dd-mm-yyyy'), null, 'Cora Rodriguez', 530358851, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (386, 'Alexis', 'Davis', to_date('25-06-2020', 'dd-mm-yyyy'), null, 'Ava Davis', 577066673, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (387, 'Katherine', 'Thomas', to_date('01-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Lila Thomas', 519552719, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (388, 'Eloise', 'Johnson', to_date('30-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Harper Johnson', 550966624, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (389, 'Ruby', 'Campbell', to_date('20-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Lucas Campbell', 544857438, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (390, 'Skylar', 'Rogers', to_date('20-10-2019', 'dd-mm-yyyy'), 'Peanuts', 'Aurora Rogers', 585890564, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (391, 'Sloane', 'Taylor', to_date('19-12-2018', 'dd-mm-yyyy'), null, 'Mila Taylor', 550038106, null, 65);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (392, 'Aurora', 'Lopez', to_date('25-11-2019', 'dd-mm-yyyy'), 'Dairy', 'Sadie Lopez', 528829729, null, 107);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (393, 'Teagan', 'Taylor', to_date('12-11-2018', 'dd-mm-yyyy'), 'Dairy', 'George Taylor', 571008754, null, 63);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (394, 'Grace', 'Carter', to_date('07-05-2018', 'dd-mm-yyyy'), null, 'Savannah Carter', 518067254, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (395, 'Elena', 'Johnson', to_date('21-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Lucy Johnson', 597120164, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (396, 'Miguel', 'Johnson', to_date('02-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Kyle Johnson', 546455856, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (397, 'Clara', 'Hall', to_date('19-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Ruby Hall', 512668045, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (398, 'Josephine', 'Miller', to_date('28-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Eliza Miller', 581962277, null, 62);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (399, 'Lillian', 'Walker', to_date('04-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Savannah Walker', 566597370, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (400, 'Andrea', 'Moore', to_date('04-05-2022', 'dd-mm-yyyy'), null, 'Grace Moore', 599948095, null, 112);
commit;
prompt 400 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (401, 'Everly', 'Rogers', to_date('18-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Clara Rogers', 586879920, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (402, 'Genevieve', 'Phillips', to_date('30-03-2019', 'dd-mm-yyyy'), null, 'Felipe Phillips', 514368785, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (403, 'Lillian', 'Nguyen', to_date('18-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Nguyen', 562297614, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (404, 'Sophie', 'Davis', to_date('17-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Layla Davis', 511210424, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (405, 'Grace', 'Moore', to_date('26-05-2018', 'dd-mm-yyyy'), 'Gluten', 'Molly Moore', 542882255, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (406, 'Athena', 'Lopez', to_date('12-05-2019', 'dd-mm-yyyy'), null, 'Mia Lopez', 544809925, null, 79);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (407, 'Isabella', 'Nelson', to_date('30-04-2018', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Nelson', 583210549, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (408, 'Albert', 'Lewis', to_date('27-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Zoey Lewis', 566318085, null, 86);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (409, 'Alexandra', 'Sanchez', to_date('20-09-2022', 'dd-mm-yyyy'), null, 'Piper Sanchez', 563861976, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (410, 'Madilyn', 'Clark', to_date('15-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Lily Clark', 571344279, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (411, 'Clara', 'Nguyen', to_date('20-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Emilia Nguyen', 532694176, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (412, 'Kyle', 'Moore', to_date('05-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Edward Moore', 527486842, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (413, 'Dennis', 'Nelson', to_date('04-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Juliet Nelson', 543937954, null, 36);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (414, 'Rylee', 'Scott', to_date('18-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Jordan Scott', 592479520, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (415, 'Javier', 'Garcia', to_date('06-12-2023', 'dd-mm-yyyy'), null, 'Lillian Garcia', 536862595, null, 65);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (416, 'Lucy', 'Allen', to_date('19-04-2022', 'dd-mm-yyyy'), 'Gluten', 'George Allen', 532943145, null, 41);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (417, 'Bella', 'Watson', to_date('03-12-2019', 'dd-mm-yyyy'), 'Dairy', 'Lillian Watson', 520617562, null, 10);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (418, 'Albert', 'Garcia', to_date('17-03-2021', 'dd-mm-yyyy'), null, 'Eva Garcia', 565626535, null, 80);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (419, 'Ezekiel', 'Miller', to_date('09-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Bella Miller', 517423717, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (420, 'Elena', 'Cruz', to_date('17-12-2019', 'dd-mm-yyyy'), null, 'Jesse Cruz', 568844946, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (421, 'Valentina', 'Evans', to_date('25-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Aubree Evans', 560463896, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (422, 'Jasmine', 'Anderson', to_date('24-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Catalina Anderson', 562053743, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (423, 'Claire', 'Thomas', to_date('05-08-2021', 'dd-mm-yyyy'), 'Peanuts', 'Gabriel Thomas', 584450210, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (424, 'Gregory', 'Moore', to_date('25-11-2022', 'dd-mm-yyyy'), null, 'Edward Moore', 565549248, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (425, 'Grace', 'Lee', to_date('24-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Aubrey Lee', 583128371, null, 2);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (426, 'Leilani', 'Wilson', to_date('10-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Brian Wilson', 526045638, null, 7);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (427, 'Julian', 'Anderson', to_date('15-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Anderson', 585396669, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (428, 'Dustin', 'Moore', to_date('04-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Jade Moore', 515791482, null, 140);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (429, 'Brianna', 'Thomas', to_date('26-02-2020', 'dd-mm-yyyy'), 'Peanuts', 'Clara Thomas', 566485075, null, 143);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (430, 'Aaliyah', 'Sanchez', to_date('25-08-2019', 'dd-mm-yyyy'), 'Peanuts', 'Charles Sanchez', 577548895, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (431, 'Alexis', 'Wright', to_date('01-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Luna Wright', 534628299, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (432, 'Savannah', 'Johnson', to_date('24-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Aaron Johnson', 521882184, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (433, 'Lily', 'Hernandez', to_date('07-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Isaiah Hernandez', 546464999, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (434, 'Chloe', 'Young', to_date('13-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Sophie Young', 513475266, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (435, 'Penelope', 'Kim', to_date('14-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Aurora Kim', 535960424, null, 97);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (436, 'Callie', 'Watson', to_date('07-11-2020', 'dd-mm-yyyy'), null, 'Eric Watson', 544567619, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (437, 'Grace', 'Hernandez', to_date('01-05-2022', 'dd-mm-yyyy'), null, 'Piper Hernandez', 559557270, null, 2);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (438, 'Sloane', 'Carter', to_date('10-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Gracie Carter', 517706207, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (439, 'Carlos', 'Lewis', to_date('21-08-2020', 'dd-mm-yyyy'), null, 'Cole Lewis', 562649541, null, 36);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (440, 'Delilah', 'Hall', to_date('25-08-2020', 'dd-mm-yyyy'), 'Dairy', 'Brandon Hall', 514577512, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (441, 'Madeline', 'Garcia', to_date('31-01-2018', 'dd-mm-yyyy'), 'Gluten', 'Brian Garcia', 594786246, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (442, 'Vivian', 'Mitchell', to_date('27-08-2023', 'dd-mm-yyyy'), null, 'Nora Mitchell', 528787567, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (443, 'Emilia', 'Ramirez', to_date('07-10-2021', 'dd-mm-yyyy'), null, 'Caleb Ramirez', 540420690, null, 130);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (444, 'Isabella', 'Hernandez', to_date('15-03-2019', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Hernandez', 526745346, null, 84);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (445, 'Aubree', 'Thomas', to_date('01-09-2022', 'dd-mm-yyyy'), null, 'Ava Thomas', 591163331, null, 33);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (446, 'Harold', 'Sanchez', to_date('04-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Adrian Sanchez', 529315730, null, 14);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (447, 'Skylar', 'Kim', to_date('21-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Emma Kim', 584121275, null, 14);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (448, 'Leonardo', 'Moore', to_date('31-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Clara Moore', 532471052, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (449, 'Genevieve', 'Garcia', to_date('24-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Scarlett Garcia', 549306126, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (450, 'Anna', 'Roy', to_date('27-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Cole Roy', 573565506, null, 102);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (451, 'Sarah', 'Rodriguez', to_date('13-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Brianna Rodriguez', 596172653, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (452, 'Eric', 'Rodriguez', to_date('04-06-2022', 'dd-mm-yyyy'), null, 'Abigail Rodriguez', 578297178, null, 62);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (453, 'Aurora', 'Clark', to_date('22-10-2023', 'dd-mm-yyyy'), null, 'Josephine Clark', 567636016, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (454, 'Lila', 'Robinson', to_date('11-11-2019', 'dd-mm-yyyy'), null, 'Aubrey Robinson', 585983418, null, 4);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (455, 'Brandon', 'Nelson', to_date('03-10-2023', 'dd-mm-yyyy'), null, 'Emma Nelson', 536585025, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (456, 'Julian', 'Davis', to_date('21-01-2022', 'dd-mm-yyyy'), 'Peanuts', 'Daisy Davis', 533409085, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (457, 'Ava', 'Jones', to_date('28-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Eliza Jones', 571433029, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (458, 'Olivia', 'Walker', to_date('15-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Austin Walker', 537372988, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (459, 'Alice', 'Rogers', to_date('14-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Emilia Rogers', 527894442, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (460, 'Rylee', 'Adams', to_date('22-02-2018', 'dd-mm-yyyy'), null, 'Everly Adams', 526657490, null, 136);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (461, 'Millie', 'Scott', to_date('10-04-2021', 'dd-mm-yyyy'), null, 'Hope Scott', 520714548, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (462, 'Nora', 'Martinez', to_date('22-11-2018', 'dd-mm-yyyy'), null, 'Keira Martinez', 578139943, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (463, 'Carlos', 'Garcia', to_date('07-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Emilia Garcia', 574400117, null, 4);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (464, 'Alyssa', 'Lewis', to_date('29-08-2021', 'dd-mm-yyyy'), null, 'Brooklyn Lewis', 592529731, null, 119);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (465, 'Sophia', 'Miller', to_date('05-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Jordan Miller', 531744060, null, 76);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (466, 'Brooklyn', 'Lee', to_date('24-03-2019', 'dd-mm-yyyy'), 'Gluten', 'Jordan Lee', 553581591, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (467, 'Hannah', 'Young', to_date('31-03-2019', 'dd-mm-yyyy'), null, 'Lola Young', 551531634, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (468, 'Gabriel', 'Williams', to_date('07-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Juliet Williams', 566610799, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (469, 'Aaron', 'Rodriguez', to_date('28-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Christopher Rodriguez', 548449378, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (470, 'Sophia', 'Johnson', to_date('04-03-2018', 'dd-mm-yyyy'), null, 'Eloise Johnson', 574864651, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (471, 'Molly', 'Diaz', to_date('20-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Sloane Diaz', 584312547, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (472, 'Ivy', 'Phillips', to_date('01-05-2022', 'dd-mm-yyyy'), null, 'John Phillips', 531085853, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (473, 'Everly', 'Ramirez', to_date('24-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Natalia Ramirez', 597340259, null, 116);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (474, 'Athena', 'Robinson', to_date('18-01-2020', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Robinson', 597069681, null, 70);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (475, 'Teagan', 'Garcia', to_date('15-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Garcia', 576606621, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (476, 'Mia', 'Moore', to_date('03-04-2019', 'dd-mm-yyyy'), null, 'Gracie Moore', 590593158, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (477, 'Rose', 'Hernandez', to_date('30-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Julian Hernandez', 572817630, null, 98);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (478, 'Javier', 'Hernandez', to_date('24-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Eva Hernandez', 517886584, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (479, 'Benjamin', 'Rodriguez', to_date('30-12-2020', 'dd-mm-yyyy'), 'Peanuts', 'Harold Rodriguez', 511444113, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (480, 'Naomi', 'Allen', to_date('03-07-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Allen', 595170872, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (481, 'Adalyn', 'Harris', to_date('26-04-2019', 'dd-mm-yyyy'), 'Gluten', 'Brianna Harris', 573305029, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (482, 'Eliana', 'Green', to_date('26-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Adam Green', 570357774, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (483, 'Natalia', 'Anderson', to_date('11-02-2021', 'dd-mm-yyyy'), 'Peanuts', 'Callie Anderson', 587199718, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (484, 'Cody', 'Mitchell', to_date('18-03-2022', 'dd-mm-yyyy'), null, 'Vivian Mitchell', 526469770, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (485, 'Juan', 'Lopez', to_date('25-03-2022', 'dd-mm-yyyy'), null, 'Alyssa Lopez', 555025150, null, 68);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (486, 'Jack', 'Scott', to_date('26-03-2023', 'dd-mm-yyyy'), 'Dairy', 'Benjamin Scott', 538168407, null, 39);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (487, 'Lola', 'Clark', to_date('22-07-2022', 'dd-mm-yyyy'), 'Dairy', 'Ellie Clark', 549921745, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (488, 'Alexis', 'Hernandez', to_date('23-08-2023', 'dd-mm-yyyy'), null, 'Willow Hernandez', 540327238, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (489, 'Stella', 'Moore', to_date('17-12-2021', 'dd-mm-yyyy'), null, 'Sloane Moore', 531321411, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (490, 'Jordan', 'Walker', to_date('03-09-2018', 'dd-mm-yyyy'), null, 'Lucas Walker', 526796378, null, 128);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (491, 'Makenna', 'Wright', to_date('03-06-2019', 'dd-mm-yyyy'), 'Dairy', 'Clara Wright', 558357285, null, 34);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (492, 'Eva', 'Hall', to_date('18-06-2019', 'dd-mm-yyyy'), 'Peanuts', 'Riley Hall', 530767423, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (493, 'Melanie', 'Rogers', to_date('28-05-2020', 'dd-mm-yyyy'), 'Peanuts', 'David Rogers', 548627110, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (494, 'Charlotte', 'Allen', to_date('12-01-2018', 'dd-mm-yyyy'), null, 'Caleb Allen', 596873086, null, 4);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (495, 'Brian', 'Moore', to_date('13-09-2019', 'dd-mm-yyyy'), null, 'Diego Moore', 590958485, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (496, 'Clara', 'Thomas', to_date('19-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Mila Thomas', 552095354, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (497, 'Brianna', 'Moore', to_date('30-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Moore', 575292663, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (498, 'Aubrey', 'Anderson', to_date('17-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'David Anderson', 580907445, null, 146);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (499, 'Eliza', 'Allen', to_date('19-09-2022', 'dd-mm-yyyy'), null, 'Kyle Allen', 557934706, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (500, 'Natalie', 'Nguyen', to_date('12-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Sophia Nguyen', 556293055, null, 117);
commit;
prompt 500 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (501, 'Violet', 'Campbell', to_date('26-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Diego Campbell', 512441543, null, 12);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (502, 'Gabriella', 'Allen', to_date('19-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Luna Allen', 582627630, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (503, 'Claire', 'Lopez', to_date('09-05-2018', 'dd-mm-yyyy'), 'Gluten', 'Savannah Lopez', 589845119, null, 96);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (504, 'John', 'Robinson', to_date('23-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Miguel Robinson', 545137275, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (505, 'Lawrence', 'Hernandez', to_date('13-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Kyle Hernandez', 565439313, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (506, 'Alexandra', 'Nelson', to_date('24-12-2018', 'dd-mm-yyyy'), null, 'Cole Nelson', 549811078, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (507, 'Sarah', 'Martinez', to_date('30-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Avery Martinez', 545854906, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (508, 'Lola', 'Hernandez', to_date('08-07-2019', 'dd-mm-yyyy'), null, 'Avery Hernandez', 531437148, null, 63);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (509, 'Madeline', 'Moore', to_date('19-04-2018', 'dd-mm-yyyy'), 'Peanuts', 'Katherine Moore', 581068392, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (510, 'Sadie', 'Lopez', to_date('01-11-2021', 'dd-mm-yyyy'), 'Dairy', 'Julian Lopez', 516268364, null, 102);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (511, 'Anna', 'Walker', to_date('08-05-2019', 'dd-mm-yyyy'), null, 'Grace Walker', 549415909, null, 85);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (512, 'Eric', 'Scott', to_date('06-01-2021', 'dd-mm-yyyy'), null, 'Isaiah Scott', 594864457, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (513, 'Dylan', 'Lewis', to_date('11-09-2021', 'dd-mm-yyyy'), null, 'Bella Lewis', 521530711, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (514, 'Jonathan', 'Lewis', to_date('30-03-2020', 'dd-mm-yyyy'), null, 'Diego Lewis', 580653918, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (515, 'Sarah', 'Rogers', to_date('01-10-2023', 'dd-mm-yyyy'), 'Peanuts', 'Samantha Rogers', 516829888, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (516, 'Jordan', 'Hernandez', to_date('09-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Madilyn Hernandez', 541141419, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (517, 'Ava', 'Nelson', to_date('10-10-2023', 'dd-mm-yyyy'), null, 'Kaitlyn Nelson', 530771055, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (518, 'Luna', 'Moore', to_date('08-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Ivy Moore', 559702678, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (519, 'Nicole', 'Brown', to_date('07-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabella Brown', 577636908, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (520, 'Ethan', 'Campbell', to_date('09-05-2021', 'dd-mm-yyyy'), 'Peanuts', 'Joshua Campbell', 556138948, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (521, 'Andrew', 'Moore', to_date('23-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Samantha Moore', 537861534, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (522, 'Ezekiel', 'Garcia', to_date('27-06-2020', 'dd-mm-yyyy'), null, 'Valentina Garcia', 568475780, null, 20);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (523, 'Brianna', 'Hernandez', to_date('08-01-2023', 'dd-mm-yyyy'), 'Dairy', 'Dennis Hernandez', 517976820, null, 142);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (524, 'Mila', 'Clark', to_date('29-08-2019', 'dd-mm-yyyy'), null, 'Makenna Clark', 537158668, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (525, 'Autumn', 'Harris', to_date('07-04-2023', 'dd-mm-yyyy'), null, 'Ruby Harris', 583331735, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (526, 'Ella', 'Moore', to_date('14-05-2018', 'dd-mm-yyyy'), null, 'Cole Moore', 577378165, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (527, 'Amaya', 'Williams', to_date('30-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Sadie Williams', 555949388, null, 139);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (528, 'Brandon', 'Nguyen', to_date('18-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Emilia Nguyen', 547597806, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (529, 'Claire', 'Clark', to_date('23-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Bailey Clark', 516343621, null, 97);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (530, 'Christopher', 'Hernandez', to_date('03-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Carlos Hernandez', 520881733, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (531, 'Javier', 'Rogers', to_date('15-06-2022', 'dd-mm-yyyy'), null, 'Sarah Rogers', 518064634, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (532, 'Addison', 'Lee', to_date('05-05-2023', 'dd-mm-yyyy'), 'Gluten', 'John Lee', 587194224, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (533, 'Felipe', 'Wilson', to_date('05-04-2021', 'dd-mm-yyyy'), null, 'Christopher Wilson', 524025596, null, 80);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (534, 'Aaliyah', 'Davis', to_date('27-03-2023', 'dd-mm-yyyy'), null, 'Zoey Davis', 583056136, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (535, 'Ava', 'Garcia', to_date('06-07-2018', 'dd-mm-yyyy'), 'Gluten', 'Kyle Garcia', 533201647, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (536, 'Keith', 'Rodriguez', to_date('19-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Evelyn Rodriguez', 510006481, null, 41);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (537, 'Aurora', 'Nguyen', to_date('12-10-2019', 'dd-mm-yyyy'), null, 'Lola Nguyen', 537570056, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (538, 'Everly', 'Lee', to_date('31-10-2020', 'dd-mm-yyyy'), null, 'Alexandra Lee', 588778174, null, 22);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (539, 'Kaylee', 'Garcia', to_date('31-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Riley Garcia', 586063167, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (540, 'Alan', 'Cruz', to_date('02-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Rose Cruz', 551440621, null, 1);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (541, 'Emery', 'Campbell', to_date('22-12-2021', 'dd-mm-yyyy'), null, 'Brianna Campbell', 550660267, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (542, 'Aubree', 'Garcia', to_date('07-04-2022', 'dd-mm-yyyy'), null, 'Dennis Garcia', 561975299, null, 54);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (543, 'Hannah', 'Moore', to_date('26-07-2018', 'dd-mm-yyyy'), null, 'Christopher Moore', 557394590, null, 47);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (544, 'Mackenzie', 'Nelson', to_date('03-11-2023', 'dd-mm-yyyy'), null, 'Benjamin Nelson', 546463981, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (545, 'Isaac', 'Lewis', to_date('26-12-2020', 'dd-mm-yyyy'), null, 'Mackenzie Lewis', 542150938, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (546, 'Charles', 'Hernandez', to_date('24-01-2020', 'dd-mm-yyyy'), 'Peanuts', 'Kaylee Hernandez', 510340401, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (547, 'Adeline', 'Scott', to_date('20-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Edward Scott', 522665949, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (548, 'Daisy', 'Moore', to_date('24-06-2022', 'dd-mm-yyyy'), null, 'Evelyn Moore', 578094377, null, 88);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (549, 'Millie', 'Hernandez', to_date('16-05-2020', 'dd-mm-yyyy'), null, 'Serenity Hernandez', 540520286, null, 24);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (550, 'Isabella', 'Davis', to_date('26-03-2019', 'dd-mm-yyyy'), null, 'Antonio Davis', 537801101, null, 26);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (551, 'Charles', 'Wright', to_date('24-12-2018', 'dd-mm-yyyy'), null, 'Sophia Wright', 525528880, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (552, 'Javier', 'Lopez', to_date('09-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Daisy Lopez', 597011403, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (553, 'Jade', 'Hernandez', to_date('03-06-2018', 'dd-mm-yyyy'), null, 'Jordan Hernandez', 516591109, null, 87);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (554, 'Brielle', 'Wright', to_date('13-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Grace Wright', 549668558, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (555, 'Lola', 'Cruz', to_date('03-11-2019', 'dd-mm-yyyy'), 'Gluten', 'Aria Cruz', 578393812, null, 54);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (556, 'Rosalie', 'Wilson', to_date('13-10-2019', 'dd-mm-yyyy'), 'Dairy', 'Charlotte Wilson', 593642123, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (557, 'Jack', 'Thomas', to_date('01-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Thomas', 537154083, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (558, 'Callie', 'Lopez', to_date('09-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Lopez', 545196694, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (559, 'Joan', 'Walker', to_date('06-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Hannah Walker', 532094533, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (560, 'Samantha', 'Miller', to_date('14-01-2018', 'dd-mm-yyyy'), null, 'Genevieve Miller', 554528598, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (561, 'Anna', 'Walker', to_date('08-10-2021', 'dd-mm-yyyy'), null, 'Nora Walker', 550623016, null, 68);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (562, 'Christopher', 'Young', to_date('07-07-2019', 'dd-mm-yyyy'), null, 'Hope Young', 533218119, null, 53);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (563, 'Lydia', 'Nelson', to_date('28-01-2023', 'dd-mm-yyyy'), null, 'Ella Nelson', 573708971, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (564, 'Miguel', 'Garcia', to_date('21-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Ava Garcia', 540741461, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (565, 'Leah', 'Scott', to_date('23-04-2023', 'dd-mm-yyyy'), null, 'Ruby Scott', 592965868, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (566, 'Kinsley', 'Roberts', to_date('15-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Layla Roberts', 551193054, null, 137);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (567, 'Reagan', 'Johnson', to_date('02-02-2019', 'dd-mm-yyyy'), null, 'Evelyn Johnson', 597960280, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (568, 'Jonathan', 'Mitchell', to_date('13-10-2023', 'dd-mm-yyyy'), 'Dairy', 'Kaylee Mitchell', 544776575, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (569, 'Jordan', 'Young', to_date('29-09-2023', 'dd-mm-yyyy'), null, 'Emery Young', 561168155, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (570, 'Amelia', 'Thomas', to_date('22-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Eric Thomas', 525391672, null, 68);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (571, 'Kevin', 'Robinson', to_date('28-02-2022', 'dd-mm-yyyy'), 'Dairy', 'Mila Robinson', 516804246, null, 143);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (572, 'Isabelle', 'Rogers', to_date('20-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Olivia Rogers', 559429017, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (573, 'Ella', 'Moore', to_date('25-09-2022', 'dd-mm-yyyy'), null, 'Joan Moore', 533661142, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (574, 'Leilani', 'Rodriguez', to_date('20-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Jordan Rodriguez', 588072382, null, 117);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (575, 'Avery', 'Clark', to_date('04-02-2019', 'dd-mm-yyyy'), null, 'Alexandra Clark', 517658922, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (576, 'Eliana', 'Lopez', to_date('18-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Brandon Lopez', 526993207, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (577, 'Leah', 'Davis', to_date('02-06-2020', 'dd-mm-yyyy'), null, 'Joseph Davis', 552418898, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (578, 'Anthony', 'Walker', to_date('13-04-2022', 'dd-mm-yyyy'), 'Peanuts', 'Olivia Walker', 567612673, null, 99);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (579, 'Nora', 'Allen', to_date('18-12-2020', 'dd-mm-yyyy'), null, 'Melanie Allen', 526119716, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (580, 'Leilani', 'Thompson', to_date('27-05-2019', 'dd-mm-yyyy'), null, 'Maya Thompson', 577660846, null, 137);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (581, 'Hannah', 'Scott', to_date('01-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Zoey Scott', 551471973, null, 39);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (582, 'Cameron', 'Young', to_date('23-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Lily Young', 558168909, null, 141);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (583, 'Sadie', 'Kim', to_date('28-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Allison Kim', 587046453, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (584, 'Delilah', 'Hernandez', to_date('06-06-2018', 'dd-mm-yyyy'), 'Dairy', 'Vivienne Hernandez', 540198348, null, 130);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (585, 'Lucas', 'Lopez', to_date('06-06-2019', 'dd-mm-yyyy'), null, 'Gianna Lopez', 515667833, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (586, 'Brooklyn', 'Allen', to_date('22-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Savannah Allen', 577653047, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (587, 'Anthony', 'Davis', to_date('16-08-2018', 'dd-mm-yyyy'), null, 'Cameron Davis', 515991972, null, 42);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (588, 'Chad', 'Cruz', to_date('29-10-2018', 'dd-mm-yyyy'), null, 'Julia Cruz', 520082502, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (589, 'David', 'Wright', to_date('03-03-2022', 'dd-mm-yyyy'), null, 'Cora Wright', 548591749, null, 93);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (590, 'Samantha', 'Hernandez', to_date('19-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Gabriella Hernandez', 548177272, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (591, 'Edward', 'Clark', to_date('15-08-2022', 'dd-mm-yyyy'), 'Peanuts', 'Piper Clark', 512682038, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (592, 'Allison', 'Lewis', to_date('10-05-2020', 'dd-mm-yyyy'), null, 'Austin Lewis', 582492328, null, 92);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (593, 'Piper', 'Moore', to_date('02-05-2020', 'dd-mm-yyyy'), null, 'Samantha Moore', 525732705, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (594, 'Anna', 'Roberts', to_date('25-09-2018', 'dd-mm-yyyy'), null, 'Jayden Roberts', 530842507, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (595, 'Adalyn', 'Taylor', to_date('29-01-2022', 'dd-mm-yyyy'), null, 'Adeline Taylor', 599187570, null, 59);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (596, 'Hazel', 'Evans', to_date('31-07-2021', 'dd-mm-yyyy'), null, 'Madilyn Evans', 529891675, null, 8);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (597, 'Aaliyah', 'Allen', to_date('22-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Piper Allen', 554417989, null, 42);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (598, 'Reagan', 'Garcia', to_date('11-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Garcia', 598025101, null, 101);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (599, 'Henry', 'Nelson', to_date('21-08-2023', 'dd-mm-yyyy'), null, 'Sloane Nelson', 587679797, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (600, 'Autumn', 'Evans', to_date('17-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Evans', 554843888, null, 91);
commit;
prompt 600 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (601, 'Joshua', 'Carter', to_date('24-09-2022', 'dd-mm-yyyy'), null, 'Justin Carter', 561777302, null, 88);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (602, 'Isaiah', 'Brown', to_date('22-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Lila Brown', 588463654, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (603, 'Aria', 'Williams', to_date('07-03-2023', 'dd-mm-yyyy'), null, 'Cora Williams', 587312013, null, 79);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (604, 'Catalina', 'Sanchez', to_date('12-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Sanchez', 523716282, null, 130);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (605, 'Gabriella', 'Allen', to_date('22-06-2018', 'dd-mm-yyyy'), null, 'Dustin Allen', 599773224, null, 25);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (606, 'Lawrence', 'Robinson', to_date('14-07-2021', 'dd-mm-yyyy'), null, 'Leonardo Robinson', 542244037, null, 68);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (607, 'Nathan', 'Hernandez', to_date('11-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Chloe Hernandez', 583243421, null, 39);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (608, 'Taylor', 'Smith', to_date('01-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Clara Smith', 588354344, null, 36);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (609, 'Jonathan', 'Moore', to_date('26-04-2020', 'dd-mm-yyyy'), null, 'Alan Moore', 574490594, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (610, 'Eva', 'Sanchez', to_date('07-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Jack Sanchez', 599516522, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (611, 'Brianna', 'Lopez', to_date('01-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Caleb Lopez', 571746241, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (612, 'Claire', 'Lee', to_date('07-06-2021', 'dd-mm-yyyy'), null, 'Aurora Lee', 520854657, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (613, 'Cameron', 'Garcia', to_date('01-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Everly Garcia', 542045620, null, 71);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (614, 'Henry', 'Hernandez', to_date('18-10-2018', 'dd-mm-yyyy'), null, 'Arabella Hernandez', 557597032, null, 28);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (615, 'Lila', 'Moore', to_date('30-07-2020', 'dd-mm-yyyy'), null, 'Claire Moore', 571134822, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (616, 'Jesse', 'Robinson', to_date('15-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Jonathan Robinson', 575911656, null, 33);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (617, 'Natalie', 'Hernandez', to_date('17-12-2021', 'dd-mm-yyyy'), null, 'Andrea Hernandez', 550433498, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (618, 'Anthony', 'Nelson', to_date('28-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Chad Nelson', 578991936, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (619, 'Dustin', 'Carter', to_date('18-10-2022', 'dd-mm-yyyy'), 'Peanuts', 'Elena Carter', 520107809, null, 122);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (620, 'Cody', 'Clark', to_date('26-08-2022', 'dd-mm-yyyy'), null, 'Hazel Clark', 534554614, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (621, 'Aurora', 'Walker', to_date('21-11-2021', 'dd-mm-yyyy'), null, 'Lucas Walker', 565571371, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (622, 'Leah', 'Garcia', to_date('19-05-2020', 'dd-mm-yyyy'), null, 'Ezekiel Garcia', 523681128, null, 27);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (623, 'Antonio', 'Garcia', to_date('08-03-2023', 'dd-mm-yyyy'), null, 'Josephine Garcia', 551076076, null, 107);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (624, 'Vivienne', 'Williams', to_date('07-01-2022', 'dd-mm-yyyy'), 'Dairy', 'Bailey Williams', 524114967, null, 35);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (625, 'Keira', 'Clark', to_date('26-09-2018', 'dd-mm-yyyy'), null, 'Kinsley Clark', 583902230, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (626, 'Keira', 'Cruz', to_date('21-09-2022', 'dd-mm-yyyy'), null, 'Isaiah Cruz', 539439900, null, 32);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (627, 'Skylar', 'Nelson', to_date('06-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Sloane Nelson', 540364597, null, 118);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (628, 'Dylan', 'Miller', to_date('13-03-2019', 'dd-mm-yyyy'), 'Gluten', 'Gregory Miller', 541925194, null, 45);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (629, 'Nora', 'Lopez', to_date('08-08-2019', 'dd-mm-yyyy'), null, 'Daniel Lopez', 537182821, null, 102);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (630, 'Bailey', 'Thomas', to_date('03-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Elena Thomas', 511359084, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (631, 'Sloane', 'Lopez', to_date('27-04-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Lopez', 564868683, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (632, 'Chad', 'Evans', to_date('14-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Anthony Evans', 531135702, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (633, 'Violet', 'Campbell', to_date('15-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Campbell', 523848478, null, 110);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (634, 'Alice', 'Lee', to_date('27-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Jacob Lee', 596542065, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (635, 'Lucy', 'Moore', to_date('12-10-2023', 'dd-mm-yyyy'), null, 'Ava Moore', 568501898, null, 9);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (636, 'Isaiah', 'Jones', to_date('06-08-2018', 'dd-mm-yyyy'), 'Peanuts', 'Hannah Jones', 562468433, null, 65);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (637, 'Juan', 'Nelson', to_date('28-09-2020', 'dd-mm-yyyy'), 'Gluten', 'Zoey Nelson', 522823206, null, 142);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (638, 'Cora', 'Sanchez', to_date('25-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Juliet Sanchez', 574742174, null, 75);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (639, 'Sophia', 'Sanchez', to_date('17-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Lola Sanchez', 597753559, null, 76);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (640, 'Isaiah', 'Thompson', to_date('04-10-2023', 'dd-mm-yyyy'), null, 'Lillian Thompson', 512883900, null, 58);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (641, 'Dustin', 'Lee', to_date('25-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Madison Lee', 530911364, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (642, 'Juan', 'King', to_date('01-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'David King', 518256808, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (643, 'Dustin', 'Wilson', to_date('12-07-2018', 'dd-mm-yyyy'), null, 'Joseph Wilson', 589558609, null, 98);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (644, 'Vivienne', 'Evans', to_date('18-01-2018', 'dd-mm-yyyy'), null, 'Gianna Evans', 552546833, null, 46);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (645, 'Jonathan', 'Lopez', to_date('11-04-2021', 'dd-mm-yyyy'), null, 'Olivia Lopez', 535228153, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (646, 'Caroline', 'Scott', to_date('01-10-2020', 'dd-mm-yyyy'), 'Dairy', 'Henry Scott', 569203857, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (647, 'Isla', 'Allen', to_date('15-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Callie Allen', 545762532, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (648, 'Nora', 'Davis', to_date('23-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'George Davis', 523834095, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (649, 'Felipe', 'Moore', to_date('28-08-2023', 'dd-mm-yyyy'), null, 'Scarlett Moore', 559904494, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (650, 'Lily', 'Young', to_date('22-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Jasmine Young', 554481990, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (651, 'Gregory', 'Nelson', to_date('01-12-2019', 'dd-mm-yyyy'), null, 'Amelia Nelson', 556335255, null, 150);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (652, 'Evelyn', 'Garcia', to_date('29-07-2020', 'dd-mm-yyyy'), 'Dairy', 'Quinn Garcia', 568940114, null, 16);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (653, 'Alexis', 'Campbell', to_date('27-12-2020', 'dd-mm-yyyy'), null, 'Jordan Campbell', 555023396, null, 3);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (654, 'Keith', 'Diaz', to_date('11-07-2023', 'dd-mm-yyyy'), null, 'Cole Diaz', 553404738, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (655, 'Andrew', 'Lopez', to_date('26-02-2021', 'dd-mm-yyyy'), null, 'Eden Lopez', 558004193, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (656, 'Genevieve', 'Ramirez', to_date('23-10-2019', 'dd-mm-yyyy'), null, 'Natalie Ramirez', 565672100, null, 60);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (657, 'Lillian', 'Davis', to_date('16-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Jonathan Davis', 510614731, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (658, 'Isabelle', 'Nguyen', to_date('28-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Jonathan Nguyen', 589320897, null, 24);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (659, 'Henry', 'Rogers', to_date('20-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Addison Rogers', 571978640, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (660, 'Chloe', 'Garcia', to_date('28-11-2023', 'dd-mm-yyyy'), null, 'Derek Garcia', 563056508, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (661, 'Madison', 'Allen', to_date('13-04-2018', 'dd-mm-yyyy'), null, 'Anthony Allen', 511761380, null, 53);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (662, 'George', 'Robinson', to_date('02-05-2019', 'dd-mm-yyyy'), null, 'Douglas Robinson', 524777503, null, 53);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (663, 'Gabriella', 'Walker', to_date('27-12-2018', 'dd-mm-yyyy'), null, 'Miguel Walker', 579839183, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (664, 'Eden', 'Allen', to_date('11-08-2020', 'dd-mm-yyyy'), 'Peanuts', 'Alice Allen', 590925510, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (665, 'Serenity', 'Mitchell', to_date('21-04-2021', 'dd-mm-yyyy'), 'Peanuts', 'Skylar Mitchell', 583931611, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (666, 'Madelyn', 'Allen', to_date('30-08-2020', 'dd-mm-yyyy'), 'Peanuts', 'Brielle Allen', 597688730, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (667, 'Daisy', 'Adams', to_date('24-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Aaliyah Adams', 556669124, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (668, 'Lillian', 'Lopez', to_date('10-08-2019', 'dd-mm-yyyy'), null, 'Adam Lopez', 567054683, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (669, 'Henry', 'Lee', to_date('05-01-2023', 'dd-mm-yyyy'), null, 'Caroline Lee', 583118597, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (670, 'Juliet', 'Moore', to_date('13-08-2020', 'dd-mm-yyyy'), 'Dairy', 'Isabella Moore', 597318941, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (671, 'John', 'Thompson', to_date('05-04-2020', 'dd-mm-yyyy'), null, 'Melanie Thompson', 510219075, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (672, 'Luna', 'Thomas', to_date('20-08-2023', 'dd-mm-yyyy'), 'Dairy', 'Eden Thomas', 567387124, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (673, 'David', 'Nguyen', to_date('24-10-2022', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Nguyen', 560461856, null, 62);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (674, 'Eva', 'Clark', to_date('05-08-2020', 'dd-mm-yyyy'), 'Gluten', 'Brielle Clark', 556352351, null, 86);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (675, 'Chloe', 'Wilson', to_date('27-01-2020', 'dd-mm-yyyy'), null, 'Ellie Wilson', 570099660, null, 45);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (676, 'Douglas', 'Walker', to_date('15-01-2023', 'dd-mm-yyyy'), null, 'Alexis Walker', 543327062, null, 51);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (677, 'Christopher', 'Watson', to_date('28-12-2022', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Watson', 515139839, null, 143);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (678, 'Delilah', 'Moore', to_date('10-02-2020', 'dd-mm-yyyy'), 'Dairy', 'Maya Moore', 510408518, null, 19);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (679, 'Lillian', 'Davis', to_date('17-06-2021', 'dd-mm-yyyy'), 'Dairy', 'Nathan Davis', 545768481, null, 40);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (680, 'Joshua', 'Allen', to_date('11-01-2022', 'dd-mm-yyyy'), null, 'Aaron Allen', 533779820, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (681, 'Ezekiel', 'Rodriguez', to_date('12-10-2018', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Rodriguez', 544323729, null, 132);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (682, 'Savannah', 'Thompson', to_date('17-07-2020', 'dd-mm-yyyy'), 'Gluten', 'Brielle Thompson', 595584090, null, 128);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (683, 'Elena', 'Clark', to_date('21-02-2019', 'dd-mm-yyyy'), null, 'Violet Clark', 547386942, null, 41);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (684, 'Kaitlyn', 'Hernandez', to_date('02-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Ethan Hernandez', 558220451, null, 90);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (685, 'Adam', 'Nguyen', to_date('08-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Alan Nguyen', 593904398, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (686, 'Sophia', 'Allen', to_date('27-06-2021', 'dd-mm-yyyy'), 'Dairy', 'Lawrence Allen', 521450074, null, 91);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (687, 'Benjamin', 'Roy', to_date('23-02-2023', 'dd-mm-yyyy'), 'Dairy', 'Amaya Roy', 571088165, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (688, 'Everly', 'Carter', to_date('08-09-2018', 'dd-mm-yyyy'), null, 'Hope Carter', 526613506, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (689, 'Sophia', 'Robinson', to_date('01-01-2022', 'dd-mm-yyyy'), 'Gluten', 'Dylan Robinson', 556608833, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (690, 'Madison', 'Smith', to_date('11-04-2020', 'dd-mm-yyyy'), null, 'Vivian Smith', 558693562, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (691, 'Gregory', 'Wilson', to_date('11-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Arabella Wilson', 580624509, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (692, 'Chloe', 'Wilson', to_date('03-07-2020', 'dd-mm-yyyy'), null, 'Isaiah Wilson', 584213398, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (693, 'Leilani', 'Brown', to_date('28-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Sloane Brown', 553788572, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (694, 'Aurora', 'Young', to_date('05-11-2023', 'dd-mm-yyyy'), null, 'Willow Young', 522460390, null, 65);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (695, 'Kaitlyn', 'Carter', to_date('23-09-2019', 'dd-mm-yyyy'), 'Dairy', 'David Carter', 570516958, null, 48);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (696, 'Emery', 'Young', to_date('26-07-2022', 'dd-mm-yyyy'), null, 'Rosalie Young', 541634495, null, 78);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (697, 'Justin', 'Clark', to_date('19-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Julia Clark', 557843191, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (698, 'Brianna', 'Young', to_date('25-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Young', 519585550, null, 139);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (699, 'Willow', 'Smith', to_date('13-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Isaiah Smith', 594048435, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (700, 'Isaiah', 'Rodriguez', to_date('07-11-2018', 'dd-mm-yyyy'), null, 'Isaac Rodriguez', 577415946, null, 56);
commit;
prompt 700 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (701, 'Albert', 'Lee', to_date('05-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Eden Lee', 541027876, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (702, 'Joan', 'Garcia', to_date('14-05-2019', 'dd-mm-yyyy'), null, 'Derek Garcia', 575277786, null, 96);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (703, 'Hannah', 'Lewis', to_date('13-12-2020', 'dd-mm-yyyy'), 'Gluten', 'Callie Lewis', 596896650, null, 81);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (704, 'Amelia', 'Rodriguez', to_date('25-11-2018', 'dd-mm-yyyy'), null, 'Aurora Rodriguez', 567178237, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (705, 'Leonardo', 'Jones', to_date('01-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Layla Jones', 575086506, null, 95);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (706, 'Sadie', 'Watson', to_date('20-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Kevin Watson', 587400513, null, 100);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (707, 'Alaina', 'Hall', to_date('15-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Bella Hall', 587103254, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (708, 'Quinn', 'Davis', to_date('24-10-2020', 'dd-mm-yyyy'), null, 'Eva Davis', 570132215, null, 72);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (709, 'Albert', 'Moore', to_date('16-07-2018', 'dd-mm-yyyy'), null, 'Samantha Moore', 522025110, null, 82);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (710, 'Javier', 'Lopez', to_date('20-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Hazel Lopez', 571522290, null, 64);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (711, 'Leilani', 'Thomas', to_date('04-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Delilah Thomas', 573756558, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (712, 'Dennis', 'Williams', to_date('01-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Hannah Williams', 539560187, null, 138);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (713, 'Benjamin', 'King', to_date('28-11-2023', 'dd-mm-yyyy'), null, 'Ava King', 584601823, null, 52);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (714, 'Jordan', 'Hernandez', to_date('28-01-2020', 'dd-mm-yyyy'), null, 'Millie Hernandez', 538128684, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (715, 'Aaron', 'Davis', to_date('25-07-2019', 'dd-mm-yyyy'), 'Dairy', 'Josephine Davis', 552677540, null, 98);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (716, 'Clara', 'Wright', to_date('12-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Benjamin Wright', 579764863, null, 53);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (717, 'Adalyn', 'Davis', to_date('01-08-2023', 'dd-mm-yyyy'), 'Dairy', 'Jacob Davis', 597297557, null, 63);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (718, 'Charlotte', 'Green', to_date('14-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Felipe Green', 522032236, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (719, 'David', 'Johnson', to_date('07-02-2023', 'dd-mm-yyyy'), 'Gluten', 'Alaina Johnson', 538242802, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (720, 'Arabella', 'Taylor', to_date('19-03-2018', 'dd-mm-yyyy'), null, 'Quinn Taylor', 529052596, null, 38);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (721, 'Javier', 'Garcia', to_date('24-03-2018', 'dd-mm-yyyy'), 'Dairy', 'Allison Garcia', 549635635, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (722, 'Adam', 'Kim', to_date('19-02-2022', 'dd-mm-yyyy'), null, 'Ella Kim', 572835254, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (723, 'Rylee', 'Williams', to_date('27-08-2023', 'dd-mm-yyyy'), null, 'Scarlett Williams', 553562760, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (724, 'Adalyn', 'Nelson', to_date('23-11-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabella Nelson', 528809218, null, 67);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (725, 'Charles', 'Allen', to_date('09-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Douglas Allen', 565769931, null, 106);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (726, 'Antonio', 'Garcia', to_date('03-03-2019', 'dd-mm-yyyy'), null, 'Gabriel Garcia', 568027178, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (727, 'Jade', 'Mitchell', to_date('10-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Mitchell', 526803571, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (728, 'Catalina', 'Nelson', to_date('05-12-2019', 'dd-mm-yyyy'), null, 'Antonio Nelson', 556170272, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (729, 'Kennedy', 'Miller', to_date('09-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Miller', 527195525, null, 89);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (730, 'Kennedy', 'Rogers', to_date('07-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Gregory Rogers', 589218583, null, 94);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (731, 'Chloe', 'Johnson', to_date('02-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Austin Johnson', 544464441, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (732, 'Juan', 'Wright', to_date('20-06-2019', 'dd-mm-yyyy'), 'Dairy', 'Reagan Wright', 564878785, null, 43);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (733, 'Dennis', 'Rogers', to_date('06-09-2023', 'dd-mm-yyyy'), null, 'Benjamin Rogers', 571201255, null, 60);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (734, 'Ruby', 'Martinez', to_date('01-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Eliza Martinez', 596851840, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (735, 'Brianna', 'Diaz', to_date('10-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Eliana Diaz', 516628526, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (736, 'Evelyn', 'Lopez', to_date('16-09-2023', 'dd-mm-yyyy'), null, 'Willow Lopez', 548957130, null, 73);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (737, 'Joseph', 'Garcia', to_date('26-06-2022', 'dd-mm-yyyy'), 'Gluten', 'Leonardo Garcia', 597341129, null, 148);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (738, 'Everly', 'Rogers', to_date('16-09-2021', 'dd-mm-yyyy'), null, 'Juliet Rogers', 589578943, null, 89);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (739, 'Kaylee', 'Moore', to_date('05-06-2018', 'dd-mm-yyyy'), 'Peanuts', 'Gianna Moore', 546811506, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (740, 'Ivy', 'Nguyen', to_date('19-11-2019', 'dd-mm-yyyy'), 'Gluten', 'Teagan Nguyen', 518396629, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (741, 'Keira', 'Lee', to_date('12-04-2019', 'dd-mm-yyyy'), null, 'Taylor Lee', 537390208, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (742, 'Callie', 'Cruz', to_date('08-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Luna Cruz', 516188935, null, 18);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (743, 'Aubrey', 'Moore', to_date('31-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Cole Moore', 573180758, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (744, 'Diego', 'Rogers', to_date('19-11-2023', 'dd-mm-yyyy'), null, 'Juliet Rogers', 542575530, null, 3);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (745, 'Brianna', 'Walker', to_date('16-01-2023', 'dd-mm-yyyy'), null, 'Adeline Walker', 555276489, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (746, 'Delilah', 'Lopez', to_date('23-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Layla Lopez', 586283874, null, 128);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (747, 'Teagan', 'Moore', to_date('19-09-2018', 'dd-mm-yyyy'), 'Dairy', 'Keith Moore', 542036540, null, 55);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (748, 'Adam', 'Hall', to_date('01-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Hall', 517421636, null, 57);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (749, 'Reagan', 'Adams', to_date('30-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Peyton Adams', 571972845, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (750, 'Elena', 'Nelson', to_date('26-03-2018', 'dd-mm-yyyy'), null, 'Ellie Nelson', 562877351, null, 50);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (751, 'Layla', 'Scott', to_date('15-10-2020', 'dd-mm-yyyy'), 'Gluten', 'Nicole Scott', 575200242, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (752, 'Alan', 'Anderson', to_date('07-10-2022', 'dd-mm-yyyy'), 'Peanuts', 'Millie Anderson', 578905527, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (753, 'Madison', 'Young', to_date('17-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Young', 535149526, null, 143);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (754, 'Taylor', 'Allen', to_date('01-12-2021', 'dd-mm-yyyy'), 'Gluten', 'Harold Allen', 553633251, null, 125);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (755, 'Genevieve', 'Wilson', to_date('06-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Willow Wilson', 546491800, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (756, 'Hazel', 'Lewis', to_date('06-04-2018', 'dd-mm-yyyy'), 'Dairy', 'Jasmine Lewis', 578190592, null, 90);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (757, 'Dustin', 'Allen', to_date('01-06-2023', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Allen', 569005730, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (758, 'Eric', 'Moore', to_date('14-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Julia Moore', 526821995, null, 142);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (759, 'Diego', 'Robinson', to_date('18-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Stella Robinson', 587013183, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (760, 'Evelyn', 'Nguyen', to_date('27-07-2021', 'dd-mm-yyyy'), null, 'Douglas Nguyen', 539640058, null, 49);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (761, 'Harper', 'Wright', to_date('21-06-2020', 'dd-mm-yyyy'), null, 'Ava Wright', 563301783, null, 95);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (762, 'Stella', 'Phillips', to_date('23-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Leah Phillips', 592387919, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (763, 'Avery', 'Moore', to_date('07-08-2018', 'dd-mm-yyyy'), null, 'Nicole Moore', 599549260, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (764, 'Gianna', 'Thompson', to_date('21-12-2023', 'dd-mm-yyyy'), null, 'Ezekiel Thompson', 520085268, null, 61);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (765, 'Sophie', 'Taylor', to_date('01-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Valentina Taylor', 591390039, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (766, 'Avery', 'Anderson', to_date('09-12-2020', 'dd-mm-yyyy'), null, 'Gracie Anderson', 540910488, null, 21);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (767, 'Clara', 'Mitchell', to_date('27-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Julia Mitchell', 545751050, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (768, 'Addison', 'Mitchell', to_date('09-05-2019', 'dd-mm-yyyy'), null, 'Rose Mitchell', 528079427, null, 29);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (769, 'Brooklyn', 'Rodriguez', to_date('21-07-2018', 'dd-mm-yyyy'), null, 'Madilyn Rodriguez', 561897400, null, 58);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (770, 'Ava', 'Miller', to_date('07-02-2020', 'dd-mm-yyyy'), null, 'Sarah Miller', 575067043, null, 96);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (771, 'Adalyn', 'Brown', to_date('08-02-2018', 'dd-mm-yyyy'), null, 'Jade Brown', 591270389, null, 5);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (772, 'Luna', 'Garcia', to_date('26-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Allison Garcia', 522691087, null, 42);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (773, 'Amaya', 'Young', to_date('25-07-2020', 'dd-mm-yyyy'), null, 'Lillian Young', 592058733, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (774, 'Luke', 'Walker', to_date('16-04-2019', 'dd-mm-yyyy'), null, 'Joshua Walker', 570646001, null, 89);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (775, 'Valentina', 'Robinson', to_date('27-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Isaac Robinson', 549161211, null, 66);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (776, 'Brian', 'Jones', to_date('03-06-2021', 'dd-mm-yyyy'), 'Gluten', 'Claire Jones', 560467335, null, 119);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (777, 'Addison', 'Cruz', to_date('13-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Vivian Cruz', 515067737, null, 145);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (778, 'Gregory', 'Wright', to_date('17-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Douglas Wright', 539239445, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (779, 'Justin', 'Davis', to_date('28-03-2019', 'dd-mm-yyyy'), 'Peanuts', 'Stella Davis', 511187879, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (780, 'Eliana', 'Scott', to_date('23-01-2022', 'dd-mm-yyyy'), null, 'Athena Scott', 580605324, null, 45);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (781, 'Rosalie', 'Rogers', to_date('25-11-2019', 'dd-mm-yyyy'), null, 'Cora Rogers', 583535602, null, 80);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (782, 'Alice', 'Allen', to_date('14-01-2022', 'dd-mm-yyyy'), null, 'Eliza Allen', 561877915, null, 107);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (783, 'Daisy', 'Mitchell', to_date('21-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Lillian Mitchell', 576382554, null, 23);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (784, 'Kyle', 'Nelson', to_date('08-06-2019', 'dd-mm-yyyy'), null, 'Chad Nelson', 546445295, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (785, 'Ellie', 'Rodriguez', to_date('26-11-2020', 'dd-mm-yyyy'), 'Dairy', 'Lila Rodriguez', 588839878, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (786, 'Aubrey', 'Rodriguez', to_date('08-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Alexis Rodriguez', 569423896, null, 56);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (787, 'Caroline', 'Wright', to_date('23-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Willow Wright', 523409258, null, 15);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (788, 'Brooklyn', 'Allen', to_date('06-03-2023', 'dd-mm-yyyy'), null, 'Ellie Allen', 523126520, null, 6);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (789, 'Alice', 'Allen', to_date('07-01-2022', 'dd-mm-yyyy'), 'Dairy', 'Andrew Allen', 530876686, null, 28);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (790, 'Adrian', 'Wright', to_date('03-11-2023', 'dd-mm-yyyy'), null, 'Peyton Wright', 559403965, null, 83);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (791, 'Aurora', 'Harris', to_date('07-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Paisley Harris', 581055223, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (792, 'Isaiah', 'Garcia', to_date('30-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Teagan Garcia', 569307774, null, 31);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (793, 'Evelyn', 'Lopez', to_date('22-10-2018', 'dd-mm-yyyy'), 'Peanuts', 'Javier Lopez', 567472364, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (794, 'Lola', 'Young', to_date('13-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Kevin Young', 534402994, null, 30);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (795, 'Paisley', 'Allen', to_date('07-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Keith Allen', 529883841, null, 148);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (796, 'Gianna', 'Miller', to_date('18-01-2019', 'dd-mm-yyyy'), null, 'Miguel Miller', 551828863, null, 39);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (797, 'Lily', 'Lopez', to_date('11-04-2018', 'dd-mm-yyyy'), null, 'Caroline Lopez', 596264733, null, 117);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (798, 'Hazel', 'Garcia', to_date('03-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Juliet Garcia', 564156636, null, 8);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (799, 'Juan', 'Green', to_date('20-09-2020', 'dd-mm-yyyy'), 'Peanuts', 'Gianna Green', 557281659, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, kindergartenid)
values (800, 'Luna', 'Ramirez', to_date('25-08-2022', 'dd-mm-yyyy'), null, 'Daniel Ramirez', 515162918, null, 14);
commit;
prompt 800 records loaded
prompt Loading REGISTRATION...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (100, to_date('26-11-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 1, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (101, to_date('24-03-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 2, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (102, to_date('15-04-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 3, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (103, to_date('05-07-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 4, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (104, to_date('16-10-2020', 'dd-mm-yyyy'), 'english', 'pending', 5, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (105, to_date('08-07-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 6, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (106, to_date('14-04-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 7, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (107, to_date('11-08-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 8, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (108, to_date('23-01-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 9, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (109, to_date('13-06-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 10, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (110, to_date('30-12-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 11, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (111, to_date('14-09-2023', 'dd-mm-yyyy'), 'russian', 'pending', 12, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (112, to_date('22-04-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 13, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (113, to_date('24-06-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 14, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (114, to_date('25-03-2023', 'dd-mm-yyyy'), 'english', 'accepted', 15, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (115, to_date('24-08-2021', 'dd-mm-yyyy'), 'russian', 'pending', 16, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (116, to_date('08-06-2021', 'dd-mm-yyyy'), 'russian', 'pending', 17, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (117, to_date('27-11-2019', 'dd-mm-yyyy'), 'english', 'rejected', 18, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (118, to_date('21-04-2023', 'dd-mm-yyyy'), 'english', 'rejected', 19, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (119, to_date('21-09-2020', 'dd-mm-yyyy'), 'english', 'rejected', 20, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (120, to_date('21-12-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 21, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (121, to_date('20-01-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 22, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (122, to_date('27-03-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 23, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (123, to_date('07-11-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 24, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (124, to_date('24-03-2021', 'dd-mm-yyyy'), 'english', 'rejected', 25, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (125, to_date('17-06-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 26, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (126, to_date('07-12-2021', 'dd-mm-yyyy'), 'russian', 'pending', 27, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (127, to_date('29-09-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 28, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (128, to_date('02-07-2019', 'dd-mm-yyyy'), 'english', 'accepted', 29, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (129, to_date('29-01-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 30, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (130, to_date('17-05-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 31, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (131, to_date('15-02-2020', 'dd-mm-yyyy'), 'russian', 'pending', 32, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (132, to_date('02-04-2019', 'dd-mm-yyyy'), 'english', 'rejected', 33, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (133, to_date('09-06-2020', 'dd-mm-yyyy'), 'russian', 'pending', 34, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (134, to_date('22-10-2023', 'dd-mm-yyyy'), 'russian', 'pending', 35, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (135, to_date('19-11-2021', 'dd-mm-yyyy'), 'russian', 'pending', 36, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (136, to_date('20-04-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 37, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (137, to_date('09-11-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 38, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (138, to_date('04-12-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 39, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (139, to_date('23-04-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 40, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (140, to_date('06-01-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 41, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (141, to_date('11-08-2020', 'dd-mm-yyyy'), 'english', 'accepted', 42, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (142, to_date('21-01-2020', 'dd-mm-yyyy'), 'russian', 'pending', 43, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (143, to_date('22-03-2023', 'dd-mm-yyyy'), 'english', 'accepted', 44, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (144, to_date('28-06-2020', 'dd-mm-yyyy'), 'english', 'accepted', 45, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (145, to_date('19-02-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 46, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (146, to_date('11-05-2021', 'dd-mm-yyyy'), 'english', 'accepted', 47, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (147, to_date('15-03-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 48, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (148, to_date('27-09-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 49, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (149, to_date('16-03-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 50, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (150, to_date('03-01-2020', 'dd-mm-yyyy'), 'english', 'rejected', 51, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (151, to_date('11-10-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 52, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (152, to_date('21-11-2023', 'dd-mm-yyyy'), 'english', 'pending', 53, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (153, to_date('14-02-2019', 'dd-mm-yyyy'), 'english', 'accepted', 54, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (154, to_date('14-05-2023', 'dd-mm-yyyy'), 'english', 'rejected', 55, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (155, to_date('27-07-2021', 'dd-mm-yyyy'), 'english', 'rejected', 56, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (156, to_date('07-05-2021', 'dd-mm-yyyy'), 'english', 'rejected', 57, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (157, to_date('26-11-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 58, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (158, to_date('12-03-2021', 'dd-mm-yyyy'), 'english', 'pending', 59, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (159, to_date('14-07-2022', 'dd-mm-yyyy'), 'english', 'pending', 60, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (160, to_date('07-01-2023', 'dd-mm-yyyy'), 'english', 'accepted', 61, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (161, to_date('21-06-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 62, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (162, to_date('29-10-2022', 'dd-mm-yyyy'), 'english', 'pending', 63, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (163, to_date('10-02-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 64, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (164, to_date('18-06-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 65, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (165, to_date('01-11-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 66, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (166, to_date('10-05-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 67, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (167, to_date('06-06-2019', 'dd-mm-yyyy'), 'english', 'rejected', 68, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (168, to_date('06-02-2019', 'dd-mm-yyyy'), 'english', 'accepted', 69, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (169, to_date('16-04-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 70, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (170, to_date('29-10-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 71, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (171, to_date('27-06-2020', 'dd-mm-yyyy'), 'english', 'pending', 72, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (172, to_date('27-05-2020', 'dd-mm-yyyy'), 'english', 'pending', 73, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (173, to_date('04-08-2019', 'dd-mm-yyyy'), 'english', 'rejected', 74, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (174, to_date('06-06-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 75, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (175, to_date('06-05-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 76, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (176, to_date('25-01-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 77, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (177, to_date('23-02-2020', 'dd-mm-yyyy'), 'english', 'rejected', 78, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (178, to_date('31-08-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 79, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (179, to_date('24-04-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 80, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (180, to_date('17-03-2020', 'dd-mm-yyyy'), 'russian', 'pending', 81, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (181, to_date('17-03-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 82, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (182, to_date('23-07-2020', 'dd-mm-yyyy'), 'english', 'accepted', 83, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (183, to_date('16-02-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 84, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (184, to_date('19-07-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 85, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (185, to_date('19-01-2019', 'dd-mm-yyyy'), 'english', 'accepted', 86, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (186, to_date('31-10-2022', 'dd-mm-yyyy'), 'english', 'rejected', 87, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (187, to_date('27-02-2020', 'dd-mm-yyyy'), 'english', 'accepted', 88, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (188, to_date('09-08-2020', 'dd-mm-yyyy'), 'english', 'pending', 89, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (189, to_date('06-03-2019', 'dd-mm-yyyy'), 'english', 'pending', 90, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (190, to_date('03-02-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 91, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (191, to_date('27-07-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 92, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (192, to_date('17-11-2021', 'dd-mm-yyyy'), 'english', 'rejected', 93, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (193, to_date('24-06-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 94, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (194, to_date('10-01-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 95, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (195, to_date('14-07-2023', 'dd-mm-yyyy'), 'russian', 'pending', 96, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (196, to_date('13-01-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 97, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (197, to_date('12-06-2022', 'dd-mm-yyyy'), 'english', 'rejected', 98, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (198, to_date('30-07-2023', 'dd-mm-yyyy'), 'english', 'accepted', 99, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (199, to_date('30-05-2020', 'dd-mm-yyyy'), 'english', 'pending', 100, 123);
commit;
prompt 100 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (200, to_date('03-02-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 101, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (201, to_date('07-05-2019', 'dd-mm-yyyy'), 'english', 'pending', 102, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (202, to_date('23-02-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 103, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (203, to_date('02-12-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 104, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (204, to_date('18-08-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 105, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (205, to_date('31-05-2022', 'dd-mm-yyyy'), 'english', 'pending', 106, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (206, to_date('07-10-2019', 'dd-mm-yyyy'), 'english', 'pending', 107, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (207, to_date('10-05-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 108, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (208, to_date('08-12-2020', 'dd-mm-yyyy'), 'russian', 'pending', 109, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (209, to_date('12-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 110, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (210, to_date('19-04-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 111, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (211, to_date('30-09-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 112, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (212, to_date('27-03-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 113, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (213, to_date('06-12-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 114, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (214, to_date('13-08-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 115, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (215, to_date('21-01-2023', 'dd-mm-yyyy'), 'english', 'pending', 116, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (216, to_date('07-11-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 117, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (217, to_date('13-05-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 118, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (218, to_date('15-10-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 119, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (219, to_date('20-05-2019', 'dd-mm-yyyy'), 'english', 'accepted', 120, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (220, to_date('25-05-2022', 'dd-mm-yyyy'), 'english', 'pending', 121, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (221, to_date('21-04-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 122, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (222, to_date('12-04-2021', 'dd-mm-yyyy'), 'english', 'accepted', 123, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (223, to_date('14-02-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 124, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (224, to_date('24-12-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 125, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (225, to_date('15-08-2021', 'dd-mm-yyyy'), 'english', 'rejected', 126, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (226, to_date('16-02-2020', 'dd-mm-yyyy'), 'english', 'pending', 127, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (227, to_date('02-03-2021', 'dd-mm-yyyy'), 'russian', 'pending', 128, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (228, to_date('13-05-2021', 'dd-mm-yyyy'), 'english', 'rejected', 129, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (229, to_date('16-04-2023', 'dd-mm-yyyy'), 'russian', 'pending', 130, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (230, to_date('14-02-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 131, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (231, to_date('08-02-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 132, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (232, to_date('06-03-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 133, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (233, to_date('18-07-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 134, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (234, to_date('10-01-2020', 'dd-mm-yyyy'), 'english', 'accepted', 135, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (235, to_date('21-05-2023', 'dd-mm-yyyy'), 'english', 'rejected', 136, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (236, to_date('01-02-2021', 'dd-mm-yyyy'), 'english', 'rejected', 137, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (237, to_date('06-02-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 138, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (238, to_date('18-09-2023', 'dd-mm-yyyy'), 'english', 'pending', 139, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (239, to_date('10-07-2023', 'dd-mm-yyyy'), 'russian', 'pending', 140, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (240, to_date('30-12-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 141, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (241, to_date('26-04-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 142, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (242, to_date('27-05-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 143, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (243, to_date('10-04-2021', 'dd-mm-yyyy'), 'russian', 'pending', 144, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (244, to_date('22-03-2023', 'dd-mm-yyyy'), 'russian', 'pending', 145, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (245, to_date('27-05-2023', 'dd-mm-yyyy'), 'english', 'pending', 146, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (246, to_date('25-10-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 147, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (247, to_date('02-11-2022', 'dd-mm-yyyy'), 'russian', 'pending', 148, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (248, to_date('10-09-2019', 'dd-mm-yyyy'), 'english', 'accepted', 149, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (249, to_date('31-07-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 150, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (250, to_date('17-05-2020', 'dd-mm-yyyy'), 'english', 'pending', 151, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (251, to_date('10-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 152, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (252, to_date('15-02-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 153, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (253, to_date('22-04-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 154, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (254, to_date('26-05-2021', 'dd-mm-yyyy'), 'english', 'pending', 155, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (255, to_date('20-06-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 156, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (256, to_date('22-03-2019', 'dd-mm-yyyy'), 'english', 'pending', 157, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (257, to_date('06-06-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 158, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (258, to_date('09-04-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 159, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (259, to_date('14-10-2019', 'dd-mm-yyyy'), 'english', 'pending', 160, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (260, to_date('09-11-2019', 'dd-mm-yyyy'), 'english', 'accepted', 161, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (261, to_date('23-05-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 162, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (262, to_date('23-08-2021', 'dd-mm-yyyy'), 'russian', 'pending', 163, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (263, to_date('14-10-2023', 'dd-mm-yyyy'), 'russian', 'pending', 164, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (264, to_date('01-04-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 165, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (265, to_date('31-05-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 166, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (266, to_date('12-08-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 167, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (267, to_date('25-08-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 168, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (268, to_date('06-03-2021', 'dd-mm-yyyy'), 'english', 'pending', 169, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (269, to_date('04-09-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 170, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (270, to_date('02-12-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 171, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (271, to_date('13-02-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 172, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (272, to_date('22-02-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 173, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (273, to_date('12-07-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 174, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (274, to_date('16-02-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 175, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (275, to_date('03-09-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 176, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (276, to_date('25-07-2023', 'dd-mm-yyyy'), 'english', 'pending', 177, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (277, to_date('22-08-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 178, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (278, to_date('24-10-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 179, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (279, to_date('27-09-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 180, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (280, to_date('20-12-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 181, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (281, to_date('25-03-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 182, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (282, to_date('01-10-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 183, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (283, to_date('09-11-2020', 'dd-mm-yyyy'), 'english', 'rejected', 184, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (284, to_date('07-03-2022', 'dd-mm-yyyy'), 'english', 'rejected', 185, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (285, to_date('19-03-2022', 'dd-mm-yyyy'), 'english', 'accepted', 186, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (286, to_date('07-02-2021', 'dd-mm-yyyy'), 'russian', 'pending', 187, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (287, to_date('17-11-2020', 'dd-mm-yyyy'), 'english', 'pending', 188, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (288, to_date('02-07-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 189, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (289, to_date('03-06-2020', 'dd-mm-yyyy'), 'russian', 'pending', 190, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (290, to_date('12-08-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 191, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (291, to_date('27-02-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 192, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (292, to_date('25-11-2022', 'dd-mm-yyyy'), 'english', 'pending', 193, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (293, to_date('11-10-2019', 'dd-mm-yyyy'), 'english', 'rejected', 194, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (294, to_date('13-10-2019', 'dd-mm-yyyy'), 'english', 'rejected', 195, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (295, to_date('22-09-2021', 'dd-mm-yyyy'), 'english', 'accepted', 196, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (296, to_date('18-03-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 197, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (297, to_date('20-06-2021', 'dd-mm-yyyy'), 'english', 'pending', 198, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (298, to_date('22-01-2019', 'dd-mm-yyyy'), 'english', 'pending', 199, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (299, to_date('28-06-2020', 'dd-mm-yyyy'), 'english', 'pending', 200, 124);
commit;
prompt 200 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (300, to_date('20-04-2022', 'dd-mm-yyyy'), 'russian', 'pending', 201, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (301, to_date('02-03-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 202, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (302, to_date('12-01-2023', 'dd-mm-yyyy'), 'english', 'accepted', 203, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (303, to_date('01-06-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 204, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (304, to_date('11-04-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 205, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (305, to_date('07-03-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 206, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (306, to_date('16-08-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 207, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (307, to_date('18-09-2021', 'dd-mm-yyyy'), 'english', 'rejected', 208, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (308, to_date('30-08-2022', 'dd-mm-yyyy'), 'english', 'accepted', 209, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (309, to_date('03-09-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 210, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (310, to_date('03-04-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 211, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (311, to_date('14-01-2020', 'dd-mm-yyyy'), 'english', 'pending', 212, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (312, to_date('02-08-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 213, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (313, to_date('29-10-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 214, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (314, to_date('20-01-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 215, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (315, to_date('26-08-2023', 'dd-mm-yyyy'), 'english', 'pending', 216, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (316, to_date('19-12-2021', 'dd-mm-yyyy'), 'english', 'pending', 217, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (317, to_date('15-01-2022', 'dd-mm-yyyy'), 'english', 'accepted', 218, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (318, to_date('15-01-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 219, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (319, to_date('19-08-2020', 'dd-mm-yyyy'), 'english', 'accepted', 220, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (320, to_date('18-09-2023', 'dd-mm-yyyy'), 'english', 'pending', 221, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (321, to_date('14-02-2019', 'dd-mm-yyyy'), 'russian', 'pending', 222, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (322, to_date('20-04-2019', 'dd-mm-yyyy'), 'english', 'pending', 223, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (323, to_date('23-01-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 224, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (324, to_date('25-11-2023', 'dd-mm-yyyy'), 'english', 'accepted', 225, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (325, to_date('19-06-2023', 'dd-mm-yyyy'), 'russian', 'pending', 226, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (326, to_date('09-03-2020', 'dd-mm-yyyy'), 'english', 'pending', 227, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (327, to_date('15-03-2019', 'dd-mm-yyyy'), 'english', 'pending', 228, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (328, to_date('15-12-2023', 'dd-mm-yyyy'), 'russian', 'pending', 229, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (329, to_date('29-03-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 230, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (330, to_date('05-07-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 231, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (331, to_date('05-09-2020', 'dd-mm-yyyy'), 'russian', 'pending', 232, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (332, to_date('08-11-2022', 'dd-mm-yyyy'), 'english', 'accepted', 233, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (333, to_date('04-08-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 234, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (334, to_date('14-09-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 235, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (335, to_date('10-09-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 236, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (336, to_date('19-04-2019', 'dd-mm-yyyy'), 'russian', 'pending', 237, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (337, to_date('22-10-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 238, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (338, to_date('13-01-2021', 'dd-mm-yyyy'), 'english', 'pending', 239, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (339, to_date('05-03-2021', 'dd-mm-yyyy'), 'russian', 'pending', 240, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (340, to_date('01-12-2023', 'dd-mm-yyyy'), 'english', 'pending', 241, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (341, to_date('11-07-2019', 'dd-mm-yyyy'), 'english', 'accepted', 242, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (342, to_date('15-10-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 243, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (343, to_date('02-01-2023', 'dd-mm-yyyy'), 'english', 'accepted', 244, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (344, to_date('08-06-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 245, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (345, to_date('26-11-2019', 'dd-mm-yyyy'), 'english', 'pending', 246, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (346, to_date('09-06-2020', 'dd-mm-yyyy'), 'english', 'pending', 247, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (347, to_date('06-03-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 248, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (348, to_date('19-11-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 249, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (349, to_date('26-10-2023', 'dd-mm-yyyy'), 'russian', 'pending', 250, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (350, to_date('08-11-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 251, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (351, to_date('31-12-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 252, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (352, to_date('06-10-2022', 'dd-mm-yyyy'), 'russian', 'pending', 253, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (353, to_date('20-01-2021', 'dd-mm-yyyy'), 'russian', 'pending', 254, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (354, to_date('23-06-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 255, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (355, to_date('10-04-2019', 'dd-mm-yyyy'), 'russian', 'pending', 256, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (356, to_date('03-04-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 257, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (357, to_date('26-06-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 258, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (358, to_date('06-07-2022', 'dd-mm-yyyy'), 'english', 'pending', 259, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (359, to_date('25-06-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 260, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (360, to_date('21-05-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 261, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (361, to_date('02-04-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 262, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (362, to_date('11-02-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 263, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (363, to_date('28-12-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 264, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (364, to_date('26-03-2021', 'dd-mm-yyyy'), 'english', 'accepted', 265, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (365, to_date('23-12-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 266, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (366, to_date('30-07-2023', 'dd-mm-yyyy'), 'english', 'rejected', 267, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (367, to_date('20-03-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 268, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (368, to_date('06-02-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 269, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (369, to_date('05-12-2022', 'dd-mm-yyyy'), 'english', 'pending', 270, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (370, to_date('08-07-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 271, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (371, to_date('28-10-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 272, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (372, to_date('20-09-2020', 'dd-mm-yyyy'), 'english', 'rejected', 273, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (373, to_date('20-03-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 274, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (374, to_date('24-01-2020', 'dd-mm-yyyy'), 'english', 'accepted', 275, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (375, to_date('30-11-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 276, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (376, to_date('02-06-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 277, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (377, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 278, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (378, to_date('20-01-2020', 'dd-mm-yyyy'), 'english', 'accepted', 279, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (379, to_date('19-03-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 280, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (380, to_date('29-04-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 281, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (381, to_date('26-07-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 282, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (382, to_date('14-03-2019', 'dd-mm-yyyy'), 'english', 'pending', 283, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (383, to_date('02-04-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 284, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (384, to_date('19-07-2022', 'dd-mm-yyyy'), 'english', 'pending', 285, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (385, to_date('28-09-2022', 'dd-mm-yyyy'), 'english', 'pending', 286, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (386, to_date('19-04-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 287, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (387, to_date('23-07-2019', 'dd-mm-yyyy'), 'russian', 'pending', 288, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (388, to_date('12-05-2023', 'dd-mm-yyyy'), 'english', 'pending', 289, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (389, to_date('07-11-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 290, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (390, to_date('27-05-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 291, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (391, to_date('04-11-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 292, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (392, to_date('25-05-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 293, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (393, to_date('08-01-2023', 'dd-mm-yyyy'), 'english', 'accepted', 294, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (394, to_date('09-01-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 295, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (395, to_date('13-03-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 296, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (396, to_date('02-11-2020', 'dd-mm-yyyy'), 'english', 'pending', 297, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (397, to_date('05-05-2020', 'dd-mm-yyyy'), 'russian', 'pending', 298, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (398, to_date('20-04-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 299, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (399, to_date('06-04-2021', 'dd-mm-yyyy'), 'english', 'pending', 300, 143);
commit;
prompt 300 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (400, to_date('03-08-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 301, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (401, to_date('24-01-2020', 'dd-mm-yyyy'), 'russian', 'pending', 302, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (402, to_date('18-03-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 303, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (403, to_date('09-06-2022', 'dd-mm-yyyy'), 'english', 'pending', 304, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (404, to_date('23-06-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 305, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (405, to_date('08-10-2022', 'dd-mm-yyyy'), 'english', 'pending', 306, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (406, to_date('24-09-2022', 'dd-mm-yyyy'), 'english', 'accepted', 307, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (407, to_date('17-01-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 308, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (408, to_date('08-06-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 309, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (409, to_date('29-07-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 310, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (410, to_date('16-01-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 311, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (411, to_date('14-07-2023', 'dd-mm-yyyy'), 'english', 'pending', 312, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (412, to_date('11-09-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 313, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (413, to_date('24-04-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 314, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (414, to_date('20-09-2023', 'dd-mm-yyyy'), 'english', 'rejected', 315, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (415, to_date('30-08-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 316, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (416, to_date('18-12-2023', 'dd-mm-yyyy'), 'english', 'rejected', 317, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (417, to_date('16-09-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 318, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (418, to_date('26-11-2021', 'dd-mm-yyyy'), 'english', 'pending', 319, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (419, to_date('10-09-2019', 'dd-mm-yyyy'), 'russian', 'pending', 320, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (420, to_date('13-08-2023', 'dd-mm-yyyy'), 'english', 'accepted', 321, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (421, to_date('06-08-2019', 'dd-mm-yyyy'), 'english', 'rejected', 322, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (422, to_date('04-07-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 323, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (423, to_date('22-07-2021', 'dd-mm-yyyy'), 'russian', 'pending', 324, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (424, to_date('22-11-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 325, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (425, to_date('28-01-2021', 'dd-mm-yyyy'), 'english', 'accepted', 326, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (426, to_date('20-05-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 327, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (427, to_date('26-01-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 328, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (428, to_date('26-01-2020', 'dd-mm-yyyy'), 'english', 'pending', 329, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (429, to_date('19-09-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 330, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (430, to_date('13-07-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 331, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (431, to_date('10-02-2019', 'dd-mm-yyyy'), 'english', 'pending', 332, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (432, to_date('27-08-2021', 'dd-mm-yyyy'), 'russian', 'pending', 333, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (433, to_date('28-09-2021', 'dd-mm-yyyy'), 'english', 'rejected', 334, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (434, to_date('08-04-2020', 'dd-mm-yyyy'), 'english', 'pending', 335, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (435, to_date('16-10-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 336, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (436, to_date('01-08-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 337, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (437, to_date('18-03-2022', 'dd-mm-yyyy'), 'english', 'rejected', 338, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (438, to_date('08-06-2021', 'dd-mm-yyyy'), 'english', 'pending', 339, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (439, to_date('30-08-2022', 'dd-mm-yyyy'), 'english', 'rejected', 340, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (440, to_date('20-05-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 341, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (441, to_date('21-03-2022', 'dd-mm-yyyy'), 'russian', 'pending', 342, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (442, to_date('23-07-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 343, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (443, to_date('28-11-2019', 'dd-mm-yyyy'), 'english', 'rejected', 344, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (444, to_date('21-05-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 345, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (445, to_date('26-01-2021', 'dd-mm-yyyy'), 'english', 'pending', 346, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (446, to_date('24-01-2021', 'dd-mm-yyyy'), 'english', 'pending', 347, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (447, to_date('06-07-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 348, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (448, to_date('27-11-2022', 'dd-mm-yyyy'), 'english', 'accepted', 349, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (449, to_date('23-06-2021', 'dd-mm-yyyy'), 'russian', 'pending', 350, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (450, to_date('14-06-2022', 'dd-mm-yyyy'), 'english', 'accepted', 351, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (451, to_date('14-06-2022', 'dd-mm-yyyy'), 'russian', 'pending', 352, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (452, to_date('02-06-2020', 'dd-mm-yyyy'), 'russian', 'pending', 353, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (453, to_date('27-09-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 354, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (454, to_date('22-06-2022', 'dd-mm-yyyy'), 'english', 'pending', 355, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (455, to_date('24-11-2019', 'dd-mm-yyyy'), 'english', 'rejected', 356, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (456, to_date('07-10-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 357, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (457, to_date('09-12-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 358, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (458, to_date('06-05-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 359, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (459, to_date('22-05-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 360, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (460, to_date('28-04-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 361, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (461, to_date('13-02-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 362, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (462, to_date('28-11-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 363, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (463, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 364, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (464, to_date('15-03-2022', 'dd-mm-yyyy'), 'russian', 'pending', 365, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (465, to_date('26-06-2019', 'dd-mm-yyyy'), 'english', 'accepted', 366, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (466, to_date('03-11-2021', 'dd-mm-yyyy'), 'english', 'accepted', 367, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (467, to_date('26-08-2023', 'dd-mm-yyyy'), 'english', 'rejected', 368, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (468, to_date('08-06-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 369, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (469, to_date('24-07-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 370, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (470, to_date('28-10-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 371, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (471, to_date('17-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 372, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (472, to_date('27-02-2022', 'dd-mm-yyyy'), 'english', 'accepted', 373, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (473, to_date('07-06-2023', 'dd-mm-yyyy'), 'english', 'rejected', 374, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (474, to_date('01-10-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 375, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (475, to_date('10-02-2019', 'dd-mm-yyyy'), 'english', 'rejected', 376, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (476, to_date('19-10-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 377, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (477, to_date('14-11-2020', 'dd-mm-yyyy'), 'english', 'rejected', 378, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (478, to_date('19-11-2020', 'dd-mm-yyyy'), 'russian', 'pending', 379, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (479, to_date('24-01-2019', 'dd-mm-yyyy'), 'russian', 'pending', 380, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (480, to_date('12-04-2020', 'dd-mm-yyyy'), 'english', 'rejected', 381, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (481, to_date('28-07-2021', 'dd-mm-yyyy'), 'english', 'accepted', 382, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (482, to_date('31-01-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 383, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (483, to_date('10-08-2020', 'dd-mm-yyyy'), 'english', 'rejected', 384, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (484, to_date('04-03-2022', 'dd-mm-yyyy'), 'english', 'pending', 385, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (485, to_date('22-04-2022', 'dd-mm-yyyy'), 'russian', 'pending', 386, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (486, to_date('13-12-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 387, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (487, to_date('20-02-2019', 'dd-mm-yyyy'), 'russian', 'pending', 388, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (488, to_date('01-12-2020', 'dd-mm-yyyy'), 'english', 'accepted', 389, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (489, to_date('19-02-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 390, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (490, to_date('19-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 391, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (491, to_date('03-12-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 392, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (492, to_date('30-12-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 393, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (493, to_date('31-07-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 394, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (494, to_date('30-01-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 395, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (495, to_date('14-04-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 396, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (496, to_date('15-02-2019', 'dd-mm-yyyy'), 'russian', 'pending', 397, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (497, to_date('24-10-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 398, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (498, to_date('26-01-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 399, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (499, to_date('18-10-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 400, 136);
commit;
prompt 400 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (500, to_date('07-06-2021', 'dd-mm-yyyy'), 'russian', 'pending', 401, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (501, to_date('06-11-2021', 'dd-mm-yyyy'), 'english', 'rejected', 402, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (502, to_date('20-07-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 403, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (503, to_date('19-06-2022', 'dd-mm-yyyy'), 'english', 'accepted', 404, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (504, to_date('29-08-2020', 'dd-mm-yyyy'), 'english', 'rejected', 405, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (505, to_date('27-09-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 406, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (506, to_date('06-10-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 407, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (507, to_date('02-12-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 408, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (508, to_date('03-05-2023', 'dd-mm-yyyy'), 'english', 'accepted', 409, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (509, to_date('27-09-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 410, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (510, to_date('30-10-2022', 'dd-mm-yyyy'), 'russian', 'pending', 411, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (511, to_date('06-08-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 412, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (512, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'pending', 413, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (513, to_date('07-07-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 414, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (514, to_date('12-12-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 415, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (515, to_date('08-12-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 416, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (516, to_date('08-04-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 417, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (517, to_date('26-04-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 418, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (518, to_date('02-08-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 419, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (519, to_date('22-07-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 420, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (520, to_date('30-03-2020', 'dd-mm-yyyy'), 'english', 'pending', 421, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (521, to_date('09-03-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 422, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (522, to_date('27-08-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 423, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (523, to_date('12-06-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 424, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (524, to_date('30-06-2019', 'dd-mm-yyyy'), 'english', 'accepted', 425, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (525, to_date('10-02-2022', 'dd-mm-yyyy'), 'english', 'accepted', 426, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (526, to_date('15-09-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 427, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (527, to_date('28-02-2019', 'dd-mm-yyyy'), 'russian', 'pending', 428, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (528, to_date('29-04-2023', 'dd-mm-yyyy'), 'russian', 'pending', 429, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (529, to_date('02-04-2019', 'dd-mm-yyyy'), 'russian', 'pending', 430, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (530, to_date('10-02-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 431, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (531, to_date('31-12-2021', 'dd-mm-yyyy'), 'english', 'accepted', 432, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (532, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 433, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (533, to_date('04-02-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 434, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (534, to_date('05-04-2020', 'dd-mm-yyyy'), 'russian', 'pending', 435, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (535, to_date('12-03-2019', 'dd-mm-yyyy'), 'english', 'pending', 436, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (536, to_date('15-10-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 437, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (537, to_date('30-08-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 438, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (538, to_date('30-09-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 439, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (539, to_date('06-02-2022', 'dd-mm-yyyy'), 'english', 'pending', 440, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (540, to_date('23-05-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 441, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (541, to_date('11-09-2020', 'dd-mm-yyyy'), 'english', 'accepted', 442, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (542, to_date('17-07-2021', 'dd-mm-yyyy'), 'english', 'pending', 443, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (543, to_date('21-05-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 444, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (544, to_date('26-11-2023', 'dd-mm-yyyy'), 'russian', 'pending', 445, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (545, to_date('30-10-2020', 'dd-mm-yyyy'), 'english', 'accepted', 446, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (546, to_date('14-03-2023', 'dd-mm-yyyy'), 'english', 'pending', 447, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (547, to_date('17-03-2019', 'dd-mm-yyyy'), 'english', 'rejected', 448, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (548, to_date('09-02-2019', 'dd-mm-yyyy'), 'english', 'pending', 449, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (549, to_date('20-10-2019', 'dd-mm-yyyy'), 'russian', 'pending', 450, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (550, to_date('12-01-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 451, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (551, to_date('01-06-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 452, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (552, to_date('25-08-2020', 'dd-mm-yyyy'), 'english', 'accepted', 453, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (553, to_date('12-08-2021', 'dd-mm-yyyy'), 'russian', 'pending', 454, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (554, to_date('22-04-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 455, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (555, to_date('24-09-2019', 'dd-mm-yyyy'), 'russian', 'pending', 456, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (556, to_date('16-03-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 457, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (557, to_date('29-09-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 458, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (558, to_date('03-06-2019', 'dd-mm-yyyy'), 'english', 'accepted', 459, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (559, to_date('05-12-2023', 'dd-mm-yyyy'), 'english', 'accepted', 460, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (560, to_date('12-09-2020', 'dd-mm-yyyy'), 'english', 'accepted', 461, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (561, to_date('28-04-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 462, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (562, to_date('08-02-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 463, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (563, to_date('12-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 464, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (564, to_date('19-06-2023', 'dd-mm-yyyy'), 'english', 'pending', 465, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (565, to_date('27-04-2019', 'dd-mm-yyyy'), 'english', 'accepted', 466, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (566, to_date('09-08-2019', 'dd-mm-yyyy'), 'english', 'accepted', 467, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (567, to_date('04-07-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 468, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (568, to_date('09-06-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 469, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (569, to_date('23-09-2019', 'dd-mm-yyyy'), 'russian', 'pending', 470, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (570, to_date('07-11-2023', 'dd-mm-yyyy'), 'english', 'accepted', 471, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (571, to_date('07-06-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 472, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (572, to_date('13-05-2021', 'dd-mm-yyyy'), 'english', 'rejected', 473, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (573, to_date('06-10-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 474, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (574, to_date('03-09-2021', 'dd-mm-yyyy'), 'russian', 'pending', 475, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (575, to_date('13-09-2019', 'dd-mm-yyyy'), 'english', 'pending', 476, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (576, to_date('14-12-2021', 'dd-mm-yyyy'), 'english', 'pending', 477, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (577, to_date('16-01-2023', 'dd-mm-yyyy'), 'english', 'accepted', 478, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (578, to_date('24-12-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 479, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (579, to_date('13-03-2020', 'dd-mm-yyyy'), 'english', 'rejected', 480, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (580, to_date('03-02-2021', 'dd-mm-yyyy'), 'english', 'accepted', 481, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (581, to_date('10-10-2019', 'dd-mm-yyyy'), 'english', 'pending', 482, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (582, to_date('07-12-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 483, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (583, to_date('01-01-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 484, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (584, to_date('09-01-2023', 'dd-mm-yyyy'), 'russian', 'pending', 485, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (585, to_date('11-12-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 486, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (586, to_date('24-02-2019', 'dd-mm-yyyy'), 'russian', 'pending', 487, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (587, to_date('21-07-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 488, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (588, to_date('16-07-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 489, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (589, to_date('02-07-2020', 'dd-mm-yyyy'), 'english', 'rejected', 490, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (590, to_date('18-11-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 491, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (591, to_date('10-11-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 492, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (592, to_date('23-02-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 493, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (593, to_date('21-07-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 494, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (594, to_date('18-03-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 495, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (595, to_date('03-09-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 496, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (596, to_date('17-04-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 497, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (597, to_date('19-07-2023', 'dd-mm-yyyy'), 'english', 'rejected', 498, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (598, to_date('24-03-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 499, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (599, to_date('05-09-2022', 'dd-mm-yyyy'), 'english', 'rejected', 500, 142);
commit;
prompt 500 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (600, to_date('07-07-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 501, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (601, to_date('15-06-2019', 'dd-mm-yyyy'), 'russian', 'pending', 502, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (602, to_date('22-03-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 503, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (603, to_date('08-09-2019', 'dd-mm-yyyy'), 'russian', 'pending', 504, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (604, to_date('27-08-2023', 'dd-mm-yyyy'), 'russian', 'pending', 505, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (605, to_date('18-12-2020', 'dd-mm-yyyy'), 'english', 'rejected', 506, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (606, to_date('15-11-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 507, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (607, to_date('25-10-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 508, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (608, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 509, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (609, to_date('03-09-2020', 'dd-mm-yyyy'), 'russian', 'pending', 510, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (610, to_date('11-06-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 511, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (611, to_date('05-09-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 512, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (612, to_date('13-08-2021', 'dd-mm-yyyy'), 'english', 'rejected', 513, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (613, to_date('07-04-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 514, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (614, to_date('09-12-2022', 'dd-mm-yyyy'), 'english', 'rejected', 515, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (615, to_date('29-07-2020', 'dd-mm-yyyy'), 'english', 'rejected', 516, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (616, to_date('10-04-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 517, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (617, to_date('12-09-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 518, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (618, to_date('02-05-2023', 'dd-mm-yyyy'), 'english', 'rejected', 519, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (619, to_date('06-09-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 520, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (620, to_date('19-11-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 521, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (621, to_date('29-05-2019', 'dd-mm-yyyy'), 'english', 'pending', 522, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (622, to_date('25-09-2021', 'dd-mm-yyyy'), 'english', 'rejected', 523, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (623, to_date('24-03-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 524, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (624, to_date('26-07-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 525, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (625, to_date('19-06-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 526, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (626, to_date('26-07-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 527, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (627, to_date('08-09-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 528, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (628, to_date('10-11-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 529, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (629, to_date('20-10-2021', 'dd-mm-yyyy'), 'english', 'rejected', 530, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (630, to_date('10-10-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 531, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (631, to_date('24-12-2019', 'dd-mm-yyyy'), 'russian', 'pending', 532, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (632, to_date('29-11-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 533, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (633, to_date('14-05-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 534, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (634, to_date('03-01-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 535, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (635, to_date('21-08-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 536, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (636, to_date('27-08-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 537, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (637, to_date('29-04-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 538, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (638, to_date('16-10-2019', 'dd-mm-yyyy'), 'english', 'pending', 539, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (639, to_date('02-01-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 540, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (640, to_date('06-01-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 541, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (641, to_date('31-03-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 542, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (642, to_date('24-09-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 543, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (643, to_date('04-06-2019', 'dd-mm-yyyy'), 'english', 'pending', 544, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (644, to_date('29-01-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 545, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (645, to_date('17-04-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 546, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (646, to_date('12-09-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 547, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (647, to_date('03-06-2023', 'dd-mm-yyyy'), 'russian', 'pending', 548, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (648, to_date('16-04-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 549, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (649, to_date('27-05-2019', 'dd-mm-yyyy'), 'english', 'accepted', 550, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (650, to_date('04-01-2022', 'dd-mm-yyyy'), 'english', 'accepted', 551, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (651, to_date('23-11-2021', 'dd-mm-yyyy'), 'english', 'pending', 552, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (652, to_date('23-08-2019', 'dd-mm-yyyy'), 'english', 'accepted', 553, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (653, to_date('24-06-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 554, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (654, to_date('17-08-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 555, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (655, to_date('22-04-2021', 'dd-mm-yyyy'), 'english', 'rejected', 556, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (656, to_date('08-11-2020', 'dd-mm-yyyy'), 'english', 'pending', 557, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (657, to_date('01-08-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 558, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (658, to_date('29-04-2023', 'dd-mm-yyyy'), 'russian', 'pending', 559, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (659, to_date('09-11-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 560, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (660, to_date('26-07-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 561, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (661, to_date('10-02-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 562, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (662, to_date('27-11-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 563, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (663, to_date('08-09-2019', 'dd-mm-yyyy'), 'english', 'rejected', 564, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (664, to_date('11-07-2020', 'dd-mm-yyyy'), 'english', 'rejected', 565, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (665, to_date('28-12-2021', 'dd-mm-yyyy'), 'english', 'rejected', 566, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (666, to_date('11-05-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 567, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (667, to_date('21-01-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 568, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (668, to_date('09-10-2021', 'dd-mm-yyyy'), 'english', 'pending', 569, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (669, to_date('14-11-2023', 'dd-mm-yyyy'), 'russian', 'pending', 570, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (670, to_date('26-01-2022', 'dd-mm-yyyy'), 'english', 'rejected', 571, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (671, to_date('17-07-2019', 'dd-mm-yyyy'), 'english', 'accepted', 572, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (672, to_date('28-10-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 573, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (673, to_date('15-04-2023', 'dd-mm-yyyy'), 'english', 'pending', 574, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (674, to_date('30-12-2023', 'dd-mm-yyyy'), 'russian', 'pending', 575, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (675, to_date('17-03-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 576, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (676, to_date('17-11-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 577, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (677, to_date('20-11-2022', 'dd-mm-yyyy'), 'english', 'accepted', 578, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (678, to_date('09-11-2023', 'dd-mm-yyyy'), 'english', 'pending', 579, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (679, to_date('22-10-2023', 'dd-mm-yyyy'), 'english', 'accepted', 580, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (680, to_date('23-12-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 581, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (681, to_date('30-07-2020', 'dd-mm-yyyy'), 'russian', 'pending', 582, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (682, to_date('29-04-2022', 'dd-mm-yyyy'), 'english', 'accepted', 583, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (683, to_date('19-12-2023', 'dd-mm-yyyy'), 'english', 'pending', 584, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (684, to_date('20-03-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 585, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (685, to_date('30-09-2021', 'dd-mm-yyyy'), 'english', 'rejected', 586, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (686, to_date('16-03-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 587, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (687, to_date('15-05-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 588, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (688, to_date('30-11-2019', 'dd-mm-yyyy'), 'english', 'accepted', 589, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (689, to_date('05-06-2021', 'dd-mm-yyyy'), 'english', 'pending', 590, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (690, to_date('20-08-2020', 'dd-mm-yyyy'), 'english', 'pending', 591, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (691, to_date('12-12-2020', 'dd-mm-yyyy'), 'russian', 'pending', 592, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (692, to_date('23-10-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 593, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (693, to_date('29-06-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 594, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (694, to_date('05-04-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 595, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (695, to_date('25-01-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 596, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (696, to_date('05-04-2021', 'dd-mm-yyyy'), 'english', 'rejected', 597, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (697, to_date('07-11-2022', 'dd-mm-yyyy'), 'russian', 'pending', 598, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (698, to_date('04-06-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 599, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (699, to_date('20-09-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 600, 142);
commit;
prompt 600 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (700, to_date('26-05-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 601, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (701, to_date('14-08-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 602, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (702, to_date('13-05-2019', 'dd-mm-yyyy'), 'english', 'rejected', 603, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (703, to_date('12-09-2021', 'dd-mm-yyyy'), 'english', 'rejected', 604, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (704, to_date('09-05-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 605, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (705, to_date('26-04-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 606, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (706, to_date('21-05-2020', 'dd-mm-yyyy'), 'russian', 'pending', 607, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (707, to_date('20-10-2021', 'dd-mm-yyyy'), 'english', 'pending', 608, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (708, to_date('01-06-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 609, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (709, to_date('24-01-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 610, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (710, to_date('25-01-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 611, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (711, to_date('03-01-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 612, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (712, to_date('25-03-2020', 'dd-mm-yyyy'), 'russian', 'pending', 613, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (713, to_date('01-10-2022', 'dd-mm-yyyy'), 'english', 'rejected', 614, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (714, to_date('05-06-2021', 'dd-mm-yyyy'), 'english', 'rejected', 615, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (715, to_date('01-09-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 616, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (716, to_date('30-12-2021', 'dd-mm-yyyy'), 'english', 'pending', 617, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (717, to_date('26-03-2023', 'dd-mm-yyyy'), 'english', 'rejected', 618, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (718, to_date('14-02-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 619, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (719, to_date('09-09-2020', 'dd-mm-yyyy'), 'english', 'rejected', 620, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (720, to_date('20-08-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 621, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (721, to_date('10-07-2022', 'dd-mm-yyyy'), 'russian', 'pending', 622, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (722, to_date('24-08-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 623, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (723, to_date('27-09-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 624, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (724, to_date('28-12-2023', 'dd-mm-yyyy'), 'english', 'accepted', 625, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (725, to_date('22-12-2020', 'dd-mm-yyyy'), 'english', 'pending', 626, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (726, to_date('28-06-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 627, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (727, to_date('28-05-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 628, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (728, to_date('04-01-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 629, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (729, to_date('19-06-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 630, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (730, to_date('08-05-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 631, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (731, to_date('26-05-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 632, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (732, to_date('08-12-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 633, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (733, to_date('05-08-2021', 'dd-mm-yyyy'), 'english', 'pending', 634, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (734, to_date('26-04-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 635, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (735, to_date('02-10-2023', 'dd-mm-yyyy'), 'english', 'accepted', 636, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (736, to_date('30-06-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 637, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (737, to_date('10-11-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 638, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (738, to_date('20-01-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 639, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (739, to_date('25-12-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 640, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (740, to_date('31-01-2022', 'dd-mm-yyyy'), 'russian', 'pending', 641, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (741, to_date('08-11-2022', 'dd-mm-yyyy'), 'english', 'accepted', 642, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (742, to_date('23-12-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 643, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (743, to_date('18-04-2023', 'dd-mm-yyyy'), 'english', 'pending', 644, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (744, to_date('13-12-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 645, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (745, to_date('10-06-2022', 'dd-mm-yyyy'), 'russian', 'pending', 646, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (746, to_date('19-06-2021', 'dd-mm-yyyy'), 'english', 'pending', 647, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (747, to_date('08-10-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 648, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (748, to_date('23-05-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 649, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (749, to_date('16-12-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 650, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (750, to_date('11-01-2020', 'dd-mm-yyyy'), 'english', 'pending', 651, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (751, to_date('17-07-2021', 'dd-mm-yyyy'), 'english', 'rejected', 652, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (752, to_date('04-12-2021', 'dd-mm-yyyy'), 'english', 'rejected', 653, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (753, to_date('24-05-2023', 'dd-mm-yyyy'), 'english', 'accepted', 654, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (754, to_date('03-07-2023', 'dd-mm-yyyy'), 'russian', 'pending', 655, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (755, to_date('01-01-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 656, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (756, to_date('03-07-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 657, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (757, to_date('29-07-2020', 'dd-mm-yyyy'), 'english', 'rejected', 658, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (758, to_date('29-03-2023', 'dd-mm-yyyy'), 'english', 'rejected', 659, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (759, to_date('18-12-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 660, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (760, to_date('03-09-2021', 'dd-mm-yyyy'), 'english', 'accepted', 661, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (761, to_date('12-05-2021', 'dd-mm-yyyy'), 'russian', 'pending', 662, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (762, to_date('15-04-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 663, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (763, to_date('14-11-2021', 'dd-mm-yyyy'), 'english', 'accepted', 664, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (764, to_date('13-10-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 665, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (765, to_date('29-10-2019', 'dd-mm-yyyy'), 'hebrew', 'rejected', 666, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (766, to_date('01-08-2022', 'dd-mm-yyyy'), 'english', 'rejected', 667, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (767, to_date('21-12-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 668, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (768, to_date('26-02-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 669, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (769, to_date('10-06-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 670, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (770, to_date('20-02-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 671, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (771, to_date('10-07-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 672, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (772, to_date('16-04-2021', 'dd-mm-yyyy'), 'russian', 'pending', 673, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (773, to_date('10-04-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 674, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (774, to_date('26-03-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 675, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (775, to_date('11-12-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 676, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (776, to_date('13-01-2019', 'dd-mm-yyyy'), 'russian', 'pending', 677, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (777, to_date('04-03-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 678, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (778, to_date('03-08-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 679, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (779, to_date('18-01-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 680, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (780, to_date('15-10-2023', 'dd-mm-yyyy'), 'english', 'accepted', 681, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (781, to_date('12-12-2021', 'dd-mm-yyyy'), 'hebrew', 'accepted', 682, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (782, to_date('26-07-2019', 'dd-mm-yyyy'), 'english', 'pending', 683, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (783, to_date('14-03-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 684, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (784, to_date('04-09-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 685, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (785, to_date('25-07-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 686, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (786, to_date('10-05-2023', 'dd-mm-yyyy'), 'english', 'pending', 687, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (787, to_date('05-07-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 688, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (788, to_date('29-09-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 689, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (789, to_date('29-04-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 690, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (790, to_date('29-02-2020', 'dd-mm-yyyy'), 'english', 'rejected', 691, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (791, to_date('08-01-2023', 'dd-mm-yyyy'), 'russian', 'rejected', 692, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (792, to_date('24-02-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 693, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (793, to_date('23-01-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 694, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (794, to_date('20-05-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 695, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (795, to_date('26-11-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 696, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (796, to_date('02-05-2022', 'dd-mm-yyyy'), 'english', 'rejected', 697, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (797, to_date('01-05-2021', 'dd-mm-yyyy'), 'english', 'pending', 698, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (798, to_date('21-10-2022', 'dd-mm-yyyy'), 'russian', 'rejected', 699, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (799, to_date('20-08-2023', 'dd-mm-yyyy'), 'english', 'pending', 700, 123);
commit;
prompt 700 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (800, to_date('23-03-2020', 'dd-mm-yyyy'), 'english', 'pending', 701, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (801, to_date('31-07-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 702, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (802, to_date('18-10-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 703, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (803, to_date('11-03-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 704, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (804, to_date('05-06-2019', 'dd-mm-yyyy'), 'english', 'rejected', 705, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (805, to_date('09-05-2021', 'dd-mm-yyyy'), 'russian', 'pending', 706, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (806, to_date('26-06-2019', 'dd-mm-yyyy'), 'russian', 'pending', 707, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (807, to_date('24-03-2021', 'dd-mm-yyyy'), 'english', 'rejected', 708, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (808, to_date('19-05-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 709, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (809, to_date('21-06-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 710, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (810, to_date('10-12-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 711, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (811, to_date('12-04-2021', 'dd-mm-yyyy'), 'english', 'rejected', 712, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (812, to_date('05-08-2023', 'dd-mm-yyyy'), 'russian', 'pending', 713, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (813, to_date('24-03-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 714, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (814, to_date('20-05-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 715, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (815, to_date('08-12-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 716, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (816, to_date('16-10-2021', 'dd-mm-yyyy'), 'english', 'pending', 717, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (817, to_date('21-07-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 718, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (818, to_date('10-05-2023', 'dd-mm-yyyy'), 'english', 'pending', 719, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (819, to_date('13-01-2019', 'dd-mm-yyyy'), 'english', 'rejected', 720, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (820, to_date('14-02-2022', 'dd-mm-yyyy'), 'english', 'pending', 721, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (821, to_date('28-03-2021', 'dd-mm-yyyy'), 'english', 'pending', 722, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (822, to_date('26-11-2023', 'dd-mm-yyyy'), 'english', 'rejected', 723, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (823, to_date('07-11-2023', 'dd-mm-yyyy'), 'russian', 'pending', 724, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (824, to_date('04-05-2023', 'dd-mm-yyyy'), 'english', 'rejected', 725, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (825, to_date('03-02-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 726, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (826, to_date('13-10-2021', 'dd-mm-yyyy'), 'russian', 'pending', 727, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (827, to_date('10-04-2020', 'dd-mm-yyyy'), 'russian', 'pending', 728, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (828, to_date('28-12-2022', 'dd-mm-yyyy'), 'english', 'pending', 729, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (829, to_date('20-02-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 730, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (830, to_date('20-08-2021', 'dd-mm-yyyy'), 'russian', 'pending', 731, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (831, to_date('05-01-2022', 'dd-mm-yyyy'), 'hebrew', 'pending', 732, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (832, to_date('11-08-2019', 'dd-mm-yyyy'), 'russian', 'pending', 733, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (833, to_date('21-10-2023', 'dd-mm-yyyy'), 'english', 'rejected', 734, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (834, to_date('04-03-2020', 'dd-mm-yyyy'), 'hebrew', 'pending', 735, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (835, to_date('07-10-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 736, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (836, to_date('21-11-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 737, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (837, to_date('11-02-2020', 'dd-mm-yyyy'), 'english', 'pending', 738, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (838, to_date('18-05-2023', 'dd-mm-yyyy'), 'english', 'accepted', 739, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (839, to_date('03-06-2023', 'dd-mm-yyyy'), 'english', 'accepted', 740, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (840, to_date('20-11-2020', 'dd-mm-yyyy'), 'russian', 'pending', 741, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (841, to_date('10-11-2021', 'dd-mm-yyyy'), 'hebrew', 'rejected', 742, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (842, to_date('04-09-2023', 'dd-mm-yyyy'), 'english', 'accepted', 743, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (843, to_date('27-03-2019', 'dd-mm-yyyy'), 'russian', 'pending', 744, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (844, to_date('15-03-2022', 'dd-mm-yyyy'), 'russian', 'accepted', 745, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (845, to_date('24-10-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 746, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (846, to_date('19-02-2022', 'dd-mm-yyyy'), 'english', 'rejected', 747, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (847, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'pending', 748, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (848, to_date('02-03-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 749, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (849, to_date('22-11-2019', 'dd-mm-yyyy'), 'english', 'pending', 750, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (850, to_date('24-08-2020', 'dd-mm-yyyy'), 'russian', 'rejected', 751, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (851, to_date('09-05-2022', 'dd-mm-yyyy'), 'hebrew', 'rejected', 752, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (852, to_date('10-01-2020', 'dd-mm-yyyy'), 'hebrew', 'accepted', 753, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (853, to_date('07-05-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 754, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (854, to_date('11-02-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 755, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (855, to_date('22-09-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 756, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (856, to_date('20-02-2023', 'dd-mm-yyyy'), 'russian', 'pending', 757, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (857, to_date('21-12-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 758, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (858, to_date('22-08-2022', 'dd-mm-yyyy'), 'hebrew', 'accepted', 759, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (859, to_date('03-10-2019', 'dd-mm-yyyy'), 'english', 'accepted', 760, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (860, to_date('25-02-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 761, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (861, to_date('06-04-2020', 'dd-mm-yyyy'), 'english', 'accepted', 762, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (862, to_date('20-09-2023', 'dd-mm-yyyy'), 'hebrew', 'accepted', 763, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (863, to_date('18-05-2021', 'dd-mm-yyyy'), 'russian', 'pending', 764, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (864, to_date('15-03-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 765, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (865, to_date('20-08-2019', 'dd-mm-yyyy'), 'english', 'rejected', 766, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (866, to_date('02-06-2019', 'dd-mm-yyyy'), 'english', 'accepted', 767, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (867, to_date('08-01-2019', 'dd-mm-yyyy'), 'hebrew', 'pending', 768, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (868, to_date('30-01-2021', 'dd-mm-yyyy'), 'russian', 'rejected', 769, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (869, to_date('28-07-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 770, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (870, to_date('26-07-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 771, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (871, to_date('17-10-2019', 'dd-mm-yyyy'), 'english', 'pending', 772, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (872, to_date('15-06-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 773, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (873, to_date('11-11-2021', 'dd-mm-yyyy'), 'russian', 'accepted', 774, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (874, to_date('10-12-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 775, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (875, to_date('07-09-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 776, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (876, to_date('06-01-2023', 'dd-mm-yyyy'), 'english', 'pending', 777, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (877, to_date('27-09-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 778, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (878, to_date('20-06-2019', 'dd-mm-yyyy'), 'russian', 'rejected', 779, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (879, to_date('25-09-2020', 'dd-mm-yyyy'), 'english', 'pending', 780, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (880, to_date('13-09-2021', 'dd-mm-yyyy'), 'english', 'accepted', 781, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (881, to_date('05-02-2020', 'dd-mm-yyyy'), 'russian', 'pending', 782, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (882, to_date('19-05-2022', 'dd-mm-yyyy'), 'russian', 'pending', 783, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (883, to_date('28-03-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 784, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (884, to_date('09-11-2022', 'dd-mm-yyyy'), 'english', 'rejected', 785, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (885, to_date('01-09-2020', 'dd-mm-yyyy'), 'english', 'rejected', 786, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (886, to_date('09-06-2020', 'dd-mm-yyyy'), 'russian', 'accepted', 787, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (887, to_date('30-11-2022', 'dd-mm-yyyy'), 'english', 'pending', 788, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (888, to_date('12-06-2023', 'dd-mm-yyyy'), 'hebrew', 'pending', 789, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (889, to_date('23-03-2023', 'dd-mm-yyyy'), 'russian', 'pending', 790, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (890, to_date('06-02-2019', 'dd-mm-yyyy'), 'hebrew', 'accepted', 791, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (891, to_date('13-02-2023', 'dd-mm-yyyy'), 'hebrew', 'rejected', 792, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (892, to_date('20-03-2019', 'dd-mm-yyyy'), 'english', 'accepted', 793, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (893, to_date('26-09-2020', 'dd-mm-yyyy'), 'hebrew', 'rejected', 794, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (894, to_date('15-09-2023', 'dd-mm-yyyy'), 'russian', 'accepted', 795, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (895, to_date('02-01-2022', 'dd-mm-yyyy'), 'english', 'pending', 796, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (896, to_date('25-11-2021', 'dd-mm-yyyy'), 'english', 'accepted', 797, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (897, to_date('05-08-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 798, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (898, to_date('04-09-2021', 'dd-mm-yyyy'), 'hebrew', 'pending', 799, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, childid, k_type_id)
values (899, to_date('23-09-2019', 'dd-mm-yyyy'), 'russian', 'accepted', 800, 123);
commit;
prompt 800 records loaded
prompt Loading TEACHER...
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (1, 'Alivia Garcia', 596067674, to_date('09-03-2005', 'dd-mm-yyyy'), 'assistant', 71);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (2, 'Penelope Thomas', 594356767, to_date('29-11-2021', 'dd-mm-yyyy'), 'assistant', 39);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (3, 'Makenna Garcia', 526764730, to_date('15-08-2012', 'dd-mm-yyyy'), 'teacher', 2);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (4, 'Eliza Allen', 554519829, to_date('08-10-2004', 'dd-mm-yyyy'), 'teacher', 26);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (5, 'Everly Young', 539957204, to_date('06-07-1997', 'dd-mm-yyyy'), 'assistant', 95);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (6, 'Talia Scott', 529739436, to_date('06-09-2020', 'dd-mm-yyyy'), 'teacher', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (7, 'Rose Moore', 587377289, to_date('12-03-1997', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (8, 'Claire Campbell', 562401307, to_date('25-01-2004', 'dd-mm-yyyy'), 'teacher', 57);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (9, 'Makayla Rogers', 550791006, to_date('06-07-1990', 'dd-mm-yyyy'), 'teacher', 122);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (10, 'Ada Scott', 565879282, to_date('13-10-2013', 'dd-mm-yyyy'), 'assistant', 137);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (11, 'Julianna Hernandez', 598373592, to_date('26-06-1994', 'dd-mm-yyyy'), 'teacher', 120);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (12, 'Maggie Hernandez', 539670068, to_date('05-12-2013', 'dd-mm-yyyy'), 'assistant', 149);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (13, 'Eliza Jones', 591113401, to_date('12-01-2020', 'dd-mm-yyyy'), 'assistant', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (14, 'Ruby Rodriguez', 558270340, to_date('08-06-2001', 'dd-mm-yyyy'), 'teacher', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (15, 'Eva Campbell', 599462517, to_date('03-04-2013', 'dd-mm-yyyy'), 'assistant', 41);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (16, 'Maya Rogers', 534754102, to_date('26-10-2009', 'dd-mm-yyyy'), 'teacher', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (17, 'Arianna Clark', 516928889, to_date('09-04-2003', 'dd-mm-yyyy'), 'assistant', 110);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (18, 'Talia Wright', 585594591, to_date('05-08-2013', 'dd-mm-yyyy'), 'assistant', 31);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (19, 'Stella Clark', 531938568, to_date('07-10-2012', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (20, 'Anastasia Brown', 514606940, to_date('06-04-2006', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (21, 'Grace Lewis', 590323284, to_date('12-02-2005', 'dd-mm-yyyy'), 'teacher', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (22, 'Serena Lopez', 552285379, to_date('01-05-2002', 'dd-mm-yyyy'), 'assistant', 29);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (23, 'Vivian Allen', 561264061, to_date('06-09-1990', 'dd-mm-yyyy'), 'teacher', 9);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (24, 'Sloane Scott', 515703779, to_date('11-07-2011', 'dd-mm-yyyy'), 'teacher', 117);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (25, 'Daisy Roy', 555526073, to_date('05-04-2007', 'dd-mm-yyyy'), 'assistant', 28);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (26, 'Aniyah Allen', 554712737, to_date('01-10-2000', 'dd-mm-yyyy'), 'assistant', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (27, 'Abigail Hall', 544864441, to_date('23-03-1994', 'dd-mm-yyyy'), 'teacher', 49);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (28, 'Alyssa Garcia', 585099846, to_date('06-10-1999', 'dd-mm-yyyy'), 'assistant', 105);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (29, 'Brooklyn Phillips', 577808822, to_date('22-07-2003', 'dd-mm-yyyy'), 'teacher', 31);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (30, 'Sawyer Sanchez', 515400052, to_date('28-04-2021', 'dd-mm-yyyy'), 'assistant', 19);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (31, 'Sloane Lopez', 522797199, to_date('07-08-2022', 'dd-mm-yyyy'), 'teacher', 116);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (32, 'Miriam Phillips', 556861987, to_date('06-12-2014', 'dd-mm-yyyy'), 'teacher', 82);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (33, 'Savannah Allen', 598459617, to_date('13-09-1992', 'dd-mm-yyyy'), 'teacher', 36);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (34, 'Zara Nelson', 592142585, to_date('24-10-1998', 'dd-mm-yyyy'), 'assistant', 107);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (35, 'Katherine Garcia', 577194176, to_date('21-10-2004', 'dd-mm-yyyy'), 'assistant', 124);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (36, 'Serena Hernandez', 532076891, to_date('14-03-2017', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (37, 'Malia Taylor', 536049279, to_date('19-06-2014', 'dd-mm-yyyy'), 'assistant', 95);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (38, 'Sienna Garcia', 536713342, to_date('04-03-2015', 'dd-mm-yyyy'), 'assistant', 78);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (39, 'Miriam Nguyen', 583601491, to_date('26-12-2017', 'dd-mm-yyyy'), 'teacher', 15);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (40, 'Mia Cruz', 521038798, to_date('01-12-1996', 'dd-mm-yyyy'), 'teacher', 150);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (41, 'Gracie Smith', 524239156, to_date('25-04-2015', 'dd-mm-yyyy'), 'assistant', 114);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (42, 'Jade Hernandez', 596121749, to_date('24-10-2010', 'dd-mm-yyyy'), 'assistant', 88);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (43, 'Cora Mitchell', 560895217, to_date('30-10-1993', 'dd-mm-yyyy'), 'assistant', 2);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (44, 'Madelyn Wilson', 571772649, to_date('26-10-2011', 'dd-mm-yyyy'), 'assistant', 33);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (45, 'Vivian Walker', 547355132, to_date('01-10-1999', 'dd-mm-yyyy'), 'teacher', 65);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (46, 'Scarlett Johnson', 530401114, to_date('11-06-2003', 'dd-mm-yyyy'), 'assistant', 133);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (47, 'Isla Williams', 588373351, to_date('31-03-2022', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (48, 'Violet Jones', 567326530, to_date('13-08-2006', 'dd-mm-yyyy'), 'teacher', 31);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (49, 'Julia Miller', 523692886, to_date('03-09-2003', 'dd-mm-yyyy'), 'teacher', 120);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (50, 'Lena Campbell', 516544644, to_date('29-05-2023', 'dd-mm-yyyy'), 'assistant', 111);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (51, 'Mia Hernandez', 555273445, to_date('07-10-1990', 'dd-mm-yyyy'), 'assistant', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (52, 'Aurora Miller', 534365237, to_date('19-06-1994', 'dd-mm-yyyy'), 'assistant', 43);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (53, 'Camilla Hernandez', 583802305, to_date('03-01-2016', 'dd-mm-yyyy'), 'teacher', 97);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (54, 'Josephine Lopez', 559331953, to_date('14-08-1999', 'dd-mm-yyyy'), 'teacher', 41);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (55, 'Skyler Young', 512884700, to_date('08-10-2017', 'dd-mm-yyyy'), 'teacher', 118);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (56, 'Penelope Moore', 548886183, to_date('27-12-2020', 'dd-mm-yyyy'), 'assistant', 40);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (57, 'Nora Davis', 595309529, to_date('09-07-2001', 'dd-mm-yyyy'), 'teacher', 79);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (58, 'Talia Moore', 514467152, to_date('09-07-2001', 'dd-mm-yyyy'), 'teacher', 61);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (59, 'Maggie Garcia', 586671091, to_date('24-04-2017', 'dd-mm-yyyy'), 'teacher', 23);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (60, 'Lilliana Mitchell', 593788753, to_date('27-01-2000', 'dd-mm-yyyy'), 'assistant', 78);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (61, 'Selena Thomas', 557763962, to_date('20-04-1998', 'dd-mm-yyyy'), 'assistant', 100);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (62, 'Hazel Miller', 582276729, to_date('08-05-2000', 'dd-mm-yyyy'), 'assistant', 118);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (63, 'Sawyer Miller', 555724918, to_date('30-11-2007', 'dd-mm-yyyy'), 'teacher', 46);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (64, 'Violet Harris', 591448621, to_date('05-02-2014', 'dd-mm-yyyy'), 'teacher', 129);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (65, 'Hazel Scott', 523974272, to_date('20-07-1993', 'dd-mm-yyyy'), 'teacher', 36);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (66, 'Millie Wright', 546888309, to_date('31-07-2019', 'dd-mm-yyyy'), 'teacher', 110);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (67, 'Alaina Lee', 530063567, to_date('04-04-1991', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (68, 'Ariana Roy', 586600500, to_date('10-05-2017', 'dd-mm-yyyy'), 'teacher', 140);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (69, 'Genevieve Hernandez', 573109245, to_date('23-02-2017', 'dd-mm-yyyy'), 'assistant', 33);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (70, 'Emerson Moore', 559120582, to_date('18-12-2016', 'dd-mm-yyyy'), 'assistant', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (71, 'Violet Lee', 546956794, to_date('12-11-2001', 'dd-mm-yyyy'), 'teacher', 25);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (72, 'Natalie Jones', 587638551, to_date('05-04-2018', 'dd-mm-yyyy'), 'teacher', 40);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (73, 'Claire Campbell', 593928773, to_date('23-04-2014', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (74, 'Penelope Allen', 570750444, to_date('25-04-2018', 'dd-mm-yyyy'), 'teacher', 127);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (75, 'Miriam Miller', 548872523, to_date('20-11-2008', 'dd-mm-yyyy'), 'assistant', 94);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (76, 'Aria Moore', 535063477, to_date('13-06-2013', 'dd-mm-yyyy'), 'teacher', 44);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (77, 'Brooklynn Nelson', 596362269, to_date('18-11-1996', 'dd-mm-yyyy'), 'assistant', 133);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (78, 'Delilah Wright', 576549925, to_date('11-03-2008', 'dd-mm-yyyy'), 'assistant', 97);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (79, 'Jasmine Robinson', 591142217, to_date('08-06-2014', 'dd-mm-yyyy'), 'assistant', 38);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (80, 'Daphne Roy', 590340512, to_date('20-11-2003', 'dd-mm-yyyy'), 'teacher', 13);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (81, 'Jasmine Allen', 545212036, to_date('12-05-2011', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (82, 'Athena Wilson', 541648313, to_date('15-08-2014', 'dd-mm-yyyy'), 'teacher', 77);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (83, 'Piper Clark', 555126578, to_date('18-07-2007', 'dd-mm-yyyy'), 'teacher', 32);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (84, 'Phoebe Wright', 554845295, to_date('22-04-2013', 'dd-mm-yyyy'), 'teacher', 89);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (85, 'Delilah Ramirez', 531269300, to_date('15-09-1997', 'dd-mm-yyyy'), 'teacher', 33);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (86, 'Violet Allen', 565097633, to_date('04-05-2018', 'dd-mm-yyyy'), 'assistant', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (87, 'Sarah Nguyen', 517466286, to_date('31-07-2018', 'dd-mm-yyyy'), 'teacher', 24);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (88, 'Adeline Miller', 549129193, to_date('07-10-1993', 'dd-mm-yyyy'), 'teacher', 28);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (89, 'Vivian Nguyen', 587384384, to_date('16-06-2005', 'dd-mm-yyyy'), 'teacher', 60);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (90, 'Natalie Anderson', 532788759, to_date('25-06-2008', 'dd-mm-yyyy'), 'teacher', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (91, 'Mila Lopez', 580996068, to_date('26-08-2008', 'dd-mm-yyyy'), 'assistant', 57);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (92, 'Alana Lee', 568461008, to_date('10-05-2011', 'dd-mm-yyyy'), 'teacher', 57);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (93, 'Emilia Lewis', 529391202, to_date('14-09-1994', 'dd-mm-yyyy'), 'teacher', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (94, 'Lydia Garcia', 554991306, to_date('15-05-2022', 'dd-mm-yyyy'), 'teacher', 54);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (95, 'Blakely Moore', 578305024, to_date('22-06-2001', 'dd-mm-yyyy'), 'teacher', 111);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (96, 'Josie Wright', 522392538, to_date('25-11-2014', 'dd-mm-yyyy'), 'assistant', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (97, 'Savannah Wright', 559697505, to_date('27-02-2018', 'dd-mm-yyyy'), 'assistant', 9);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (98, 'Abigail Wilson', 514109601, to_date('02-08-2021', 'dd-mm-yyyy'), 'assistant', 132);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (99, 'Savannah Phillips', 553901499, to_date('10-05-1996', 'dd-mm-yyyy'), 'assistant', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (100, 'Nylah King', 562225270, to_date('15-08-2022', 'dd-mm-yyyy'), 'assistant', 45);
commit;
prompt 100 records committed...
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (101, 'Layla Hernandez', 530801036, to_date('28-12-2021', 'dd-mm-yyyy'), 'teacher', 56);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (102, 'Zoey Allen', 590520335, to_date('16-01-1995', 'dd-mm-yyyy'), 'assistant', 97);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (103, 'Avery Garcia', 524512967, to_date('11-03-1997', 'dd-mm-yyyy'), 'teacher', 24);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (104, 'Zoey Harris', 521040954, to_date('13-11-2007', 'dd-mm-yyyy'), 'teacher', 93);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (105, 'Zara Taylor', 589031145, to_date('17-09-2014', 'dd-mm-yyyy'), 'assistant', 106);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (106, 'Kaitlyn Allen', 514060720, to_date('02-11-2020', 'dd-mm-yyyy'), 'teacher', 135);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (107, 'Sloane Campbell', 523375742, to_date('11-01-2017', 'dd-mm-yyyy'), 'teacher', 112);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (108, 'Alaina Walker', 513473183, to_date('26-05-2007', 'dd-mm-yyyy'), 'teacher', 120);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (109, 'Aubree Garcia', 577050637, to_date('14-02-2020', 'dd-mm-yyyy'), 'assistant', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (110, 'Mia Wright', 581274281, to_date('29-04-2002', 'dd-mm-yyyy'), 'assistant', 13);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (111, 'Addison Diaz', 572772792, to_date('05-03-2021', 'dd-mm-yyyy'), 'teacher', 131);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (112, 'Allison Rodriguez', 599135910, to_date('12-01-2011', 'dd-mm-yyyy'), 'assistant', 115);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (113, 'Juliana Moore', 573494740, to_date('13-01-2008', 'dd-mm-yyyy'), 'teacher', 121);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (114, 'Kaylee Moore', 557649784, to_date('26-02-2013', 'dd-mm-yyyy'), 'assistant', 141);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (115, 'Callie Brown', 562555704, to_date('09-01-1991', 'dd-mm-yyyy'), 'assistant', 99);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (116, 'Sloane Rodriguez', 543266314, to_date('08-02-1995', 'dd-mm-yyyy'), 'teacher', 119);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (117, 'Eliza Moore', 578761940, to_date('26-12-2006', 'dd-mm-yyyy'), 'teacher', 124);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (118, 'Quinn Martinez', 591504246, to_date('26-01-2023', 'dd-mm-yyyy'), 'assistant', 1);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (119, 'Eva Allen', 552566044, to_date('12-03-2018', 'dd-mm-yyyy'), 'teacher', 14);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (120, 'Catalina Nguyen', 540775929, to_date('20-07-2004', 'dd-mm-yyyy'), 'teacher', 50);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (121, 'Taylor Lopez', 547760714, to_date('29-05-1996', 'dd-mm-yyyy'), 'assistant', 109);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (122, 'Mariana Hernandez', 591556989, to_date('06-02-2019', 'dd-mm-yyyy'), 'assistant', 138);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (123, 'Avery Cruz', 572592717, to_date('14-06-2023', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (124, 'Sophia Hall', 551845376, to_date('09-05-2007', 'dd-mm-yyyy'), 'assistant', 136);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (125, 'Delilah Thomas', 593251746, to_date('13-04-1993', 'dd-mm-yyyy'), 'assistant', 63);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (126, 'Hazel Rogers', 554118081, to_date('28-01-2019', 'dd-mm-yyyy'), 'assistant', 137);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (127, 'Ava Rodriguez', 560241936, to_date('07-06-2002', 'dd-mm-yyyy'), 'assistant', 64);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (128, 'Nylah Clark', 560679934, to_date('18-09-2009', 'dd-mm-yyyy'), 'teacher', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (129, 'Elena Walker', 551614916, to_date('18-02-2010', 'dd-mm-yyyy'), 'assistant', 68);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (130, 'Rylee Clark', 510490343, to_date('05-06-2001', 'dd-mm-yyyy'), 'teacher', 6);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (131, 'Adrianna Lopez', 581974122, to_date('26-12-2001', 'dd-mm-yyyy'), 'teacher', 65);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (132, 'Brianna Garcia', 574826165, to_date('10-09-2022', 'dd-mm-yyyy'), 'assistant', 50);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (133, 'Annalise Wilson', 519386857, to_date('31-12-2013', 'dd-mm-yyyy'), 'teacher', 81);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (134, 'Zara Scott', 595129311, to_date('27-06-2020', 'dd-mm-yyyy'), 'teacher', 75);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (135, 'Lola Garcia', 594334031, to_date('17-06-1998', 'dd-mm-yyyy'), 'assistant', 122);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (136, 'Eva Garcia', 560294535, to_date('09-07-2021', 'dd-mm-yyyy'), 'assistant', 79);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (137, 'Mackenzie Rodriguez', 568161259, to_date('23-03-2021', 'dd-mm-yyyy'), 'assistant', 65);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (138, 'Daisy Hernandez', 517484827, to_date('09-09-1993', 'dd-mm-yyyy'), 'assistant', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (139, 'Amaya Thomas', 511709345, to_date('12-04-2017', 'dd-mm-yyyy'), 'assistant', 34);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (140, 'Claire Rodriguez', 582758282, to_date('16-12-2000', 'dd-mm-yyyy'), 'assistant', 121);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (141, 'Fiona Hall', 579580741, to_date('02-11-2001', 'dd-mm-yyyy'), 'teacher', 50);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (142, 'Nina Campbell', 597424287, to_date('26-09-2009', 'dd-mm-yyyy'), 'assistant', 127);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (143, 'Emerson Lee', 554290169, to_date('21-04-2023', 'dd-mm-yyyy'), 'assistant', 10);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (144, 'Madelyn Garcia', 544141190, to_date('29-11-1996', 'dd-mm-yyyy'), 'assistant', 136);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (145, 'Eva Allen', 537922804, to_date('03-08-1996', 'dd-mm-yyyy'), 'assistant', 47);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (146, 'Andrea Rodriguez', 555699664, to_date('26-10-1996', 'dd-mm-yyyy'), 'assistant', 46);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (147, 'Brooke Sanchez', 520541654, to_date('04-11-1998', 'dd-mm-yyyy'), 'assistant', 149);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (148, 'Nora Nelson', 578303817, to_date('18-12-2011', 'dd-mm-yyyy'), 'teacher', 145);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (149, 'Anastasia Campbell', 582613178, to_date('26-07-2023', 'dd-mm-yyyy'), 'teacher', 25);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (150, 'Haley Anderson', 516200163, to_date('23-01-1991', 'dd-mm-yyyy'), 'assistant', 109);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (151, 'Makenna Campbell', 516676321, to_date('05-11-2023', 'dd-mm-yyyy'), 'assistant', 16);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (152, 'Paisley Rodriguez', 541194741, to_date('29-09-2014', 'dd-mm-yyyy'), 'assistant', 57);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (153, 'Chloe Hernandez', 579167340, to_date('12-04-2005', 'dd-mm-yyyy'), 'assistant', 69);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (154, 'Mila Lewis', 590195523, to_date('25-11-2007', 'dd-mm-yyyy'), 'assistant', 148);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (155, 'Peyton Clark', 570590567, to_date('09-08-1994', 'dd-mm-yyyy'), 'teacher', 63);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (156, 'Lila Rogers', 564569157, to_date('29-07-2017', 'dd-mm-yyyy'), 'assistant', 52);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (157, 'Lena Hernandez', 512095937, to_date('16-03-1991', 'dd-mm-yyyy'), 'teacher', 30);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (158, 'Molly Martinez', 586228041, to_date('28-04-1999', 'dd-mm-yyyy'), 'assistant', 39);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (159, 'Madilyn Moore', 533634467, to_date('08-12-1997', 'dd-mm-yyyy'), 'teacher', 98);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (160, 'Olivia Hernandez', 528761122, to_date('08-08-2018', 'dd-mm-yyyy'), 'assistant', 8);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (161, 'Ellie Phillips', 551112306, to_date('19-12-1990', 'dd-mm-yyyy'), 'assistant', 31);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (162, 'Sawyer Miller', 511869604, to_date('13-05-1998', 'dd-mm-yyyy'), 'teacher', 25);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (163, 'Freya Hernandez', 593246578, to_date('25-04-2019', 'dd-mm-yyyy'), 'assistant', 107);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (164, 'Ada Nguyen', 573010956, to_date('30-03-2007', 'dd-mm-yyyy'), 'teacher', 40);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (165, 'Hayden Thomas', 529953879, to_date('29-11-2009', 'dd-mm-yyyy'), 'teacher', 116);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (166, 'Evelyn Hernandez', 546339752, to_date('24-12-2007', 'dd-mm-yyyy'), 'assistant', 56);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (167, 'Naomi Hernandez', 542373858, to_date('29-06-1994', 'dd-mm-yyyy'), 'teacher', 94);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (168, 'Brielle Moore', 546429819, to_date('14-06-1991', 'dd-mm-yyyy'), 'teacher', 57);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (169, 'Aubrey Roberts', 531926540, to_date('12-10-2010', 'dd-mm-yyyy'), 'assistant', 94);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (170, 'Allison Allen', 586064099, to_date('06-02-2004', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (171, 'Lila Green', 571775564, to_date('04-11-1995', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (172, 'Josephine Cruz', 520066307, to_date('01-10-2014', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (173, 'Julianna Lee', 561924270, to_date('16-06-2018', 'dd-mm-yyyy'), 'assistant', 131);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (174, 'Aubrie Young', 534933464, to_date('09-02-2000', 'dd-mm-yyyy'), 'assistant', 126);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (175, 'Makenna Thomas', 561340235, to_date('09-02-2019', 'dd-mm-yyyy'), 'assistant', 7);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (176, 'Lydia Lee', 513558022, to_date('12-11-1992', 'dd-mm-yyyy'), 'teacher', 22);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (177, 'Aubrey Allen', 532918862, to_date('09-05-1994', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (178, 'Riley Carter', 581857601, to_date('28-08-2014', 'dd-mm-yyyy'), 'teacher', 28);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (179, 'Eva Mitchell', 568042030, to_date('10-01-2010', 'dd-mm-yyyy'), 'teacher', 40);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (180, 'Aaliyah Hernandez', 554021567, to_date('16-01-2010', 'dd-mm-yyyy'), 'assistant', 91);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (181, 'Emilia Mitchell', 532160916, to_date('05-05-2003', 'dd-mm-yyyy'), 'teacher', 64);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (182, 'Elsie Harris', 559026750, to_date('28-02-2014', 'dd-mm-yyyy'), 'assistant', 117);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (183, 'Charlotte Thomas', 547748064, to_date('15-06-2022', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (184, 'Zoey Allen', 531701774, to_date('19-02-2005', 'dd-mm-yyyy'), 'assistant', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (185, 'Daisy Campbell', 547968171, to_date('30-10-2007', 'dd-mm-yyyy'), 'assistant', 23);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (186, 'Isabella Garcia', 535454620, to_date('26-07-2009', 'dd-mm-yyyy'), 'assistant', 74);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (187, 'Blake Hernandez', 541156017, to_date('23-08-2016', 'dd-mm-yyyy'), 'assistant', 51);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (188, 'Athena Clark', 589793709, to_date('08-04-2007', 'dd-mm-yyyy'), 'teacher', 79);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (189, 'Skyler Lee', 590830777, to_date('14-02-2006', 'dd-mm-yyyy'), 'assistant', 110);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (190, 'Ashley Garcia', 531146548, to_date('15-08-1993', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (191, 'Alaina Jones', 531310003, to_date('23-01-2010', 'dd-mm-yyyy'), 'assistant', 97);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (192, 'Autumn Williams', 576569729, to_date('05-10-2001', 'dd-mm-yyyy'), 'assistant', 87);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (193, 'Skylar Nguyen', 599221869, to_date('29-04-2023', 'dd-mm-yyyy'), 'teacher', 6);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (194, 'Sophia Jones', 549252221, to_date('05-08-2008', 'dd-mm-yyyy'), 'assistant', 10);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (195, 'Ella Miller', 570440138, to_date('17-12-2007', 'dd-mm-yyyy'), 'teacher', 148);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (196, 'Julia Green', 568757838, to_date('10-06-2008', 'dd-mm-yyyy'), 'assistant', 18);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (197, 'Makayla Evans', 534924911, to_date('28-07-2018', 'dd-mm-yyyy'), 'assistant', 49);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (198, 'Eden Evans', 590608988, to_date('26-07-2003', 'dd-mm-yyyy'), 'teacher', 107);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (199, 'Ella Moore', 569369928, to_date('23-09-1994', 'dd-mm-yyyy'), 'teacher', 74);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (200, 'Sadie Clark', 539337623, to_date('17-09-2005', 'dd-mm-yyyy'), 'teacher', 12);
commit;
prompt 200 records committed...
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (201, 'Serenity Wilson', 565731979, to_date('11-01-1997', 'dd-mm-yyyy'), 'teacher', 130);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (202, 'Emilia Roy', 544373991, to_date('31-01-2022', 'dd-mm-yyyy'), 'assistant', 119);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (203, 'Alivia Young', 569234980, to_date('16-05-1998', 'dd-mm-yyyy'), 'assistant', 125);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (204, 'Leilani Scott', 568101982, to_date('18-03-2012', 'dd-mm-yyyy'), 'assistant', 116);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (205, 'Adelaide Campbell', 580164942, to_date('11-03-1998', 'dd-mm-yyyy'), 'teacher', 44);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (206, 'Aaliyah Rodriguez', 591079081, to_date('06-03-2012', 'dd-mm-yyyy'), 'assistant', 16);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (207, 'Jordyn Robinson', 583599209, to_date('02-02-2010', 'dd-mm-yyyy'), 'assistant', 11);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (208, 'Alivia Hernandez', 580046048, to_date('23-09-2012', 'dd-mm-yyyy'), 'teacher', 21);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (209, 'Lydia Moore', 564288592, to_date('19-08-2020', 'dd-mm-yyyy'), 'teacher', 34);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (210, 'Ellie Diaz', 561673045, to_date('14-07-1998', 'dd-mm-yyyy'), 'assistant', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (211, 'Reagan Johnson', 591837290, to_date('19-04-1998', 'dd-mm-yyyy'), 'assistant', 19);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (212, 'Piper Anderson', 536465024, to_date('26-07-2000', 'dd-mm-yyyy'), 'teacher', 50);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (213, 'Avery Anderson', 522714679, to_date('29-03-1992', 'dd-mm-yyyy'), 'assistant', 66);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (214, 'Elise Davis', 591687266, to_date('05-10-2023', 'dd-mm-yyyy'), 'assistant', 33);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (215, 'Athena Anderson', 562618327, to_date('09-12-2011', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (216, 'Catherine Garcia', 559136733, to_date('24-11-2023', 'dd-mm-yyyy'), 'teacher', 128);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (217, 'Emersyn Johnson', 581061108, to_date('24-07-2019', 'dd-mm-yyyy'), 'assistant', 51);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (218, 'Alyssa Thomas', 522321947, to_date('15-08-2022', 'dd-mm-yyyy'), 'teacher', 93);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (219, 'Caroline Campbell', 563567828, to_date('27-11-2008', 'dd-mm-yyyy'), 'assistant', 70);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (220, 'Nora Robinson', 576233766, to_date('10-08-2001', 'dd-mm-yyyy'), 'assistant', 5);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (221, 'Brielle Moore', 547733466, to_date('11-01-2002', 'dd-mm-yyyy'), 'teacher', 79);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (222, 'Natalie Moore', 538453237, to_date('13-04-2011', 'dd-mm-yyyy'), 'teacher', 28);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (223, 'Marley Walker', 574238518, to_date('26-10-2001', 'dd-mm-yyyy'), 'assistant', 140);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (224, 'Isabella Campbell', 536796216, to_date('11-07-1998', 'dd-mm-yyyy'), 'teacher', 73);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (225, 'Sloane Lopez', 595429935, to_date('15-04-2007', 'dd-mm-yyyy'), 'teacher', 83);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (226, 'Alana Allen', 579736918, to_date('14-11-2016', 'dd-mm-yyyy'), 'teacher', 40);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (227, 'Selena Rogers', 553017676, to_date('19-10-1994', 'dd-mm-yyyy'), 'teacher', 11);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (228, 'Andrea Nguyen', 522321471, to_date('13-03-2011', 'dd-mm-yyyy'), 'teacher', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (229, 'Layla Davis', 574164188, to_date('27-01-2005', 'dd-mm-yyyy'), 'teacher', 88);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (230, 'Logan Rogers', 599901166, to_date('13-06-2006', 'dd-mm-yyyy'), 'assistant', 11);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (231, 'Kaylee Lee', 568891984, to_date('09-04-2010', 'dd-mm-yyyy'), 'assistant', 53);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (232, 'Andrea Garcia', 590271312, to_date('05-04-2016', 'dd-mm-yyyy'), 'teacher', 34);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (233, 'Blake Harris', 591062442, to_date('16-05-2004', 'dd-mm-yyyy'), 'teacher', 73);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (234, 'Kaitlyn Wright', 557787164, to_date('27-06-2020', 'dd-mm-yyyy'), 'assistant', 41);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (235, 'Isabelle Mitchell', 573313785, to_date('05-08-2022', 'dd-mm-yyyy'), 'teacher', 62);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (236, 'Valentina King', 535185895, to_date('01-06-2016', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (237, 'Alice Allen', 570080854, to_date('27-04-1994', 'dd-mm-yyyy'), 'assistant', 45);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (238, 'Blake Hernandez', 589139999, to_date('26-05-2002', 'dd-mm-yyyy'), 'assistant', 148);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (239, 'Amira Johnson', 519680845, to_date('27-12-2017', 'dd-mm-yyyy'), 'assistant', 44);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (240, 'Elsie Carter', 517313202, to_date('25-02-1995', 'dd-mm-yyyy'), 'assistant', 5);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (241, 'Kendall Lopez', 559161350, to_date('28-02-2013', 'dd-mm-yyyy'), 'assistant', 81);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (242, 'Sophia Jones', 544951866, to_date('11-06-1991', 'dd-mm-yyyy'), 'teacher', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (243, 'Nina Scott', 537556058, to_date('25-09-1993', 'dd-mm-yyyy'), 'teacher', 90);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (244, 'Madison Rogers', 582215205, to_date('07-06-1998', 'dd-mm-yyyy'), 'assistant', 19);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (245, 'Arianna Wright', 511624749, to_date('23-01-2023', 'dd-mm-yyyy'), 'assistant', 43);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (246, 'Maya Lewis', 594443965, to_date('04-07-2003', 'dd-mm-yyyy'), 'assistant', 69);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (247, 'Talia Williams', 576077820, to_date('06-09-2002', 'dd-mm-yyyy'), 'teacher', 49);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (248, 'Nylah Allen', 570107233, to_date('07-07-2017', 'dd-mm-yyyy'), 'assistant', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (249, 'Naomi Lewis', 520316884, to_date('09-06-2011', 'dd-mm-yyyy'), 'teacher', 79);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (250, 'Delilah Hernandez', 585702398, to_date('09-07-2018', 'dd-mm-yyyy'), 'teacher', 56);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (251, 'Naomi Moore', 546410028, to_date('16-04-1995', 'dd-mm-yyyy'), 'assistant', 86);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (252, 'Fiona Moore', 586800137, to_date('01-11-1997', 'dd-mm-yyyy'), 'teacher', 26);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (253, 'Cora Young', 551313035, to_date('09-12-1992', 'dd-mm-yyyy'), 'assistant', 2);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (254, 'Aurora Hernandez', 510278005, to_date('17-01-2016', 'dd-mm-yyyy'), 'teacher', 145);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (255, 'Amira Hernandez', 539256167, to_date('24-03-1994', 'dd-mm-yyyy'), 'teacher', 10);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (256, 'Savannah Green', 589527074, to_date('29-11-2009', 'dd-mm-yyyy'), 'assistant', 42);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (257, 'Blake Mitchell', 579512148, to_date('22-09-2022', 'dd-mm-yyyy'), 'assistant', 145);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (258, 'Zoey Wright', 527636312, to_date('16-01-1999', 'dd-mm-yyyy'), 'assistant', 149);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (259, 'Emerson Jones', 568502525, to_date('13-10-1993', 'dd-mm-yyyy'), 'teacher', 100);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (260, 'Piper Lewis', 587230075, to_date('06-05-2006', 'dd-mm-yyyy'), 'teacher', 3);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (261, 'Emerson Lewis', 514161743, to_date('26-07-2005', 'dd-mm-yyyy'), 'teacher', 141);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (262, 'Gracie Garcia', 587379973, to_date('09-08-2003', 'dd-mm-yyyy'), 'assistant', 106);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (263, 'Hazel Garcia', 541794674, to_date('14-02-2009', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (264, 'Faith Wilson', 540509709, to_date('23-03-2010', 'dd-mm-yyyy'), 'assistant', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (265, 'Nicole Lopez', 522859659, to_date('24-07-1994', 'dd-mm-yyyy'), 'teacher', 69);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (266, 'Eliana Rodriguez', 510214031, to_date('21-02-2005', 'dd-mm-yyyy'), 'teacher', 51);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (267, 'Blake Brown', 572209406, to_date('27-06-2021', 'dd-mm-yyyy'), 'teacher', 82);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (268, 'Jocelyn Allen', 554134857, to_date('30-10-2013', 'dd-mm-yyyy'), 'teacher', 55);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (269, 'Alexandra Nelson', 576719002, to_date('01-01-2005', 'dd-mm-yyyy'), 'assistant', 118);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (270, 'Lucy Nelson', 511820777, to_date('27-04-2003', 'dd-mm-yyyy'), 'teacher', 26);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (271, 'Josephine Wright', 533189458, to_date('16-12-1997', 'dd-mm-yyyy'), 'teacher', 100);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (272, 'Sadie Harris', 564125455, to_date('04-06-1997', 'dd-mm-yyyy'), 'assistant', 50);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (273, 'Brianna Allen', 550612618, to_date('19-10-2001', 'dd-mm-yyyy'), 'assistant', 133);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (274, 'Catherine Mitchell', 516495861, to_date('10-07-2007', 'dd-mm-yyyy'), 'assistant', 94);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (275, 'Andrea Wright', 526758948, to_date('02-10-2014', 'dd-mm-yyyy'), 'teacher', 91);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (276, 'Julianna Nelson', 537186924, to_date('27-04-2001', 'dd-mm-yyyy'), 'teacher', 112);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (277, 'Maggie Garcia', 538189537, to_date('11-02-2020', 'dd-mm-yyyy'), 'assistant', 108);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (278, 'Mila Young', 597677645, to_date('26-05-1998', 'dd-mm-yyyy'), 'assistant', 33);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (279, 'Josephine Young', 587303912, to_date('22-02-1993', 'dd-mm-yyyy'), 'assistant', 44);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (280, 'Parker Lopez', 590007634, to_date('18-12-2008', 'dd-mm-yyyy'), 'assistant', 81);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (281, 'Daisy Williams', 533584388, to_date('21-12-2015', 'dd-mm-yyyy'), 'teacher', 69);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (282, 'Brooke Moore', 595558113, to_date('24-11-1995', 'dd-mm-yyyy'), 'teacher', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (283, 'Daphne Lee', 557830226, to_date('30-10-2011', 'dd-mm-yyyy'), 'assistant', 29);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (284, 'Natalie Thomas', 568881677, to_date('27-08-1998', 'dd-mm-yyyy'), 'assistant', 147);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (285, 'Matilda Green', 513340894, to_date('19-08-1990', 'dd-mm-yyyy'), 'assistant', 84);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (286, 'Nora Young', 557898932, to_date('13-03-2018', 'dd-mm-yyyy'), 'assistant', 3);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (287, 'Claire Walker', 547263109, to_date('19-01-2018', 'dd-mm-yyyy'), 'teacher', 41);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (288, 'Sophie Lewis', 556233926, to_date('21-09-1992', 'dd-mm-yyyy'), 'teacher', 29);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (289, 'Serena Miller', 516341780, to_date('16-03-2009', 'dd-mm-yyyy'), 'teacher', 63);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (290, 'Logan Roberts', 556493065, to_date('02-01-2011', 'dd-mm-yyyy'), 'assistant', 137);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (291, 'Ashley Roberts', 511007705, to_date('15-12-2022', 'dd-mm-yyyy'), 'teacher', 53);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (292, 'Parker Wilson', 570031265, to_date('17-12-1996', 'dd-mm-yyyy'), 'assistant', 7);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (293, 'Skyler Lopez', 568361594, to_date('19-04-2021', 'dd-mm-yyyy'), 'teacher', 27);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (294, 'Aria Moore', 557161078, to_date('04-05-2004', 'dd-mm-yyyy'), 'teacher', 52);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (295, 'Addison Diaz', 568037081, to_date('13-11-2006', 'dd-mm-yyyy'), 'assistant', 66);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (296, 'Brielle Nguyen', 557420785, to_date('29-09-2005', 'dd-mm-yyyy'), 'assistant', 101);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (297, 'Jayla Clark', 563624223, to_date('02-03-2004', 'dd-mm-yyyy'), 'teacher', 128);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (298, 'Kinsley Allen', 519942224, to_date('04-01-2012', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (299, 'Gabriella Wilson', 520530258, to_date('02-04-2013', 'dd-mm-yyyy'), 'assistant', 109);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (300, 'Jordyn Wright', 569899204, to_date('14-05-2016', 'dd-mm-yyyy'), 'teacher', 43);
commit;
prompt 300 records committed...
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (301, 'Leah Phillips', 549198904, to_date('25-01-2003', 'dd-mm-yyyy'), 'teacher', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (302, 'Ada Clark', 596447587, to_date('30-07-2001', 'dd-mm-yyyy'), 'teacher', 71);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (303, 'Eden Robinson', 572917000, to_date('19-11-2002', 'dd-mm-yyyy'), 'assistant', 114);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (304, 'Brooklynn Scott', 574455772, to_date('31-07-2008', 'dd-mm-yyyy'), 'assistant', 149);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (305, 'Alexis Lewis', 584784282, to_date('09-03-2012', 'dd-mm-yyyy'), 'assistant', 113);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (306, 'Blake Wilson', 541386483, to_date('27-04-1997', 'dd-mm-yyyy'), 'assistant', 66);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (307, 'Anna Wright', 573246722, to_date('16-07-2018', 'dd-mm-yyyy'), 'teacher', 104);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (308, 'Anna Mitchell', 574448386, to_date('19-06-2009', 'dd-mm-yyyy'), 'teacher', 94);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (309, 'Valentina Lopez', 515881720, to_date('12-06-2011', 'dd-mm-yyyy'), 'teacher', 90);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (310, 'Olivia Moore', 543743390, to_date('31-08-1998', 'dd-mm-yyyy'), 'teacher', 8);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (311, 'Vivienne Lopez', 589207204, to_date('12-08-2023', 'dd-mm-yyyy'), 'assistant', 54);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (312, 'Natalie Scott', 530036564, to_date('01-02-1996', 'dd-mm-yyyy'), 'teacher', 116);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (313, 'Eliana Martinez', 528791754, to_date('30-08-2004', 'dd-mm-yyyy'), 'teacher', 56);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (314, 'Ellie Moore', 582395515, to_date('14-10-1991', 'dd-mm-yyyy'), 'teacher', 67);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (315, 'Emersyn Young', 525289817, to_date('05-06-2011', 'dd-mm-yyyy'), 'assistant', 102);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (316, 'Juliet Scott', 512613517, to_date('12-01-1997', 'dd-mm-yyyy'), 'teacher', 2);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (317, 'Chloe Green', 512056715, to_date('23-08-2008', 'dd-mm-yyyy'), 'assistant', 115);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (318, 'Riley Lewis', 548765854, to_date('19-04-1990', 'dd-mm-yyyy'), 'teacher', 38);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (319, 'Freya Martinez', 552462901, to_date('20-12-2014', 'dd-mm-yyyy'), 'assistant', 10);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (320, 'Ashley Clark', 538285842, to_date('29-08-2015', 'dd-mm-yyyy'), 'teacher', 22);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (321, 'Amelia Miller', 545041763, to_date('12-11-1999', 'dd-mm-yyyy'), 'teacher', 14);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (322, 'Gabriella Johnson', 550347671, to_date('05-11-2009', 'dd-mm-yyyy'), 'assistant', 140);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (323, 'Isla Thompson', 546937973, to_date('26-07-2017', 'dd-mm-yyyy'), 'teacher', 139);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (324, 'Miriam Clark', 533234521, to_date('27-04-1990', 'dd-mm-yyyy'), 'assistant', 58);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (325, 'Haley Mitchell', 572189822, to_date('07-04-2015', 'dd-mm-yyyy'), 'assistant', 96);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (326, 'Lilliana Wilson', 581310441, to_date('12-03-2019', 'dd-mm-yyyy'), 'teacher', 148);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (327, 'Lillian Anderson', 533905701, to_date('26-02-2014', 'dd-mm-yyyy'), 'teacher', 75);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (328, 'Arabella Jones', 554649221, to_date('01-12-2014', 'dd-mm-yyyy'), 'teacher', 65);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (329, 'Ariana Davis', 520345447, to_date('16-10-2022', 'dd-mm-yyyy'), 'teacher', 20);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (330, 'Sadie Rogers', 521042168, to_date('09-04-2019', 'dd-mm-yyyy'), 'assistant', 139);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (331, 'Myla Jones', 533770829, to_date('20-07-2010', 'dd-mm-yyyy'), 'assistant', 2);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (332, 'Adelaide Moore', 528630247, to_date('13-03-2017', 'dd-mm-yyyy'), 'teacher', 38);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (333, 'Sloane Hernandez', 520562416, to_date('01-06-2011', 'dd-mm-yyyy'), 'assistant', 88);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (334, 'Noelle Davis', 554689712, to_date('01-08-1990', 'dd-mm-yyyy'), 'teacher', 38);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (335, 'Ashley Hernandez', 561709456, to_date('22-01-2005', 'dd-mm-yyyy'), 'assistant', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (336, 'Sadie Hall', 569689206, to_date('19-04-1992', 'dd-mm-yyyy'), 'teacher', 117);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (337, 'Claire Nelson', 566937695, to_date('20-12-2009', 'dd-mm-yyyy'), 'teacher', 43);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (338, 'Elsie Thompson', 575748061, to_date('17-12-2019', 'dd-mm-yyyy'), 'teacher', 47);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (339, 'Josephine Lee', 553069055, to_date('30-12-2019', 'dd-mm-yyyy'), 'teacher', 133);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (340, 'Kendall Hernandez', 554410256, to_date('17-08-2018', 'dd-mm-yyyy'), 'assistant', 136);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (341, 'Grace Lopez', 561501976, to_date('18-03-2012', 'dd-mm-yyyy'), 'teacher', 126);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (342, 'Elena Hernandez', 559656704, to_date('15-11-2005', 'dd-mm-yyyy'), 'teacher', 117);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (343, 'Jocelyn Wright', 560664746, to_date('18-08-1995', 'dd-mm-yyyy'), 'teacher', 23);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (344, 'Lilliana Moore', 591126368, to_date('27-04-1999', 'dd-mm-yyyy'), 'assistant', 3);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (345, 'Emma Roy', 598425461, to_date('15-09-2012', 'dd-mm-yyyy'), 'teacher', 123);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (346, 'Fiona Johnson', 557786783, to_date('23-11-2015', 'dd-mm-yyyy'), 'assistant', 90);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (347, 'Kennedy Phillips', 557796403, to_date('24-01-2005', 'dd-mm-yyyy'), 'teacher', 21);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (348, 'Millie Hernandez', 551626394, to_date('06-05-2013', 'dd-mm-yyyy'), 'assistant', 51);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (349, 'Amira Young', 582172314, to_date('05-03-1998', 'dd-mm-yyyy'), 'assistant', 41);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (350, 'Adalyn Campbell', 543683296, to_date('12-10-2000', 'dd-mm-yyyy'), 'assistant', 18);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (351, 'Alaina Clark', 562135035, to_date('27-04-2022', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (352, 'Miriam Lewis', 545081914, to_date('11-03-2017', 'dd-mm-yyyy'), 'assistant', 31);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (353, 'Ava Mitchell', 542122706, to_date('03-11-2019', 'dd-mm-yyyy'), 'teacher', 65);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (354, 'Bianca Nguyen', 523405384, to_date('23-11-1991', 'dd-mm-yyyy'), 'teacher', 14);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (355, 'Everly Nguyen', 596198385, to_date('11-09-1992', 'dd-mm-yyyy'), 'assistant', 5);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (356, 'Mackenzie Campbell', 587082098, to_date('07-02-2009', 'dd-mm-yyyy'), 'teacher', 92);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (357, 'Lena Lee', 535050304, to_date('06-04-2003', 'dd-mm-yyyy'), 'teacher', 123);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (358, 'Natalia Scott', 574802702, to_date('24-07-2019', 'dd-mm-yyyy'), 'assistant', 60);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (359, 'Aspen Thomas', 532486498, to_date('15-12-2019', 'dd-mm-yyyy'), 'teacher', 141);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (360, 'Nora Nelson', 586567967, to_date('31-10-2009', 'dd-mm-yyyy'), 'assistant', 95);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (361, 'Adeline Mitchell', 555312696, to_date('03-01-2012', 'dd-mm-yyyy'), 'teacher', 11);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (362, 'Lucy Hernandez', 579294648, to_date('17-06-2015', 'dd-mm-yyyy'), 'teacher', 86);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (363, 'Makenna Allen', 520963107, to_date('06-05-2017', 'dd-mm-yyyy'), 'assistant', 82);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (364, 'Anna Moore', 557041626, to_date('10-05-2005', 'dd-mm-yyyy'), 'teacher', 118);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (365, 'Hazel Diaz', 530174017, to_date('06-10-1997', 'dd-mm-yyyy'), 'teacher', 51);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (366, 'Millie Cruz', 513103252, to_date('04-11-2023', 'dd-mm-yyyy'), 'assistant', 85);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (367, 'Juliana Anderson', 585401819, to_date('27-11-2008', 'dd-mm-yyyy'), 'teacher', 47);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (368, 'Eva Garcia', 582271081, to_date('06-10-2009', 'dd-mm-yyyy'), 'assistant', 109);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (369, 'Sadie Hernandez', 569059496, to_date('16-06-2004', 'dd-mm-yyyy'), 'assistant', 106);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (370, 'Catalina Allen', 576020270, to_date('25-08-2003', 'dd-mm-yyyy'), 'assistant', 145);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (371, 'Elsie Hernandez', 525104319, to_date('10-10-2012', 'dd-mm-yyyy'), 'assistant', 143);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (372, 'Elise Anderson', 548094526, to_date('07-12-2013', 'dd-mm-yyyy'), 'assistant', 90);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (373, 'Harley Sanchez', 588082039, to_date('04-08-2015', 'dd-mm-yyyy'), 'assistant', 24);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (374, 'Maggie Lee', 554673780, to_date('24-06-2019', 'dd-mm-yyyy'), 'teacher', 104);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (375, 'Madilyn Lopez', 528037946, to_date('08-11-2014', 'dd-mm-yyyy'), 'teacher', 4);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (376, 'Aubree Wilson', 538126406, to_date('02-10-2016', 'dd-mm-yyyy'), 'teacher', 91);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (377, 'Hayden Lewis', 567550031, to_date('13-09-2005', 'dd-mm-yyyy'), 'assistant', 5);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (378, 'Katherine Nelson', 581348047, to_date('17-10-1994', 'dd-mm-yyyy'), 'teacher', 7);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (379, 'Layla Moore', 596127779, to_date('24-03-2015', 'dd-mm-yyyy'), 'assistant', 69);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (380, 'Mila Hall', 518551004, to_date('01-10-2005', 'dd-mm-yyyy'), 'assistant', 134);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (381, 'Maggie Lee', 550909852, to_date('03-06-2013', 'dd-mm-yyyy'), 'assistant', 18);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (382, 'Kinsley Harris', 573172273, to_date('16-02-2001', 'dd-mm-yyyy'), 'assistant', 35);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (383, 'Violet Carter', 549757709, to_date('13-01-2017', 'dd-mm-yyyy'), 'assistant', 13);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (384, 'Stella Martinez', 549256719, to_date('29-12-1998', 'dd-mm-yyyy'), 'assistant', 150);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (385, 'Aubrie Garcia', 592555456, to_date('13-01-2010', 'dd-mm-yyyy'), 'assistant', 105);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (386, 'Ava Rogers', 569924318, to_date('09-12-2019', 'dd-mm-yyyy'), 'assistant', 26);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (387, 'Reagan Moore', 528784136, to_date('28-06-1991', 'dd-mm-yyyy'), 'teacher', 125);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (388, 'Jocelyn Garcia', 574792453, to_date('01-09-2019', 'dd-mm-yyyy'), 'teacher', 118);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (389, 'Cora Wright', 554427055, to_date('07-09-2013', 'dd-mm-yyyy'), 'teacher', 105);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (390, 'Makayla Ramirez', 514031106, to_date('14-12-1993', 'dd-mm-yyyy'), 'teacher', 126);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (391, 'Emma Davis', 585106658, to_date('25-03-1994', 'dd-mm-yyyy'), 'teacher', 7);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (392, 'Sarah Diaz', 561975424, to_date('21-05-2000', 'dd-mm-yyyy'), 'assistant', 76);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (393, 'Daphne Scott', 558675934, to_date('17-10-2002', 'dd-mm-yyyy'), 'assistant', 97);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (394, 'Claire Harris', 574967600, to_date('26-04-1992', 'dd-mm-yyyy'), 'assistant', 146);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (395, 'Valentina Lewis', 557964646, to_date('19-08-2020', 'dd-mm-yyyy'), 'teacher', 78);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (396, 'Ruth Diaz', 547579069, to_date('20-11-2022', 'dd-mm-yyyy'), 'assistant', 107);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (397, 'Natalia Nguyen', 527637725, to_date('17-09-2016', 'dd-mm-yyyy'), 'teacher', 56);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (398, 'Taylor Clark', 556415651, to_date('05-09-1992', 'dd-mm-yyyy'), 'assistant', 16);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (399, 'Claire Roberts', 592067687, to_date('03-03-1998', 'dd-mm-yyyy'), 'teacher', 103);
insert into TEACHER (teacher_id, t_name, phone, experience_date, t_role, kindergartenid)
values (400, 'Mackenzie Thomas', 590435624, to_date('26-09-2009', 'dd-mm-yyyy'), 'teacher', 63);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for KINDERGARTEN...
alter table KINDERGARTEN enable constraint SYS_C007189;
alter table KINDERGARTEN enable constraint SYS_C007190;
prompt Enabling foreign key constraints for ACTIVITYSCHEDULE...
alter table ACTIVITYSCHEDULE enable constraint SYS_C007448;
alter table ACTIVITYSCHEDULE enable constraint SYS_C007449;
prompt Enabling foreign key constraints for CHILD...
alter table CHILD enable constraint SYS_C007467;
prompt Enabling foreign key constraints for REGISTRATION...
alter table REGISTRATION enable constraint SYS_C007484;
alter table REGISTRATION enable constraint SYS_C007485;
prompt Enabling foreign key constraints for TEACHER...
alter table TEACHER enable constraint SYS_C007238;
prompt Enabling triggers for ACTIVITY...
alter table ACTIVITY enable all triggers;
prompt Enabling triggers for K_TYPE...
alter table K_TYPE enable all triggers;
prompt Enabling triggers for BUILDINGS...
alter table BUILDINGS enable all triggers;
prompt Enabling triggers for KINDERGARTEN...
alter table KINDERGARTEN enable all triggers;
prompt Enabling triggers for ACTIVITYSCHEDULE...
alter table ACTIVITYSCHEDULE enable all triggers;
prompt Enabling triggers for CHILD...
alter table CHILD enable all triggers;
prompt Enabling triggers for REGISTRATION...
alter table REGISTRATION enable all triggers;
prompt Enabling triggers for TEACHER...
alter table TEACHER enable all triggers;
set feedback on
set define on
prompt Done.
