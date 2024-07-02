prompt PL/SQL Developer import file
prompt Created on יום חמישי 20 יוני 2024 by לקוח
set feedback off
set define off
prompt Creating ACTIVITY...
create table ACTIVITY
(
  activityid      NUMBER(3) not null,
  act_description VARCHAR2(100) default 'No description provided',
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

prompt Creating REGISTRATION...
create table REGISTRATION
(
  registrationid_  NUMBER(3) not null,
  registrationdate DATE,
  r_language       VARCHAR2(20),
  status           VARCHAR2(20),
  k_type_id        NUMBER(3) not null,
  kindergartenid   NUMBER(3)
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
  add constraint FK_REGISTRATION_KINDERGARTEN foreign key (KINDERGARTENID)
  references KINDERGARTEN (KINDERGARTENID);
alter table REGISTRATION
  add foreign key (K_TYPE_ID)
  references K_TYPE (K_TYPE_ID);

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
  registrationid_       NUMBER(3)
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
  add constraint FK_CHILD_REGISTRATION foreign key (REGISTRATIONID_)
  references REGISTRATION (REGISTRATIONID_);

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
prompt Disabling triggers for REGISTRATION...
alter table REGISTRATION disable all triggers;
prompt Disabling triggers for CHILD...
alter table CHILD disable all triggers;
prompt Disabling triggers for TEACHER...
alter table TEACHER disable all triggers;
prompt Disabling foreign key constraints for KINDERGARTEN...
alter table KINDERGARTEN disable constraint SYS_C007189;
alter table KINDERGARTEN disable constraint SYS_C007190;
prompt Disabling foreign key constraints for ACTIVITYSCHEDULE...
alter table ACTIVITYSCHEDULE disable constraint SYS_C007448;
alter table ACTIVITYSCHEDULE disable constraint SYS_C007449;
prompt Disabling foreign key constraints for REGISTRATION...
alter table REGISTRATION disable constraint FK_REGISTRATION_KINDERGARTEN;
alter table REGISTRATION disable constraint SYS_C007485;
prompt Disabling foreign key constraints for CHILD...
alter table CHILD disable constraint FK_CHILD_REGISTRATION;
prompt Disabling foreign key constraints for TEACHER...
alter table TEACHER disable constraint SYS_C007238;
prompt Deleting TEACHER...
delete from TEACHER;
commit;
prompt Deleting CHILD...
delete from CHILD;
commit;
prompt Deleting REGISTRATION...
delete from REGISTRATION;
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
insert into ACTIVITY (activityid, act_description, activity_name)
values (21, null, ' bbb');
insert into ACTIVITY (activityid, act_description, activity_name)
values (22, ' gyhjk', ' sss');
commit;
prompt 22 records loaded
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
values ('8:15', to_date('03-04-2024', 'dd-mm-yyyy'), 5, 138);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('14-09-2024', 'dd-mm-yyyy'), 14, 143);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:30', to_date('21-02-2024', 'dd-mm-yyyy'), 9, 54);
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
values ('10:45', to_date('22-08-2024', 'dd-mm-yyyy'), 13, 43);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:30', to_date('16-09-2024', 'dd-mm-yyyy'), 1, 100);
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
values ('11:15', to_date('19-02-2024', 'dd-mm-yyyy'), 5, 100);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('21-08-2024', 'dd-mm-yyyy'), 13, 23);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('19-03-2024', 'dd-mm-yyyy'), 7, 45);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('19-04-2024', 'dd-mm-yyyy'), 5, 59);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:30', to_date('23-04-2024', 'dd-mm-yyyy'), 3, 53);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('13-08-2024', 'dd-mm-yyyy'), 4, 117);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:15', to_date('13-07-2024', 'dd-mm-yyyy'), 17, 108);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('10-05-2024', 'dd-mm-yyyy'), 16, 65);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('21-06-2024', 'dd-mm-yyyy'), 1, 70);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:45', to_date('11-04-2024', 'dd-mm-yyyy'), 7, 87);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:15', to_date('01-09-2024', 'dd-mm-yyyy'), 5, 119);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:45', to_date('15-03-2024', 'dd-mm-yyyy'), 4, 95);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('12:00', to_date('18-08-2024', 'dd-mm-yyyy'), 8, 6);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('20-07-2024', 'dd-mm-yyyy'), 3, 122);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('8:30', to_date('29-03-2024', 'dd-mm-yyyy'), 19, 113);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('28-05-2024', 'dd-mm-yyyy'), 16, 18);
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
commit;
prompt 100 records committed...
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
values ('8:45', to_date('26-07-2024', 'dd-mm-yyyy'), 20, 9);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:30', to_date('18-08-2024', 'dd-mm-yyyy'), 10, 84);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:45', to_date('07-07-2024', 'dd-mm-yyyy'), 5, 12);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:30', to_date('09-02-2024', 'dd-mm-yyyy'), 15, 116);
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
values ('8:30', to_date('05-07-2024', 'dd-mm-yyyy'), 14, 50);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('14:45', to_date('27-08-2024', 'dd-mm-yyyy'), 15, 9);
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
values ('14:45', to_date('29-04-2024', 'dd-mm-yyyy'), 16, 74);
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
values ('13:15', to_date('01-04-2024', 'dd-mm-yyyy'), 17, 103);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('05-09-2024', 'dd-mm-yyyy'), 5, 137);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('24-02-2024', 'dd-mm-yyyy'), 5, 108);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('13:00', to_date('30-08-2024', 'dd-mm-yyyy'), 14, 17);
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
values ('15:30', to_date('24-08-2024', 'dd-mm-yyyy'), 19, 91);
commit;
prompt 200 records committed...
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
values ('14:00', to_date('23-07-2024', 'dd-mm-yyyy'), 1, 115);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:30', to_date('19-07-2024', 'dd-mm-yyyy'), 14, 19);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('10:45', to_date('06-05-2024', 'dd-mm-yyyy'), 15, 65);
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
commit;
prompt 300 records committed...
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
values ('15:30', to_date('27-06-2024', 'dd-mm-yyyy'), 15, 148);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:15', to_date('03-02-2024', 'dd-mm-yyyy'), 18, 96);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('11:00', to_date('23-02-2024', 'dd-mm-yyyy'), 4, 90);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('15:15', to_date('16-02-2024', 'dd-mm-yyyy'), 11, 85);
insert into ACTIVITYSCHEDULE (act_hour, activity_date, activityid, kindergartenid)
values ('9:45', to_date('16-04-2024', 'dd-mm-yyyy'), 20, 15);
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
values ('9:45', to_date('03-04-2024', 'dd-mm-yyyy'), 1, 85);
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
prompt 397 records loaded
prompt Loading REGISTRATION...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (100, to_date('26-11-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 114);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (103, to_date('05-07-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 51);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (104, to_date('16-10-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 37);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (105, to_date('08-07-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 88);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (108, to_date('23-01-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (109, to_date('13-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (111, to_date('14-09-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 20);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (112, to_date('22-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 55);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (113, to_date('24-06-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 36);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (114, to_date('25-03-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 88);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (115, to_date('24-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 120);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (116, to_date('08-06-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 66);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (120, to_date('21-12-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 1);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (121, to_date('20-01-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 108);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (123, to_date('07-11-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 105);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (126, to_date('07-12-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 111);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (127, to_date('29-09-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (128, to_date('02-07-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (129, to_date('29-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 32);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (131, to_date('15-02-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 56);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (133, to_date('09-06-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 9);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (134, to_date('22-10-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 97);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (135, to_date('19-11-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 25);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (140, to_date('06-01-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (141, to_date('11-08-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 32);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (142, to_date('21-01-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 53);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (143, to_date('22-03-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 31);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (144, to_date('28-06-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (146, to_date('11-05-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (147, to_date('15-03-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 29);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (149, to_date('16-03-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 24);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (151, to_date('11-10-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 30);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (152, to_date('21-11-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 36);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (153, to_date('14-02-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (157, to_date('26-11-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 130);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (158, to_date('12-03-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 55);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (159, to_date('14-07-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 23);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (160, to_date('07-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 103);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (161, to_date('21-06-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 57);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (162, to_date('29-10-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 18);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (163, to_date('10-02-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 95);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (165, to_date('01-11-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 85);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (168, to_date('06-02-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (169, to_date('16-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 80);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (170, to_date('29-10-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (171, to_date('27-06-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 55);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (172, to_date('27-05-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 69);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (174, to_date('06-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 119);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (175, to_date('06-05-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (180, to_date('17-03-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (182, to_date('23-07-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 26);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (183, to_date('16-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (184, to_date('19-07-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (185, to_date('19-01-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 57);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (187, to_date('27-02-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 75);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (188, to_date('09-08-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 19);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (189, to_date('06-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 73);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (191, to_date('27-07-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 84);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (193, to_date('24-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (195, to_date('14-07-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (196, to_date('13-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 47);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (198, to_date('30-07-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (199, to_date('30-05-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 92);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (200, to_date('03-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 28);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (201, to_date('07-05-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (202, to_date('23-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (203, to_date('02-12-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 92);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (204, to_date('18-08-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 149);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (205, to_date('31-05-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 26);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (206, to_date('07-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 76);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (208, to_date('08-12-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 46);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (209, to_date('12-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (210, to_date('19-04-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 60);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (211, to_date('30-09-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (212, to_date('27-03-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 90);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (215, to_date('21-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 11);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (217, to_date('13-05-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 133);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (218, to_date('15-10-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 104);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (219, to_date('20-05-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (220, to_date('25-05-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 76);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (222, to_date('12-04-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 93);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (224, to_date('24-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 86);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (226, to_date('16-02-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 20);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (227, to_date('02-03-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 133);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (229, to_date('16-04-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 74);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (230, to_date('14-02-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (231, to_date('08-02-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (233, to_date('18-07-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 17);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (234, to_date('10-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 40);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (238, to_date('18-09-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 35);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (239, to_date('10-07-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 139);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (241, to_date('26-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 108);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (242, to_date('27-05-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 72);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (243, to_date('10-04-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (244, to_date('22-03-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (245, to_date('27-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 148);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (246, to_date('25-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 5);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (247, to_date('02-11-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 111);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (248, to_date('10-09-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (249, to_date('31-07-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 116);
commit;
prompt 100 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (250, to_date('17-05-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 98);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (251, to_date('10-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (252, to_date('15-02-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (254, to_date('26-05-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 32);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (255, to_date('20-06-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (256, to_date('22-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 5);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (257, to_date('06-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (258, to_date('09-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 31);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (259, to_date('14-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 92);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (260, to_date('09-11-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 45);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (262, to_date('23-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 37);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (263, to_date('14-10-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (266, to_date('12-08-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 150);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (267, to_date('25-08-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 34);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (268, to_date('06-03-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 25);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (269, to_date('04-09-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (271, to_date('13-02-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 87);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (272, to_date('22-02-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (274, to_date('16-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (275, to_date('03-09-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (276, to_date('25-07-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 150);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (277, to_date('22-08-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 150);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (278, to_date('24-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 112);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (285, to_date('19-03-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 129);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (286, to_date('07-02-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 72);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (287, to_date('17-11-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 140);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (288, to_date('02-07-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 68);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (289, to_date('03-06-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 40);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (290, to_date('12-08-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 22);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (291, to_date('27-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (292, to_date('25-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 38);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (295, to_date('22-09-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 104);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (297, to_date('20-06-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (298, to_date('22-01-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 13);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (299, to_date('28-06-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (300, to_date('20-04-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 129);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (302, to_date('12-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 110);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (304, to_date('11-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 120);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (306, to_date('16-08-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (308, to_date('30-08-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 10);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (309, to_date('03-09-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (310, to_date('03-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 111);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (311, to_date('14-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 64);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (312, to_date('02-08-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 87);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (314, to_date('20-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 56);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (315, to_date('26-08-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (316, to_date('19-12-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (317, to_date('15-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 29);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (318, to_date('15-01-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (319, to_date('19-08-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 72);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (320, to_date('18-09-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (321, to_date('14-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 137);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (322, to_date('20-04-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 66);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (324, to_date('25-11-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 34);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (325, to_date('19-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (326, to_date('09-03-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (327, to_date('15-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 103);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (328, to_date('15-12-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 74);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (329, to_date('29-03-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (330, to_date('05-07-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 119);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (331, to_date('05-09-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 9);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (332, to_date('08-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (334, to_date('14-09-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 146);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (335, to_date('10-09-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 15);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (336, to_date('19-04-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 115);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (337, to_date('22-10-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 52);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (338, to_date('13-01-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (339, to_date('05-03-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 12);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (340, to_date('01-12-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 54);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (341, to_date('11-07-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 38);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (343, to_date('02-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (344, to_date('08-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (345, to_date('26-11-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 112);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (346, to_date('09-06-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 100);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (347, to_date('06-03-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (349, to_date('26-10-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 105);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (352, to_date('06-10-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 66);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (353, to_date('20-01-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 23);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (355, to_date('10-04-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (356, to_date('03-04-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 58);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (358, to_date('06-07-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 57);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (360, to_date('21-05-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (363, to_date('28-12-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 16);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (364, to_date('26-03-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 22);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (365, to_date('23-12-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 9);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (367, to_date('20-03-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 51);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (368, to_date('06-02-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 31);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (369, to_date('05-12-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (371, to_date('28-10-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 97);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (373, to_date('20-03-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 50);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (374, to_date('24-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 14);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (376, to_date('02-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 17);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (377, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (378, to_date('20-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 66);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (379, to_date('19-03-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (380, to_date('29-04-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 138);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (381, to_date('26-07-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 7);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (382, to_date('14-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 115);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (383, to_date('02-04-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 114);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (384, to_date('19-07-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 131);
commit;
prompt 200 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (385, to_date('28-09-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 81);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (387, to_date('23-07-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 74);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (388, to_date('12-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (389, to_date('07-11-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 93);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (392, to_date('25-05-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 55);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (393, to_date('08-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (394, to_date('09-01-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 9);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (396, to_date('02-11-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (397, to_date('05-05-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 34);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (399, to_date('06-04-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 17);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (401, to_date('24-01-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 85);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (403, to_date('09-06-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 115);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (405, to_date('08-10-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (406, to_date('24-09-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 104);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (407, to_date('17-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 26);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (409, to_date('29-07-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (411, to_date('14-07-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 118);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (417, to_date('16-09-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (418, to_date('26-11-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 100);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (419, to_date('10-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 39);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (420, to_date('13-08-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 50);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (422, to_date('04-07-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 20);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (423, to_date('22-07-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 47);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (425, to_date('28-01-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 30);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (426, to_date('20-05-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 85);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (428, to_date('26-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 117);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (429, to_date('19-09-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 131);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (431, to_date('10-02-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (432, to_date('27-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 141);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (434, to_date('08-04-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (438, to_date('08-06-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (440, to_date('20-05-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 7);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (441, to_date('21-03-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (442, to_date('23-07-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 9);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (444, to_date('21-05-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (445, to_date('26-01-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 55);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (446, to_date('24-01-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (447, to_date('06-07-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 56);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (448, to_date('27-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (449, to_date('23-06-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (450, to_date('14-06-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 113);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (451, to_date('14-06-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 124);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (452, to_date('02-06-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 11);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (454, to_date('22-06-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 138);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (456, to_date('07-10-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 70);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (457, to_date('09-12-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 16);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (463, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 139);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (464, to_date('15-03-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 110);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (465, to_date('26-06-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 107);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (466, to_date('03-11-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 118);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (471, to_date('17-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 129);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (472, to_date('27-02-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (474, to_date('01-10-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 77);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (478, to_date('19-11-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 18);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (479, to_date('24-01-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 85);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (481, to_date('28-07-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 47);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (484, to_date('04-03-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (485, to_date('22-04-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (487, to_date('20-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 87);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (488, to_date('01-12-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (490, to_date('19-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 65);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (493, to_date('31-07-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 106);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (494, to_date('30-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 113);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (495, to_date('14-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 110);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (496, to_date('15-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (497, to_date('24-10-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 62);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (498, to_date('26-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 138);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (499, to_date('18-10-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 112);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (500, to_date('07-06-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 87);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (502, to_date('20-07-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (503, to_date('19-06-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (506, to_date('06-10-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 7);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (507, to_date('02-12-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 86);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (508, to_date('03-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (509, to_date('27-09-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (510, to_date('30-10-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (512, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 36);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (513, to_date('07-07-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 40);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (515, to_date('08-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 41);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (516, to_date('08-04-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 10);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (517, to_date('26-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 80);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (520, to_date('30-03-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 47);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (521, to_date('09-03-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 19);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (524, to_date('30-06-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 2);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (525, to_date('10-02-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 7);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (526, to_date('15-09-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (527, to_date('28-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 140);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (528, to_date('29-04-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (529, to_date('02-04-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 30);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (530, to_date('10-02-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 16);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (531, to_date('31-12-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (532, to_date('23-12-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 81);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (533, to_date('04-02-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 34);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (534, to_date('05-04-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 97);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (535, to_date('12-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 133);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (536, to_date('15-10-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 2);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (538, to_date('30-09-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 36);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (539, to_date('06-02-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 23);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (540, to_date('23-05-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (541, to_date('11-09-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 131);
commit;
prompt 300 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (542, to_date('17-07-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 130);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (544, to_date('26-11-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 33);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (545, to_date('30-10-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 14);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (546, to_date('14-03-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 14);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (548, to_date('09-02-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (549, to_date('20-10-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 102);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (552, to_date('25-08-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (553, to_date('12-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 4);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (555, to_date('24-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (556, to_date('16-03-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 118);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (558, to_date('03-06-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (559, to_date('05-12-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 136);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (560, to_date('12-09-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (561, to_date('28-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 106);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (563, to_date('12-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 119);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (564, to_date('19-06-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 76);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (565, to_date('27-04-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 26);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (566, to_date('09-08-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 111);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (568, to_date('09-06-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 133);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (569, to_date('23-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 21);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (570, to_date('07-11-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (571, to_date('07-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 19);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (574, to_date('03-09-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (575, to_date('13-09-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 81);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (576, to_date('14-12-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 98);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (577, to_date('16-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (578, to_date('24-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 64);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (580, to_date('03-02-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 112);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (581, to_date('10-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (583, to_date('01-01-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (584, to_date('09-01-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 68);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (586, to_date('24-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 131);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (587, to_date('21-07-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (588, to_date('16-07-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (590, to_date('18-11-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 34);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (591, to_date('10-11-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (593, to_date('21-07-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 4);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (594, to_date('18-03-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (595, to_date('03-09-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 118);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (601, to_date('15-06-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 52);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (602, to_date('22-03-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 96);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (603, to_date('08-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (604, to_date('27-08-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (606, to_date('15-11-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (607, to_date('25-10-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 63);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (608, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (609, to_date('03-09-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 102);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (610, to_date('11-06-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 85);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (613, to_date('07-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 25);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (616, to_date('10-04-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 112);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (619, to_date('06-09-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 108);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (620, to_date('19-11-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 114);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (621, to_date('29-05-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 20);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (623, to_date('24-03-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (624, to_date('26-07-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (625, to_date('19-06-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 131);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (626, to_date('26-07-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 139);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (628, to_date('10-11-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 97);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (630, to_date('10-10-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 16);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (631, to_date('24-12-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (632, to_date('29-11-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 80);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (634, to_date('03-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 113);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (635, to_date('21-08-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 41);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (637, to_date('29-04-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 22);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (638, to_date('16-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 25);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (639, to_date('02-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 1);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (641, to_date('31-03-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 54);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (642, to_date('24-09-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 47);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (643, to_date('04-06-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 31);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (644, to_date('29-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 73);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (645, to_date('17-04-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (647, to_date('03-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 88);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (648, to_date('16-04-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 24);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (649, to_date('27-05-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 26);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (650, to_date('04-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (651, to_date('23-11-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 23);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (652, to_date('23-08-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 87);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (653, to_date('24-06-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 29);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (656, to_date('08-11-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 122);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (657, to_date('01-08-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (658, to_date('29-04-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (660, to_date('26-07-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 68);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (661, to_date('10-02-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 53);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (666, to_date('11-05-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 105);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (668, to_date('09-10-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 147);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (669, to_date('14-11-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 68);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (671, to_date('17-07-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 113);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (673, to_date('15-04-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 117);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (674, to_date('30-12-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 19);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (677, to_date('20-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 99);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (678, to_date('09-11-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 103);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (679, to_date('22-10-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 137);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (680, to_date('23-12-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 39);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (681, to_date('30-07-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 141);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (682, to_date('29-04-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 110);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (683, to_date('19-12-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 130);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (684, to_date('20-03-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 30);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (687, to_date('15-05-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 147);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (688, to_date('30-11-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 93);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (689, to_date('05-06-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 19);
commit;
prompt 400 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (690, to_date('20-08-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (691, to_date('12-12-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 92);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (692, to_date('23-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 133);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (693, to_date('29-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 125);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (695, to_date('25-01-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 8);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (697, to_date('07-11-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 101);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (698, to_date('04-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (699, to_date('20-09-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (706, to_date('21-05-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 39);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (707, to_date('20-10-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 36);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (708, to_date('01-06-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 35);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (709, to_date('24-01-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 123);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (710, to_date('25-01-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 35);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (712, to_date('25-03-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 71);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (715, to_date('01-09-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 33);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (716, to_date('30-12-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 106);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (720, to_date('20-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (721, to_date('10-07-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 27);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (723, to_date('27-09-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 35);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (724, to_date('28-12-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 51);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (725, to_date('22-12-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 32);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (727, to_date('28-05-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 45);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (728, to_date('04-01-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 102);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (732, to_date('08-12-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 110);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (733, to_date('05-08-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 50);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (735, to_date('02-10-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 65);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (736, to_date('30-06-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 142);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (739, to_date('25-12-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 58);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (740, to_date('31-01-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 52);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (741, to_date('08-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 56);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (742, to_date('23-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 98);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (743, to_date('18-04-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 46);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (744, to_date('13-12-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 73);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (745, to_date('10-06-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (746, to_date('19-06-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 40);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (747, to_date('08-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 105);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (748, to_date('23-05-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 18);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (749, to_date('16-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 30);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (750, to_date('11-01-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 150);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (753, to_date('24-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 120);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (754, to_date('03-07-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 129);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (755, to_date('01-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 60);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (756, to_date('03-07-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (759, to_date('18-12-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 147);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (760, to_date('03-09-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 53);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (761, to_date('12-05-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 53);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (762, to_date('15-04-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 83);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (763, to_date('14-11-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (764, to_date('13-10-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (768, to_date('26-02-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (770, to_date('20-02-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 134);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (771, to_date('10-07-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 15);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (772, to_date('16-04-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 62);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (773, to_date('10-04-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 86);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (774, to_date('26-03-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 45);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (775, to_date('11-12-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 51);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (776, to_date('13-01-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (777, to_date('04-03-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 19);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (778, to_date('03-08-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 40);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (779, to_date('18-01-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 38);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (780, to_date('15-10-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 132);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (781, to_date('12-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 128);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (782, to_date('26-07-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 41);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (784, to_date('04-09-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 149);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (785, to_date('25-07-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 91);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (786, to_date('10-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (787, to_date('05-07-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (789, to_date('29-04-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 114);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (792, to_date('24-02-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (793, to_date('23-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 65);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (794, to_date('20-05-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 48);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (795, to_date('26-11-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 78);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (797, to_date('01-05-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 139);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (799, to_date('20-08-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 56);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (800, to_date('23-03-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (802, to_date('18-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 81);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (805, to_date('09-05-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 100);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (806, to_date('26-06-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (1, to_date('16-06-2024 14:26:08', 'dd-mm-yyyy hh24:mi:ss'), 'English', 'Pending', 143, 1);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (808, to_date('19-05-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 82);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (809, to_date('21-06-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 64);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (810, to_date('10-12-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (812, to_date('05-08-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 52);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (813, to_date('24-03-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (815, to_date('08-12-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 53);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (816, to_date('16-10-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 63);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (817, to_date('21-07-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (818, to_date('10-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 143, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (820, to_date('14-02-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 131);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (821, to_date('28-03-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 18);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (823, to_date('07-11-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 67);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (826, to_date('13-10-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (827, to_date('10-04-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 57);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (828, to_date('28-12-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 89);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (829, to_date('20-02-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 135, 94);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (830, to_date('20-08-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 50);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (831, to_date('05-01-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 43);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (832, to_date('11-08-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 60);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (834, to_date('04-03-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 124, 15);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (837, to_date('11-02-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 89);
commit;
prompt 500 records committed...
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (838, to_date('18-05-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 103);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (839, to_date('03-06-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 126);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (840, to_date('20-11-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 149);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (842, to_date('04-09-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 83);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (843, to_date('27-03-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 3);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (844, to_date('15-03-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (847, to_date('09-01-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 57);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (848, to_date('02-03-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 103);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (849, to_date('22-11-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 50);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (852, to_date('10-01-2020', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 143);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (854, to_date('11-02-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 142, 149);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (856, to_date('20-02-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 109);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (858, to_date('22-08-2022', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 105);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (859, to_date('03-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 49);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (860, to_date('25-02-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 95);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (861, to_date('06-04-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 123, 29);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (862, to_date('20-09-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 15);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (863, to_date('18-05-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 61);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (864, to_date('15-03-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 127);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (866, to_date('02-06-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (867, to_date('08-01-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 136, 29);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (870, to_date('26-07-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 5);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (871, to_date('17-10-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 42);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (872, to_date('15-06-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 123, 115);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (873, to_date('11-11-2021', 'dd-mm-yyyy'), 'russian', 'Accepted', 136, 89);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (875, to_date('07-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 119);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (876, to_date('06-01-2023', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 145);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (877, to_date('27-09-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 135);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (879, to_date('25-09-2020', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 45);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (880, to_date('13-09-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 80);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (881, to_date('05-02-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 107);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (882, to_date('19-05-2022', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 23);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (886, to_date('09-06-2020', 'dd-mm-yyyy'), 'russian', 'Accepted', 142, 15);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (887, to_date('30-11-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 124, 6);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (888, to_date('12-06-2023', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 28);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (889, to_date('23-03-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 143, 83);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (890, to_date('06-02-2019', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 135, 104);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (892, to_date('20-03-2019', 'dd-mm-yyyy'), 'english', 'Accepted', 135, 121);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (894, to_date('15-09-2023', 'dd-mm-yyyy'), 'russian', 'Accepted', 124, 148);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (895, to_date('02-01-2022', 'dd-mm-yyyy'), 'english', 'Accepted', 142, 39);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (896, to_date('25-11-2021', 'dd-mm-yyyy'), 'english', 'Accepted', 136, 117);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (897, to_date('05-08-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 8);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (898, to_date('04-09-2021', 'dd-mm-yyyy'), 'hebrew', 'Accepted', 143, 144);
insert into REGISTRATION (registrationid_, registrationdate, r_language, status, k_type_id, kindergartenid)
values (899, to_date('23-09-2019', 'dd-mm-yyyy'), 'russian', 'Accepted', 123, 14);
commit;
prompt 544 records loaded
prompt Loading CHILD...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (1, 'Harper', 'Miller', to_date('04-10-2022', 'dd-mm-yyyy'), 'Gluten', 'Madeline Miller', 588847873, null, 100);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (2, 'Lila', 'Clark', to_date('15-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Nora Clark', 574842398, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (3, 'Madison', 'Ramirez', to_date('06-12-2018', 'dd-mm-yyyy'), 'Peanuts', 'John Ramirez', 517582087, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (4, 'Dylan', 'Johnson', to_date('06-12-2023', 'dd-mm-yyyy'), 'Gluten', 'David Johnson', 534016128, null, 103);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (5, 'Jack', 'Thomas', to_date('24-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Aurora Thomas', 532572143, null, 104);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (6, 'Gregory', 'Rogers', to_date('03-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Amelia Rogers', 587717904, null, 105);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (7, 'Aubree', 'Robinson', to_date('19-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Aaliyah Robinson', 592101363, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (8, 'Juan', 'Evans', to_date('25-03-2021', 'dd-mm-yyyy'), null, 'Kinsley Evans', 520604331, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (9, 'Leilani', 'Miller', to_date('20-11-2020', 'dd-mm-yyyy'), null, 'Piper Miller', 551767273, null, 108);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (10, 'Cameron', 'Diaz', to_date('11-05-2020', 'dd-mm-yyyy'), 'Dairy', 'Maya Diaz', 566202456, null, 109);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (11, 'Rosalie', 'Garcia', to_date('05-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Gabriel Garcia', 540570590, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (12, 'Sloane', 'Nguyen', to_date('06-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Lucy Nguyen', 545214792, null, 111);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (13, 'Brianna', 'Miller', to_date('21-10-2021', 'dd-mm-yyyy'), null, 'Elena Miller', 596031271, null, 112);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (14, 'Leonardo', 'Campbell', to_date('29-12-2020', 'dd-mm-yyyy'), null, 'Charlotte Campbell', 531389515, null, 113);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (15, 'Ava', 'Wilson', to_date('03-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Juan Wilson', 545262964, null, 114);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (16, 'Eva', 'Clark', to_date('26-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Dustin Clark', 524562705, null, 115);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (17, 'Ezekiel', 'Carter', to_date('27-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Juan Carter', 585414418, null, 116);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (18, 'Autumn', 'Walker', to_date('17-04-2018', 'dd-mm-yyyy'), null, 'Adalyn Walker', 537264958, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (19, 'Olivia', 'Johnson', to_date('25-03-2022', 'dd-mm-yyyy'), null, 'Felipe Johnson', 536018837, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (20, 'Alexandra', 'Thompson', to_date('07-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Douglas Thompson', 594226641, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (21, 'Daniel', 'Walker', to_date('29-09-2018', 'dd-mm-yyyy'), null, 'Gregory Walker', 539049290, null, 120);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (22, 'Lucy', 'Rodriguez', to_date('03-04-2023', 'dd-mm-yyyy'), null, 'Allison Rodriguez', 569980433, null, 121);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (23, 'Luna', 'Hernandez', to_date('07-05-2022', 'dd-mm-yyyy'), 'Dairy', 'Callie Hernandez', 529556355, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (24, 'Amelia', 'Carter', to_date('17-08-2023', 'dd-mm-yyyy'), null, 'Nathan Carter', 565330607, null, 123);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (25, 'Serenity', 'Robinson', to_date('25-12-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madilyn Robinson', 561405746, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (26, 'Naomi', 'Clark', to_date('14-05-2018', 'dd-mm-yyyy'), null, 'Cora Clark', 565628708, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (27, 'Mia', 'Nelson', to_date('30-11-2021', 'dd-mm-yyyy'), 'Peanuts', 'Daisy Nelson', 546208389, null, 126);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (28, 'Rylee', 'Scott', to_date('01-09-2023', 'dd-mm-yyyy'), null, 'Emma Scott', 584067767, null, 127);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (29, 'Andrea', 'Anderson', to_date('13-02-2018', 'dd-mm-yyyy'), null, 'Nora Anderson', 513023771, null, 128);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (30, 'Jack', 'Scott', to_date('22-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Joan Scott', 512708817, null, 129);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (31, 'Leilani', 'Rogers', to_date('07-12-2019', 'dd-mm-yyyy'), 'Dairy', 'Dustin Rogers', 510690950, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (32, 'Alexis', 'Cruz', to_date('03-08-2020', 'dd-mm-yyyy'), null, 'Adeline Cruz', 590769216, null, 131);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (33, 'Nora', 'Nguyen', to_date('26-03-2023', 'dd-mm-yyyy'), null, 'Isabelle Nguyen', 540231576, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (34, 'Avery', 'Rodriguez', to_date('23-06-2021', 'dd-mm-yyyy'), null, 'Samantha Rodriguez', 560032805, null, 133);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (35, 'Antonio', 'Clark', to_date('06-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Vivienne Clark', 560907331, null, 134);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (36, 'Jordan', 'Campbell', to_date('15-01-2021', 'dd-mm-yyyy'), null, 'Callie Campbell', 543464520, null, 135);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (37, 'Samantha', 'Allen', to_date('22-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Andrea Allen', 598205958, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (38, 'Brian', 'Carter', to_date('21-04-2021', 'dd-mm-yyyy'), 'Dairy', 'Peyton Carter', 549650000, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (39, 'Harper', 'Hall', to_date('22-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Paisley Hall', 598347962, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (40, 'Nathan', 'Harris', to_date('07-11-2023', 'dd-mm-yyyy'), 'Peanuts', 'Teagan Harris', 548123208, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (41, 'Henry', 'Allen', to_date('12-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Gracie Allen', 512571173, null, 140);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (42, 'Keira', 'Kim', to_date('28-06-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Kim', 533854435, null, 141);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (43, 'Juan', 'Scott', to_date('21-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Addison Scott', 562529742, null, 142);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (44, 'Emery', 'Wright', to_date('30-03-2018', 'dd-mm-yyyy'), 'Gluten', 'Andrew Wright', 513899954, null, 143);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (45, 'Joshua', 'Hall', to_date('02-08-2019', 'dd-mm-yyyy'), 'Gluten', 'Molly Hall', 560859403, null, 144);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (46, 'Jayden', 'Anderson', to_date('16-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Anderson', 599558177, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (47, 'Isabelle', 'Moore', to_date('01-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Jack Moore', 537224781, null, 146);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (48, 'Aurora', 'Walker', to_date('11-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Sadie Walker', 586474668, null, 147);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (49, 'Adeline', 'Kim', to_date('11-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Kim', 564328212, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (50, 'Adalyn', 'Brown', to_date('15-06-2020', 'dd-mm-yyyy'), 'Dairy', 'Adeline Brown', 552273227, null, 149);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (51, 'Melanie', 'Thomas', to_date('23-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Natalie Thomas', 577515662, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (52, 'Isabelle', 'Mitchell', to_date('24-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Dylan Mitchell', 565490836, null, 151);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (53, 'Alexis', 'Miller', to_date('06-11-2023', 'dd-mm-yyyy'), null, 'Piper Miller', 590171539, null, 152);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (54, 'Vivienne', 'Hernandez', to_date('15-03-2023', 'dd-mm-yyyy'), null, 'Lydia Hernandez', 529003172, null, 153);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (55, 'Riley', 'Allen', to_date('20-04-2023', 'dd-mm-yyyy'), 'Peanuts', 'Aria Allen', 555764266, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (56, 'Mackenzie', 'Hernandez', to_date('18-02-2022', 'dd-mm-yyyy'), null, 'Antonio Hernandez', 584316069, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (57, 'Luke', 'Clark', to_date('04-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Clark', 574352333, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (58, 'Juliet', 'Garcia', to_date('05-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Christopher Garcia', 549520620, null, 157);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (59, 'Amelia', 'Wright', to_date('15-04-2021', 'dd-mm-yyyy'), 'Peanuts', 'Maya Wright', 560491684, null, 158);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (60, 'Molly', 'Adams', to_date('17-07-2020', 'dd-mm-yyyy'), 'Gluten', 'Chloe Adams', 524885320, null, 159);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (61, 'Alice', 'Robinson', to_date('26-04-2022', 'dd-mm-yyyy'), null, 'Ivy Robinson', 562515890, null, 160);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (62, 'Teagan', 'Allen', to_date('26-04-2018', 'dd-mm-yyyy'), 'Gluten', 'Aaliyah Allen', 518300471, null, 161);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (63, 'Eliana', 'Clark', to_date('18-09-2019', 'dd-mm-yyyy'), 'Dairy', 'Lillian Clark', 540737888, null, 162);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (64, 'Ivy', 'Moore', to_date('14-03-2023', 'dd-mm-yyyy'), null, 'Isaiah Moore', 565196838, null, 163);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (65, 'Ruby', 'Walker', to_date('13-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Derek Walker', 558605350, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (66, 'Claire', 'Robinson', to_date('28-02-2019', 'dd-mm-yyyy'), null, 'Juan Robinson', 553821900, null, 165);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (67, 'Addison', 'Garcia', to_date('29-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Lucy Garcia', 555337890, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (68, 'Amelia', 'Adams', to_date('17-10-2019', 'dd-mm-yyyy'), 'Dairy', 'Jayden Adams', 561829258, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (69, 'Luke', 'Thomas', to_date('01-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Allison Thomas', 592711488, null, 168);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (70, 'Diego', 'Wilson', to_date('10-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Joshua Wilson', 520971921, null, 169);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (71, 'Austin', 'Scott', to_date('10-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Riley Scott', 517315934, null, 170);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (72, 'Abraham', 'Thompson', to_date('13-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Alaina Thompson', 516638606, null, 171);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (73, 'Adalyn', 'Phillips', to_date('06-01-2023', 'dd-mm-yyyy'), null, 'Gabriel Phillips', 536133010, null, 172);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (74, 'Scarlett', 'Young', to_date('08-04-2020', 'dd-mm-yyyy'), null, 'Hazel Young', 588523956, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (75, 'Gabriel', 'Scott', to_date('17-05-2020', 'dd-mm-yyyy'), null, 'Natalia Scott', 557488948, null, 174);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (76, 'Allison', 'Jones', to_date('08-06-2021', 'dd-mm-yyyy'), 'Gluten', 'Emery Jones', 567655148, null, 175);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (77, 'Ava', 'Rodriguez', to_date('02-06-2022', 'dd-mm-yyyy'), null, 'Mia Rodriguez', 562033122, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (78, 'Henry', 'Clark', to_date('03-10-2018', 'dd-mm-yyyy'), 'Dairy', 'Harper Clark', 590485288, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (79, 'Javier', 'Young', to_date('03-09-2022', 'dd-mm-yyyy'), null, 'Alice Young', 534656300, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (80, 'Lawrence', 'Rogers', to_date('07-05-2019', 'dd-mm-yyyy'), null, 'Eliana Rogers', 527334370, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (81, 'Evelyn', 'Clark', to_date('09-08-2018', 'dd-mm-yyyy'), null, 'Leonardo Clark', 553870768, null, 180);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (82, 'Ariana', 'Scott', to_date('23-03-2022', 'dd-mm-yyyy'), 'Peanuts', 'Edward Scott', 517985037, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (83, 'Aurora', 'Taylor', to_date('25-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Serenity Taylor', 586920851, null, 182);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (84, 'Joshua', 'Wilson', to_date('19-03-2023', 'dd-mm-yyyy'), 'Gluten', 'Eliza Wilson', 527869846, null, 183);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (85, 'Olivia', 'Hernandez', to_date('30-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Charlotte Hernandez', 529146047, null, 184);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (86, 'Josephine', 'Nelson', to_date('11-01-2019', 'dd-mm-yyyy'), null, 'Penelope Nelson', 594548438, null, 185);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (87, 'Rose', 'Hernandez', to_date('18-04-2022', 'dd-mm-yyyy'), 'Dairy', 'Isabella Hernandez', 557636365, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (88, 'Cora', 'Walker', to_date('12-12-2021', 'dd-mm-yyyy'), null, 'Dennis Walker', 582480874, null, 187);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (89, 'Diego', 'Rogers', to_date('23-08-2021', 'dd-mm-yyyy'), null, 'Madison Rogers', 578274445, null, 188);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (90, 'Harper', 'Harris', to_date('12-11-2022', 'dd-mm-yyyy'), null, 'Kevin Harris', 592280631, null, 189);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (91, 'Kaitlyn', 'Hernandez', to_date('11-06-2023', 'dd-mm-yyyy'), null, 'Clara Hernandez', 599957387, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (92, 'Luna', 'Miller', to_date('19-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Alexis Miller', 547501127, null, 191);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (93, 'Leonardo', 'Hernandez', to_date('24-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Hernandez', 590995731, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (94, 'Aurora', 'Allen', to_date('03-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Jacob Allen', 523992563, null, 193);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (95, 'Eric', 'Walker', to_date('03-07-2019', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Walker', 591846409, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (96, 'Lucy', 'Smith', to_date('07-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Smith', 567261881, null, 195);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (97, 'Adalyn', 'Garcia', to_date('10-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Jade Garcia', 520489344, null, 196);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (98, 'Lillian', 'Hernandez', to_date('12-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Austin Hernandez', 582262945, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (99, 'Kyle', 'Hernandez', to_date('24-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Brian Hernandez', 586344651, null, 198);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (100, 'Daisy', 'Rogers', to_date('29-10-2020', 'dd-mm-yyyy'), 'Peanuts', 'Sarah Rogers', 511357835, null, 199);
commit;
prompt 100 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (101, 'Dustin', 'Lewis', to_date('02-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Lucas Lewis', 542052286, null, 200);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (102, 'Leilani', 'Davis', to_date('05-10-2019', 'dd-mm-yyyy'), null, 'Anthony Davis', 596566574, null, 201);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (103, 'Amaya', 'Sanchez', to_date('13-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Teagan Sanchez', 539091978, null, 202);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (104, 'Caroline', 'Lee', to_date('01-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Alice Lee', 566988890, null, 203);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (105, 'Callie', 'Nelson', to_date('17-12-2019', 'dd-mm-yyyy'), null, 'Adeline Nelson', 590632990, null, 204);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (106, 'Lila', 'Lopez', to_date('17-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Elena Lopez', 584024462, null, 205);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (107, 'Nicole', 'Hernandez', to_date('28-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Eloise Hernandez', 574392735, null, 206);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (108, 'Zoey', 'Rogers', to_date('20-01-2018', 'dd-mm-yyyy'), 'Peanuts', 'Lila Rogers', 566413855, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (109, 'Zoey', 'Jones', to_date('19-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Brooklyn Jones', 544078891, null, 208);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (110, 'Grace', 'Moore', to_date('21-01-2022', 'dd-mm-yyyy'), null, 'Felipe Moore', 559722260, null, 209);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (111, 'Carlos', 'Adams', to_date('13-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Maya Adams', 515893255, null, 210);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (112, 'Eloise', 'Davis', to_date('18-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Eva Davis', 515084382, null, 211);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (113, 'Chloe', 'Anderson', to_date('01-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Lillian Anderson', 535973306, null, 212);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (114, 'Jayden', 'Walker', to_date('31-03-2023', 'dd-mm-yyyy'), null, 'Cora Walker', 590404617, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (115, 'Vivian', 'Rogers', to_date('17-06-2018', 'dd-mm-yyyy'), 'Dairy', 'Taylor Rogers', 590337353, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (116, 'Ellie', 'Scott', to_date('22-07-2022', 'dd-mm-yyyy'), null, 'Grace Scott', 534261828, null, 215);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (117, 'Keira', 'Jones', to_date('21-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Clara Jones', 592709469, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (118, 'Jayden', 'Young', to_date('02-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Clara Young', 538885685, null, 217);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (119, 'Skylar', 'Moore', to_date('08-02-2020', 'dd-mm-yyyy'), 'Dairy', 'Joseph Moore', 582716826, null, 218);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (120, 'John', 'Johnson', to_date('09-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Henry Johnson', 518122540, null, 219);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (121, 'Samantha', 'Miller', to_date('26-03-2021', 'dd-mm-yyyy'), 'Gluten', 'Kaitlyn Miller', 555740243, null, 220);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (122, 'Vivian', 'Nelson', to_date('15-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Ezekiel Nelson', 575527737, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (123, 'Autumn', 'Cruz', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Isaac Cruz', 517823424, null, 222);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (124, 'Serenity', 'Green', to_date('12-03-2021', 'dd-mm-yyyy'), null, 'Paisley Green', 562651693, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (125, 'Delilah', 'Young', to_date('06-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Everly Young', 547664211, null, 224);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (126, 'Sadie', 'Rogers', to_date('18-04-2020', 'dd-mm-yyyy'), null, 'Ivy Rogers', 582144323, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (127, 'Everly', 'Garcia', to_date('02-09-2019', 'dd-mm-yyyy'), 'Dairy', 'Justin Garcia', 561409207, null, 226);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (128, 'Juliet', 'Allen', to_date('24-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Justin Allen', 574966456, null, 227);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (129, 'Luna', 'Wright', to_date('05-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Keira Wright', 577263236, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (130, 'Valentina', 'Watson', to_date('24-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Abigail Watson', 532191280, null, 229);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (131, 'Madeline', 'Davis', to_date('25-02-2018', 'dd-mm-yyyy'), null, 'Eric Davis', 510383295, null, 230);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (132, 'Jacob', 'Diaz', to_date('11-06-2019', 'dd-mm-yyyy'), null, 'Mackenzie Diaz', 557010880, null, 231);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (133, 'Valentina', 'Watson', to_date('03-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Ella Watson', 579648817, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (134, 'Ava', 'Lopez', to_date('26-04-2022', 'dd-mm-yyyy'), null, 'Javier Lopez', 541035924, null, 233);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (135, 'Valentina', 'Campbell', to_date('16-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Isla Campbell', 567119206, null, 234);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (136, 'Joseph', 'Robinson', to_date('08-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Robinson', 519654379, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (137, 'Justin', 'Campbell', to_date('03-05-2020', 'dd-mm-yyyy'), 'Dairy', 'Taylor Campbell', 535206449, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (138, 'Jayden', 'Nelson', to_date('04-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Nicole Nelson', 559206635, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (139, 'Ruby', 'Hernandez', to_date('28-04-2020', 'dd-mm-yyyy'), null, 'Josephine Hernandez', 557083711, null, 238);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (140, 'Eliana', 'Allen', to_date('03-07-2020', 'dd-mm-yyyy'), null, 'Ethan Allen', 595595574, null, 239);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (141, 'Alyssa', 'Evans', to_date('28-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Edward Evans', 522031324, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (142, 'Caroline', 'Lewis', to_date('13-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Cole Lewis', 511685028, null, 241);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (143, 'Eva', 'Garcia', to_date('17-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Brandon Garcia', 552800683, null, 242);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (144, 'Alexis', 'Lewis', to_date('22-06-2021', 'dd-mm-yyyy'), null, 'Josephine Lewis', 539176965, null, 243);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (145, 'Claire', 'Campbell', to_date('20-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Campbell', 550252300, null, 244);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (146, 'Serenity', 'Mitchell', to_date('29-04-2020', 'dd-mm-yyyy'), null, 'Lucy Mitchell', 551982965, null, 245);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (147, 'Amaya', 'Young', to_date('07-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Adalyn Young', 519961217, null, 246);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (148, 'Madeline', 'Brown', to_date('08-07-2020', 'dd-mm-yyyy'), 'Dairy', 'Madison Brown', 554807251, null, 247);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (149, 'Everly', 'Diaz', to_date('06-05-2021', 'dd-mm-yyyy'), null, 'Scarlett Diaz', 586326229, null, 248);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (150, 'Addison', 'Allen', to_date('07-01-2020', 'dd-mm-yyyy'), null, 'David Allen', 550727962, null, 249);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (151, 'Aaliyah', 'Miller', to_date('01-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Grace Miller', 542247393, null, 250);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (152, 'Rylee', 'Thomas', to_date('21-12-2021', 'dd-mm-yyyy'), null, 'Sophie Thomas', 548870108, null, 251);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (153, 'Isaac', 'Robinson', to_date('15-08-2020', 'dd-mm-yyyy'), 'Gluten', 'Everly Robinson', 577193168, null, 252);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (154, 'Arabella', 'Robinson', to_date('14-04-2019', 'dd-mm-yyyy'), null, 'Alyssa Robinson', 571889772, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (155, 'Rose', 'Taylor', to_date('23-05-2023', 'dd-mm-yyyy'), null, 'Kyle Taylor', 517282462, null, 254);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (156, 'Andrea', 'Johnson', to_date('22-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Cora Johnson', 589969056, null, 255);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (157, 'Naomi', 'Hernandez', to_date('29-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Eliza Hernandez', 596811489, null, 256);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (158, 'Emery', 'Robinson', to_date('01-02-2022', 'dd-mm-yyyy'), null, 'Chloe Robinson', 582816652, null, 257);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (159, 'Mila', 'Sanchez', to_date('29-08-2018', 'dd-mm-yyyy'), null, 'Piper Sanchez', 553868356, null, 258);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (160, 'Aaliyah', 'Sanchez', to_date('17-03-2020', 'dd-mm-yyyy'), null, 'Sloane Sanchez', 524648281, null, 259);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (161, 'Antonio', 'Lewis', to_date('02-06-2019', 'dd-mm-yyyy'), null, 'Amelia Lewis', 588099850, null, 260);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (162, 'Delilah', 'Johnson', to_date('16-09-2022', 'dd-mm-yyyy'), null, 'Piper Johnson', 562222759, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (163, 'Kaitlyn', 'Nguyen', to_date('17-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Aurora Nguyen', 514438751, null, 262);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (164, 'David', 'Jones', to_date('03-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabelle Jones', 552938437, null, 263);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (165, 'Rose', 'Hernandez', to_date('30-10-2021', 'dd-mm-yyyy'), 'Dairy', 'Hope Hernandez', 597009499, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (166, 'Madelyn', 'Allen', to_date('05-08-2021', 'dd-mm-yyyy'), null, 'Lola Allen', 570748233, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (167, 'Paisley', 'Rogers', to_date('24-02-2018', 'dd-mm-yyyy'), null, 'Scarlett Rogers', 598457872, null, 266);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (168, 'Callie', 'Campbell', to_date('19-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Natalie Campbell', 566638853, null, 267);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (169, 'Sarah', 'Moore', to_date('28-03-2022', 'dd-mm-yyyy'), null, 'Valentina Moore', 540375882, null, 268);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (170, 'Ella', 'Clark', to_date('30-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Olivia Clark', 572519572, null, 269);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (171, 'Claire', 'Lewis', to_date('03-04-2023', 'dd-mm-yyyy'), null, 'Brandon Lewis', 589694966, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (172, 'Gracie', 'Mitchell', to_date('25-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Quinn Mitchell', 513184783, null, 271);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (173, 'Lillian', 'Hall', to_date('28-02-2020', 'dd-mm-yyyy'), null, 'Autumn Hall', 549043349, null, 272);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (174, 'Nicole', 'Garcia', to_date('14-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Adeline Garcia', 550111833, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (175, 'George', 'Hernandez', to_date('21-11-2022', 'dd-mm-yyyy'), null, 'Charlotte Hernandez', 548652440, null, 274);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (176, 'Lola', 'Moore', to_date('10-10-2020', 'dd-mm-yyyy'), 'Dairy', 'Harper Moore', 582355503, null, 275);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (177, 'Ariana', 'Roberts', to_date('23-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Gabriel Roberts', 540311238, null, 276);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (178, 'Genevieve', 'Rogers', to_date('13-03-2020', 'dd-mm-yyyy'), null, 'Caleb Rogers', 580471597, null, 277);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (179, 'Vivian', 'Nguyen', to_date('22-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Nguyen', 573938837, null, 278);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (180, 'Sophie', 'Davis', to_date('02-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Caleb Davis', 594633382, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (181, 'Jasmine', 'Wilson', to_date('11-03-2018', 'dd-mm-yyyy'), null, 'Claire Wilson', 533350500, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (182, 'Alice', 'Rogers', to_date('15-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Caleb Rogers', 584989537, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (183, 'Alice', 'Ramirez', to_date('25-03-2021', 'dd-mm-yyyy'), null, 'Lily Ramirez', 553718172, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (184, 'Juliet', 'Hernandez', to_date('01-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Quinn Hernandez', 520191602, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (185, 'Joshua', 'Campbell', to_date('24-07-2020', 'dd-mm-yyyy'), null, 'Charlotte Campbell', 585686586, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (186, 'Luna', 'Jones', to_date('24-11-2023', 'dd-mm-yyyy'), 'Dairy', 'Reagan Jones', 571029455, null, 285);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (187, 'Chloe', 'Campbell', to_date('02-12-2022', 'dd-mm-yyyy'), 'Gluten', 'Peyton Campbell', 522172435, null, 286);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (188, 'Adalyn', 'Walker', to_date('28-09-2020', 'dd-mm-yyyy'), null, 'Addison Walker', 536491070, null, 287);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (189, 'David', 'Martinez', to_date('18-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Adrian Martinez', 543931725, null, 288);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (190, 'Chloe', 'Moore', to_date('14-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Lillian Moore', 521115014, null, 289);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (191, 'Cole', 'Kim', to_date('02-04-2020', 'dd-mm-yyyy'), null, 'Brandon Kim', 543493359, null, 290);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (192, 'Brielle', 'Anderson', to_date('27-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Amelia Anderson', 536222394, null, 291);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (193, 'Leah', 'Nelson', to_date('25-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Isabella Nelson', 544021005, null, 292);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (194, 'Emery', 'Rogers', to_date('01-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Bella Rogers', 550657017, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (195, 'Miguel', 'Allen', to_date('19-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Dylan Allen', 521764740, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (196, 'Leonardo', 'Brown', to_date('12-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Gracie Brown', 560180520, null, 295);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (197, 'Adam', 'Rogers', to_date('22-11-2023', 'dd-mm-yyyy'), 'Peanuts', 'Lawrence Rogers', 549884169, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (198, 'Diego', 'Nguyen', to_date('28-04-2023', 'dd-mm-yyyy'), 'Gluten', 'Emery Nguyen', 565632963, null, 297);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (199, 'John', 'Watson', to_date('01-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Lucas Watson', 592973176, null, 298);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (200, 'Brian', 'Cruz', to_date('08-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Caroline Cruz', 527677051, null, 299);
commit;
prompt 200 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (201, 'Autumn', 'Evans', to_date('18-03-2023', 'dd-mm-yyyy'), null, 'Lila Evans', 594186487, null, 300);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (202, 'Miguel', 'Campbell', to_date('29-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Emilia Campbell', 579738087, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (203, 'Olivia', 'Watson', to_date('19-08-2022', 'dd-mm-yyyy'), 'Dairy', 'Bella Watson', 592270731, null, 302);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (204, 'Adrian', 'Hernandez', to_date('02-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Rosalie Hernandez', 580107527, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (205, 'Ellie', 'Garcia', to_date('01-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Nathan Garcia', 553331266, null, 304);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (206, 'Juliet', 'Thomas', to_date('02-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Penelope Thomas', 566498130, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (207, 'Justin', 'Lee', to_date('20-06-2018', 'dd-mm-yyyy'), null, 'Douglas Lee', 574821944, null, 306);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (208, 'Molly', 'Moore', to_date('20-05-2018', 'dd-mm-yyyy'), null, 'Brian Moore', 574917352, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (209, 'Ruby', 'Harris', to_date('11-12-2021', 'dd-mm-yyyy'), 'Gluten', 'Lucas Harris', 598930873, null, 308);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (210, 'Elena', 'Allen', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Claire Allen', 542065490, null, 309);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (211, 'Keira', 'Sanchez', to_date('04-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Antonio Sanchez', 528140566, null, 310);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (212, 'Luke', 'Nguyen', to_date('23-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Madeline Nguyen', 547462633, null, 311);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (213, 'Adalyn', 'Walker', to_date('22-05-2021', 'dd-mm-yyyy'), null, 'Josephine Walker', 553969988, null, 312);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (214, 'Eliana', 'Clark', to_date('16-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Gabriella Clark', 588733279, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (215, 'Emilia', 'Allen', to_date('26-11-2021', 'dd-mm-yyyy'), null, 'Albert Allen', 527818412, null, 314);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (216, 'Willow', 'Young', to_date('11-09-2022', 'dd-mm-yyyy'), null, 'Sophie Young', 513483423, null, 315);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (217, 'Javier', 'Roy', to_date('26-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Daniel Roy', 565990827, null, 316);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (218, 'Brianna', 'Diaz', to_date('18-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Leilani Diaz', 586182802, null, 317);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (219, 'Dennis', 'Lewis', to_date('05-11-2022', 'dd-mm-yyyy'), null, 'Lily Lewis', 545227182, null, 318);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (220, 'Natalie', 'Moore', to_date('18-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Kaitlyn Moore', 597057673, null, 319);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (221, 'Ivy', 'Miller', to_date('11-02-2019', 'dd-mm-yyyy'), 'Peanuts', 'Harold Miller', 577608301, null, 320);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (222, 'Mackenzie', 'Young', to_date('14-05-2022', 'dd-mm-yyyy'), null, 'Rosalie Young', 545203523, null, 321);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (223, 'Jonathan', 'Hernandez', to_date('15-04-2022', 'dd-mm-yyyy'), null, 'Elena Hernandez', 534897789, null, 322);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (224, 'Aria', 'Campbell', to_date('04-03-2020', 'dd-mm-yyyy'), null, 'Aurora Campbell', 519873300, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (225, 'Mackenzie', 'Walker', to_date('09-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Chloe Walker', 514074744, null, 324);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (226, 'Genevieve', 'Robinson', to_date('11-03-2018', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Robinson', 527310445, null, 325);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (227, 'Carlos', 'Robinson', to_date('16-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Makenna Robinson', 565617958, null, 326);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (228, 'Millie', 'Williams', to_date('23-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Maya Williams', 515153842, null, 327);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (229, 'Alice', 'Walker', to_date('21-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Mila Walker', 554318993, null, 328);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (230, 'Avery', 'Johnson', to_date('04-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Bella Johnson', 587865739, null, 329);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (231, 'Piper', 'Hernandez', to_date('18-12-2021', 'dd-mm-yyyy'), null, 'Lola Hernandez', 583054162, null, 330);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (232, 'Sloane', 'Campbell', to_date('21-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Leilani Campbell', 530019130, null, 331);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (233, 'Violet', 'Scott', to_date('14-05-2020', 'dd-mm-yyyy'), null, 'Madilyn Scott', 566601524, null, 332);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (234, 'Adrian', 'Hernandez', to_date('05-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Cameron Hernandez', 570085654, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (235, 'Teagan', 'Lewis', to_date('05-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Valentina Lewis', 596801959, null, 334);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (236, 'Gracie', 'Scott', to_date('30-08-2018', 'dd-mm-yyyy'), null, 'Isaiah Scott', 582724410, null, 335);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (237, 'Aaliyah', 'Moore', to_date('19-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Alice Moore', 574301277, null, 336);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (238, 'Bailey', 'Martinez', to_date('04-08-2019', 'dd-mm-yyyy'), 'Gluten', 'Amelia Martinez', 578595711, null, 337);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (239, 'Josephine', 'Rodriguez', to_date('07-11-2021', 'dd-mm-yyyy'), 'Peanuts', 'Sadie Rodriguez', 592805661, null, 338);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (240, 'George', 'Robinson', to_date('17-02-2022', 'dd-mm-yyyy'), null, 'Henry Robinson', 595917890, null, 339);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (241, 'Lillian', 'Hernandez', to_date('06-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Eloise Hernandez', 586453604, null, 340);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (242, 'David', 'Lewis', to_date('26-09-2018', 'dd-mm-yyyy'), 'Peanuts', 'George Lewis', 525399546, null, 341);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (243, 'Cameron', 'Walker', to_date('18-08-2022', 'dd-mm-yyyy'), null, 'Layla Walker', 573589985, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (244, 'Isla', 'Allen', to_date('07-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Jayden Allen', 554070821, null, 343);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (245, 'Serenity', 'Lopez', to_date('06-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Nora Lopez', 548919814, null, 344);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (246, 'Skylar', 'Wilson', to_date('14-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Arabella Wilson', 560337842, null, 345);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (247, 'Grace', 'Lee', to_date('15-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Ariana Lee', 599539404, null, 346);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (248, 'Jonathan', 'Hernandez', to_date('04-03-2021', 'dd-mm-yyyy'), null, 'Albert Hernandez', 594443739, null, 347);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (249, 'Brianna', 'Nguyen', to_date('09-01-2023', 'dd-mm-yyyy'), null, 'Allison Nguyen', 518532960, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (250, 'Ava', 'Phillips', to_date('16-10-2019', 'dd-mm-yyyy'), null, 'Harold Phillips', 556910314, null, 349);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (251, 'Joan', 'Adams', to_date('24-06-2022', 'dd-mm-yyyy'), null, 'Sloane Adams', 578813040, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (252, 'Madilyn', 'Moore', to_date('07-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Douglas Moore', 598043541, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (253, 'Bailey', 'Mitchell', to_date('03-04-2023', 'dd-mm-yyyy'), 'Dairy', 'Andrew Mitchell', 556542361, null, 352);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (254, 'Leilani', 'Mitchell', to_date('03-11-2018', 'dd-mm-yyyy'), null, 'Emilia Mitchell', 532976801, null, 353);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (255, 'Bailey', 'Williams', to_date('08-09-2019', 'dd-mm-yyyy'), null, 'Nicole Williams', 561829909, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (256, 'Javier', 'Robinson', to_date('04-02-2020', 'dd-mm-yyyy'), 'Gluten', 'Austin Robinson', 582704326, null, 355);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (257, 'Cody', 'Wilson', to_date('11-01-2018', 'dd-mm-yyyy'), null, 'Mia Wilson', 517882756, null, 356);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (258, 'Lydia', 'Lopez', to_date('19-12-2019', 'dd-mm-yyyy'), null, 'Peyton Lopez', 594109782, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (259, 'Kinsley', 'Clark', to_date('19-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Abigail Clark', 533159408, null, 358);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (260, 'Stella', 'Scott', to_date('18-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Lillian Scott', 557916105, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (261, 'Joshua', 'Wright', to_date('22-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Eva Wright', 595512890, null, 360);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (262, 'Aurora', 'Thomas', to_date('16-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Felipe Thomas', 565145292, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (263, 'Hazel', 'Walker', to_date('25-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Violet Walker', 581737423, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (264, 'Gianna', 'Harris', to_date('08-08-2022', 'dd-mm-yyyy'), null, 'Anthony Harris', 592392226, null, 363);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (265, 'Andrea', 'Young', to_date('22-10-2020', 'dd-mm-yyyy'), null, 'Rose Young', 567718942, null, 364);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (266, 'Aaron', 'Brown', to_date('24-09-2021', 'dd-mm-yyyy'), null, 'Madilyn Brown', 554570020, null, 365);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (267, 'Diego', 'Williams', to_date('19-07-2020', 'dd-mm-yyyy'), null, 'Henry Williams', 537864059, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (268, 'Paisley', 'Mitchell', to_date('02-06-2021', 'dd-mm-yyyy'), 'Dairy', 'John Mitchell', 513960949, null, 367);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (269, 'Luke', 'Carter', to_date('19-10-2023', 'dd-mm-yyyy'), null, 'Derek Carter', 596700609, null, 368);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (270, 'Lucas', 'Lopez', to_date('22-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Paisley Lopez', 557843438, null, 369);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (271, 'Brian', 'Miller', to_date('07-05-2022', 'dd-mm-yyyy'), null, 'Aaron Miller', 597378243, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (272, 'Andrew', 'Allen', to_date('15-05-2022', 'dd-mm-yyyy'), null, 'Catalina Allen', 513620217, null, 371);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (273, 'Andrea', 'Walker', to_date('13-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Scarlett Walker', 519849522, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (274, 'Elena', 'Clark', to_date('10-02-2020', 'dd-mm-yyyy'), null, 'Gregory Clark', 567403393, null, 373);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (275, 'Allison', 'Davis', to_date('03-12-2018', 'dd-mm-yyyy'), null, 'Scarlett Davis', 555218270, null, 374);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (276, 'Alaina', 'Anderson', to_date('20-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Mila Anderson', 549075977, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (277, 'Juliet', 'Hernandez', to_date('05-11-2018', 'dd-mm-yyyy'), 'Peanuts', 'Avery Hernandez', 546984031, null, 376);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (278, 'Kyle', 'Campbell', to_date('28-10-2023', 'dd-mm-yyyy'), null, 'Diego Campbell', 560514378, null, 377);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (279, 'Piper', 'Miller', to_date('10-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Julia Miller', 563360457, null, 378);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (280, 'Kyle', 'Garcia', to_date('26-10-2020', 'dd-mm-yyyy'), 'Peanuts', 'Lola Garcia', 546871949, null, 379);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (281, 'Alexis', 'Lopez', to_date('05-12-2022', 'dd-mm-yyyy'), 'Peanuts', 'Makenna Lopez', 599941137, null, 380);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (282, 'Vivian', 'Roy', to_date('08-06-2020', 'dd-mm-yyyy'), null, 'Charles Roy', 518364624, null, 381);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (283, 'Skylar', 'Rogers', to_date('25-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Andrea Rogers', 599818425, null, 382);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (284, 'Natalia', 'Carter', to_date('07-02-2022', 'dd-mm-yyyy'), 'Gluten', 'John Carter', 590463076, null, 383);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (285, 'Keira', 'Lopez', to_date('21-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Genevieve Lopez', 588023643, null, 384);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (286, 'Isla', 'Brown', to_date('18-11-2018', 'dd-mm-yyyy'), 'Peanuts', 'Cameron Brown', 537254253, null, 385);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (287, 'Lawrence', 'Campbell', to_date('23-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Daniel Campbell', 537593553, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (288, 'Edward', 'Robinson', to_date('19-05-2022', 'dd-mm-yyyy'), null, 'Amelia Robinson', 536577471, null, 387);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (289, 'Isla', 'Lee', to_date('22-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Claire Lee', 558243740, null, 388);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (290, 'Charlotte', 'Anderson', to_date('08-11-2021', 'dd-mm-yyyy'), 'Dairy', 'Adalyn Anderson', 541791326, null, 389);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (291, 'Emma', 'Phillips', to_date('18-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Phillips', 569257714, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (292, 'Nathan', 'Williams', to_date('25-11-2022', 'dd-mm-yyyy'), null, 'Cody Williams', 572389874, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (293, 'Aurora', 'Lopez', to_date('26-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Stella Lopez', 517859890, null, 392);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (294, 'Julian', 'Thomas', to_date('10-09-2018', 'dd-mm-yyyy'), null, 'Genevieve Thomas', 525460162, null, 393);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (295, 'Andrew', 'Hernandez', to_date('18-11-2018', 'dd-mm-yyyy'), 'Gluten', 'Reagan Hernandez', 550826712, null, 394);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (296, 'Luke', 'Clark', to_date('28-03-2019', 'dd-mm-yyyy'), null, 'Natalie Clark', 544692839, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (297, 'Quinn', 'Hernandez', to_date('12-10-2020', 'dd-mm-yyyy'), null, 'Skylar Hernandez', 587973408, null, 396);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (298, 'Bailey', 'Cruz', to_date('12-06-2022', 'dd-mm-yyyy'), 'Dairy', 'Kinsley Cruz', 577823059, null, 397);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (299, 'Natalia', 'Campbell', to_date('20-04-2022', 'dd-mm-yyyy'), null, 'Kinsley Campbell', 518779677, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (300, 'Juan', 'Allen', to_date('27-10-2021', 'dd-mm-yyyy'), 'Dairy', 'Aria Allen', 561349540, null, 399);
commit;
prompt 300 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (301, 'Millie', 'Taylor', to_date('28-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Gianna Taylor', 560815172, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (302, 'Millie', 'Allen', to_date('24-08-2021', 'dd-mm-yyyy'), 'Peanuts', 'Bella Allen', 540082725, null, 401);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (303, 'Ivy', 'Wright', to_date('22-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Jack Wright', 587101839, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (304, 'Mila', 'Thomas', to_date('08-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Andrea Thomas', 522777009, null, 403);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (305, 'Ezekiel', 'Wilson', to_date('09-01-2018', 'dd-mm-yyyy'), null, 'Millie Wilson', 584092203, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (306, 'David', 'Hernandez', to_date('30-06-2020', 'dd-mm-yyyy'), 'Dairy', 'Riley Hernandez', 598722217, null, 405);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (307, 'Cody', 'Mitchell', to_date('19-02-2020', 'dd-mm-yyyy'), null, 'Eva Mitchell', 558933461, null, 406);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (308, 'Isabella', 'Rogers', to_date('15-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Olivia Rogers', 581351383, null, 407);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (309, 'Madeline', 'Wilson', to_date('17-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Riley Wilson', 549215425, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (310, 'Daniel', 'Moore', to_date('07-01-2020', 'dd-mm-yyyy'), null, 'Lola Moore', 560154336, null, 409);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (311, 'Adalyn', 'Allen', to_date('18-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Claire Allen', 553934751, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (312, 'Juliet', 'Scott', to_date('20-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Benjamin Scott', 534030524, null, 411);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (313, 'Catalina', 'Anderson', to_date('22-12-2023', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Anderson', 587157296, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (314, 'Nora', 'Rogers', to_date('24-05-2021', 'dd-mm-yyyy'), 'Gluten', 'Kinsley Rogers', 514052490, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (315, 'Chloe', 'Robinson', to_date('19-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Naomi Robinson', 540091002, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (316, 'Alexis', 'Lopez', to_date('08-02-2021', 'dd-mm-yyyy'), 'Peanuts', 'Paisley Lopez', 572961998, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (317, 'Caroline', 'Garcia', to_date('14-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Henry Garcia', 555835552, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (318, 'Isaac', 'Rodriguez', to_date('01-08-2018', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Rodriguez', 558680279, null, 417);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (319, 'Juan', 'Lee', to_date('20-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Alexis Lee', 525140800, null, 418);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (320, 'Charlotte', 'Moore', to_date('09-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Moore', 525085861, null, 419);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (321, 'Emery', 'Rogers', to_date('15-02-2022', 'dd-mm-yyyy'), null, 'Justin Rogers', 510917394, null, 420);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (322, 'Luna', 'Moore', to_date('03-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Keith Moore', 599785749, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (323, 'Vivian', 'Miller', to_date('25-10-2021', 'dd-mm-yyyy'), null, 'Keith Miller', 513301123, null, 422);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (324, 'Aubree', 'Walker', to_date('06-09-2018', 'dd-mm-yyyy'), 'Dairy', 'Juan Walker', 547153829, null, 423);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (325, 'Keith', 'Allen', to_date('11-02-2020', 'dd-mm-yyyy'), null, 'Melanie Allen', 576096187, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (326, 'Harold', 'Mitchell', to_date('11-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Eva Mitchell', 579973789, null, 425);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (327, 'Samantha', 'Anderson', to_date('09-05-2022', 'dd-mm-yyyy'), null, 'Brielle Anderson', 529575762, null, 426);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (328, 'Bella', 'Nguyen', to_date('08-06-2019', 'dd-mm-yyyy'), null, 'Hazel Nguyen', 512574503, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (329, 'Josephine', 'Carter', to_date('15-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Molly Carter', 551146245, null, 428);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (330, 'Bella', 'Wilson', to_date('16-01-2021', 'dd-mm-yyyy'), null, 'Amaya Wilson', 548053321, null, 429);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (331, 'Gracie', 'Sanchez', to_date('23-11-2020', 'dd-mm-yyyy'), null, 'Bailey Sanchez', 557738458, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (332, 'Lucas', 'Allen', to_date('05-02-2019', 'dd-mm-yyyy'), null, 'Charlotte Allen', 550947155, null, 431);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (333, 'Delilah', 'King', to_date('28-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Autumn King', 539768119, null, 432);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (334, 'Skylar', 'Nelson', to_date('07-12-2023', 'dd-mm-yyyy'), 'Peanuts', 'Arabella Nelson', 587031810, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (335, 'Eliza', 'Thomas', to_date('22-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Mackenzie Thomas', 583738494, null, 434);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (336, 'Chloe', 'Rogers', to_date('21-05-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Rogers', 522706090, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (337, 'Dustin', 'Hernandez', to_date('29-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Alyssa Hernandez', 518193967, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (338, 'Edward', 'Allen', to_date('11-05-2019', 'dd-mm-yyyy'), 'Peanuts', 'Layla Allen', 537242544, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (339, 'Joshua', 'Allen', to_date('23-06-2020', 'dd-mm-yyyy'), null, 'Dustin Allen', 590579127, null, 438);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (340, 'Samantha', 'Lewis', to_date('01-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Isla Lewis', 540747430, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (341, 'Chloe', 'Young', to_date('30-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Maya Young', 540643961, null, 440);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (342, 'Natalie', 'King', to_date('26-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Daniel King', 514619349, null, 441);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (343, 'Joseph', 'Davis', to_date('30-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Dustin Davis', 516463287, null, 442);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (344, 'Callie', 'Robinson', to_date('28-09-2020', 'dd-mm-yyyy'), 'Peanuts', 'Abraham Robinson', 550726262, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (345, 'Penelope', 'Lewis', to_date('07-11-2022', 'dd-mm-yyyy'), null, 'Keith Lewis', 518641062, null, 444);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (346, 'Eliana', 'Campbell', to_date('09-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Juliet Campbell', 579469475, null, 445);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (347, 'Isaac', 'Wright', to_date('04-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Charlotte Wright', 540935049, null, 446);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (348, 'Aaron', 'Allen', to_date('13-06-2022', 'dd-mm-yyyy'), null, 'Chad Allen', 529524046, null, 447);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (349, 'Jasmine', 'Moore', to_date('20-09-2020', 'dd-mm-yyyy'), null, 'Clara Moore', 565150433, null, 448);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (350, 'Rosalie', 'Scott', to_date('22-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Dylan Scott', 552686733, null, 449);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (351, 'Adalyn', 'Clark', to_date('29-08-2021', 'dd-mm-yyyy'), 'Dairy', 'Brandon Clark', 592034206, null, 450);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (352, 'Abraham', 'Rodriguez', to_date('23-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Rose Rodriguez', 531470420, null, 451);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (353, 'Lila', 'Hernandez', to_date('23-04-2023', 'dd-mm-yyyy'), 'Dairy', 'Valentina Hernandez', 575538684, null, 452);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (354, 'Aria', 'Allen', to_date('09-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Taylor Allen', 570987440, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (355, 'Skylar', 'Taylor', to_date('01-02-2022', 'dd-mm-yyyy'), 'Dairy', 'Luna Taylor', 553295136, null, 454);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (356, 'Stella', 'Garcia', to_date('05-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Garcia', 583550358, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (357, 'Antonio', 'Nelson', to_date('05-04-2022', 'dd-mm-yyyy'), null, 'Luna Nelson', 510766150, null, 456);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (358, 'Ivy', 'Rodriguez', to_date('12-09-2022', 'dd-mm-yyyy'), 'Dairy', 'Molly Rodriguez', 528274297, null, 457);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (359, 'Joseph', 'Lee', to_date('27-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Millie Lee', 549095539, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (360, 'Lucas', 'Anderson', to_date('16-12-2021', 'dd-mm-yyyy'), null, 'Alexis Anderson', 554945668, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (361, 'Evelyn', 'Lewis', to_date('31-03-2018', 'dd-mm-yyyy'), 'Dairy', 'Ruby Lewis', 544185285, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (362, 'Kaitlyn', 'Harris', to_date('21-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Andrea Harris', 532288948, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (363, 'Eden', 'Mitchell', to_date('14-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Sophie Mitchell', 512989387, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (364, 'Ava', 'Robinson', to_date('09-03-2023', 'dd-mm-yyyy'), 'Gluten', 'Joseph Robinson', 541400445, null, 463);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (365, 'Anna', 'Young', to_date('16-07-2019', 'dd-mm-yyyy'), null, 'Adalyn Young', 595736864, null, 464);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (366, 'Mackenzie', 'Lewis', to_date('30-07-2019', 'dd-mm-yyyy'), null, 'Mila Lewis', 539864282, null, 465);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (367, 'Keith', 'Wright', to_date('17-01-2021', 'dd-mm-yyyy'), null, 'Isaac Wright', 539777152, null, 466);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (368, 'Javier', 'Lopez', to_date('29-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Madelyn Lopez', 535399909, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (369, 'Leah', 'Scott', to_date('18-03-2021', 'dd-mm-yyyy'), 'Peanuts', 'Samantha Scott', 567009302, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (370, 'Christopher', 'Johnson', to_date('02-03-2020', 'dd-mm-yyyy'), null, 'Alexandra Johnson', 591567143, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (371, 'Layla', 'Clark', to_date('27-10-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabella Clark', 586967796, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (372, 'Douglas', 'Williams', to_date('10-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Henry Williams', 558315389, null, 471);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (373, 'Eliana', 'Scott', to_date('02-02-2021', 'dd-mm-yyyy'), null, 'Abraham Scott', 513648837, null, 472);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (374, 'Emma', 'Moore', to_date('08-05-2022', 'dd-mm-yyyy'), null, 'Caleb Moore', 529591137, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (375, 'Taylor', 'Garcia', to_date('01-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Madeline Garcia', 532693335, null, 474);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (376, 'David', 'Hernandez', to_date('24-05-2020', 'dd-mm-yyyy'), null, 'Eloise Hernandez', 513377811, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (377, 'Daisy', 'Robinson', to_date('31-10-2022', 'dd-mm-yyyy'), null, 'Stella Robinson', 513416027, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (378, 'Savannah', 'Lee', to_date('28-09-2022', 'dd-mm-yyyy'), null, 'Amelia Lee', 596910755, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (379, 'Eliza', 'Hernandez', to_date('04-01-2022', 'dd-mm-yyyy'), null, 'Lily Hernandez', 563023088, null, 478);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (380, 'Alice', 'Brown', to_date('11-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Caleb Brown', 599093750, null, 479);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (381, 'Lydia', 'Rodriguez', to_date('23-01-2019', 'dd-mm-yyyy'), null, 'Juliet Rodriguez', 585558865, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (382, 'Eric', 'Harris', to_date('15-07-2018', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Harris', 513561765, null, 481);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (383, 'Leilani', 'Walker', to_date('13-10-2019', 'dd-mm-yyyy'), null, 'Zoey Walker', 523774075, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (384, 'Molly', 'Robinson', to_date('03-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'Ethan Robinson', 552538531, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (385, 'Dennis', 'Rodriguez', to_date('26-04-2020', 'dd-mm-yyyy'), null, 'Cora Rodriguez', 530358851, null, 484);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (386, 'Alexis', 'Davis', to_date('25-06-2020', 'dd-mm-yyyy'), null, 'Ava Davis', 577066673, null, 485);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (387, 'Katherine', 'Thomas', to_date('01-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Lila Thomas', 519552719, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (388, 'Eloise', 'Johnson', to_date('30-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Harper Johnson', 550966624, null, 487);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (389, 'Ruby', 'Campbell', to_date('20-02-2019', 'dd-mm-yyyy'), 'Gluten', 'Lucas Campbell', 544857438, null, 488);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (390, 'Skylar', 'Rogers', to_date('20-10-2019', 'dd-mm-yyyy'), 'Peanuts', 'Aurora Rogers', 585890564, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (391, 'Sloane', 'Taylor', to_date('19-12-2018', 'dd-mm-yyyy'), null, 'Mila Taylor', 550038106, null, 490);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (392, 'Aurora', 'Lopez', to_date('25-11-2019', 'dd-mm-yyyy'), 'Dairy', 'Sadie Lopez', 528829729, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (393, 'Teagan', 'Taylor', to_date('12-11-2018', 'dd-mm-yyyy'), 'Dairy', 'George Taylor', 571008754, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (394, 'Grace', 'Carter', to_date('07-05-2018', 'dd-mm-yyyy'), null, 'Savannah Carter', 518067254, null, 493);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (395, 'Elena', 'Johnson', to_date('21-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Lucy Johnson', 597120164, null, 494);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (396, 'Miguel', 'Johnson', to_date('02-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Kyle Johnson', 546455856, null, 495);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (397, 'Clara', 'Hall', to_date('19-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Ruby Hall', 512668045, null, 496);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (398, 'Josephine', 'Miller', to_date('28-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Eliza Miller', 581962277, null, 497);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (399, 'Lillian', 'Walker', to_date('04-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Savannah Walker', 566597370, null, 498);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (400, 'Andrea', 'Moore', to_date('04-05-2022', 'dd-mm-yyyy'), null, 'Grace Moore', 599948095, null, 499);
commit;
prompt 400 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (401, 'Everly', 'Rogers', to_date('18-07-2023', 'dd-mm-yyyy'), 'Dairy', 'Clara Rogers', 586879920, null, 500);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (402, 'Genevieve', 'Phillips', to_date('30-03-2019', 'dd-mm-yyyy'), null, 'Felipe Phillips', 514368785, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (403, 'Lillian', 'Nguyen', to_date('18-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Nguyen', 562297614, null, 502);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (404, 'Sophie', 'Davis', to_date('17-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Layla Davis', 511210424, null, 503);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (405, 'Grace', 'Moore', to_date('26-05-2018', 'dd-mm-yyyy'), 'Gluten', 'Molly Moore', 542882255, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (406, 'Athena', 'Lopez', to_date('12-05-2019', 'dd-mm-yyyy'), null, 'Mia Lopez', 544809925, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (407, 'Isabella', 'Nelson', to_date('30-04-2018', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Nelson', 583210549, null, 506);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (408, 'Albert', 'Lewis', to_date('27-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Zoey Lewis', 566318085, null, 507);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (409, 'Alexandra', 'Sanchez', to_date('20-09-2022', 'dd-mm-yyyy'), null, 'Piper Sanchez', 563861976, null, 508);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (410, 'Madilyn', 'Clark', to_date('15-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Lily Clark', 571344279, null, 509);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (411, 'Clara', 'Nguyen', to_date('20-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Emilia Nguyen', 532694176, null, 510);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (412, 'Kyle', 'Moore', to_date('05-10-2023', 'dd-mm-yyyy'), 'Gluten', 'Edward Moore', 527486842, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (413, 'Dennis', 'Nelson', to_date('04-01-2020', 'dd-mm-yyyy'), 'Dairy', 'Juliet Nelson', 543937954, null, 512);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (414, 'Rylee', 'Scott', to_date('18-07-2021', 'dd-mm-yyyy'), 'Dairy', 'Jordan Scott', 592479520, null, 513);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (415, 'Javier', 'Garcia', to_date('06-12-2023', 'dd-mm-yyyy'), null, 'Lillian Garcia', 536862595, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (416, 'Lucy', 'Allen', to_date('19-04-2022', 'dd-mm-yyyy'), 'Gluten', 'George Allen', 532943145, null, 515);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (417, 'Bella', 'Watson', to_date('03-12-2019', 'dd-mm-yyyy'), 'Dairy', 'Lillian Watson', 520617562, null, 516);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (418, 'Albert', 'Garcia', to_date('17-03-2021', 'dd-mm-yyyy'), null, 'Eva Garcia', 565626535, null, 517);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (419, 'Ezekiel', 'Miller', to_date('09-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Bella Miller', 517423717, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (420, 'Elena', 'Cruz', to_date('17-12-2019', 'dd-mm-yyyy'), null, 'Jesse Cruz', 568844946, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (421, 'Valentina', 'Evans', to_date('25-02-2021', 'dd-mm-yyyy'), 'Dairy', 'Aubree Evans', 560463896, null, 520);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (422, 'Jasmine', 'Anderson', to_date('24-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Catalina Anderson', 562053743, null, 521);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (423, 'Claire', 'Thomas', to_date('05-08-2021', 'dd-mm-yyyy'), 'Peanuts', 'Gabriel Thomas', 584450210, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (424, 'Gregory', 'Moore', to_date('25-11-2022', 'dd-mm-yyyy'), null, 'Edward Moore', 565549248, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (425, 'Grace', 'Lee', to_date('24-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Aubrey Lee', 583128371, null, 524);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (426, 'Leilani', 'Wilson', to_date('10-05-2018', 'dd-mm-yyyy'), 'Dairy', 'Brian Wilson', 526045638, null, 525);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (427, 'Julian', 'Anderson', to_date('15-02-2021', 'dd-mm-yyyy'), 'Gluten', 'Ezekiel Anderson', 585396669, null, 526);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (428, 'Dustin', 'Moore', to_date('04-12-2023', 'dd-mm-yyyy'), 'Dairy', 'Jade Moore', 515791482, null, 527);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (429, 'Brianna', 'Thomas', to_date('26-02-2020', 'dd-mm-yyyy'), 'Peanuts', 'Clara Thomas', 566485075, null, 528);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (430, 'Aaliyah', 'Sanchez', to_date('25-08-2019', 'dd-mm-yyyy'), 'Peanuts', 'Charles Sanchez', 577548895, null, 529);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (431, 'Alexis', 'Wright', to_date('01-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Luna Wright', 534628299, null, 530);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (432, 'Savannah', 'Johnson', to_date('24-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Aaron Johnson', 521882184, null, 531);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (433, 'Lily', 'Hernandez', to_date('07-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Isaiah Hernandez', 546464999, null, 532);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (434, 'Chloe', 'Young', to_date('13-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Sophie Young', 513475266, null, 533);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (435, 'Penelope', 'Kim', to_date('14-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Aurora Kim', 535960424, null, 534);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (436, 'Callie', 'Watson', to_date('07-11-2020', 'dd-mm-yyyy'), null, 'Eric Watson', 544567619, null, 535);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (437, 'Grace', 'Hernandez', to_date('01-05-2022', 'dd-mm-yyyy'), null, 'Piper Hernandez', 559557270, null, 536);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (438, 'Sloane', 'Carter', to_date('10-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Gracie Carter', 517706207, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (439, 'Carlos', 'Lewis', to_date('21-08-2020', 'dd-mm-yyyy'), null, 'Cole Lewis', 562649541, null, 538);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (440, 'Delilah', 'Hall', to_date('25-08-2020', 'dd-mm-yyyy'), 'Dairy', 'Brandon Hall', 514577512, null, 539);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (441, 'Madeline', 'Garcia', to_date('31-01-2018', 'dd-mm-yyyy'), 'Gluten', 'Brian Garcia', 594786246, null, 540);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (442, 'Vivian', 'Mitchell', to_date('27-08-2023', 'dd-mm-yyyy'), null, 'Nora Mitchell', 528787567, null, 541);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (443, 'Emilia', 'Ramirez', to_date('07-10-2021', 'dd-mm-yyyy'), null, 'Caleb Ramirez', 540420690, null, 542);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (444, 'Isabella', 'Hernandez', to_date('15-03-2019', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Hernandez', 526745346, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (445, 'Aubree', 'Thomas', to_date('01-09-2022', 'dd-mm-yyyy'), null, 'Ava Thomas', 591163331, null, 544);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (446, 'Harold', 'Sanchez', to_date('04-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Adrian Sanchez', 529315730, null, 545);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (447, 'Skylar', 'Kim', to_date('21-11-2023', 'dd-mm-yyyy'), 'Gluten', 'Emma Kim', 584121275, null, 546);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (448, 'Leonardo', 'Moore', to_date('31-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Clara Moore', 532471052, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (449, 'Genevieve', 'Garcia', to_date('24-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Scarlett Garcia', 549306126, null, 548);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (450, 'Anna', 'Roy', to_date('27-11-2021', 'dd-mm-yyyy'), 'Gluten', 'Cole Roy', 573565506, null, 549);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (451, 'Sarah', 'Rodriguez', to_date('13-08-2021', 'dd-mm-yyyy'), 'Gluten', 'Brianna Rodriguez', 596172653, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (452, 'Eric', 'Rodriguez', to_date('04-06-2022', 'dd-mm-yyyy'), null, 'Abigail Rodriguez', 578297178, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (453, 'Aurora', 'Clark', to_date('22-10-2023', 'dd-mm-yyyy'), null, 'Josephine Clark', 567636016, null, 552);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (454, 'Lila', 'Robinson', to_date('11-11-2019', 'dd-mm-yyyy'), null, 'Aubrey Robinson', 585983418, null, 553);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (455, 'Brandon', 'Nelson', to_date('03-10-2023', 'dd-mm-yyyy'), null, 'Emma Nelson', 536585025, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (456, 'Julian', 'Davis', to_date('21-01-2022', 'dd-mm-yyyy'), 'Peanuts', 'Daisy Davis', 533409085, null, 555);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (457, 'Ava', 'Jones', to_date('28-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Eliza Jones', 571433029, null, 556);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (458, 'Olivia', 'Walker', to_date('15-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Austin Walker', 537372988, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (459, 'Alice', 'Rogers', to_date('14-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Emilia Rogers', 527894442, null, 558);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (460, 'Rylee', 'Adams', to_date('22-02-2018', 'dd-mm-yyyy'), null, 'Everly Adams', 526657490, null, 559);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (461, 'Millie', 'Scott', to_date('10-04-2021', 'dd-mm-yyyy'), null, 'Hope Scott', 520714548, null, 560);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (462, 'Nora', 'Martinez', to_date('22-11-2018', 'dd-mm-yyyy'), null, 'Keira Martinez', 578139943, null, 561);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (463, 'Carlos', 'Garcia', to_date('07-04-2020', 'dd-mm-yyyy'), 'Peanuts', 'Emilia Garcia', 574400117, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (464, 'Alyssa', 'Lewis', to_date('29-08-2021', 'dd-mm-yyyy'), null, 'Brooklyn Lewis', 592529731, null, 563);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (465, 'Sophia', 'Miller', to_date('05-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Jordan Miller', 531744060, null, 564);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (466, 'Brooklyn', 'Lee', to_date('24-03-2019', 'dd-mm-yyyy'), 'Gluten', 'Jordan Lee', 553581591, null, 565);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (467, 'Hannah', 'Young', to_date('31-03-2019', 'dd-mm-yyyy'), null, 'Lola Young', 551531634, null, 566);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (468, 'Gabriel', 'Williams', to_date('07-09-2023', 'dd-mm-yyyy'), 'Dairy', 'Juliet Williams', 566610799, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (469, 'Aaron', 'Rodriguez', to_date('28-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Christopher Rodriguez', 548449378, null, 568);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (470, 'Sophia', 'Johnson', to_date('04-03-2018', 'dd-mm-yyyy'), null, 'Eloise Johnson', 574864651, null, 569);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (471, 'Molly', 'Diaz', to_date('20-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Sloane Diaz', 584312547, null, 570);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (472, 'Ivy', 'Phillips', to_date('01-05-2022', 'dd-mm-yyyy'), null, 'John Phillips', 531085853, null, 571);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (473, 'Everly', 'Ramirez', to_date('24-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Natalia Ramirez', 597340259, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (474, 'Athena', 'Robinson', to_date('18-01-2020', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Robinson', 597069681, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (475, 'Teagan', 'Garcia', to_date('15-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Vivienne Garcia', 576606621, null, 574);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (476, 'Mia', 'Moore', to_date('03-04-2019', 'dd-mm-yyyy'), null, 'Gracie Moore', 590593158, null, 575);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (477, 'Rose', 'Hernandez', to_date('30-04-2022', 'dd-mm-yyyy'), 'Gluten', 'Julian Hernandez', 572817630, null, 576);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (478, 'Javier', 'Hernandez', to_date('24-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Eva Hernandez', 517886584, null, 577);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (479, 'Benjamin', 'Rodriguez', to_date('30-12-2020', 'dd-mm-yyyy'), 'Peanuts', 'Harold Rodriguez', 511444113, null, 578);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (480, 'Naomi', 'Allen', to_date('03-07-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Allen', 595170872, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (481, 'Adalyn', 'Harris', to_date('26-04-2019', 'dd-mm-yyyy'), 'Gluten', 'Brianna Harris', 573305029, null, 580);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (482, 'Eliana', 'Green', to_date('26-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Adam Green', 570357774, null, 581);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (483, 'Natalia', 'Anderson', to_date('11-02-2021', 'dd-mm-yyyy'), 'Peanuts', 'Callie Anderson', 587199718, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (484, 'Cody', 'Mitchell', to_date('18-03-2022', 'dd-mm-yyyy'), null, 'Vivian Mitchell', 526469770, null, 583);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (485, 'Juan', 'Lopez', to_date('25-03-2022', 'dd-mm-yyyy'), null, 'Alyssa Lopez', 555025150, null, 584);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (486, 'Jack', 'Scott', to_date('26-03-2023', 'dd-mm-yyyy'), 'Dairy', 'Benjamin Scott', 538168407, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (487, 'Lola', 'Clark', to_date('22-07-2022', 'dd-mm-yyyy'), 'Dairy', 'Ellie Clark', 549921745, null, 586);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (488, 'Alexis', 'Hernandez', to_date('23-08-2023', 'dd-mm-yyyy'), null, 'Willow Hernandez', 540327238, null, 587);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (489, 'Stella', 'Moore', to_date('17-12-2021', 'dd-mm-yyyy'), null, 'Sloane Moore', 531321411, null, 588);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (490, 'Jordan', 'Walker', to_date('03-09-2018', 'dd-mm-yyyy'), null, 'Lucas Walker', 526796378, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (491, 'Makenna', 'Wright', to_date('03-06-2019', 'dd-mm-yyyy'), 'Dairy', 'Clara Wright', 558357285, null, 590);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (492, 'Eva', 'Hall', to_date('18-06-2019', 'dd-mm-yyyy'), 'Peanuts', 'Riley Hall', 530767423, null, 591);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (493, 'Melanie', 'Rogers', to_date('28-05-2020', 'dd-mm-yyyy'), 'Peanuts', 'David Rogers', 548627110, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (494, 'Charlotte', 'Allen', to_date('12-01-2018', 'dd-mm-yyyy'), null, 'Caleb Allen', 596873086, null, 593);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (495, 'Brian', 'Moore', to_date('13-09-2019', 'dd-mm-yyyy'), null, 'Diego Moore', 590958485, null, 594);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (496, 'Clara', 'Thomas', to_date('19-02-2022', 'dd-mm-yyyy'), 'Peanuts', 'Mila Thomas', 552095354, null, 595);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (497, 'Brianna', 'Moore', to_date('30-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Moore', 575292663, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (498, 'Aubrey', 'Anderson', to_date('17-09-2022', 'dd-mm-yyyy'), 'Peanuts', 'David Anderson', 580907445, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (499, 'Eliza', 'Allen', to_date('19-09-2022', 'dd-mm-yyyy'), null, 'Kyle Allen', 557934706, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (500, 'Natalie', 'Nguyen', to_date('12-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Sophia Nguyen', 556293055, null, null);
commit;
prompt 500 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (501, 'Violet', 'Campbell', to_date('26-06-2018', 'dd-mm-yyyy'), 'Gluten', 'Diego Campbell', 512441543, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (502, 'Gabriella', 'Allen', to_date('19-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Luna Allen', 582627630, null, 601);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (503, 'Claire', 'Lopez', to_date('09-05-2018', 'dd-mm-yyyy'), 'Gluten', 'Savannah Lopez', 589845119, null, 602);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (504, 'John', 'Robinson', to_date('23-04-2020', 'dd-mm-yyyy'), 'Gluten', 'Miguel Robinson', 545137275, null, 603);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (505, 'Lawrence', 'Hernandez', to_date('13-07-2021', 'dd-mm-yyyy'), 'Peanuts', 'Kyle Hernandez', 565439313, null, 604);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (506, 'Alexandra', 'Nelson', to_date('24-12-2018', 'dd-mm-yyyy'), null, 'Cole Nelson', 549811078, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (507, 'Sarah', 'Martinez', to_date('30-01-2020', 'dd-mm-yyyy'), 'Gluten', 'Avery Martinez', 545854906, null, 606);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (508, 'Lola', 'Hernandez', to_date('08-07-2019', 'dd-mm-yyyy'), null, 'Avery Hernandez', 531437148, null, 607);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (509, 'Madeline', 'Moore', to_date('19-04-2018', 'dd-mm-yyyy'), 'Peanuts', 'Katherine Moore', 581068392, null, 608);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (510, 'Sadie', 'Lopez', to_date('01-11-2021', 'dd-mm-yyyy'), 'Dairy', 'Julian Lopez', 516268364, null, 609);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (511, 'Anna', 'Walker', to_date('08-05-2019', 'dd-mm-yyyy'), null, 'Grace Walker', 549415909, null, 610);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (512, 'Eric', 'Scott', to_date('06-01-2021', 'dd-mm-yyyy'), null, 'Isaiah Scott', 594864457, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (513, 'Dylan', 'Lewis', to_date('11-09-2021', 'dd-mm-yyyy'), null, 'Bella Lewis', 521530711, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (514, 'Jonathan', 'Lewis', to_date('30-03-2020', 'dd-mm-yyyy'), null, 'Diego Lewis', 580653918, null, 613);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (515, 'Sarah', 'Rogers', to_date('01-10-2023', 'dd-mm-yyyy'), 'Peanuts', 'Samantha Rogers', 516829888, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (516, 'Jordan', 'Hernandez', to_date('09-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Madilyn Hernandez', 541141419, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (517, 'Ava', 'Nelson', to_date('10-10-2023', 'dd-mm-yyyy'), null, 'Kaitlyn Nelson', 530771055, null, 616);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (518, 'Luna', 'Moore', to_date('08-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Ivy Moore', 559702678, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (519, 'Nicole', 'Brown', to_date('07-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabella Brown', 577636908, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (520, 'Ethan', 'Campbell', to_date('09-05-2021', 'dd-mm-yyyy'), 'Peanuts', 'Joshua Campbell', 556138948, null, 619);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (521, 'Andrew', 'Moore', to_date('23-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Samantha Moore', 537861534, null, 620);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (522, 'Ezekiel', 'Garcia', to_date('27-06-2020', 'dd-mm-yyyy'), null, 'Valentina Garcia', 568475780, null, 621);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (523, 'Brianna', 'Hernandez', to_date('08-01-2023', 'dd-mm-yyyy'), 'Dairy', 'Dennis Hernandez', 517976820, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (524, 'Mila', 'Clark', to_date('29-08-2019', 'dd-mm-yyyy'), null, 'Makenna Clark', 537158668, null, 623);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (525, 'Autumn', 'Harris', to_date('07-04-2023', 'dd-mm-yyyy'), null, 'Ruby Harris', 583331735, null, 624);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (526, 'Ella', 'Moore', to_date('14-05-2018', 'dd-mm-yyyy'), null, 'Cole Moore', 577378165, null, 625);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (527, 'Amaya', 'Williams', to_date('30-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Sadie Williams', 555949388, null, 626);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (528, 'Brandon', 'Nguyen', to_date('18-12-2021', 'dd-mm-yyyy'), 'Peanuts', 'Emilia Nguyen', 547597806, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (529, 'Claire', 'Clark', to_date('23-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Bailey Clark', 516343621, null, 628);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (530, 'Christopher', 'Hernandez', to_date('03-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Carlos Hernandez', 520881733, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (531, 'Javier', 'Rogers', to_date('15-06-2022', 'dd-mm-yyyy'), null, 'Sarah Rogers', 518064634, null, 630);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (532, 'Addison', 'Lee', to_date('05-05-2023', 'dd-mm-yyyy'), 'Gluten', 'John Lee', 587194224, null, 631);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (533, 'Felipe', 'Wilson', to_date('05-04-2021', 'dd-mm-yyyy'), null, 'Christopher Wilson', 524025596, null, 632);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (534, 'Aaliyah', 'Davis', to_date('27-03-2023', 'dd-mm-yyyy'), null, 'Zoey Davis', 583056136, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (535, 'Ava', 'Garcia', to_date('06-07-2018', 'dd-mm-yyyy'), 'Gluten', 'Kyle Garcia', 533201647, null, 634);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (536, 'Keith', 'Rodriguez', to_date('19-08-2023', 'dd-mm-yyyy'), 'Peanuts', 'Evelyn Rodriguez', 510006481, null, 635);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (537, 'Aurora', 'Nguyen', to_date('12-10-2019', 'dd-mm-yyyy'), null, 'Lola Nguyen', 537570056, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (538, 'Everly', 'Lee', to_date('31-10-2020', 'dd-mm-yyyy'), null, 'Alexandra Lee', 588778174, null, 637);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (539, 'Kaylee', 'Garcia', to_date('31-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Riley Garcia', 586063167, null, 638);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (540, 'Alan', 'Cruz', to_date('02-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Rose Cruz', 551440621, null, 639);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (541, 'Emery', 'Campbell', to_date('22-12-2021', 'dd-mm-yyyy'), null, 'Brianna Campbell', 550660267, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (542, 'Aubree', 'Garcia', to_date('07-04-2022', 'dd-mm-yyyy'), null, 'Dennis Garcia', 561975299, null, 641);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (543, 'Hannah', 'Moore', to_date('26-07-2018', 'dd-mm-yyyy'), null, 'Christopher Moore', 557394590, null, 642);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (544, 'Mackenzie', 'Nelson', to_date('03-11-2023', 'dd-mm-yyyy'), null, 'Benjamin Nelson', 546463981, null, 643);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (545, 'Isaac', 'Lewis', to_date('26-12-2020', 'dd-mm-yyyy'), null, 'Mackenzie Lewis', 542150938, null, 644);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (546, 'Charles', 'Hernandez', to_date('24-01-2020', 'dd-mm-yyyy'), 'Peanuts', 'Kaylee Hernandez', 510340401, null, 645);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (547, 'Adeline', 'Scott', to_date('20-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Edward Scott', 522665949, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (548, 'Daisy', 'Moore', to_date('24-06-2022', 'dd-mm-yyyy'), null, 'Evelyn Moore', 578094377, null, 647);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (549, 'Millie', 'Hernandez', to_date('16-05-2020', 'dd-mm-yyyy'), null, 'Serenity Hernandez', 540520286, null, 648);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (550, 'Isabella', 'Davis', to_date('26-03-2019', 'dd-mm-yyyy'), null, 'Antonio Davis', 537801101, null, 649);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (551, 'Charles', 'Wright', to_date('24-12-2018', 'dd-mm-yyyy'), null, 'Sophia Wright', 525528880, null, 650);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (552, 'Javier', 'Lopez', to_date('09-12-2020', 'dd-mm-yyyy'), 'Dairy', 'Daisy Lopez', 597011403, null, 651);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (553, 'Jade', 'Hernandez', to_date('03-06-2018', 'dd-mm-yyyy'), null, 'Jordan Hernandez', 516591109, null, 652);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (554, 'Brielle', 'Wright', to_date('13-06-2022', 'dd-mm-yyyy'), 'Peanuts', 'Grace Wright', 549668558, null, 653);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (555, 'Lola', 'Cruz', to_date('03-11-2019', 'dd-mm-yyyy'), 'Gluten', 'Aria Cruz', 578393812, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (556, 'Rosalie', 'Wilson', to_date('13-10-2019', 'dd-mm-yyyy'), 'Dairy', 'Charlotte Wilson', 593642123, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (557, 'Jack', 'Thomas', to_date('01-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Thomas', 537154083, null, 656);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (558, 'Callie', 'Lopez', to_date('09-04-2019', 'dd-mm-yyyy'), 'Peanuts', 'Dennis Lopez', 545196694, null, 657);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (559, 'Joan', 'Walker', to_date('06-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Hannah Walker', 532094533, null, 658);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (560, 'Samantha', 'Miller', to_date('14-01-2018', 'dd-mm-yyyy'), null, 'Genevieve Miller', 554528598, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (561, 'Anna', 'Walker', to_date('08-10-2021', 'dd-mm-yyyy'), null, 'Nora Walker', 550623016, null, 660);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (562, 'Christopher', 'Young', to_date('07-07-2019', 'dd-mm-yyyy'), null, 'Hope Young', 533218119, null, 661);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (563, 'Lydia', 'Nelson', to_date('28-01-2023', 'dd-mm-yyyy'), null, 'Ella Nelson', 573708971, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (564, 'Miguel', 'Garcia', to_date('21-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Ava Garcia', 540741461, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (565, 'Leah', 'Scott', to_date('23-04-2023', 'dd-mm-yyyy'), null, 'Ruby Scott', 592965868, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (566, 'Kinsley', 'Roberts', to_date('15-09-2020', 'dd-mm-yyyy'), 'Dairy', 'Layla Roberts', 551193054, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (567, 'Reagan', 'Johnson', to_date('02-02-2019', 'dd-mm-yyyy'), null, 'Evelyn Johnson', 597960280, null, 666);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (568, 'Jonathan', 'Mitchell', to_date('13-10-2023', 'dd-mm-yyyy'), 'Dairy', 'Kaylee Mitchell', 544776575, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (569, 'Jordan', 'Young', to_date('29-09-2023', 'dd-mm-yyyy'), null, 'Emery Young', 561168155, null, 668);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (570, 'Amelia', 'Thomas', to_date('22-05-2018', 'dd-mm-yyyy'), 'Peanuts', 'Eric Thomas', 525391672, null, 669);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (571, 'Kevin', 'Robinson', to_date('28-02-2022', 'dd-mm-yyyy'), 'Dairy', 'Mila Robinson', 516804246, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (572, 'Isabelle', 'Rogers', to_date('20-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Olivia Rogers', 559429017, null, 671);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (573, 'Ella', 'Moore', to_date('25-09-2022', 'dd-mm-yyyy'), null, 'Joan Moore', 533661142, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (574, 'Leilani', 'Rodriguez', to_date('20-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Jordan Rodriguez', 588072382, null, 673);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (575, 'Avery', 'Clark', to_date('04-02-2019', 'dd-mm-yyyy'), null, 'Alexandra Clark', 517658922, null, 674);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (576, 'Eliana', 'Lopez', to_date('18-10-2019', 'dd-mm-yyyy'), 'Gluten', 'Brandon Lopez', 526993207, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (577, 'Leah', 'Davis', to_date('02-06-2020', 'dd-mm-yyyy'), null, 'Joseph Davis', 552418898, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (578, 'Anthony', 'Walker', to_date('13-04-2022', 'dd-mm-yyyy'), 'Peanuts', 'Olivia Walker', 567612673, null, 677);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (579, 'Nora', 'Allen', to_date('18-12-2020', 'dd-mm-yyyy'), null, 'Melanie Allen', 526119716, null, 678);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (580, 'Leilani', 'Thompson', to_date('27-05-2019', 'dd-mm-yyyy'), null, 'Maya Thompson', 577660846, null, 679);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (581, 'Hannah', 'Scott', to_date('01-11-2022', 'dd-mm-yyyy'), 'Dairy', 'Zoey Scott', 551471973, null, 680);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (582, 'Cameron', 'Young', to_date('23-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Lily Young', 558168909, null, 681);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (583, 'Sadie', 'Kim', to_date('28-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Allison Kim', 587046453, null, 682);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (584, 'Delilah', 'Hernandez', to_date('06-06-2018', 'dd-mm-yyyy'), 'Dairy', 'Vivienne Hernandez', 540198348, null, 683);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (585, 'Lucas', 'Lopez', to_date('06-06-2019', 'dd-mm-yyyy'), null, 'Gianna Lopez', 515667833, null, 684);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (586, 'Brooklyn', 'Allen', to_date('22-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Savannah Allen', 577653047, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (587, 'Anthony', 'Davis', to_date('16-08-2018', 'dd-mm-yyyy'), null, 'Cameron Davis', 515991972, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (588, 'Chad', 'Cruz', to_date('29-10-2018', 'dd-mm-yyyy'), null, 'Julia Cruz', 520082502, null, 687);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (589, 'David', 'Wright', to_date('03-03-2022', 'dd-mm-yyyy'), null, 'Cora Wright', 548591749, null, 688);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (590, 'Samantha', 'Hernandez', to_date('19-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Gabriella Hernandez', 548177272, null, 689);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (591, 'Edward', 'Clark', to_date('15-08-2022', 'dd-mm-yyyy'), 'Peanuts', 'Piper Clark', 512682038, null, 690);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (592, 'Allison', 'Lewis', to_date('10-05-2020', 'dd-mm-yyyy'), null, 'Austin Lewis', 582492328, null, 691);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (593, 'Piper', 'Moore', to_date('02-05-2020', 'dd-mm-yyyy'), null, 'Samantha Moore', 525732705, null, 692);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (594, 'Anna', 'Roberts', to_date('25-09-2018', 'dd-mm-yyyy'), null, 'Jayden Roberts', 530842507, null, 693);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (595, 'Adalyn', 'Taylor', to_date('29-01-2022', 'dd-mm-yyyy'), null, 'Adeline Taylor', 599187570, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (596, 'Hazel', 'Evans', to_date('31-07-2021', 'dd-mm-yyyy'), null, 'Madilyn Evans', 529891675, null, 695);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (597, 'Aaliyah', 'Allen', to_date('22-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Piper Allen', 554417989, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (598, 'Reagan', 'Garcia', to_date('11-03-2020', 'dd-mm-yyyy'), 'Peanuts', 'Benjamin Garcia', 598025101, null, 697);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (599, 'Henry', 'Nelson', to_date('21-08-2023', 'dd-mm-yyyy'), null, 'Sloane Nelson', 587679797, null, 698);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (600, 'Autumn', 'Evans', to_date('17-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Evans', 554843888, null, 699);
commit;
prompt 600 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (601, 'Joshua', 'Carter', to_date('24-09-2022', 'dd-mm-yyyy'), null, 'Justin Carter', 561777302, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (602, 'Isaiah', 'Brown', to_date('22-01-2023', 'dd-mm-yyyy'), 'Gluten', 'Lila Brown', 588463654, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (603, 'Aria', 'Williams', to_date('07-03-2023', 'dd-mm-yyyy'), null, 'Cora Williams', 587312013, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (604, 'Catalina', 'Sanchez', to_date('12-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Sanchez', 523716282, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (605, 'Gabriella', 'Allen', to_date('22-06-2018', 'dd-mm-yyyy'), null, 'Dustin Allen', 599773224, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (606, 'Lawrence', 'Robinson', to_date('14-07-2021', 'dd-mm-yyyy'), null, 'Leonardo Robinson', 542244037, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (607, 'Nathan', 'Hernandez', to_date('11-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Chloe Hernandez', 583243421, null, 706);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (608, 'Taylor', 'Smith', to_date('01-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Clara Smith', 588354344, null, 707);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (609, 'Jonathan', 'Moore', to_date('26-04-2020', 'dd-mm-yyyy'), null, 'Alan Moore', 574490594, null, 708);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (610, 'Eva', 'Sanchez', to_date('07-01-2018', 'dd-mm-yyyy'), 'Dairy', 'Jack Sanchez', 599516522, null, 709);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (611, 'Brianna', 'Lopez', to_date('01-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Caleb Lopez', 571746241, null, 710);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (612, 'Claire', 'Lee', to_date('07-06-2021', 'dd-mm-yyyy'), null, 'Aurora Lee', 520854657, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (613, 'Cameron', 'Garcia', to_date('01-09-2018', 'dd-mm-yyyy'), 'Gluten', 'Everly Garcia', 542045620, null, 712);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (614, 'Henry', 'Hernandez', to_date('18-10-2018', 'dd-mm-yyyy'), null, 'Arabella Hernandez', 557597032, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (615, 'Lila', 'Moore', to_date('30-07-2020', 'dd-mm-yyyy'), null, 'Claire Moore', 571134822, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (616, 'Jesse', 'Robinson', to_date('15-12-2018', 'dd-mm-yyyy'), 'Gluten', 'Jonathan Robinson', 575911656, null, 715);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (617, 'Natalie', 'Hernandez', to_date('17-12-2021', 'dd-mm-yyyy'), null, 'Andrea Hernandez', 550433498, null, 716);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (618, 'Anthony', 'Nelson', to_date('28-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Chad Nelson', 578991936, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (619, 'Dustin', 'Carter', to_date('18-10-2022', 'dd-mm-yyyy'), 'Peanuts', 'Elena Carter', 520107809, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (620, 'Cody', 'Clark', to_date('26-08-2022', 'dd-mm-yyyy'), null, 'Hazel Clark', 534554614, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (621, 'Aurora', 'Walker', to_date('21-11-2021', 'dd-mm-yyyy'), null, 'Lucas Walker', 565571371, null, 720);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (622, 'Leah', 'Garcia', to_date('19-05-2020', 'dd-mm-yyyy'), null, 'Ezekiel Garcia', 523681128, null, 721);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (623, 'Antonio', 'Garcia', to_date('08-03-2023', 'dd-mm-yyyy'), null, 'Josephine Garcia', 551076076, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (624, 'Vivienne', 'Williams', to_date('07-01-2022', 'dd-mm-yyyy'), 'Dairy', 'Bailey Williams', 524114967, null, 723);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (625, 'Keira', 'Clark', to_date('26-09-2018', 'dd-mm-yyyy'), null, 'Kinsley Clark', 583902230, null, 724);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (626, 'Keira', 'Cruz', to_date('21-09-2022', 'dd-mm-yyyy'), null, 'Isaiah Cruz', 539439900, null, 725);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (627, 'Skylar', 'Nelson', to_date('06-06-2023', 'dd-mm-yyyy'), 'Dairy', 'Sloane Nelson', 540364597, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (628, 'Dylan', 'Miller', to_date('13-03-2019', 'dd-mm-yyyy'), 'Gluten', 'Gregory Miller', 541925194, null, 727);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (629, 'Nora', 'Lopez', to_date('08-08-2019', 'dd-mm-yyyy'), null, 'Daniel Lopez', 537182821, null, 728);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (630, 'Bailey', 'Thomas', to_date('03-07-2023', 'dd-mm-yyyy'), 'Gluten', 'Elena Thomas', 511359084, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (631, 'Sloane', 'Lopez', to_date('27-04-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Lopez', 564868683, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (632, 'Chad', 'Evans', to_date('14-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Anthony Evans', 531135702, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (633, 'Violet', 'Campbell', to_date('15-09-2023', 'dd-mm-yyyy'), 'Peanuts', 'Madeline Campbell', 523848478, null, 732);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (634, 'Alice', 'Lee', to_date('27-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Jacob Lee', 596542065, null, 733);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (635, 'Lucy', 'Moore', to_date('12-10-2023', 'dd-mm-yyyy'), null, 'Ava Moore', 568501898, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (636, 'Isaiah', 'Jones', to_date('06-08-2018', 'dd-mm-yyyy'), 'Peanuts', 'Hannah Jones', 562468433, null, 735);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (637, 'Juan', 'Nelson', to_date('28-09-2020', 'dd-mm-yyyy'), 'Gluten', 'Zoey Nelson', 522823206, null, 736);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (638, 'Cora', 'Sanchez', to_date('25-02-2018', 'dd-mm-yyyy'), 'Dairy', 'Juliet Sanchez', 574742174, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (639, 'Sophia', 'Sanchez', to_date('17-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Lola Sanchez', 597753559, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (640, 'Isaiah', 'Thompson', to_date('04-10-2023', 'dd-mm-yyyy'), null, 'Lillian Thompson', 512883900, null, 739);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (641, 'Dustin', 'Lee', to_date('25-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Madison Lee', 530911364, null, 740);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (642, 'Juan', 'King', to_date('01-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'David King', 518256808, null, 741);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (643, 'Dustin', 'Wilson', to_date('12-07-2018', 'dd-mm-yyyy'), null, 'Joseph Wilson', 589558609, null, 742);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (644, 'Vivienne', 'Evans', to_date('18-01-2018', 'dd-mm-yyyy'), null, 'Gianna Evans', 552546833, null, 743);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (645, 'Jonathan', 'Lopez', to_date('11-04-2021', 'dd-mm-yyyy'), null, 'Olivia Lopez', 535228153, null, 744);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (646, 'Caroline', 'Scott', to_date('01-10-2020', 'dd-mm-yyyy'), 'Dairy', 'Henry Scott', 569203857, null, 745);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (647, 'Isla', 'Allen', to_date('15-09-2023', 'dd-mm-yyyy'), 'Gluten', 'Callie Allen', 545762532, null, 746);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (648, 'Nora', 'Davis', to_date('23-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'George Davis', 523834095, null, 747);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (649, 'Felipe', 'Moore', to_date('28-08-2023', 'dd-mm-yyyy'), null, 'Scarlett Moore', 559904494, null, 748);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (650, 'Lily', 'Young', to_date('22-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Jasmine Young', 554481990, null, 749);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (651, 'Gregory', 'Nelson', to_date('01-12-2019', 'dd-mm-yyyy'), null, 'Amelia Nelson', 556335255, null, 750);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (652, 'Evelyn', 'Garcia', to_date('29-07-2020', 'dd-mm-yyyy'), 'Dairy', 'Quinn Garcia', 568940114, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (653, 'Alexis', 'Campbell', to_date('27-12-2020', 'dd-mm-yyyy'), null, 'Jordan Campbell', 555023396, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (654, 'Keith', 'Diaz', to_date('11-07-2023', 'dd-mm-yyyy'), null, 'Cole Diaz', 553404738, null, 753);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (655, 'Andrew', 'Lopez', to_date('26-02-2021', 'dd-mm-yyyy'), null, 'Eden Lopez', 558004193, null, 754);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (656, 'Genevieve', 'Ramirez', to_date('23-10-2019', 'dd-mm-yyyy'), null, 'Natalie Ramirez', 565672100, null, 755);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (657, 'Lillian', 'Davis', to_date('16-01-2019', 'dd-mm-yyyy'), 'Dairy', 'Jonathan Davis', 510614731, null, 756);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (658, 'Isabelle', 'Nguyen', to_date('28-05-2023', 'dd-mm-yyyy'), 'Peanuts', 'Jonathan Nguyen', 589320897, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (659, 'Henry', 'Rogers', to_date('20-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Addison Rogers', 571978640, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (660, 'Chloe', 'Garcia', to_date('28-11-2023', 'dd-mm-yyyy'), null, 'Derek Garcia', 563056508, null, 759);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (661, 'Madison', 'Allen', to_date('13-04-2018', 'dd-mm-yyyy'), null, 'Anthony Allen', 511761380, null, 760);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (662, 'George', 'Robinson', to_date('02-05-2019', 'dd-mm-yyyy'), null, 'Douglas Robinson', 524777503, null, 761);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (663, 'Gabriella', 'Walker', to_date('27-12-2018', 'dd-mm-yyyy'), null, 'Miguel Walker', 579839183, null, 762);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (664, 'Eden', 'Allen', to_date('11-08-2020', 'dd-mm-yyyy'), 'Peanuts', 'Alice Allen', 590925510, null, 763);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (665, 'Serenity', 'Mitchell', to_date('21-04-2021', 'dd-mm-yyyy'), 'Peanuts', 'Skylar Mitchell', 583931611, null, 764);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (666, 'Madelyn', 'Allen', to_date('30-08-2020', 'dd-mm-yyyy'), 'Peanuts', 'Brielle Allen', 597688730, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (667, 'Daisy', 'Adams', to_date('24-03-2022', 'dd-mm-yyyy'), 'Gluten', 'Aaliyah Adams', 556669124, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (668, 'Lillian', 'Lopez', to_date('10-08-2019', 'dd-mm-yyyy'), null, 'Adam Lopez', 567054683, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (669, 'Henry', 'Lee', to_date('05-01-2023', 'dd-mm-yyyy'), null, 'Caroline Lee', 583118597, null, 768);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (670, 'Juliet', 'Moore', to_date('13-08-2020', 'dd-mm-yyyy'), 'Dairy', 'Isabella Moore', 597318941, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (671, 'John', 'Thompson', to_date('05-04-2020', 'dd-mm-yyyy'), null, 'Melanie Thompson', 510219075, null, 770);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (672, 'Luna', 'Thomas', to_date('20-08-2023', 'dd-mm-yyyy'), 'Dairy', 'Eden Thomas', 567387124, null, 771);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (673, 'David', 'Nguyen', to_date('24-10-2022', 'dd-mm-yyyy'), 'Gluten', 'Brooklyn Nguyen', 560461856, null, 772);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (674, 'Eva', 'Clark', to_date('05-08-2020', 'dd-mm-yyyy'), 'Gluten', 'Brielle Clark', 556352351, null, 773);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (675, 'Chloe', 'Wilson', to_date('27-01-2020', 'dd-mm-yyyy'), null, 'Ellie Wilson', 570099660, null, 774);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (676, 'Douglas', 'Walker', to_date('15-01-2023', 'dd-mm-yyyy'), null, 'Alexis Walker', 543327062, null, 775);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (677, 'Christopher', 'Watson', to_date('28-12-2022', 'dd-mm-yyyy'), 'Peanuts', 'Chloe Watson', 515139839, null, 776);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (678, 'Delilah', 'Moore', to_date('10-02-2020', 'dd-mm-yyyy'), 'Dairy', 'Maya Moore', 510408518, null, 777);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (679, 'Lillian', 'Davis', to_date('17-06-2021', 'dd-mm-yyyy'), 'Dairy', 'Nathan Davis', 545768481, null, 778);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (680, 'Joshua', 'Allen', to_date('11-01-2022', 'dd-mm-yyyy'), null, 'Aaron Allen', 533779820, null, 779);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (681, 'Ezekiel', 'Rodriguez', to_date('12-10-2018', 'dd-mm-yyyy'), 'Peanuts', 'Nicole Rodriguez', 544323729, null, 780);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (682, 'Savannah', 'Thompson', to_date('17-07-2020', 'dd-mm-yyyy'), 'Gluten', 'Brielle Thompson', 595584090, null, 781);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (683, 'Elena', 'Clark', to_date('21-02-2019', 'dd-mm-yyyy'), null, 'Violet Clark', 547386942, null, 782);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (684, 'Kaitlyn', 'Hernandez', to_date('02-06-2019', 'dd-mm-yyyy'), 'Gluten', 'Ethan Hernandez', 558220451, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (685, 'Adam', 'Nguyen', to_date('08-09-2019', 'dd-mm-yyyy'), 'Gluten', 'Alan Nguyen', 593904398, null, 784);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (686, 'Sophia', 'Allen', to_date('27-06-2021', 'dd-mm-yyyy'), 'Dairy', 'Lawrence Allen', 521450074, null, 785);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (687, 'Benjamin', 'Roy', to_date('23-02-2023', 'dd-mm-yyyy'), 'Dairy', 'Amaya Roy', 571088165, null, 786);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (688, 'Everly', 'Carter', to_date('08-09-2018', 'dd-mm-yyyy'), null, 'Hope Carter', 526613506, null, 787);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (689, 'Sophia', 'Robinson', to_date('01-01-2022', 'dd-mm-yyyy'), 'Gluten', 'Dylan Robinson', 556608833, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (690, 'Madison', 'Smith', to_date('11-04-2020', 'dd-mm-yyyy'), null, 'Vivian Smith', 558693562, null, 789);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (691, 'Gregory', 'Wilson', to_date('11-05-2023', 'dd-mm-yyyy'), 'Dairy', 'Arabella Wilson', 580624509, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (692, 'Chloe', 'Wilson', to_date('03-07-2020', 'dd-mm-yyyy'), null, 'Isaiah Wilson', 584213398, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (693, 'Leilani', 'Brown', to_date('28-12-2019', 'dd-mm-yyyy'), 'Peanuts', 'Sloane Brown', 553788572, null, 792);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (694, 'Aurora', 'Young', to_date('05-11-2023', 'dd-mm-yyyy'), null, 'Willow Young', 522460390, null, 793);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (695, 'Kaitlyn', 'Carter', to_date('23-09-2019', 'dd-mm-yyyy'), 'Dairy', 'David Carter', 570516958, null, 794);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (696, 'Emery', 'Young', to_date('26-07-2022', 'dd-mm-yyyy'), null, 'Rosalie Young', 541634495, null, 795);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (697, 'Justin', 'Clark', to_date('19-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Julia Clark', 557843191, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (698, 'Brianna', 'Young', to_date('25-10-2021', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Young', 519585550, null, 797);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (699, 'Willow', 'Smith', to_date('13-03-2019', 'dd-mm-yyyy'), 'Dairy', 'Isaiah Smith', 594048435, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (700, 'Isaiah', 'Rodriguez', to_date('07-11-2018', 'dd-mm-yyyy'), null, 'Isaac Rodriguez', 577415946, null, 799);
commit;
prompt 700 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (701, 'Albert', 'Lee', to_date('05-01-2023', 'dd-mm-yyyy'), 'Peanuts', 'Eden Lee', 541027876, null, 800);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (702, 'Joan', 'Garcia', to_date('14-05-2019', 'dd-mm-yyyy'), null, 'Derek Garcia', 575277786, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (703, 'Hannah', 'Lewis', to_date('13-12-2020', 'dd-mm-yyyy'), 'Gluten', 'Callie Lewis', 596896650, null, 802);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (704, 'Amelia', 'Rodriguez', to_date('25-11-2018', 'dd-mm-yyyy'), null, 'Aurora Rodriguez', 567178237, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (705, 'Leonardo', 'Jones', to_date('01-06-2023', 'dd-mm-yyyy'), 'Gluten', 'Layla Jones', 575086506, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (706, 'Sadie', 'Watson', to_date('20-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Kevin Watson', 587400513, null, 805);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (707, 'Alaina', 'Hall', to_date('15-03-2020', 'dd-mm-yyyy'), 'Dairy', 'Bella Hall', 587103254, null, 806);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (708, 'Quinn', 'Davis', to_date('24-10-2020', 'dd-mm-yyyy'), null, 'Eva Davis', 570132215, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (709, 'Albert', 'Moore', to_date('16-07-2018', 'dd-mm-yyyy'), null, 'Samantha Moore', 522025110, null, 808);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (710, 'Javier', 'Lopez', to_date('20-05-2023', 'dd-mm-yyyy'), 'Gluten', 'Hazel Lopez', 571522290, null, 809);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (711, 'Leilani', 'Thomas', to_date('04-12-2021', 'dd-mm-yyyy'), 'Dairy', 'Delilah Thomas', 573756558, null, 810);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (712, 'Dennis', 'Williams', to_date('01-11-2019', 'dd-mm-yyyy'), 'Peanuts', 'Hannah Williams', 539560187, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (713, 'Benjamin', 'King', to_date('28-11-2023', 'dd-mm-yyyy'), null, 'Ava King', 584601823, null, 812);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (714, 'Jordan', 'Hernandez', to_date('28-01-2020', 'dd-mm-yyyy'), null, 'Millie Hernandez', 538128684, null, 813);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (715, 'Aaron', 'Davis', to_date('25-07-2019', 'dd-mm-yyyy'), 'Dairy', 'Josephine Davis', 552677540, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (716, 'Clara', 'Wright', to_date('12-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Benjamin Wright', 579764863, null, 815);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (717, 'Adalyn', 'Davis', to_date('01-08-2023', 'dd-mm-yyyy'), 'Dairy', 'Jacob Davis', 597297557, null, 816);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (718, 'Charlotte', 'Green', to_date('14-08-2018', 'dd-mm-yyyy'), 'Dairy', 'Felipe Green', 522032236, null, 817);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (719, 'David', 'Johnson', to_date('07-02-2023', 'dd-mm-yyyy'), 'Gluten', 'Alaina Johnson', 538242802, null, 818);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (720, 'Arabella', 'Taylor', to_date('19-03-2018', 'dd-mm-yyyy'), null, 'Quinn Taylor', 529052596, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (721, 'Javier', 'Garcia', to_date('24-03-2018', 'dd-mm-yyyy'), 'Dairy', 'Allison Garcia', 549635635, null, 820);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (722, 'Adam', 'Kim', to_date('19-02-2022', 'dd-mm-yyyy'), null, 'Ella Kim', 572835254, null, 821);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (723, 'Rylee', 'Williams', to_date('27-08-2023', 'dd-mm-yyyy'), null, 'Scarlett Williams', 553562760, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (724, 'Adalyn', 'Nelson', to_date('23-11-2018', 'dd-mm-yyyy'), 'Dairy', 'Isabella Nelson', 528809218, null, 823);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (725, 'Charles', 'Allen', to_date('09-11-2022', 'dd-mm-yyyy'), 'Gluten', 'Douglas Allen', 565769931, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (726, 'Antonio', 'Garcia', to_date('03-03-2019', 'dd-mm-yyyy'), null, 'Gabriel Garcia', 568027178, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (727, 'Jade', 'Mitchell', to_date('10-05-2020', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Mitchell', 526803571, null, 826);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (728, 'Catalina', 'Nelson', to_date('05-12-2019', 'dd-mm-yyyy'), null, 'Antonio Nelson', 556170272, null, 827);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (729, 'Kennedy', 'Miller', to_date('09-09-2019', 'dd-mm-yyyy'), 'Peanuts', 'Madelyn Miller', 527195525, null, 828);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (730, 'Kennedy', 'Rogers', to_date('07-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Gregory Rogers', 589218583, null, 829);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (731, 'Chloe', 'Johnson', to_date('02-02-2018', 'dd-mm-yyyy'), 'Gluten', 'Austin Johnson', 544464441, null, 830);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (732, 'Juan', 'Wright', to_date('20-06-2019', 'dd-mm-yyyy'), 'Dairy', 'Reagan Wright', 564878785, null, 831);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (733, 'Dennis', 'Rogers', to_date('06-09-2023', 'dd-mm-yyyy'), null, 'Benjamin Rogers', 571201255, null, 832);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (734, 'Ruby', 'Martinez', to_date('01-02-2019', 'dd-mm-yyyy'), 'Dairy', 'Eliza Martinez', 596851840, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (735, 'Brianna', 'Diaz', to_date('10-12-2018', 'dd-mm-yyyy'), 'Dairy', 'Eliana Diaz', 516628526, null, 834);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (736, 'Evelyn', 'Lopez', to_date('16-09-2023', 'dd-mm-yyyy'), null, 'Willow Lopez', 548957130, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (737, 'Joseph', 'Garcia', to_date('26-06-2022', 'dd-mm-yyyy'), 'Gluten', 'Leonardo Garcia', 597341129, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (738, 'Everly', 'Rogers', to_date('16-09-2021', 'dd-mm-yyyy'), null, 'Juliet Rogers', 589578943, null, 837);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (739, 'Kaylee', 'Moore', to_date('05-06-2018', 'dd-mm-yyyy'), 'Peanuts', 'Gianna Moore', 546811506, null, 838);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (740, 'Ivy', 'Nguyen', to_date('19-11-2019', 'dd-mm-yyyy'), 'Gluten', 'Teagan Nguyen', 518396629, null, 839);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (741, 'Keira', 'Lee', to_date('12-04-2019', 'dd-mm-yyyy'), null, 'Taylor Lee', 537390208, null, 840);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (742, 'Callie', 'Cruz', to_date('08-06-2021', 'dd-mm-yyyy'), 'Peanuts', 'Luna Cruz', 516188935, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (743, 'Aubrey', 'Moore', to_date('31-05-2022', 'dd-mm-yyyy'), 'Peanuts', 'Cole Moore', 573180758, null, 842);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (744, 'Diego', 'Rogers', to_date('19-11-2023', 'dd-mm-yyyy'), null, 'Juliet Rogers', 542575530, null, 843);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (745, 'Brianna', 'Walker', to_date('16-01-2023', 'dd-mm-yyyy'), null, 'Adeline Walker', 555276489, null, 844);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (746, 'Delilah', 'Lopez', to_date('23-10-2022', 'dd-mm-yyyy'), 'Dairy', 'Layla Lopez', 586283874, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (747, 'Teagan', 'Moore', to_date('19-09-2018', 'dd-mm-yyyy'), 'Dairy', 'Keith Moore', 542036540, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (748, 'Adam', 'Hall', to_date('01-01-2019', 'dd-mm-yyyy'), 'Peanuts', 'Ruby Hall', 517421636, null, 847);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (749, 'Reagan', 'Adams', to_date('30-07-2018', 'dd-mm-yyyy'), 'Dairy', 'Peyton Adams', 571972845, null, 848);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (750, 'Elena', 'Nelson', to_date('26-03-2018', 'dd-mm-yyyy'), null, 'Ellie Nelson', 562877351, null, 849);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (751, 'Layla', 'Scott', to_date('15-10-2020', 'dd-mm-yyyy'), 'Gluten', 'Nicole Scott', 575200242, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (752, 'Alan', 'Anderson', to_date('07-10-2022', 'dd-mm-yyyy'), 'Peanuts', 'Millie Anderson', 578905527, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (753, 'Madison', 'Young', to_date('17-09-2022', 'dd-mm-yyyy'), 'Gluten', 'Isabelle Young', 535149526, null, 852);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (754, 'Taylor', 'Allen', to_date('01-12-2021', 'dd-mm-yyyy'), 'Gluten', 'Harold Allen', 553633251, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (755, 'Genevieve', 'Wilson', to_date('06-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Willow Wilson', 546491800, null, 854);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (756, 'Hazel', 'Lewis', to_date('06-04-2018', 'dd-mm-yyyy'), 'Dairy', 'Jasmine Lewis', 578190592, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (757, 'Dustin', 'Allen', to_date('01-06-2023', 'dd-mm-yyyy'), 'Peanuts', 'Autumn Allen', 569005730, null, 856);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (758, 'Eric', 'Moore', to_date('14-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Julia Moore', 526821995, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (759, 'Diego', 'Robinson', to_date('18-08-2022', 'dd-mm-yyyy'), 'Gluten', 'Stella Robinson', 587013183, null, 858);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (760, 'Evelyn', 'Nguyen', to_date('27-07-2021', 'dd-mm-yyyy'), null, 'Douglas Nguyen', 539640058, null, 859);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (761, 'Harper', 'Wright', to_date('21-06-2020', 'dd-mm-yyyy'), null, 'Ava Wright', 563301783, null, 860);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (762, 'Stella', 'Phillips', to_date('23-06-2020', 'dd-mm-yyyy'), 'Peanuts', 'Leah Phillips', 592387919, null, 861);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (763, 'Avery', 'Moore', to_date('07-08-2018', 'dd-mm-yyyy'), null, 'Nicole Moore', 599549260, null, 862);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (764, 'Gianna', 'Thompson', to_date('21-12-2023', 'dd-mm-yyyy'), null, 'Ezekiel Thompson', 520085268, null, 863);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (765, 'Sophie', 'Taylor', to_date('01-09-2021', 'dd-mm-yyyy'), 'Peanuts', 'Valentina Taylor', 591390039, null, 864);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (766, 'Avery', 'Anderson', to_date('09-12-2020', 'dd-mm-yyyy'), null, 'Gracie Anderson', 540910488, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (767, 'Clara', 'Mitchell', to_date('27-04-2019', 'dd-mm-yyyy'), 'Dairy', 'Julia Mitchell', 545751050, null, 866);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (768, 'Addison', 'Mitchell', to_date('09-05-2019', 'dd-mm-yyyy'), null, 'Rose Mitchell', 528079427, null, 867);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (769, 'Brooklyn', 'Rodriguez', to_date('21-07-2018', 'dd-mm-yyyy'), null, 'Madilyn Rodriguez', 561897400, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (770, 'Ava', 'Miller', to_date('07-02-2020', 'dd-mm-yyyy'), null, 'Sarah Miller', 575067043, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (771, 'Adalyn', 'Brown', to_date('08-02-2018', 'dd-mm-yyyy'), null, 'Jade Brown', 591270389, null, 870);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (772, 'Luna', 'Garcia', to_date('26-04-2021', 'dd-mm-yyyy'), 'Gluten', 'Allison Garcia', 522691087, null, 871);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (773, 'Amaya', 'Young', to_date('25-07-2020', 'dd-mm-yyyy'), null, 'Lillian Young', 592058733, null, 872);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (774, 'Luke', 'Walker', to_date('16-04-2019', 'dd-mm-yyyy'), null, 'Joshua Walker', 570646001, null, 873);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (775, 'Valentina', 'Robinson', to_date('27-11-2022', 'dd-mm-yyyy'), 'Peanuts', 'Isaac Robinson', 549161211, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (776, 'Brian', 'Jones', to_date('03-06-2021', 'dd-mm-yyyy'), 'Gluten', 'Claire Jones', 560467335, null, 875);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (777, 'Addison', 'Cruz', to_date('13-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Vivian Cruz', 515067737, null, 876);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (778, 'Gregory', 'Wright', to_date('17-07-2022', 'dd-mm-yyyy'), 'Peanuts', 'Douglas Wright', 539239445, null, 877);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (779, 'Justin', 'Davis', to_date('28-03-2019', 'dd-mm-yyyy'), 'Peanuts', 'Stella Davis', 511187879, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (780, 'Eliana', 'Scott', to_date('23-01-2022', 'dd-mm-yyyy'), null, 'Athena Scott', 580605324, null, 879);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (781, 'Rosalie', 'Rogers', to_date('25-11-2019', 'dd-mm-yyyy'), null, 'Cora Rogers', 583535602, null, 880);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (782, 'Alice', 'Allen', to_date('14-01-2022', 'dd-mm-yyyy'), null, 'Eliza Allen', 561877915, null, 881);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (783, 'Daisy', 'Mitchell', to_date('21-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Lillian Mitchell', 576382554, null, 882);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (784, 'Kyle', 'Nelson', to_date('08-06-2019', 'dd-mm-yyyy'), null, 'Chad Nelson', 546445295, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (785, 'Ellie', 'Rodriguez', to_date('26-11-2020', 'dd-mm-yyyy'), 'Dairy', 'Lila Rodriguez', 588839878, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (786, 'Aubrey', 'Rodriguez', to_date('08-02-2023', 'dd-mm-yyyy'), 'Peanuts', 'Alexis Rodriguez', 569423896, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (787, 'Caroline', 'Wright', to_date('23-08-2019', 'dd-mm-yyyy'), 'Dairy', 'Willow Wright', 523409258, null, 886);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (788, 'Brooklyn', 'Allen', to_date('06-03-2023', 'dd-mm-yyyy'), null, 'Ellie Allen', 523126520, null, 887);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (789, 'Alice', 'Allen', to_date('07-01-2022', 'dd-mm-yyyy'), 'Dairy', 'Andrew Allen', 530876686, null, 888);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (790, 'Adrian', 'Wright', to_date('03-11-2023', 'dd-mm-yyyy'), null, 'Peyton Wright', 559403965, null, 889);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (791, 'Aurora', 'Harris', to_date('07-05-2019', 'dd-mm-yyyy'), 'Gluten', 'Paisley Harris', 581055223, null, 890);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (792, 'Isaiah', 'Garcia', to_date('30-01-2021', 'dd-mm-yyyy'), 'Peanuts', 'Teagan Garcia', 569307774, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (793, 'Evelyn', 'Lopez', to_date('22-10-2018', 'dd-mm-yyyy'), 'Peanuts', 'Javier Lopez', 567472364, null, 892);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (794, 'Lola', 'Young', to_date('13-12-2019', 'dd-mm-yyyy'), 'Gluten', 'Kevin Young', 534402994, null, null);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (795, 'Paisley', 'Allen', to_date('07-10-2018', 'dd-mm-yyyy'), 'Gluten', 'Keith Allen', 529883841, null, 894);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (796, 'Gianna', 'Miller', to_date('18-01-2019', 'dd-mm-yyyy'), null, 'Miguel Miller', 551828863, null, 895);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (797, 'Lily', 'Lopez', to_date('11-04-2018', 'dd-mm-yyyy'), null, 'Caroline Lopez', 596264733, null, 896);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (798, 'Hazel', 'Garcia', to_date('03-07-2019', 'dd-mm-yyyy'), 'Gluten', 'Juliet Garcia', 564156636, null, 897);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (799, 'Juan', 'Green', to_date('20-09-2020', 'dd-mm-yyyy'), 'Peanuts', 'Gianna Green', 557281659, null, 898);
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (800, 'Luna', 'Ramirez', to_date('25-08-2022', 'dd-mm-yyyy'), null, 'Daniel Ramirez', 515162918, null, 899);
commit;
prompt 800 records committed...
insert into CHILD (childid, first_name, last_name, dateofbirth, allergies, emergencycontactname, emergencycontactphone, medicalconditions, registrationid_)
values (900, 'John', 'Doe', to_date('20-05-2018', 'dd-mm-yyyy'), 'None', 'Jane Doe', 1234567890, 'None', 1);
commit;
prompt 801 records loaded
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
prompt Enabling foreign key constraints for REGISTRATION...
alter table REGISTRATION enable constraint FK_REGISTRATION_KINDERGARTEN;
alter table REGISTRATION enable constraint SYS_C007485;
prompt Enabling foreign key constraints for CHILD...
alter table CHILD enable constraint FK_CHILD_REGISTRATION;
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
prompt Enabling triggers for REGISTRATION...
alter table REGISTRATION enable all triggers;
prompt Enabling triggers for CHILD...
alter table CHILD enable all triggers;
prompt Enabling triggers for TEACHER...
alter table TEACHER enable all triggers;
set feedback on
set define on
prompt Done.
