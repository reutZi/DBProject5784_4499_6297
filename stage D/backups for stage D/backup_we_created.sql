prompt PL/SQL Developer import file
prompt Created on יום שישי 19 יולי 2024 by USER
set feedback off
set define off
prompt Creating ACTIVITES...
create table ACTIVITES
(
  activity_id   NUMBER(4) not null,
  activity_name VARCHAR2(30) not null,
  a_description VARCHAR2(255) not null,
  activity_date DATE not null,
  a_start_time  VARCHAR2(15) not null,
  a_end_time    VARCHAR2(15) not null
);
alter table ACTIVITES
  add primary key (ACTIVITY_ID);

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id     NUMBER(4) not null,
  shift_date   DATE not null,
  s_start_time VARCHAR2(15) not null,
  s_end_time   VARCHAR2(15) not null,
  s_location   VARCHAR2(30) not null,
  shift_leader VARCHAR2(30) not null
);
alter table SHIFTS
  add primary key (SHIFT_ID);

prompt Creating EVENTS...
create table EVENTS
(
  event_id      NUMBER(4) not null,
  event_date    DATE not null,
  event_time    VARCHAR2(15) not null,
  e_location    VARCHAR2(30) not null,
  e_description VARCHAR2(255) not null,
  shift_id      NUMBER(4) not null
);
alter table EVENTS
  add primary key (EVENT_ID);
alter table EVENTS
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);

prompt Creating ACTS_IN_EVENTS...
create table ACTS_IN_EVENTS
(
  activity_id NUMBER(4) not null,
  event_id    NUMBER(4) not null
);
alter table ACTS_IN_EVENTS
  add primary key (ACTIVITY_ID, EVENT_ID);
alter table ACTS_IN_EVENTS
  add foreign key (ACTIVITY_ID)
  references ACTIVITES (ACTIVITY_ID);
alter table ACTS_IN_EVENTS
  add foreign key (EVENT_ID)
  references EVENTS (EVENT_ID);

prompt Creating REPORTS...
create table REPORTS
(
  report_id   NUMBER(4) not null,
  report_date DATE not null,
  report_type VARCHAR2(30) not null,
  r_content   VARCHAR2(255) not null,
  event_id    NUMBER(4) not null
);
alter table REPORTS
  add primary key (REPORT_ID);
alter table REPORTS
  add foreign key (EVENT_ID)
  references EVENTS (EVENT_ID);

prompt Creating ROLES...
create table ROLES
(
  role_id           NUMBER(4) not null,
  role_name         VARCHAR2(30) not null,
  role_description  VARCHAR2(255) not null,
  required_training NUMBER(1) not null,
  max_volunteers    NUMBER(1) not null
);
alter table ROLES
  add primary key (ROLE_ID);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  volunteer_id VARCHAR2(9) not null,
  first_name   VARCHAR2(30) not null,
  last_name    VARCHAR2(30) not null,
  phone_number VARCHAR2(10) not null,
  address      VARCHAR2(255) not null,
  email        VARCHAR2(255) not null,
  status       VARCHAR2(255) not null,
  role_id      NUMBER(4) not null
);
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID);
alter table VOLUNTEERS
  add foreign key (ROLE_ID)
  references ROLES (ROLE_ID);

prompt Creating VS_IN_SHIFTS...
create table VS_IN_SHIFTS
(
  shift_id     NUMBER(4) not null,
  volunteer_id VARCHAR2(9) not null
);
alter table VS_IN_SHIFTS
  add primary key (SHIFT_ID, VOLUNTEER_ID);
alter table VS_IN_SHIFTS
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);
alter table VS_IN_SHIFTS
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);

prompt Disabling triggers for ACTIVITES...
alter table ACTIVITES disable all triggers;
prompt Disabling triggers for SHIFTS...
alter table SHIFTS disable all triggers;
prompt Disabling triggers for EVENTS...
alter table EVENTS disable all triggers;
prompt Disabling triggers for ACTS_IN_EVENTS...
alter table ACTS_IN_EVENTS disable all triggers;
prompt Disabling triggers for REPORTS...
alter table REPORTS disable all triggers;
prompt Disabling triggers for ROLES...
alter table ROLES disable all triggers;
prompt Disabling triggers for VOLUNTEERS...
alter table VOLUNTEERS disable all triggers;
prompt Disabling triggers for VS_IN_SHIFTS...
alter table VS_IN_SHIFTS disable all triggers;
prompt Disabling foreign key constraints for EVENTS...
alter table EVENTS disable constraint SYS_C008265;
prompt Disabling foreign key constraints for ACTS_IN_EVENTS...
alter table ACTS_IN_EVENTS disable constraint SYS_C008289;
alter table ACTS_IN_EVENTS disable constraint SYS_C008290;
prompt Disabling foreign key constraints for REPORTS...
alter table REPORTS disable constraint SYS_C008272;
prompt Disabling foreign key constraints for VOLUNTEERS...
alter table VOLUNTEERS disable constraint SYS_C008300;
prompt Disabling foreign key constraints for VS_IN_SHIFTS...
alter table VS_IN_SHIFTS disable constraint SYS_C008304;
alter table VS_IN_SHIFTS disable constraint SYS_C008305;
prompt Loading ACTIVITES...
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (1, 'mend', 'delectus odio libero.  aliqua. ', to_date('23-09-2017', 'dd-mm-yyyy'), '3:51', '15:29');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (2, 'mend', 'ex est. ', to_date('22-01-2024', 'dd-mm-yyyy'), '3:19', '16:25');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (3, 'carry', 'qui. ', to_date('27-03-2019', 'dd-mm-yyyy'), '8:34', '12:52');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (4, 'revive', 'dolor. ', to_date('27-06-2017', 'dd-mm-yyyy'), '0:12', '15:3');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (5, 'mend', 'aliquip. ', to_date('11-06-2018', 'dd-mm-yyyy'), '7:19', '12:55');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (6, 'carry', 'molestiae hic sed. ', to_date('10-11-2028', 'dd-mm-yyyy'), '1:9', '21:56');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (7, 'carry', 'ea animi accusamus. ', to_date('15-06-2027', 'dd-mm-yyyy'), '6:18', '22:8');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (9, 'carry', 'aut non aute. ', to_date('20-10-2023', 'dd-mm-yyyy'), '8:53', '15:11');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (10, 'mend', 'occaecati quidem. ', to_date('20-11-2020', 'dd-mm-yyyy'), '0:52', '18:34');
insert into ACTIVITES (activity_id, activity_name, a_description, activity_date, a_start_time, a_end_time)
values (8, 'revive', 'accusamus cupidatat id. ', to_date('27-07-2029', 'dd-mm-yyyy'), '5:26', '16:16');
prompt 10 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1111, to_date('16-04-2022', 'dd-mm-yyyy'), '9:16', '18:57', '90 Swank Blvd', 'Raul Randal');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1112, to_date('07-08-2018', 'dd-mm-yyyy'), '5:4', '13:40', '717 Fierstein Road', 'Eric Haggard');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1113, to_date('23-11-2027', 'dd-mm-yyyy'), '2:22', '22:1', '23rd Street', 'Tyrone Plummer');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1114, to_date('14-09-2015', 'dd-mm-yyyy'), '3:46', '13:7', '10 Linda Street', 'Russell Durning');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1115, to_date('08-08-2023', 'dd-mm-yyyy'), '2:58', '12:15', '75 Downie Road', 'Rade Moffat');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1116, to_date('23-08-2017', 'dd-mm-yyyy'), '5:23', '12:16', '21st Street', 'Gilberto Gates');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1117, to_date('14-11-2015', 'dd-mm-yyyy'), '11:14', '14:0', '44 Stewart Street', 'Curt Idle');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1118, to_date('09-08-2020', 'dd-mm-yyyy'), '1:9', '18:49', '17 Bratt Road', 'Charlize Fender');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1119, to_date('15-06-2029', 'dd-mm-yyyy'), '11:45', '22:52', '12 Lewis Road', 'Rosanne Sandler');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1120, to_date('18-12-2027', 'dd-mm-yyyy'), '2:58', '17:5', '75 De Almeida Street', 'Ashley El-Saher');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1121, to_date('25-11-2029', 'dd-mm-yyyy'), '5:53', '12:23', '6 Spike Street', 'Rachid Sarsgaard');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1122, to_date('21-12-2019', 'dd-mm-yyyy'), '4:19', '14:26', '239 Gdansk Ave', 'Aida Pesci');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1123, to_date('22-12-2029', 'dd-mm-yyyy'), '11:40', '18:49', '83 Overstreet Street', 'Julianna Masur');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1124, to_date('18-08-2026', 'dd-mm-yyyy'), '1:8', '19:8', '28 Rod Road', 'Terrence Affleck');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1125, to_date('12-06-2023', 'dd-mm-yyyy'), '3:45', '20:10', '63 Kattan Road', 'Angela Moriarty');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1126, to_date('20-12-2020', 'dd-mm-yyyy'), '2:52', '16:21', '98 Studi Blvd', 'Jeroen Aykroyd');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1127, to_date('05-11-2016', 'dd-mm-yyyy'), '8:9', '12:59', '46 Sonny Road', 'Mandy Zeta-Jones');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1128, to_date('04-06-2022', 'dd-mm-yyyy'), '7:35', '22:54', '57 Oak Park Road', 'Vanessa Rockwell');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1129, to_date('03-03-2018', 'dd-mm-yyyy'), '11:0', '19:29', '73 Glenshaw Street', 'Sam Van Damme');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1130, to_date('16-04-2017', 'dd-mm-yyyy'), '9:24', '14:18', '47 Cherry Blvd', 'Rawlins Morton');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1131, to_date('24-02-2029', 'dd-mm-yyyy'), '7:21', '14:0', '20 Spall Road', 'Chris Posener');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1132, to_date('12-06-2020', 'dd-mm-yyyy'), '12:5', '18:27', '771 Overland park Ave', 'Lois Lithgow');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1133, to_date('20-01-2026', 'dd-mm-yyyy'), '6:9', '17:2', '36 Burlington Ave', 'Joaquin Evanswood');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1134, to_date('23-05-2022', 'dd-mm-yyyy'), '11:6', '18:38', '59 Maebashi Ave', 'Frances Freeman');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1135, to_date('22-06-2023', 'dd-mm-yyyy'), '9:40', '16:3', '90 Rupert Drive', 'Katie Rockwell');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1136, to_date('02-04-2023', 'dd-mm-yyyy'), '11:54', '18:45', '94 Condition Ave', 'Edgar Clayton');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1137, to_date('28-07-2020', 'dd-mm-yyyy'), '1:31', '15:18', '842 Cage', 'Clarence Rodgers');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1138, to_date('11-08-2030', 'dd-mm-yyyy'), '11:41', '21:11', '13rd Street', 'Clea Liotta');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1139, to_date('12-01-2028', 'dd-mm-yyyy'), '7:47', '16:20', '82 Mos Road', 'Robbie Osbourne');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1140, to_date('11-11-2021', 'dd-mm-yyyy'), '11:57', '23:2', '46 Turner', 'Sydney Langella');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1141, to_date('29-10-2025', 'dd-mm-yyyy'), '2:9', '23:50', '21 Oklahoma city Drive', 'Jaime Stevenson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1142, to_date('04-08-2026', 'dd-mm-yyyy'), '4:46', '15:49', '76 Shalhoub Road', 'Parker Coe');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1143, to_date('23-10-2019', 'dd-mm-yyyy'), '8:0', '14:24', '91st Street', 'Roscoe Orton');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1144, to_date('25-04-2019', 'dd-mm-yyyy'), '2:21', '21:38', '64 Kinney Ave', 'Jill Rankin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1145, to_date('01-07-2016', 'dd-mm-yyyy'), '3:3', '14:16', '41 Holderbank Ave', 'Denzel Kravitz');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1146, to_date('01-05-2024', 'dd-mm-yyyy'), '10:27', '23:35', '20 Tal Street', 'Liam Ryder');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1147, to_date('25-06-2019', 'dd-mm-yyyy'), '12:12', '21:49', '75 Lisa Blvd', 'Vickie Vincent');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1148, to_date('20-06-2021', 'dd-mm-yyyy'), '7:11', '20:2', '13 Stanley', 'Jaime Finney');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1149, to_date('01-07-2015', 'dd-mm-yyyy'), '6:30', '18:39', '31 El Masnou Road', 'Johnnie Uggams');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1150, to_date('09-12-2019', 'dd-mm-yyyy'), '10:48', '16:23', '72 Sandra Blvd', 'Brothers Elizabeth');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1151, to_date('21-01-2018', 'dd-mm-yyyy'), '10:13', '12:30', '141 Yavne Road', 'Holly Chaykin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1152, to_date('01-07-2017', 'dd-mm-yyyy'), '0:10', '13:16', '6 Chandler Street', 'Carrie Rowlands');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1153, to_date('21-04-2016', 'dd-mm-yyyy'), '4:46', '20:32', '7 Arjona Street', 'Mitchell Perry');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1154, to_date('28-12-2027', 'dd-mm-yyyy'), '11:43', '15:53', '97 Cesena Drive', 'Marie Bandy');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1155, to_date('03-01-2026', 'dd-mm-yyyy'), '11:55', '23:46', '95 Atkinson Road', 'Charlize Wiedlin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1156, to_date('30-11-2018', 'dd-mm-yyyy'), '6:48', '12:43', '114 Penn Road', 'Doug Kershaw');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1157, to_date('08-01-2023', 'dd-mm-yyyy'), '1:41', '16:44', '38 Orleans Road', 'Patty Todd');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1158, to_date('07-12-2030', 'dd-mm-yyyy'), '12:11', '19:26', '100 San Ramon Street', 'Eliza McKennitt');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1159, to_date('16-10-2029', 'dd-mm-yyyy'), '12:46', '16:52', '87 Ringwood Road', 'Teena Crimson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1160, to_date('31-01-2016', 'dd-mm-yyyy'), '9:13', '18:30', '3 Feuerstein', 'Adam Ferry');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1161, to_date('08-11-2020', 'dd-mm-yyyy'), '5:50', '21:6', '514 Crewson Ave', 'Dean Frost');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1162, to_date('29-04-2028', 'dd-mm-yyyy'), '12:10', '20:3', '1 Leachman Road', 'Aida Ranger');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1163, to_date('02-10-2019', 'dd-mm-yyyy'), '12:9', '18:47', '61st Street', 'Michael Wainwright');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1164, to_date('04-01-2018', 'dd-mm-yyyy'), '0:19', '13:47', '15 Shoreline Road', 'Dean Harrison');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1165, to_date('07-04-2023', 'dd-mm-yyyy'), '1:3', '13:47', '82nd Street', 'Jake Wariner');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1166, to_date('20-07-2023', 'dd-mm-yyyy'), '11:7', '14:21', '99 Alfie Street', 'Glen Winans');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1167, to_date('23-02-2030', 'dd-mm-yyyy'), '2:1', '12:8', '9 Shatner Street', 'Lara Rivers');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1168, to_date('09-12-2016', 'dd-mm-yyyy'), '2:21', '17:47', '64 Hackman Street', 'Gates Lapointe');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1169, to_date('16-10-2030', 'dd-mm-yyyy'), '9:36', '15:26', '30 Harris Drive', 'Barbara Hoffman');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1170, to_date('07-06-2017', 'dd-mm-yyyy'), '1:4', '12:45', '67 Kleinenberg Drive', 'Wayman Camp');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1171, to_date('24-12-2016', 'dd-mm-yyyy'), '10:31', '13:34', '679 Harrelson Street', 'Burt Forrest');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1172, to_date('10-12-2026', 'dd-mm-yyyy'), '2:11', '16:18', '74 Rick', 'Jann Nash');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1173, to_date('05-04-2024', 'dd-mm-yyyy'), '7:18', '16:57', '62 Herndon Blvd', 'Geraldine Mraz');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1174, to_date('26-12-2016', 'dd-mm-yyyy'), '8:0', '19:9', '40 Parish', 'Barry Crystal');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1175, to_date('15-11-2020', 'dd-mm-yyyy'), '4:39', '20:57', '54 Janssen Drive', 'Jennifer Vai');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1176, to_date('16-01-2019', 'dd-mm-yyyy'), '1:20', '22:0', '49 Dearborn', 'Stephen Gilley');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1177, to_date('23-03-2018', 'dd-mm-yyyy'), '9:50', '21:5', '44 Rowlands Drive', 'Ceili Askew');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1178, to_date('14-05-2016', 'dd-mm-yyyy'), '7:36', '21:59', '63rd Street', 'Leon Holbrook');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1179, to_date('02-07-2021', 'dd-mm-yyyy'), '1:39', '14:47', '185 Germantown Drive', 'Nik Beatty');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1180, to_date('07-09-2017', 'dd-mm-yyyy'), '10:47', '20:18', '16 Sparrows Point Road', 'Connie Whitaker');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1181, to_date('11-04-2019', 'dd-mm-yyyy'), '4:18', '15:55', '70 Colombes', 'Helen Kweller');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1182, to_date('20-04-2023', 'dd-mm-yyyy'), '11:52', '23:53', '36 Merillee Road', 'Sheryl Dushku');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1183, to_date('25-01-2028', 'dd-mm-yyyy'), '2:50', '15:19', '42 Sundsvall Road', 'Mike Sellers');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1184, to_date('07-04-2023', 'dd-mm-yyyy'), '12:41', '16:26', '74 Roundtree Blvd', 'Wes Redford');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1185, to_date('14-06-2015', 'dd-mm-yyyy'), '7:7', '22:51', '18 Ipswich Ave', 'Jessica Deschanel');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1186, to_date('17-06-2026', 'dd-mm-yyyy'), '1:47', '12:56', '1 Terence Drive', 'Louise Gleeson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1187, to_date('17-09-2025', 'dd-mm-yyyy'), '3:27', '23:19', '21st Street', 'Carol Charles');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1188, to_date('16-02-2019', 'dd-mm-yyyy'), '0:0', '16:38', '7 Bangalore Drive', 'Sydney Slater');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1189, to_date('17-07-2023', 'dd-mm-yyyy'), '0:42', '12:39', '98 Herndon Street', 'Mel Bullock');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1190, to_date('26-07-2020', 'dd-mm-yyyy'), '1:32', '17:23', '615 Barueri Road', 'Tia Nakai');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1191, to_date('04-08-2020', 'dd-mm-yyyy'), '6:40', '13:37', '67 Brookfield Street', 'Leslie Hutch');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1192, to_date('18-03-2024', 'dd-mm-yyyy'), '12:41', '15:27', '92 Liv Road', 'Orlando Emmett');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1193, to_date('12-03-2027', 'dd-mm-yyyy'), '11:7', '18:53', '23rd Street', 'Lou Magnuson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1194, to_date('01-04-2022', 'dd-mm-yyyy'), '10:20', '15:29', '39 Burke Road', 'Lisa Bradford');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1195, to_date('09-06-2015', 'dd-mm-yyyy'), '1:2', '17:8', '605 Dennis Drive', 'Demi Gatlin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1196, to_date('27-09-2025', 'dd-mm-yyyy'), '7:12', '16:1', '42nd Street', 'Teri Rauhofer');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1197, to_date('31-01-2023', 'dd-mm-yyyy'), '5:46', '15:29', '6 Ty Drive', 'Yolanda Renfro');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1198, to_date('12-09-2018', 'dd-mm-yyyy'), '8:12', '17:15', '35 Ankara Road', 'Shirley Irving');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1199, to_date('02-03-2015', 'dd-mm-yyyy'), '11:41', '13:42', '841 Keaton', 'Judd Dayne');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1200, to_date('25-08-2029', 'dd-mm-yyyy'), '4:50', '20:20', '17 Bean Street', 'Carla England');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1201, to_date('07-03-2017', 'dd-mm-yyyy'), '4:6', '15:6', '967 Hershey Street', 'Isaac Ripley');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1202, to_date('26-11-2025', 'dd-mm-yyyy'), '1:24', '21:50', '43 Amy Drive', 'Deborah Levy');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1203, to_date('23-10-2025', 'dd-mm-yyyy'), '8:10', '13:37', '21st Street', 'Frankie Sarandon');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1204, to_date('28-11-2030', 'dd-mm-yyyy'), '6:15', '15:58', '7 Sizemore Street', 'Nicky DiCaprio');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1205, to_date('31-10-2025', 'dd-mm-yyyy'), '10:51', '22:37', '27 Yaphet Street', 'Kirsten Kinney');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1206, to_date('11-04-2016', 'dd-mm-yyyy'), '8:58', '23:59', '34 Frank', 'Dick Presley');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1207, to_date('05-01-2017', 'dd-mm-yyyy'), '10:41', '17:5', '32 Robin Blvd', 'Charlton McPherson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1208, to_date('21-07-2016', 'dd-mm-yyyy'), '5:54', '22:21', '97 Cross Road', 'Eliza Summer');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1209, to_date('30-06-2016', 'dd-mm-yyyy'), '12:32', '14:32', '81 Valentin Drive', 'Frankie Keeslar');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1210, to_date('28-05-2022', 'dd-mm-yyyy'), '2:13', '20:51', '1 Bismarck Road', 'Sara McConaughey');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1211, to_date('28-05-2015', 'dd-mm-yyyy'), '4:42', '22:58', '50 Hersh Road', 'Bridgette Berenger');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1212, to_date('12-03-2016', 'dd-mm-yyyy'), '7:1', '21:34', '32 Chestnut Street', 'Will Evans');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1213, to_date('04-01-2022', 'dd-mm-yyyy'), '12:15', '17:32', '96 Merchant Road', 'Mary Yankovic');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1214, to_date('08-07-2026', 'dd-mm-yyyy'), '12:5', '12:45', '612 Whitaker Drive', 'Tom Metcalf');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1215, to_date('10-11-2023', 'dd-mm-yyyy'), '10:44', '15:29', '519 Roma Street', 'Gwyneth Hershey');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1216, to_date('13-10-2021', 'dd-mm-yyyy'), '6:5', '12:33', '263 Redding Street', 'Val Torres');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1217, to_date('03-09-2021', 'dd-mm-yyyy'), '0:58', '20:44', '90 Rawlins Street', 'Thin Griffith');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1218, to_date('14-02-2017', 'dd-mm-yyyy'), '6:37', '14:55', '670 George Street', 'Chi Hersh');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1219, to_date('05-02-2028', 'dd-mm-yyyy'), '6:57', '14:48', '89 Carol Street', 'Rob Flanery');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1220, to_date('01-04-2018', 'dd-mm-yyyy'), '7:50', '23:3', '2 Bandy Road', 'Frances Steenburgen');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1221, to_date('06-03-2015', 'dd-mm-yyyy'), '11:41', '16:26', '10 Glen Cove Drive', 'Eliza Martinez');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1222, to_date('10-09-2024', 'dd-mm-yyyy'), '1:51', '17:13', '879 Suzy Road', 'Swoosie Stills');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1223, to_date('22-11-2025', 'dd-mm-yyyy'), '7:48', '12:56', '73 Thomson Street', 'Jude Atlas');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1224, to_date('04-02-2030', 'dd-mm-yyyy'), '0:57', '22:51', '8 Lili Road', 'Drew Hawthorne');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1225, to_date('15-08-2029', 'dd-mm-yyyy'), '3:25', '21:30', '89 Debi Drive', 'Praga Saucedo');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1226, to_date('02-11-2020', 'dd-mm-yyyy'), '4:46', '18:41', '25 Rispoli', 'Clarence Janney');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1227, to_date('20-07-2016', 'dd-mm-yyyy'), '9:2', '19:7', '31 Gibson Road', 'Gordon Lennix');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1228, to_date('25-10-2030', 'dd-mm-yyyy'), '5:59', '15:5', '19 Luke Drive', 'Leelee Barry');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1229, to_date('05-02-2026', 'dd-mm-yyyy'), '6:10', '19:58', '2 Bernard Road', 'Janice Hunt');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1230, to_date('08-01-2017', 'dd-mm-yyyy'), '3:38', '13:9', '86 Birmensdorf', 'Paul Coltrane');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1231, to_date('02-07-2022', 'dd-mm-yyyy'), '9:3', '18:28', '60 Garland Ave', 'Albertina Weiss');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1232, to_date('30-07-2028', 'dd-mm-yyyy'), '9:53', '21:1', '95 San Jose Street', 'Ricardo Singletary');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1233, to_date('28-07-2016', 'dd-mm-yyyy'), '0:8', '17:54', '79 Stone Drive', 'Wendy Ford');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1234, to_date('11-09-2023', 'dd-mm-yyyy'), '0:51', '18:28', '99 Polley Road', 'Jeanne Dooley');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1235, to_date('10-01-2021', 'dd-mm-yyyy'), '8:35', '16:51', '11 Squier Road', 'Hilton Lauper');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1236, to_date('24-10-2030', 'dd-mm-yyyy'), '7:10', '12:51', '61 Popper Drive', 'Gates Hayek');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1237, to_date('12-02-2022', 'dd-mm-yyyy'), '7:9', '19:2', '65 Simpson Blvd', 'Barbara Napolitano');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1238, to_date('29-03-2021', 'dd-mm-yyyy'), '12:57', '19:0', '50 Hersh Street', 'Leslie Flanagan');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1239, to_date('10-04-2028', 'dd-mm-yyyy'), '6:17', '13:19', '91 Curtis Road', 'Sandra Ruffalo');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1240, to_date('15-08-2023', 'dd-mm-yyyy'), '5:8', '22:15', '1 Wilson Street', 'Art Bedelia');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1241, to_date('03-10-2021', 'dd-mm-yyyy'), '2:38', '13:27', '73rd Street', 'Mykelti Janssen');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1242, to_date('17-09-2023', 'dd-mm-yyyy'), '1:30', '21:28', '71 Keener Drive', 'Javon Palminteri');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1243, to_date('22-03-2016', 'dd-mm-yyyy'), '1:16', '19:31', '92nd Street', 'Aidan Dorff');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1244, to_date('07-09-2025', 'dd-mm-yyyy'), '4:0', '14:22', '91st Street', 'Nicholas Lopez');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1245, to_date('14-09-2029', 'dd-mm-yyyy'), '0:10', '22:47', '73 Rippy Street', 'Hope Heatherly');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1246, to_date('26-08-2020', 'dd-mm-yyyy'), '10:7', '20:51', '93 Bragg Road', 'Rhys Berenger');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1247, to_date('01-05-2029', 'dd-mm-yyyy'), '5:42', '23:15', '23rd Street', 'Juice Goodman');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1248, to_date('28-06-2024', 'dd-mm-yyyy'), '8:29', '17:17', '21st Street', 'Burton Tucci');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1249, to_date('21-11-2015', 'dd-mm-yyyy'), '12:55', '13:30', '44 Anne', 'Sammy McLean');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1250, to_date('11-03-2026', 'dd-mm-yyyy'), '2:34', '20:23', '93 Forest Park Road', 'Alicia Kravitz');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1251, to_date('18-05-2021', 'dd-mm-yyyy'), '7:18', '20:46', '43rd Street', 'Sandra Mars');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1252, to_date('11-09-2017', 'dd-mm-yyyy'), '0:47', '20:44', '69 Church Street', 'Janeane Chestnut');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1253, to_date('15-04-2021', 'dd-mm-yyyy'), '12:22', '15:16', '37 Sheen Road', 'Giancarlo Nugent');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1254, to_date('31-01-2021', 'dd-mm-yyyy'), '11:28', '23:6', '85 Wageningen Blvd', 'Judy Ball');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1255, to_date('18-10-2023', 'dd-mm-yyyy'), '11:58', '19:0', '92 Ottawa Blvd', 'Willem Guinness');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1256, to_date('14-09-2027', 'dd-mm-yyyy'), '1:49', '18:51', '915 Chubby Drive', 'Casey Reno');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1257, to_date('02-04-2017', 'dd-mm-yyyy'), '6:21', '22:6', '19 Beth Street', 'Pam Colon');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1258, to_date('13-09-2028', 'dd-mm-yyyy'), '5:2', '20:36', '496 Palin Street', 'Frankie Russo');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1259, to_date('11-08-2023', 'dd-mm-yyyy'), '8:36', '19:24', '678 Ponty Ave', 'Rachid Turturro');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1260, to_date('27-06-2026', 'dd-mm-yyyy'), '3:36', '15:37', '23rd Street', 'Melanie Kotto');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1261, to_date('04-12-2015', 'dd-mm-yyyy'), '0:54', '21:38', '41 Buddy Road', 'Jena Salonga');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1262, to_date('23-05-2029', 'dd-mm-yyyy'), '8:20', '18:44', '53 Vonda Street', 'Tea Vincent');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1263, to_date('12-05-2015', 'dd-mm-yyyy'), '2:24', '16:18', '21 Lapointe', 'Gavin Taha');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1264, to_date('25-10-2027', 'dd-mm-yyyy'), '8:25', '16:15', '178 Trevino Drive', 'Chet Blackwell');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1265, to_date('05-12-2026', 'dd-mm-yyyy'), '12:8', '14:32', '14 Graham Street', 'Forest Roth');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1266, to_date('28-02-2026', 'dd-mm-yyyy'), '7:36', '23:30', '49 Stallone Street', 'Lauren McGoohan');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1267, to_date('18-06-2024', 'dd-mm-yyyy'), '5:28', '12:30', '934 Cassidy Blvd', 'Davey Zane');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1268, to_date('02-06-2015', 'dd-mm-yyyy'), '3:19', '18:6', '83 Singapore Ave', 'Doug Dalton');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1269, to_date('26-03-2022', 'dd-mm-yyyy'), '6:50', '20:36', '598 Culkin Road', 'Olga Lloyd');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1270, to_date('10-05-2030', 'dd-mm-yyyy'), '10:6', '18:55', '43 Sutton', 'Leonardo Richardson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1271, to_date('24-09-2022', 'dd-mm-yyyy'), '4:58', '18:58', '13 Ferry Road', 'Danni McLachlan');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1272, to_date('25-06-2022', 'dd-mm-yyyy'), '0:17', '13:34', '71 Galecki Street', 'Saffron Derringer');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1273, to_date('23-02-2030', 'dd-mm-yyyy'), '12:17', '23:16', '73 Adkins Road', 'Omar Mould');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1274, to_date('02-04-2015', 'dd-mm-yyyy'), '0:18', '16:45', '56 Oakenfold', 'Fiona Kershaw');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1275, to_date('15-06-2023', 'dd-mm-yyyy'), '7:45', '15:31', '696 Robbins Ave', 'Cate Blanchett');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1276, to_date('25-10-2022', 'dd-mm-yyyy'), '10:51', '16:29', '55 Gino', 'Benjamin Krabbe');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1277, to_date('23-09-2027', 'dd-mm-yyyy'), '5:40', '16:51', '14 Holm Drive', 'Bryan Cassel');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1278, to_date('28-07-2025', 'dd-mm-yyyy'), '12:12', '12:30', '42 Fairuza Road', 'Kenny Tyson');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1279, to_date('04-12-2022', 'dd-mm-yyyy'), '10:19', '18:43', '28 Gugino Street', 'Maceo Marsden');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1280, to_date('21-07-2022', 'dd-mm-yyyy'), '8:55', '14:48', '321 Maceio Road', 'Eliza Sinatra');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1281, to_date('28-08-2017', 'dd-mm-yyyy'), '2:53', '22:56', '92 Nicky Drive', 'Shirley Hiatt');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1282, to_date('20-10-2024', 'dd-mm-yyyy'), '9:53', '15:46', '54 Burmester Drive', 'Cheech Baldwin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1283, to_date('20-08-2029', 'dd-mm-yyyy'), '3:15', '18:36', '72 Richmond Hill Road', 'Shawn Skarsgard');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1284, to_date('21-12-2021', 'dd-mm-yyyy'), '3:43', '13:45', '90 Mclean Road', 'Jared Pleasure');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1285, to_date('03-02-2021', 'dd-mm-yyyy'), '8:3', '19:53', '442 Hauer Street', 'Jodie Hornsby');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1286, to_date('16-07-2029', 'dd-mm-yyyy'), '2:24', '23:11', '69 Oak park Street', 'Sigourney Cervine');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1287, to_date('07-12-2024', 'dd-mm-yyyy'), '10:46', '13:46', '453 Willem Blvd', 'Courtney McGowan');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1288, to_date('12-08-2016', 'dd-mm-yyyy'), '6:28', '14:29', '73 Langella Drive', 'Ving Marx');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1289, to_date('05-04-2024', 'dd-mm-yyyy'), '7:47', '23:16', '229 Tilburg Road', 'Mary McFadden');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1290, to_date('26-01-2017', 'dd-mm-yyyy'), '7:20', '17:34', '83 Bronx Street', 'Tanya Perry');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1291, to_date('03-02-2030', 'dd-mm-yyyy'), '9:44', '12:53', '5 Feore Street', 'Charlize Austin');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1292, to_date('05-07-2029', 'dd-mm-yyyy'), '12:20', '18:0', '53 Bernex Drive', 'Jarvis Yankovic');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1293, to_date('29-07-2015', 'dd-mm-yyyy'), '7:31', '22:26', '78 O''Neal Street', 'Taye Gershon');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1294, to_date('26-12-2028', 'dd-mm-yyyy'), '2:40', '18:26', '549 Botti Road', 'Ving Gershon');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1295, to_date('24-12-2015', 'dd-mm-yyyy'), '7:37', '12:23', '143 Neuquen Road', 'Marty Burrows');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1296, to_date('17-06-2017', 'dd-mm-yyyy'), '3:53', '12:55', '78 Nicole Road', 'Domingo Gaines');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1297, to_date('29-03-2027', 'dd-mm-yyyy'), '8:51', '18:26', '32nd Street', 'Clay Pride');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1298, to_date('30-10-2020', 'dd-mm-yyyy'), '8:37', '15:27', '455 Sale Blvd', 'Joey Leigh');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1299, to_date('16-06-2019', 'dd-mm-yyyy'), '9:37', '18:39', '72 Maura Street', 'Andrew Hirsch');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1300, to_date('20-04-2018', 'dd-mm-yyyy'), '9:45', '23:57', '33 Manning Street', 'Micky Zahn');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1301, to_date('02-09-2030', 'dd-mm-yyyy'), '1:22', '23:38', '861 Irving Blvd', 'Harris Elliott');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1302, to_date('16-05-2017', 'dd-mm-yyyy'), '7:10', '21:58', '66 Moorer Street', 'Edgar Conley');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1303, to_date('26-12-2024', 'dd-mm-yyyy'), '7:52', '14:46', '175 Kinski Drive', 'Neve Gagnon');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1304, to_date('26-04-2018', 'dd-mm-yyyy'), '9:25', '14:5', '1 Vienna Road', 'Raymond Torres');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1305, to_date('15-03-2025', 'dd-mm-yyyy'), '2:40', '22:19', '26 Nepean Road', 'Randy Weisberg');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1306, to_date('28-08-2019', 'dd-mm-yyyy'), '12:2', '15:59', '63rd Street', 'Sydney Frakes');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1307, to_date('13-02-2027', 'dd-mm-yyyy'), '4:36', '12:22', '39 Zeta-Jones Street', 'Freddie Cherry');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1308, to_date('22-07-2018', 'dd-mm-yyyy'), '12:58', '18:15', '20 Singh Ave', 'Eliza Oldman');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1309, to_date('18-01-2019', 'dd-mm-yyyy'), '0:37', '20:34', '21 Aglukark Road', 'Merillee Spacey');
insert into SHIFTS (shift_id, shift_date, s_start_time, s_end_time, s_location, shift_leader)
values (1310, to_date('11-11-2030', 'dd-mm-yyyy'), '2:11', '13:57', '738 Sorvino Road', 'Shawn Peterson');
prompt 200 records loaded
prompt Loading EVENTS...
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2273, to_date('03-08-2018', 'dd-mm-yyyy'), '0:41', '94 Regensburg Street', 'ea facilis et sunt saepe quo id incididunt recusandae eiusmod. ', 1136);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2274, to_date('20-05-2023', 'dd-mm-yyyy'), '11:18', '92nd Street', 'laboris tenetur ad est sapiente debitis irure at cumque. ', 1232);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2275, to_date('12-03-2017', 'dd-mm-yyyy'), '5:5', '587 Holbrook', 'tenetur quas rerum voluptas elit in. ', 1154);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2276, to_date('08-03-2020', 'dd-mm-yyyy'), '2:39', '41 Sartain Drive', 'cillum et ea reiciendis et ullamco fuga. ', 1115);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2277, to_date('06-04-2025', 'dd-mm-yyyy'), '8:8', '474 Larry Road', 'iusto in. ', 1300);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2278, to_date('19-11-2015', 'dd-mm-yyyy'), '10:57', '40 Katt Drive', 'in eu. ', 1155);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2279, to_date('06-02-2027', 'dd-mm-yyyy'), '7:13', '29 Lucien Road', 'eu quo ut in molestias quidem molestias cillum quis qui. ', 1159);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2280, to_date('01-04-2028', 'dd-mm-yyyy'), '4:20', '28 Eileen', 'nisi dolorum iusto. ', 1265);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2281, to_date('18-09-2030', 'dd-mm-yyyy'), '7:26', '181 Coyote Blvd', 'esse facere labore itaque nisi. ', 1287);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2282, to_date('06-05-2021', 'dd-mm-yyyy'), '2:54', '33rd Street', 'aut est dolorum optio dolores aliqua voluptate recusandae perferendis voluptate.  officia. ', 1239);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2283, to_date('21-11-2030', 'dd-mm-yyyy'), '9:4', '46 Connelly Road', 'aut eiusmod quod. ', 1266);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2284, to_date('23-02-2025', 'dd-mm-yyyy'), '1:3', '937 Gwyneth Drive', 'voluptas similique voluptatum itaque et autem ut amet laborum. ', 1149);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2285, to_date('04-10-2025', 'dd-mm-yyyy'), '10:37', '76 Waco Road', 'repudiandae perferendis libero consectetur laborum similique eu fugiat ex consectetur. ', 1150);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2286, to_date('22-03-2028', 'dd-mm-yyyy'), '8:7', '40 Natacha Drive', 'irure sint et eu ut aliquip fugiat nisi non cupiditate.  in cupidatat rerum. ', 1128);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2287, to_date('18-12-2028', 'dd-mm-yyyy'), '2:24', '799 Hawthorne Street', 'elit deserunt qui excepturi quas ut vero cupidatat et. ', 1156);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2288, to_date('05-01-2022', 'dd-mm-yyyy'), '12:47', '20 Curtis Ave', 'in occaecati delectus praesentium excepteur mollitia est id ex. ', 1210);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2289, to_date('26-08-2015', 'dd-mm-yyyy'), '12:58', '89 Heatherly', 'cillum libero ad cupiditate delectus dolore distinctio omnis et amet.  et culpa dolorum vero est. ', 1293);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2290, to_date('15-07-2027', 'dd-mm-yyyy'), '10:28', '35 Humphrey Road', 'et est proident provident expedita est et officiis duis alias.  occaecati. ', 1242);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2291, to_date('20-07-2018', 'dd-mm-yyyy'), '4:41', '32nd Street', 'rerum mollitia et sint repudiandae pariatur id tenetur omnis id.  cupiditate. ', 1176);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2292, to_date('25-11-2023', 'dd-mm-yyyy'), '0:6', '33rd Street', 'ducimus ut exercitation distinctio officia et maiores ullamco tenetur excepturi.  est quos. ', 1170);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2293, to_date('27-09-2030', 'dd-mm-yyyy'), '4:1', '319 Sweeney Street', 'aliqua qui sint in et. ', 1238);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2294, to_date('20-03-2026', 'dd-mm-yyyy'), '8:22', '42 Roth Drive', 'magna nisi corrupti ut soluta quas aliquip id voluptate minim.  rerum ullamco. ', 1240);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2295, to_date('06-10-2029', 'dd-mm-yyyy'), '1:41', '51 Edwardstown Blvd', 'omnis sunt. ', 1133);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2296, to_date('08-07-2022', 'dd-mm-yyyy'), '11:57', '30 Rawls Road', 'voluptate blanditiis repudiandae reprehenderit occaecati. ', 1194);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2297, to_date('22-02-2021', 'dd-mm-yyyy'), '5:3', '73 Posey Drive', 'et in. ', 1276);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2299, to_date('20-03-2030', 'dd-mm-yyyy'), '10:34', '24 Winans Blvd', 'aut amet et amet perferendis cumque laboris aut non dolorum.  accusamus ad itaque et eos fugiat. ', 1168);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2300, to_date('15-08-2019', 'dd-mm-yyyy'), '6:20', '14 Bogguss Road', 'aute in et eos id maxime. ', 1174);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2301, to_date('15-03-2025', 'dd-mm-yyyy'), '3:45', '34 Krabbe Road', 'quibusdam similique magna nam occaecati in. ', 1220);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2302, to_date('28-04-2016', 'dd-mm-yyyy'), '10:22', '20 Tulsa Street', 'soluta rerum tenetur laborum voluptatum deleniti eligendi culpa. ', 1147);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2303, to_date('30-06-2018', 'dd-mm-yyyy'), '11:37', '40 Delroy Street', 'mollit saepe ut amet eiusmod ut. ', 1193);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2304, to_date('01-07-2022', 'dd-mm-yyyy'), '3:34', '85 Gilliam Road', 'rerum ullamco non odio quo incididunt omnis sint earum. ', 1168);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2305, to_date('04-03-2017', 'dd-mm-yyyy'), '2:2', '23 Hounslow Drive', 'dignissimos id autem repellendus temporibus duis irure eveniet repudiandae dolore.  cumque elit et. ', 1296);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2306, to_date('30-06-2027', 'dd-mm-yyyy'), '10:20', '24 Nina Road', 'cillum proident cillum omnis est delectus pariatur blanditiis. ', 1135);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2307, to_date('28-08-2026', 'dd-mm-yyyy'), '1:48', '53 Aiken Street', 'non quod et nihil voluptatibus maiores est est. ', 1136);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2308, to_date('29-10-2020', 'dd-mm-yyyy'), '8:57', '84 Feliciano Ave', 'dolor ut cumque non et tempor sint laboris vero officia.  nostrud voluptates in labore. ', 1307);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2309, to_date('20-03-2019', 'dd-mm-yyyy'), '10:47', '295 Carter Ave', 'tempore deleniti est aute odio do temporibus debitis hic sapiente. ', 1194);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2310, to_date('23-06-2015', 'dd-mm-yyyy'), '10:53', '59 Wilkinson Drive', 'pariatur ea iusto. ', 1206);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2111, to_date('14-06-2018', 'dd-mm-yyyy'), '9:58', '224 Dylan Road', 'id omnis et ipsum pariatur sit nihil sint duis. ', 1182);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2112, to_date('19-03-2016', 'dd-mm-yyyy'), '2:31', '80 Ryan Ave', 'voluptas sunt accusamus excepturi excepteur est temporibus repellendus alias deleniti.  eu amet. ', 1119);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2113, to_date('25-04-2025', 'dd-mm-yyyy'), '2:48', '27 Durham', 'sunt mollitia quidem est nostrud molestiae nisi quod. ', 1287);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2114, to_date('07-09-2029', 'dd-mm-yyyy'), '9:38', '13 McPherson Blvd', 'ut proident et. ', 1166);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2115, to_date('02-01-2027', 'dd-mm-yyyy'), '8:17', '35 Maidenhead Drive', 'et id facere harum maxime hic soluta. ', 1112);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2116, to_date('22-08-2021', 'dd-mm-yyyy'), '11:58', '757 Klugh Road', 'aut ut dolores hic a itaque quidem quo molestiae ea.  labore irure a et. ', 1253);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2117, to_date('29-06-2028', 'dd-mm-yyyy'), '6:31', '12nd Street', 'aut excepteur temporibus do impedit nostrud cillum nostrud alias. ', 1203);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2118, to_date('12-09-2016', 'dd-mm-yyyy'), '0:21', '24 Fuerth Blvd', 'nam quidem eiusmod recusandae a. ', 1147);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2119, to_date('30-12-2021', 'dd-mm-yyyy'), '6:14', '5 Jimmie Drive', 'distinctio occaecat dolor nam. ', 1118);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2120, to_date('09-11-2029', 'dd-mm-yyyy'), '9:18', '66 Keith Street', 'nobis sunt tempore et dolor consectetur. ', 1218);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2121, to_date('23-02-2015', 'dd-mm-yyyy'), '7:35', '11 Eder Street', 'similique cum tempor libero et esse mollitia distinctio itaque proident.  voluptate officia. ', 1112);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2122, to_date('10-07-2019', 'dd-mm-yyyy'), '2:49', '20 Karyo Road', 'exercitation quod elit enim eligendi. ', 1127);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2123, to_date('29-03-2022', 'dd-mm-yyyy'), '1:17', '66 Bolton Blvd', 'et hic ut proident distinctio consequat ut. ', 1267);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2124, to_date('08-11-2026', 'dd-mm-yyyy'), '1:18', '5 Emm Street', 'fugiat sit minus reprehenderit aut veniam qui consectetur. ', 1299);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2125, to_date('08-01-2024', 'dd-mm-yyyy'), '5:44', '27 Zellweger Street', 'dolores adipisicing aut placeat adipisicing ut. ', 1228);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2126, to_date('27-02-2018', 'dd-mm-yyyy'), '11:48', '105 Tea Blvd', 'provident sint delectus id incididunt vero nulla consequatur molestias ut. ', 1171);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2127, to_date('20-11-2027', 'dd-mm-yyyy'), '12:5', '360 Burr Ridge Ave', 'praesentium voluptates nulla vero. ', 1121);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2128, to_date('29-12-2026', 'dd-mm-yyyy'), '7:24', '62 Springfield Road', 'dolorum corrupti repellat repudiandae. ', 1255);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2129, to_date('15-01-2018', 'dd-mm-yyyy'), '4:47', '25 Stiller', 'placeat sint dolores laboris officia et expedita officia ducimus. ', 1281);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2130, to_date('13-06-2018', 'dd-mm-yyyy'), '4:37', '69 Rob Road', 'nulla est officia voluptatum occaecat sint officia possimus et aut. ', 1165);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2131, to_date('09-06-2017', 'dd-mm-yyyy'), '9:41', '58 Hiatt', 'cupidatat omnis molestias. ', 1310);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2132, to_date('07-12-2019', 'dd-mm-yyyy'), '6:41', '20 Dennis Street', 'lorem qui similique. ', 1145);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2133, to_date('13-08-2030', 'dd-mm-yyyy'), '4:29', '42 Lenexa Street', 'quibusdam et magna minus iusto est similique voluptatum nulla delectus.  voluptates. ', 1308);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2134, to_date('15-11-2022', 'dd-mm-yyyy'), '1:18', '92 Johnnie Street', 'veniam amet impedit fugiat qui rerum est aut culpa et. ', 1165);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2135, to_date('22-09-2020', 'dd-mm-yyyy'), '8:44', '66 Witt Road', 'et quas. ', 1264);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2136, to_date('06-01-2016', 'dd-mm-yyyy'), '8:20', '16 Streamwood', 'libero quidem et minus aute quis itaque adipisicing sunt duis. ', 1274);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2137, to_date('26-06-2017', 'dd-mm-yyyy'), '11:46', '37 Drive Street', 'dolore id soluta vero reiciendis maxime similique minus nobis dolor.  et alias repellat quod. ', 1229);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2138, to_date('19-11-2015', 'dd-mm-yyyy'), '2:16', '373 Ricky Road', 'laborum distinctio sint rerum autem nam similique autem harum aut.  nostrud cum. ', 1309);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2140, to_date('24-12-2026', 'dd-mm-yyyy'), '6:7', '786 Wills Road', 'a deserunt dolor quis minus. ', 1143);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2141, to_date('21-11-2026', 'dd-mm-yyyy'), '10:15', '33rd Street', 'et ut sint hic consequatur. ', 1153);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2142, to_date('17-09-2021', 'dd-mm-yyyy'), '6:37', '39 Brooke', 'ut harum cupidatat consectetur cumque. ', 1291);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2143, to_date('05-10-2025', 'dd-mm-yyyy'), '6:37', '4 Newcastle upon Tyne Street', 'sunt labore. ', 1146);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2144, to_date('20-12-2030', 'dd-mm-yyyy'), '9:36', '577 Jay Road', 'et et id eu cillum molestiae impedit proident perferendis sed.  maxime. ', 1222);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2145, to_date('12-04-2030', 'dd-mm-yyyy'), '3:30', '44 Gaithersburg', 'esse consequatur cum minus excepturi et eveniet veniam doloribus velit.  eu. ', 1309);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2146, to_date('23-10-2022', 'dd-mm-yyyy'), '3:53', '4 Steven Road', 'in blanditiis sint ipsum ea. ', 1215);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2147, to_date('20-12-2020', 'dd-mm-yyyy'), '8:44', '74 Rollins Road', 'exercitation quis aut atque aut reiciendis do mollitia qui maiores.  quas. ', 1261);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2148, to_date('11-04-2019', 'dd-mm-yyyy'), '9:39', '70 Sheena Street', 'saepe quas et quidem ad sit molestiae dolor excepteur perferendis.  labore. ', 1304);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2149, to_date('18-12-2023', 'dd-mm-yyyy'), '3:49', '91 Northam Drive', 'nostrud culpa aute cupidatat maiores odio dolores a rerum culpa.  ut proident corrupti. ', 1232);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2150, to_date('21-01-2029', 'dd-mm-yyyy'), '12:22', '20 Mito Drive', 'omnis quas excepturi praesentium id irure ex occaecati exercitation nulla.  et ut. ', 1131);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2151, to_date('06-10-2021', 'dd-mm-yyyy'), '4:57', '62 Jean-Luc Drive', 'at autem. ', 1299);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2152, to_date('24-10-2027', 'dd-mm-yyyy'), '10:19', '24 Horizon Drive', 'eu nostrud et dolore debitis officia aut est veniam. ', 1288);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2153, to_date('28-06-2025', 'dd-mm-yyyy'), '12:36', '70 Draper', 'consectetur fuga non placeat quos qui et aut in id. ', 1259);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2154, to_date('08-04-2020', 'dd-mm-yyyy'), '11:19', '9 Anderson Ave', 'rerum do blanditiis saepe odio et voluptate voluptate aut mollitia.  anim. ', 1186);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2155, to_date('23-08-2015', 'dd-mm-yyyy'), '1:0', '37 Wagner Blvd', 'repellat facilis amet vero nulla tempore duis est veniam nihil.  cum elit. ', 1260);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2156, to_date('06-05-2027', 'dd-mm-yyyy'), '10:20', '41 McElhone', 'ipsum saepe laborum rerum saepe officia dignissimos facere aliquip voluptatum. ', 1125);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2157, to_date('20-06-2030', 'dd-mm-yyyy'), '11:1', '75 Miki Blvd', 'distinctio sint minim tempore. ', 1179);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2158, to_date('02-01-2030', 'dd-mm-yyyy'), '1:53', '571 McGill Street', 'id deserunt eveniet eu nam hic fugiat cillum quis mollitia.  tempore qui voluptas dolorum et. ', 1129);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2159, to_date('28-04-2015', 'dd-mm-yyyy'), '6:42', '39 Karlsruhe Street', 'ut ut aute accusamus voluptates dolores laboris ipsum id id.  mollitia qui nostrud non dolor. ', 1301);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2160, to_date('08-08-2026', 'dd-mm-yyyy'), '8:54', '16 MacDonald', 'minus nihil enim rerum. ', 1282);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2161, to_date('28-05-2021', 'dd-mm-yyyy'), '2:33', '3 Frakes Drive', 'facere quis pariatur nostrud. ', 1306);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2162, to_date('30-08-2027', 'dd-mm-yyyy'), '2:29', '24 Schwarzenegger Street', 'id quibusdam labore aute omnis dolorum ullamco iusto quo aut. ', 1245);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2163, to_date('27-01-2020', 'dd-mm-yyyy'), '2:4', '93 Crystal Drive', 'mollitia eos. ', 1207);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2164, to_date('01-12-2028', 'dd-mm-yyyy'), '8:37', '19 Cambridge Road', 'occaecat labore eu occaecati reiciendis placeat. ', 1175);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2165, to_date('07-04-2025', 'dd-mm-yyyy'), '4:15', '22 Vertical', 'commodo et quis mollitia aut mollit repellendus aliqua et autem.  laboris ut. ', 1273);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2166, to_date('30-08-2023', 'dd-mm-yyyy'), '4:15', '7 Holliston Street', 'ipsum eligendi est aut et in laborum incididunt. ', 1152);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2167, to_date('05-08-2030', 'dd-mm-yyyy'), '2:53', '842 Rene Drive', 'voluptas aliquip doloribus in nihil nihil mollit laborum saepe quibusdam.  voluptatum. ', 1135);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2168, to_date('16-03-2016', 'dd-mm-yyyy'), '6:59', '68 Vienna Road', 'autem duis deleniti cupiditate aut minus. ', 1145);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2169, to_date('18-09-2024', 'dd-mm-yyyy'), '10:40', '312 Garza Blvd', 'ea animi ducimus asperiores hic adipisicing labore asperiores irure consectetur.  doloribus quo. ', 1231);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2170, to_date('09-06-2030', 'dd-mm-yyyy'), '5:44', '80 Borgnine Street', 'officia nulla atque quas repellendus blanditiis tempor debitis deserunt. ', 1202);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2171, to_date('13-01-2015', 'dd-mm-yyyy'), '5:46', '28 Marburg Drive', 'officia elit voluptatum deserunt eos libero sint id omnis et.  eu placeat. ', 1136);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2172, to_date('19-11-2029', 'dd-mm-yyyy'), '12:42', '45 Szazhalombatta Drive', 'est quas qui. ', 1256);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2173, to_date('13-07-2027', 'dd-mm-yyyy'), '5:17', '54 Emmerich Drive', 'possimus ut eiusmod ex eiusmod qui et soluta enim asperiores.  et aut. ', 1161);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2174, to_date('05-11-2016', 'dd-mm-yyyy'), '4:39', '67 Levy Street', 'quis dolor eos voluptatibus lorem. ', 1302);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2175, to_date('03-11-2021', 'dd-mm-yyyy'), '7:25', '90 Thצrishaus Road', 'sapiente nulla exercitation non est voluptate dolores rerum. ', 1113);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2176, to_date('11-06-2029', 'dd-mm-yyyy'), '8:35', '659 Yamagata Ave', 'ut ut molestiae est sunt impedit quod. ', 1245);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2178, to_date('29-05-2015', 'dd-mm-yyyy'), '6:44', '35 Cornell Road', 'lorem et non id amet facere cupiditate quo nam corrupti.  maxime ad. ', 1153);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2179, to_date('24-07-2021', 'dd-mm-yyyy'), '9:13', '58 Butler Road', 'sint laborum animi doloribus molestias corrupti reprehenderit commodo ut rerum. ', 1162);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2180, to_date('03-05-2025', 'dd-mm-yyyy'), '2:48', '86 Leslie Ave', 'non corrupti cumque fugiat eu omnis animi ut sit. ', 1298);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2181, to_date('31-08-2019', 'dd-mm-yyyy'), '2:50', '82nd Street', 'ut repellendus voluptate deserunt pariatur ullamco mollitia quos animi distinctio.  optio. ', 1115);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2183, to_date('06-01-2028', 'dd-mm-yyyy'), '11:54', '7 Oshkosh Drive', 'molestiae saepe. ', 1202);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2184, to_date('29-08-2020', 'dd-mm-yyyy'), '0:2', '11 Schwarzenegger Street', 'quos do deserunt nulla sit et omnis eligendi recusandae. ', 1248);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2185, to_date('22-03-2023', 'dd-mm-yyyy'), '8:33', '37 Aidan Road', 'qui nobis distinctio quos amet mollit et nisi repudiandae molestiae. ', 1137);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2187, to_date('07-05-2019', 'dd-mm-yyyy'), '5:4', '74 Rain Drive', 'eu. ', 1246);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2188, to_date('24-06-2019', 'dd-mm-yyyy'), '12:52', '49 Mitchell Street', 'sint veniam cupiditate voluptas lorem eveniet culpa animi. ', 1296);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2189, to_date('18-10-2017', 'dd-mm-yyyy'), '5:26', '218 Anyang-si Ave', 'dolore a molestiae eligendi consequat rerum. ', 1183);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2190, to_date('06-07-2019', 'dd-mm-yyyy'), '11:38', '87 Whoopi Street', 'et rerum mollit provident eligendi aut iusto magna id magna.  molestias non proident et. ', 1161);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2191, to_date('08-10-2017', 'dd-mm-yyyy'), '1:12', '60 Vincent', 'id eligendi debitis. ', 1190);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2192, to_date('24-03-2024', 'dd-mm-yyyy'), '0:14', '25 Chinlund Drive', 'et officia similique ut voluptatibus hic qui excepturi eligendi. ', 1165);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2193, to_date('23-11-2019', 'dd-mm-yyyy'), '12:7', '42 Louise Road', 'sed molestiae dolor ut aut aut do occaecati aute ut.  in et. ', 1225);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2194, to_date('05-12-2023', 'dd-mm-yyyy'), '5:45', '278 Melrose park Drive', 'necessitatibus asperiores quod. ', 1230);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2195, to_date('05-04-2015', 'dd-mm-yyyy'), '12:12', '17 Jonny Street', 'labore laborum voluptates aliquip facilis animi possimus quos nobis dignissimos.  dolorum. ', 1308);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2196, to_date('03-06-2021', 'dd-mm-yyyy'), '12:54', '75 Swannanoa Road', 'aut necessitatibus ex praesentium. ', 1258);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2197, to_date('09-02-2028', 'dd-mm-yyyy'), '6:52', '26 Hall Street', 'sint facilis culpa et debitis. ', 1238);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2198, to_date('08-04-2028', 'dd-mm-yyyy'), '10:48', '1 Juazeiro Road', 'et impedit hic animi excepturi id et tempore libero earum.  voluptate eu quos. ', 1112);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2199, to_date('14-09-2015', 'dd-mm-yyyy'), '9:28', '61st Street', 'ex id expedita cillum. ', 1141);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2200, to_date('08-04-2024', 'dd-mm-yyyy'), '12:4', '80 Geneve Drive', 'ut dolore quidem hic molestiae sint do expedita quo dolor. ', 1227);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2201, to_date('18-08-2020', 'dd-mm-yyyy'), '5:50', '65 Drive Drive', 'omnis corrupti voluptatibus minus excepteur consectetur. ', 1281);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2202, to_date('04-07-2021', 'dd-mm-yyyy'), '11:11', '100 Arthur Road', 'corrupti. ', 1197);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2203, to_date('01-12-2027', 'dd-mm-yyyy'), '6:43', '96 Bogguss Street', 'a aliquip. ', 1220);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2204, to_date('27-06-2025', 'dd-mm-yyyy'), '2:45', '32 Eindhoven Drive', 'mollitia dolor. ', 1267);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2205, to_date('31-12-2021', 'dd-mm-yyyy'), '0:37', '2 McCain Street', 'blanditiis. ', 1256);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2206, to_date('25-04-2015', 'dd-mm-yyyy'), '1:29', '183 Rodriguez Road', 'dolor dolores proident omnis tenetur aliqua dolor in. ', 1227);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2207, to_date('08-05-2021', 'dd-mm-yyyy'), '8:44', '618 Voight Road', 'voluptatibus dolore culpa lorem laborum dolorum. ', 1193);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2208, to_date('03-08-2029', 'dd-mm-yyyy'), '2:4', '87 Chambery', 'rerum cupidatat autem sint enim tenetur quod hic et duis.  cupidatat repudiandae assumenda. ', 1155);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2209, to_date('19-01-2019', 'dd-mm-yyyy'), '0:22', '56 Utsunomiya Blvd', 'officia in omnis ea eu amet velit placeat consectetur quod.  repellendus non elit. ', 1113);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2210, to_date('03-11-2019', 'dd-mm-yyyy'), '10:6', '48 Balk Road', 'aliqua repellendus duis iusto duis expedita dolor aliquip esse officia.  similique. ', 1166);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2211, to_date('13-01-2017', 'dd-mm-yyyy'), '0:14', '57 Toledo Street', 'eos irure fugiat irure eos maiores omnis voluptas voluptates nostrud. ', 1150);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2212, to_date('27-09-2025', 'dd-mm-yyyy'), '6:28', '72 Hilary Ave', 'et voluptate mollit voluptates tempore accusamus pariatur et. ', 1242);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2213, to_date('29-08-2018', 'dd-mm-yyyy'), '5:55', '63rd Street', 'proident magna sint. ', 1207);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2214, to_date('16-08-2030', 'dd-mm-yyyy'), '0:5', '67 Rhea Road', 'eu ex officia ut laborum aut minim. ', 1222);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2215, to_date('02-09-2026', 'dd-mm-yyyy'), '4:44', '99 Jude Drive', 'commodo ut dolor laborum sint eu quas quod nobis repudiandae.  dolorum ad sit et cupidatat amet. ', 1242);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2216, to_date('17-12-2017', 'dd-mm-yyyy'), '4:41', '59 Lili Street', 'id ipsum minus placeat nam. ', 1257);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2217, to_date('22-12-2023', 'dd-mm-yyyy'), '3:7', '300 Yokohama Road', 'nulla cum ad vero voluptates excepteur quis cillum ea cum.  nihil eos rerum. ', 1200);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2218, to_date('23-04-2023', 'dd-mm-yyyy'), '3:2', '49 Crystal Ave', 'et et et mollitia distinctio. ', 1113);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2219, to_date('14-11-2020', 'dd-mm-yyyy'), '8:51', '12nd Street', 'voluptates non quo et perferendis et tenetur. ', 1301);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2220, to_date('02-05-2022', 'dd-mm-yyyy'), '6:57', '17 Redford Road', 'dolores qui excepteur atque qui ut. ', 1125);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2221, to_date('03-08-2017', 'dd-mm-yyyy'), '5:0', '619 Thompson Street', 'distinctio animi id laboris. ', 1252);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2222, to_date('18-09-2017', 'dd-mm-yyyy'), '5:30', '14 Colin Young Ave', 'sunt ut quas. ', 1225);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2223, to_date('18-07-2028', 'dd-mm-yyyy'), '9:4', '2 Witherspoon Drive', 'fuga voluptates reiciendis possimus et. ', 1244);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2224, to_date('22-12-2016', 'dd-mm-yyyy'), '11:27', '50 Stowe Drive', 'excepteur est labore. ', 1251);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2225, to_date('09-05-2029', 'dd-mm-yyyy'), '5:42', '54 Vannelli Road', 'accusamus sed rerum animi corrupti cupiditate ex exercitation asperiores ducimus.  cum. ', 1286);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2226, to_date('18-06-2028', 'dd-mm-yyyy'), '1:41', '9 Lupe', 'tempore proident rerum sunt earum aut blanditiis ex amet. ', 1233);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2227, to_date('15-01-2024', 'dd-mm-yyyy'), '6:29', '351 Statham Road', 'tempore adipisicing perferendis blanditiis voluptates pariatur nam duis et excepturi. ', 1213);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2229, to_date('13-06-2018', 'dd-mm-yyyy'), '5:25', '42 Norderstedt Road', 'mollitia perferendis pariatur et. ', 1309);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2230, to_date('23-10-2025', 'dd-mm-yyyy'), '12:28', '194 Kingston Street', 'est sint sapiente et proident ut. ', 1177);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2231, to_date('01-11-2027', 'dd-mm-yyyy'), '6:42', '4 Fort gordon Road', 'rerum. ', 1259);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2232, to_date('06-08-2016', 'dd-mm-yyyy'), '3:27', '58 Hunter Road', 'sint nihil culpa et odio praesentium voluptas ducimus est dolor. ', 1258);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2233, to_date('03-03-2027', 'dd-mm-yyyy'), '9:7', '76 Osbourne Drive', 'praesentium ullamco repudiandae optio rerum voluptate et similique autem in.  nisi dolor officia. ', 1172);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2234, to_date('16-05-2023', 'dd-mm-yyyy'), '10:24', '87 Pecs Street', 'debitis incididunt maiores a sed cupiditate. ', 1131);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2236, to_date('26-07-2028', 'dd-mm-yyyy'), '5:58', '81st Street', 'ut saepe labore ut. ', 1238);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2237, to_date('30-05-2023', 'dd-mm-yyyy'), '2:24', '42 Finn Drive', 'excepteur dolor amet minus excepteur eveniet quibusdam animi. ', 1231);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2238, to_date('07-12-2017', 'dd-mm-yyyy'), '5:4', '658 Burke Street', 'autem rerum et laborum. ', 1293);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2239, to_date('17-11-2026', 'dd-mm-yyyy'), '8:34', '60 Dooley Drive', 'autem. ', 1304);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2240, to_date('07-06-2018', 'dd-mm-yyyy'), '2:21', '459 Palmieri Ave', 'ipsum eligendi aut voluptatibus fuga et impedit mollitia non consequat.  voluptate dolor et. ', 1212);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2241, to_date('19-01-2023', 'dd-mm-yyyy'), '9:1', '53 LuPone Road', 'facilis. ', 1177);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2242, to_date('26-08-2017', 'dd-mm-yyyy'), '1:31', '87 Milwaukee Ave', 'nisi. ', 1202);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2243, to_date('25-10-2025', 'dd-mm-yyyy'), '10:21', '330 Carrere Drive', 'in pariatur et vero eligendi in ut labore sint et. ', 1115);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2244, to_date('14-11-2016', 'dd-mm-yyyy'), '7:40', '93 Fogerty Street', 'id id atque velit non est impedit ipsum rerum do.  eiusmod. ', 1268);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2245, to_date('08-05-2027', 'dd-mm-yyyy'), '7:13', '497 Taoyuan Ave', 'officia dolor. ', 1269);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2246, to_date('10-01-2027', 'dd-mm-yyyy'), '3:22', '387 Hazel Street', 'do in in. ', 1307);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2247, to_date('18-03-2022', 'dd-mm-yyyy'), '10:42', '373 Kieran Drive', 'tempor aliqua sed exercitation. ', 1286);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2248, to_date('30-09-2024', 'dd-mm-yyyy'), '12:33', '42nd Street', 'accusamus sunt et sint aut odio quibusdam aut nobis provident. ', 1221);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2249, to_date('29-09-2027', 'dd-mm-yyyy'), '0:37', '62nd Street', 'irure. ', 1216);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2250, to_date('24-10-2016', 'dd-mm-yyyy'), '3:28', '11st Street', 'maxime. ', 1145);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2251, to_date('03-03-2022', 'dd-mm-yyyy'), '6:28', '11 Ward Blvd', 'est enim optio aute nisi consectetur ducimus voluptates. ', 1253);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2252, to_date('15-08-2028', 'dd-mm-yyyy'), '9:30', '52nd Street', 'cillum. ', 1235);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2253, to_date('11-11-2022', 'dd-mm-yyyy'), '8:39', '75 Satriani Drive', 'culpa accusamus qui incididunt praesentium in cumque maxime laborum maiores. ', 1237);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2254, to_date('02-08-2027', 'dd-mm-yyyy'), '7:11', '49 Myers Road', 'at excepturi rerum cillum excepteur deserunt deleniti alias et hic.  libero dolore sit a. ', 1243);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2255, to_date('30-12-2025', 'dd-mm-yyyy'), '1:33', '22 Trick Road', 'velit et nobis repellendus eiusmod id officia dolor temporibus expedita.  optio. ', 1281);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2256, to_date('07-04-2029', 'dd-mm-yyyy'), '6:16', '97 Jeffreys Drive', 'in aut animi cillum. ', 1157);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2257, to_date('20-08-2026', 'dd-mm-yyyy'), '1:49', '19 Taryn Street', 'corrupti debitis quo animi aut optio omnis sint quod mollitia.  quas lorem cillum minim quod. ', 1150);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2258, to_date('06-01-2028', 'dd-mm-yyyy'), '9:48', '8 Brasםlia', 'molestiae quod dolorum iusto dolores ipsum occaecati. ', 1250);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2259, to_date('26-06-2027', 'dd-mm-yyyy'), '7:28', '74 Fort Collins Street', 'aliquip. ', 1131);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2260, to_date('30-05-2024', 'dd-mm-yyyy'), '7:18', '92 Eder Road', 'irure deserunt in odio eos delectus et quidem itaque excepturi.  alias. ', 1261);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2261, to_date('16-05-2028', 'dd-mm-yyyy'), '9:36', '79 Austin Blvd', 'recusandae ut eu ut nam. ', 1130);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2262, to_date('26-08-2020', 'dd-mm-yyyy'), '6:18', '34 Duchovny', 'dolor necessitatibus est repellendus libero tempor magna. ', 1291);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2263, to_date('11-06-2015', 'dd-mm-yyyy'), '8:47', '717 Biel Road', 'optio id temporibus reiciendis quis eveniet consequat aute labore. ', 1299);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2264, to_date('04-12-2028', 'dd-mm-yyyy'), '2:29', '49 Olympia Blvd', 'occaecat anim eu ex. ', 1184);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2265, to_date('18-09-2028', 'dd-mm-yyyy'), '7:6', '929 Udo Drive', 'fuga veniam laborum et cupiditate eu atque et et est.  saepe commodo aute eu dignissimos aut. ', 1290);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2266, to_date('10-11-2019', 'dd-mm-yyyy'), '7:31', '885 McFadden Road', 'consectetur corrupti aliquip omnis. ', 1150);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2267, to_date('30-06-2023', 'dd-mm-yyyy'), '2:57', '53rd Street', 'atque id id sint dolore possimus. ', 1182);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2268, to_date('02-12-2016', 'dd-mm-yyyy'), '10:28', '995 Brown Ave', 'facere quas sed alias et sit. ', 1273);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2269, to_date('30-12-2015', 'dd-mm-yyyy'), '10:14', '81 McGregor Blvd', 'laboris harum quos dolor sunt duis sunt saepe. ', 1179);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2270, to_date('10-03-2030', 'dd-mm-yyyy'), '10:37', '99 Hirsch', 'harum et ducimus qui quos dolor temporibus voluptatibus eu excepteur. ', 1119);
insert into EVENTS (event_id, event_date, event_time, e_location, e_description, shift_id)
values (2271, to_date('10-06-2022', 'dd-mm-yyyy'), '3:54', '83 Scott Road', 'facere deleniti in et possimus. ', 1144);
prompt 192 records loaded
prompt Loading ACTS_IN_EVENTS...
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2113);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2114);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2136);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2138);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2150);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2152);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2163);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2170);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2195);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2201);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2202);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2236);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2259);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (1, 2294);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2119);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2121);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2150);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2171);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2178);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2189);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2194);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2206);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2211);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2253);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2260);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2271);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2279);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2282);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2285);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2288);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2302);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (2, 2310);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2118);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2130);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2151);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2200);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2225);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2252);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (3, 2275);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2112);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2144);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2147);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2152);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2176);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2223);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2232);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2262);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2277);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (4, 2309);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2118);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2141);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2153);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2171);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2184);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2193);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2230);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2243);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2249);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2263);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2270);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2277);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (5, 2284);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2128);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2163);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2171);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2237);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2242);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2243);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (6, 2281);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2114);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2115);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2131);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2181);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2183);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2205);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2231);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2241);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2252);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2263);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2265);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2282);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (7, 2286);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2126);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2138);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2140);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2148);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2161);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2196);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2239);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2248);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (8, 2293);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2113);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2183);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2194);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2207);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2233);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2245);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2246);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (9, 2257);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2159);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2179);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2181);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2202);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2210);
insert into ACTS_IN_EVENTS (activity_id, event_id)
values (10, 2237);
prompt 105 records loaded
prompt Loading REPORTS...
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2303, to_date('24-12-2025', 'dd-mm-yyyy'), 'word', 'autem commodo provident. ', 2306);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2304, to_date('26-05-2020', 'dd-mm-yyyy'), 'word', 'nobis hic eiusmod. ', 2117);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2306, to_date('29-11-2018', 'dd-mm-yyyy'), 'pdf', 'deserunt. ', 2123);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2307, to_date('16-04-2023', 'dd-mm-yyyy'), 'word', 'odio in provident. ', 2302);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2309, to_date('01-01-2017', 'dd-mm-yyyy'), 'word', 'sit et in rerum anim iusto. ', 2143);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2312, to_date('09-02-2016', 'dd-mm-yyyy'), 'excel', 'necessitatibus ea. ', 2156);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2313, to_date('14-08-2019', 'dd-mm-yyyy'), 'word', 'hic velit dolor id. ', 2255);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2300, to_date('12-06-2024', 'dd-mm-yyyy'), 'pdf', 'officia excepteur saepe et. ', 2215);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2301, to_date('11-07-2021', 'dd-mm-yyyy'), 'pdf', 'ullamco quas sit. ', 2256);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2302, to_date('02-06-2029', 'dd-mm-yyyy'), 'pdf', 'excepteur ea est. ', 2242);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2308, to_date('11-07-2030', 'dd-mm-yyyy'), 'excel', 'irure. ', 2171);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2310, to_date('01-02-2015', 'dd-mm-yyyy'), 'word', 'hic nostrud. ', 2112);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2314, to_date('12-01-2021', 'dd-mm-yyyy'), 'excel', 'deserunt proident. ', 2148);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2315, to_date('11-02-2023', 'dd-mm-yyyy'), 'excel', 'id dolores. ', 2264);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2316, to_date('15-12-2024', 'dd-mm-yyyy'), 'excel', 'quas voluptas quos. ', 2120);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2317, to_date('21-04-2028', 'dd-mm-yyyy'), 'word', 'do. ', 2116);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2319, to_date('29-10-2025', 'dd-mm-yyyy'), 'pdf', 'a culpa libero aut. ', 2193);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2323, to_date('04-08-2027', 'dd-mm-yyyy'), 'excel', 'sunt cillum veniam est. ', 2294);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2324, to_date('28-04-2016', 'dd-mm-yyyy'), 'word', 'eos. ', 2304);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2326, to_date('12-12-2020', 'dd-mm-yyyy'), 'excel', 'qui proident. ', 2113);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2327, to_date('13-01-2019', 'dd-mm-yyyy'), 'pdf', 'lorem. ', 2147);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2328, to_date('24-05-2015', 'dd-mm-yyyy'), 'excel', 'eiusmod est ex. ', 2163);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2329, to_date('22-10-2026', 'dd-mm-yyyy'), 'excel', 'occaecati. ', 2159);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2330, to_date('05-05-2028', 'dd-mm-yyyy'), 'excel', 'eiusmod et. ', 2150);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2331, to_date('28-01-2021', 'dd-mm-yyyy'), 'word', 'anim ipsum est. ', 2308);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2332, to_date('30-10-2028', 'dd-mm-yyyy'), 'word', 'nihil. ', 2232);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2333, to_date('19-01-2029', 'dd-mm-yyyy'), 'excel', 'vero eligendi libero. ', 2262);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2334, to_date('25-04-2018', 'dd-mm-yyyy'), 'excel', 'id quis est consectetur. ', 2266);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2335, to_date('05-01-2022', 'dd-mm-yyyy'), 'excel', 'dolorum hic aut cum. ', 2169);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2337, to_date('28-11-2016', 'dd-mm-yyyy'), 'word', 'officiis dolor. ', 2115);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2339, to_date('12-04-2021', 'dd-mm-yyyy'), 'pdf', 'est culpa et. ', 2290);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2340, to_date('13-06-2028', 'dd-mm-yyyy'), 'pdf', 'amet proident. ', 2148);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2341, to_date('26-12-2023', 'dd-mm-yyyy'), 'excel', 'repellat do sunt. ', 2210);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2342, to_date('02-10-2020', 'dd-mm-yyyy'), 'pdf', 'et excepteur. ', 2173);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2343, to_date('04-06-2027', 'dd-mm-yyyy'), 'pdf', 'aliquip et. ', 2137);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2345, to_date('20-12-2020', 'dd-mm-yyyy'), 'pdf', 'id eos. ', 2138);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2346, to_date('18-09-2029', 'dd-mm-yyyy'), 'excel', 'ut tempor. ', 2261);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2348, to_date('01-01-2024', 'dd-mm-yyyy'), 'excel', 'molestiae molestiae rerum. ', 2165);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2349, to_date('30-09-2019', 'dd-mm-yyyy'), 'pdf', 'irure eu. ', 2270);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2350, to_date('26-04-2019', 'dd-mm-yyyy'), 'pdf', 'animi et. ', 2150);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2351, to_date('29-11-2024', 'dd-mm-yyyy'), 'word', 'provident est cupiditate. ', 2155);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2352, to_date('30-06-2028', 'dd-mm-yyyy'), 'word', 'et. ', 2241);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2353, to_date('12-01-2023', 'dd-mm-yyyy'), 'word', 'saepe pariatur est. ', 2223);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2354, to_date('19-09-2015', 'dd-mm-yyyy'), 'pdf', 'sint sunt. ', 2291);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2355, to_date('04-08-2017', 'dd-mm-yyyy'), 'word', 'ad. ', 2180);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2359, to_date('10-06-2017', 'dd-mm-yyyy'), 'word', 'excepturi rerum aut. ', 2196);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2360, to_date('29-07-2021', 'dd-mm-yyyy'), 'pdf', 'saepe atque. ', 2213);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2361, to_date('12-12-2018', 'dd-mm-yyyy'), 'word', 'dolores consectetur minim ex. ', 2252);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2362, to_date('12-10-2015', 'dd-mm-yyyy'), 'excel', 'magna eiusmod autem est. ', 2133);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2363, to_date('16-09-2015', 'dd-mm-yyyy'), 'pdf', 'nam laborum. ', 2113);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2364, to_date('12-02-2020', 'dd-mm-yyyy'), 'word', 'recusandae autem omnis minim. ', 2278);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2365, to_date('03-03-2024', 'dd-mm-yyyy'), 'pdf', 'elit officia cum sint. ', 2277);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2366, to_date('07-03-2029', 'dd-mm-yyyy'), 'excel', 'delectus et ea. ', 2149);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2367, to_date('27-01-2024', 'dd-mm-yyyy'), 'word', 'dignissimos quas. ', 2205);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2368, to_date('04-11-2021', 'dd-mm-yyyy'), 'word', 'lorem debitis. ', 2188);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2369, to_date('20-04-2024', 'dd-mm-yyyy'), 'excel', 'duis sed fugiat est. ', 2130);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2370, to_date('29-11-2016', 'dd-mm-yyyy'), 'excel', 'repellat dolore nihil sit. ', 2167);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2371, to_date('23-08-2015', 'dd-mm-yyyy'), 'word', 'molestiae. ', 2268);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2372, to_date('02-01-2019', 'dd-mm-yyyy'), 'word', 'quod. ', 2229);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2373, to_date('10-01-2015', 'dd-mm-yyyy'), 'word', 'officiis repellat. ', 2296);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2374, to_date('12-08-2025', 'dd-mm-yyyy'), 'excel', 'culpa libero. ', 2262);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2375, to_date('02-01-2015', 'dd-mm-yyyy'), 'word', 'adipisicing. ', 2192);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2376, to_date('04-06-2017', 'dd-mm-yyyy'), 'word', 'et praesentium id. ', 2300);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2377, to_date('26-04-2025', 'dd-mm-yyyy'), 'excel', 'aliqua omnis. ', 2187);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2378, to_date('03-01-2016', 'dd-mm-yyyy'), 'excel', 'optio. ', 2308);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2380, to_date('16-03-2027', 'dd-mm-yyyy'), 'word', 'corrupti dolore et. ', 2114);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2381, to_date('29-07-2030', 'dd-mm-yyyy'), 'word', 'perferendis dolor. ', 2189);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2382, to_date('25-12-2019', 'dd-mm-yyyy'), 'excel', 'impedit occaecati tenetur. ', 2111);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2383, to_date('11-05-2015', 'dd-mm-yyyy'), 'pdf', 'in cum sunt adipisicing. ', 2121);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2384, to_date('26-07-2018', 'dd-mm-yyyy'), 'pdf', 'eos consequat proident sint. ', 2220);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2385, to_date('04-07-2016', 'dd-mm-yyyy'), 'word', 'culpa et. ', 2226);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2386, to_date('24-04-2026', 'dd-mm-yyyy'), 'word', 'itaque expedita tenetur. ', 2285);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2387, to_date('07-11-2027', 'dd-mm-yyyy'), 'pdf', 'ut labore. ', 2219);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2388, to_date('30-09-2027', 'dd-mm-yyyy'), 'word', 'minus rerum et animi et. ', 2236);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2390, to_date('05-03-2021', 'dd-mm-yyyy'), 'pdf', 'aliqua iusto iusto et. ', 2208);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2391, to_date('19-03-2021', 'dd-mm-yyyy'), 'word', 'vero. ', 2295);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2393, to_date('17-08-2019', 'dd-mm-yyyy'), 'excel', 'repellendus. ', 2178);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2395, to_date('07-10-2019', 'dd-mm-yyyy'), 'excel', 'aut ea. ', 2129);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2396, to_date('06-07-2023', 'dd-mm-yyyy'), 'pdf', 'voluptas. ', 2227);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2397, to_date('27-12-2015', 'dd-mm-yyyy'), 'excel', 'sunt eligendi ut nihil. ', 2229);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2398, to_date('06-01-2027', 'dd-mm-yyyy'), 'excel', 'cupiditate. ', 2165);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2399, to_date('10-06-2018', 'dd-mm-yyyy'), 'pdf', 'rerum. ', 2206);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2400, to_date('16-06-2024', 'dd-mm-yyyy'), 'pdf', 'in consequatur rerum eos. ', 2269);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2401, to_date('06-01-2024', 'dd-mm-yyyy'), 'excel', 'adipisicing. ', 2146);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2402, to_date('06-10-2015', 'dd-mm-yyyy'), 'pdf', 'in et. ', 2211);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2403, to_date('11-08-2030', 'dd-mm-yyyy'), 'excel', 'accusamus qui. ', 2303);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2405, to_date('29-06-2020', 'dd-mm-yyyy'), 'excel', 'similique perferendis. ', 2306);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2406, to_date('12-12-2027', 'dd-mm-yyyy'), 'excel', 'veniam omnis minim. ', 2153);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2407, to_date('19-05-2030', 'dd-mm-yyyy'), 'excel', 'ut non deserunt. ', 2166);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2408, to_date('01-07-2015', 'dd-mm-yyyy'), 'pdf', 'soluta ad. ', 2138);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2409, to_date('29-03-2028', 'dd-mm-yyyy'), 'excel', 'omnis. ', 2166);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2410, to_date('12-09-2016', 'dd-mm-yyyy'), 'excel', 'laborum id et. ', 2130);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2411, to_date('02-07-2021', 'dd-mm-yyyy'), 'word', 'distinctio. ', 2181);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2412, to_date('26-08-2020', 'dd-mm-yyyy'), 'word', 'fuga. ', 2207);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2414, to_date('14-06-2018', 'dd-mm-yyyy'), 'word', 'et sint. ', 2165);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2415, to_date('30-05-2028', 'dd-mm-yyyy'), 'word', 'excepturi et in officia. ', 2286);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2417, to_date('06-03-2029', 'dd-mm-yyyy'), 'word', 'duis occaecat dolor. ', 2156);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2418, to_date('03-10-2020', 'dd-mm-yyyy'), 'word', 'ad rerum aliquip in tempor. ', 2127);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2419, to_date('08-05-2023', 'dd-mm-yyyy'), 'excel', 'id cupidatat ad. ', 2124);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2420, to_date('05-02-2017', 'dd-mm-yyyy'), 'excel', 'id libero est rerum omnis. ', 2278);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2421, to_date('08-10-2028', 'dd-mm-yyyy'), 'excel', 'rerum omnis quis nobis vero. ', 2179);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2422, to_date('27-10-2018', 'dd-mm-yyyy'), 'word', 'voluptas omnis nobis. ', 2152);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2423, to_date('19-11-2023', 'dd-mm-yyyy'), 'excel', 'reiciendis culpa. ', 2264);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2424, to_date('28-07-2018', 'dd-mm-yyyy'), 'word', 'deserunt officia vero vero. ', 2189);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2426, to_date('27-10-2020', 'dd-mm-yyyy'), 'excel', 'vero laborum ut autem. ', 2252);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2427, to_date('24-05-2019', 'dd-mm-yyyy'), 'word', 'dolore elit saepe in. ', 2193);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2428, to_date('18-02-2028', 'dd-mm-yyyy'), 'word', 'rerum molestias. ', 2304);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2429, to_date('18-06-2017', 'dd-mm-yyyy'), 'excel', 'sunt tempore. ', 2267);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2431, to_date('10-02-2023', 'dd-mm-yyyy'), 'word', 'distinctio sit dolor. ', 2149);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2433, to_date('29-01-2028', 'dd-mm-yyyy'), 'pdf', 'cum lorem autem minim. ', 2192);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2434, to_date('14-10-2016', 'dd-mm-yyyy'), 'pdf', 'qui deleniti veniam. ', 2219);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2435, to_date('02-12-2020', 'dd-mm-yyyy'), 'excel', 'in perferendis et minim amet. ', 2283);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2436, to_date('06-04-2015', 'dd-mm-yyyy'), 'pdf', 'qui maxime dolorum. ', 2261);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2437, to_date('02-07-2028', 'dd-mm-yyyy'), 'word', 'nobis. ', 2249);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2438, to_date('18-08-2025', 'dd-mm-yyyy'), 'word', 'dolor proident omnis. ', 2125);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2439, to_date('24-05-2018', 'dd-mm-yyyy'), 'word', 'sint earum ea. ', 2142);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2442, to_date('20-02-2016', 'dd-mm-yyyy'), 'excel', 'est. ', 2178);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2443, to_date('25-08-2017', 'dd-mm-yyyy'), 'word', 'atque sapiente. ', 2199);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2444, to_date('14-02-2021', 'dd-mm-yyyy'), 'word', 'quis. ', 2196);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2445, to_date('23-08-2024', 'dd-mm-yyyy'), 'pdf', 'adipisicing. ', 2230);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2446, to_date('19-06-2029', 'dd-mm-yyyy'), 'word', 'dolor atque ut. ', 2295);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2447, to_date('16-04-2018', 'dd-mm-yyyy'), 'word', 'occaecati dolore corrupti. ', 2195);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2448, to_date('22-07-2026', 'dd-mm-yyyy'), 'pdf', 'ut eveniet ducimus rerum. ', 2240);
insert into REPORTS (report_id, report_date, report_type, r_content, event_id)
values (2449, to_date('24-02-2027', 'dd-mm-yyyy'), 'pdf', 'aliquip sapiente. ', 2206);
prompt 124 records loaded
prompt Loading ROLES...
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (1, 'phone', 'maxime sint et. ', 3, 4);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (2, 'reportwrite', 'ut ut quibusdam aliquip. ', 3, 7);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (3, 'doc', 'id ut debitis ullamco. ', 3, 8);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (4, ' sherut', 'culpa fugiat sed nam. ', 6, 7);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (5, 'phone', 'et blanditiis qui. ', 9, 0);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (6, 'reportwrite', 'sint. ', 3, 9);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (7, 'phone', 'sunt. ', 5, 8);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (8, 'doc', 'voluptas id. ', 9, 9);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (9, 'reportwrite', 'saepe dolore voluptatum. ', 4, 9);
insert into ROLES (role_id, role_name, role_description, required_training, max_volunteers)
values (10, 'reportwrite', 'eiusmod molestias labore ea. ', 7, 7);
prompt 10 records loaded
prompt Loading VOLUNTEERS...
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('741001511', 'Gina', 'Mills', '0524540234', '63 Parker RoadBad Camberg', 'gina.mills@biosite.se', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('879327263', 'Jared', 'Grant', '0523979559', '88 Dan DriveThalwil', 'j.grant@dynacqinternational.fr', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('705284364', 'Franco', 'Redford', '0561987550', '8 Steyr DriveOsaka', 'franco.redford@pinnaclestaffin', 'active', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('027847108', 'Chalee', 'Damon', '0575188447', '83 Alcobendas StreetNashua', 'chalee.damon@jollyenterprises.', 'retired', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('314936445', 'Bridgette', 'Kimball', '0545485856', '16 Ilmenau BlvdHolliston', 'bridgette.kimball@gha.jp', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('957003822', 'Rufus', 'Wagner', '0512572188', '63 Moe DriveUlm', 'rufus@kroger.com', 'active', '10');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('338160998', 'Illeana', 'Robards', '0565454149', '100 Taylor DriveSoroe', 'illeana.robards@intel.com', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('671348563', 'Boyd', 'McDormand', '0513203757', '80 Chandler StreetAlessandria', 'bmcdormand@capstone.fi', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('883953054', 'Randy', 'McKennitt', '0594664703', '78 Sartain AveUetikon am See', 'rmckennitt@pacificdatadesigns.', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('971987270', 'Phoebe', 'Carlton', '0518569515', '40 Jaime RoadAurora', 'phoebe.carlton@sms.de', 'active', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('696511331', 'Alice', 'Dzundza', '0581717240', '31st StreetMason', 'alice.d@generalmotors.uk', 'retired', '10');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('102088648', 'Rod', 'Parsons', '0572295587', '66 Vance DriveBrentwood', 'rod.parsons@sprint.au', 'active', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('122410288', 'Natalie', 'Dunst', '0578720294', '36 Guzman BlvdFairbanks', 'natalie.dunst@infopros.it', 'in process', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('327291998', 'Jeffrey', 'Dafoe', '0573683740', '38 Hewett RoadBillund', 'jeffrey.dafoe@americanland.th', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('048646646', 'Frank', 'Ermey', '0565267141', '718 Kiefer RoadMaidenhead', 'fermey@adeasolutions.au', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('086786677', 'Udo', 'Danes', '0574189139', '27 Keitel StreetSouth Weber', 'u.danes@neogen.de', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('955866429', 'Brian', 'Mars', '0568645373', '54 Fairborn AveLinz', 'brian.mars@valleyoaksystems.za', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('905128014', 'Rory', 'Stiller', '0587032236', '1 PotterNagano', 'r.stiller@parker.com', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('805079576', 'Spencer', 'Conlee', '0512427201', '29 Carla DrivePalo Alto', 'spencer.conlee@teoco.com', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('669496513', 'Ethan', 'Thewlis', '0586487293', '54 Lakeville RoadAnnandale', 'ethan.thewlis@pearllawgroup.at', 'in process', '10');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('814578172', 'Armand', 'Blige', '0566608159', '56 Warren AveBretzfeld-Waldbach', 'armand@greene.com', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('705852145', 'Ali', 'Laurie', '0512027661', '23rd StreetTakapuna', 'alaurie@fns.uk', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('678607374', 'Night', 'Starr', '0574436686', '42 Rourke RoadHounslow', 'night.s@infinity.com', 'active', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('168999525', 'Embeth', 'Murray', '0518505975', '45 Wilson RoadKobenhavn', 'embeth.murray@trafficmanagemen', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('529867055', 'Eugene', 'Dolenz', '0512572188', '63 Moe DriveUlm', 'eugened@generalelectric.com', 'retired', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('235438802', 'Nik', 'McIntosh', '0548035751', '35 Goss AveGlen Head', 'nik.mcintosh@techbooks.com', 'active', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('624208805', 'Maceo', 'Kahn', '0544263241', '24 Chad DriveTadley', 'maceo.kahn@travizon.ca', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('237161395', 'Colin', 'Eldard', '0547894449', '74 Jemison StreetRedwood City', 'colin.e@mds.com', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('254115667', 'Pelvic', 'Botti', '0536957994', '19 Keeslar StreetToronto', 'pelvic@officedepot.is', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('222632263', 'Graham', 'Lemmon', '0547941788', '98 Everett RoadCheshire', 'graham@paintedword.com', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('405976889', 'Desmond', 'Redford', '0532992935', '87 Debbie StreetBarcelona', 'desmond.redford@mastercardinte', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('824629561', 'Bonnie', 'LaMond', '0566608159', '56 Warren AveBretzfeld-Waldbach', 'bonnie.lamond@ivorysystems.ca', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('640174589', 'Marisa', 'Sossamon', '0560102378', '70 Allison AveNew Delhi', 'm.sossamon@capital.com', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('146114543', 'Terri', 'Redford', '0504385864', '43 Pinter BlvdBishopbriggs', 'terri.redford@horizonorganic.u', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('748990413', 'Michael', 'Washington', '0518569515', '40 Jaime RoadAurora', 'mwashington@fmb.de', 'active', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('921565805', 'Vonda', 'Devine', '0589935174', '29 Sandra RoadMenlo Park', 'vonda@3tsystems.dk', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('026254013', 'Ritchie', 'Latifah', '0518591234', '93 Chandler BlvdStuttgart', 'ritchie.latifah@processplus.br', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('850736037', 'Rik', 'Gleeson', '0538955514', '74 Keitel AveWalldorf', 'rik.gleeson@taycorfinancial.ca', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('609830431', 'Lenny', 'Cronin', '0581773945', '55 Amsterdam AveBreda', 'l.cronin@air.com', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('936285481', 'Ralph', 'Tisdale', '0533996612', '74 Bishop StreetGrimbergen', 'ralph.tisdale@fmb.com', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('973262503', 'First', 'Michaels', '0561877352', '74 Everetts StLutry', 'firstm@servicesource.com', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('725345981', 'Nicolas', 'Womack', '0517536618', '54 Robertson BlvdAlvechurch', 'nicolas.womack@esoftsolutions.', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('135639362', 'Ann', 'Postlethwa', '0525463289', '65 Everetts BlvdSzczecin', 'ann.postlethwaite@pioneermortg', 'retired', '10');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('751102104', 'Chet', 'Rapaport', '0517890123', '77 Goss BlvdBristol', 'chet.rapaport@abs.ca', 'in process', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('037723814', 'Holland', 'Dalley', '0576513789', '63 Bishop BlvdHuddinge', 'h.dalley@ibfh.com', 'retired', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('847649340', 'Praga', 'Duke', '0581234567', '77 Goss BlvdStuttgart', 'praga@hersheyfoods.de', 'active', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('127774563', 'Edgar', 'Jane', '0512345678', '22 Everetts StLutry', 'edgar.jane@capitalautomotive.b', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('744075988', 'Sydney', 'Connery', '0512987654', '33 Bishop BlvdHuddinge', 'sconnery@lifelinesystems.ch', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('284787689', 'Loreena', 'Rundgren', '0561987654', '77 Bishop BlvdBristol', 'l.rundgren@loreal.com', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('686870106', 'Wesley', 'Dorn', '0561345678', '63 Robertson BlvdAlvechurch', 'wesleyd@prahs.com', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('302017993', 'Reese', 'Hanks', '0568765432', '22 Everetts BlvdSzczecin', 'reese@usainstruments.ca', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('863266868', 'Philip', 'Cole', '0521123456', '33 Everetts StLutry', 'pcole@yashtechnologies.ca', 'retired', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('144998512', 'Thomas', 'Red', '0521234567', '33 Bishop BlvdHuddinge', 'thomas.red@meridiangold.fr', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('007114333', 'Cesar', 'Affleck', '0521234567', '33 Bishop BlvdHuddinge', 'cesar.affleck@sears.com', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('158592795', 'Remy', 'Carnes', '0523456789', '77 Bishop BlvdBristol', 'remyc@linersdirect.com', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('337702606', 'Julia', 'McKellen', '0522345678', '33 Bishop BlvdHuddinge', 'julia.mckellen@cooktek.com', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('745115342', 'Jonathan', 'Mathis', '0527654321', '63 Robertson BlvdAlvechurch', 'jonathan.mathis@nat.com', 'retired', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('636744011', 'Kathleen', 'Spacek', '0523456789', '77 Bishop BlvdBristol', 'kathleen@webgroup.com', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('194954711', 'Dennis', 'Eldard', '0521234567', '33 Bishop BlvdHuddinge', 'dennis.eldard@allegiantbancorp', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('877800245', 'Harrison', 'Moore', '0523456789', '77 Bishop BlvdBristol', 'harrison@atxforms.ca', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('511568325', 'Milla', 'Davies', '0521123456', '63 Robertson BlvdAlvechurch', 'milla.davies@fpf.jp', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('685918534', 'Merrill', 'Aniston', '0529876543', '33 Bishop BlvdHuddinge', 'merrill.aniston@cardinalcartri', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('187686067', 'Etta', 'Leto', '0529876543', '33 Bishop BlvdHuddinge', 'etta.leto@idas.za', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('607883888', 'Adam', 'Adkins', '0521234567', '33 Bishop BlvdHuddinge', 'adam.adkins@peerlessmanufactur', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('581109827', 'David', 'Def', '0521234567', '33 Bishop BlvdHuddinge', 'david.d@ungertechnologies.com', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('912029990', 'Ron', 'Lizzy', '0523456789', '77 Bishop BlvdBristol', 'ron.lizzy@emt.com', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('234448967', 'Alicia', 'Candy', '0529876543', '33 Bishop BlvdHuddinge', 'alicia.candy@atxforms.it', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('682887687', 'Rosco', 'Garofalo', '0529876543', '33 Bishop BlvdHuddinge', 'r.garofalo@hitechpharmacal.pl', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('420963265', 'Kathleen', 'Benson', '0529876543', '33 Bishop BlvdHuddinge', 'kathleen.benson@iss.au', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('025814164', 'Saffron', 'Brandt', '0521234567', '33 Bishop BlvdHuddinge', 's.brandt@officedepot.ca', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('255902165', 'Nancy', 'Reubens', '0529876543', '33 Bishop BlvdHuddinge', 'nancy.r@cardinalcartridge.ch', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('498813862', 'Mika', 'McFadden', '0521234567', '33 Bishop BlvdHuddinge', 'mmcfadden@columbiabancorp.de', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('364832044', 'Cherry', 'Shand', '0521234567', '33 Bishop BlvdHuddinge', 'c.shand@sms.cl', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('155686878', 'Nick', 'Checker', '0523456789', '77 Bishop BlvdBristol', 'nick.checker@comglobalsystems.', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('703928930', 'Diamond', 'Goodman', '0529876543', '33 Bishop BlvdHuddinge', 'diamond.goodman@investorstitle', 'in process', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('608234327', 'Ian', 'Callow', '0529876543', '33 Bishop BlvdHuddinge', 'ian@tilsonlandscape.com', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('569849442', 'Kiefer', 'Calle', '0521234567', '33 Bishop BlvdHuddinge', 'kiefer.calle@hps.au', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('484654164', 'Alannah', 'Schreiber', '0529876543', '33 Bishop BlvdHuddinge', 'alannah.schreiber@safeway.ca', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('984430684', 'Reese', 'Cage', '0529876543', '33 Bishop BlvdHuddinge', 'reese.cage@coadvantageresource', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('165166680', 'Elizabeth', 'Lucien', '0521234567', '33 Bishop BlvdHuddinge', 'elizabeth.lucien@mavericktechn', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('300360696', 'Mary', 'Linney', '0529876543', '33 Bishop BlvdHuddinge', 'mary.linney@conagra.com', 'in process', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('047437879', 'Gin', 'Garcia', '0529876543', '33 Bishop BlvdHuddinge', 'g.garcia@americanmegacom.de', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('570331042', 'Garry', 'Duschel', '0529876543', '33 Bishop BlvdHuddinge', 'garryd@staffone.com', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('720532971', 'Alana', 'Tyson', '0529876543', '33 Bishop BlvdHuddinge', 'alana.tyson@whitewave.com', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('710020129', 'Rhona', 'Moreno', '0529876543', '33 Bishop BlvdHuddinge', 'rhona.moreno@portosan.de', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('975627046', 'Keanu', 'Baker', '0529876543', '33 Bishop BlvdHuddinge', 'keanu.b@catamount.com', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('108935075', 'Rascal', 'Diaz', '0529876543', '33 Bishop BlvdHuddinge', 'rascal@gci.ee', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('869446489', 'Lindsey', 'Holbrook', '0529876543', '33 Bishop BlvdHuddinge', 'lindsey.h@gra.com', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('579667581', 'Maceo', 'Steiger', '0529876543', '33 Bishop BlvdHuddinge', 'maceo.steiger@slt.nl', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('998387270', 'Victoria', 'Quinones', '0529876543', '33 Bishop BlvdHuddinge', 'victoria.quinones@marsinc.de', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('724101704', 'Gena', 'Maxwell', '0529876543', '33 Bishop BlvdHuddinge', 'gena.maxwell@priorityleasing.j', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('152572605', 'Charlie', 'Clarkson', '0529876543', '33 Bishop BlvdHuddinge', 'c.clarkson@sis.ch', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('864233203', 'Stockard', 'Idol', '0529876543', '33 Bishop BlvdHuddinge', 'stockard.idol@globalwireless.i', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('309682546', 'Roberta', 'Jane', '0529876543', '33 Bishop BlvdHuddinge', 'r.jane@educationaldevelopment.', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('033422444', 'Anita', 'Katt', '0529876543', '33 Bishop BlvdHuddinge', 'a.katt@sandyspringbancorp.gr', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('235987479', 'Lionel', 'Patton', '0529876543', '33 Bishop BlvdHuddinge', 'lionel.patton@prometheuslabora', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('210816127', 'Mint', 'Tate', '0529876543', '33 Bishop BlvdHuddinge', 'mint.tate@yes.de', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('275373015', 'Bobby', 'Bullock', '0529876543', '33 Bishop BlvdHuddinge', 'bobbyb@otbd.fr', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('189838507', 'Terrence', 'Miles', '0529876543', '33 Bishop BlvdHuddinge', 'terrence@gulfmarkoffshore.jp', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('177101709', 'Gina', 'Estevez', '0529876543', '33 Bishop BlvdHuddinge', 'gestevez@meghasystems.fr', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('780366947', 'Debbie', 'Wariner', '0529876543', '33 Bishop BlvdHuddinge', 'debbie.w@procter.com', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('187579649', 'Pat', 'Chesnutt', '0529876543', '33 Bishop BlvdHuddinge', 'pat.chesnutt@fflcbancorp.de', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('652031992', 'Lucinda', 'Close', '0529876543', '33 Bishop BlvdHuddinge', 'l.close@campbellsoup.nl', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('047371408', 'Frankie', 'Stallone', '0529876543', '33 Bishop BlvdHuddinge', 'f.stallone@spectrum.com', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('924624068', 'Olga', 'Hobson', '0529876543', '33 Bishop BlvdHuddinge', 'olga.hobson@venoco.com', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('696814618', 'Moe', 'Ermey', '0529876543', '33 Bishop BlvdHuddinge', 'mermey@gltg.gr', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('543955576', 'Earl', 'Ratzenberg', '0529876543', '33 Bishop BlvdHuddinge', 'earl@qas.fr', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('299685315', 'Norm', 'Burrows', '0529876543', '33 Bishop BlvdHuddinge', 'norm.burrows@abs.it', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('318447492', 'Kyle', 'Fisher', '0529876543', '33 Bishop BlvdHuddinge', 'k.fisher@iss.in', 'active', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('799167503', 'Vertical', 'McDowall', '0529876543', '33 Bishop BlvdHuddinge', 'vertical.mcdowall@sm.com', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('833298755', 'Vanessa', 'Reeves', '0529876543', '33 Bishop BlvdHuddinge', 'vanessa.reeves@mai.com', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('754632393', 'Lee', 'Levert', '0529876543', '33 Bishop BlvdHuddinge', 'lee@epamsystems.jp', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('895770231', 'Gil', 'Broza', '0529876543', '33 Bishop BlvdHuddinge', 'gil@innovateecommerce.br', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('400917628', 'Aaron', 'Flatts', '0529876543', '33 Bishop BlvdHuddinge', 'aaron.f@unitedasset.com', 'in process', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('614391180', 'Mac', 'Pierce', '0529876543', '33 Bishop BlvdHuddinge', 'mpierce@grt.com', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('768494443', 'Marc', 'Cheadle', '0529876543', '33 Bishop BlvdHuddinge', 'marc.cheadle@knightsbridge.dk', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('843231819', 'Lynn', 'Mars', '0529876543', '33 Bishop BlvdHuddinge', 'lynn.mars@bayer.com', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('007507474', 'Jena', 'Horton', '0529876543', '33 Bishop BlvdHuddinge', 'jena.horton@sht.ee', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('042237113', 'Rupert', 'Wine', '0529876543', '33 Bishop BlvdHuddinge', 'rupert.wine@gci.pl', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('072168409', 'Edie', 'Rebhorn', '0529876543', '33 Bishop BlvdHuddinge', 'e.rebhorn@scheringplough.uk', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('076083621', 'Hank', 'Schneider', '0529876543', '33 Bishop BlvdHuddinge', 'hank.schneider@americanexpress', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('307716898', 'Edie', 'Flatts', '0529876543', '33 Bishop BlvdHuddinge', 'edie.flatts@abs.it', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('082557774', 'Chazz', 'Rush', '0529876543', '33 Bishop BlvdHuddinge', 'chazz.rush@viacell.pt', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('720298946', 'Liam', 'Guilfoyle', '0529876543', '33 Bishop BlvdHuddinge', 'liam.guilfoyle@saralee.com', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('562748536', 'Ice', 'Wine', '0529876543', '33 Bishop BlvdHuddinge', 'ice.wine@formatech.au', 'active', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('477713746', 'Nils', 'Warwick', '0529876543', '33 Bishop BlvdHuddinge', 'nils@spenser.com', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('539682561', 'Anne', 'Kingsley', '0529876543', '33 Bishop BlvdHuddinge', 'anne.kingsley@scriptsave.at', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('948688656', 'Hikaru', 'Madsen', '0529876543', '33 Bishop BlvdHuddinge', 'hikaru.madsen@mag.com', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('871930292', 'Pamela', 'McCormack', '0529876543', '33 Bishop BlvdHuddinge', 'pamela.mccormack@comnetinterna', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('432174519', 'Rob', 'Isaak', '0529876543', '33 Bishop BlvdHuddinge', 'rob@pib.uk', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('961032191', 'Mary-Louis', 'D''Onofrio', '0529876543', '33 Bishop BlvdHuddinge', 'marylouise.donofrio@tps.be', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('658306554', 'Maureen', 'Abraham', '0529876543', '33 Bishop BlvdHuddinge', 'mabraham@sfgo.com', 'active', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('558068638', 'Teena', 'Dupree', '0529876543', '33 Bishop BlvdHuddinge', 'teena.dupree@wrgservices.ch', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('979932926', 'Taylor', 'Cage', '0529876543', '33 Bishop BlvdHuddinge', 'taylor.cage@mre.jp', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('555029781', 'Marianne', 'Loeb', '0529876543', '33 Bishop BlvdHuddinge', 'marianne.loeb@usdairyproducers', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('053878653', 'Neve', 'Prinze', '0529876543', '33 Bishop BlvdHuddinge', 'neve.prinze@northhighland.za', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('276143046', 'Etta', 'Idle', '0529876543', '33 Bishop BlvdHuddinge', 'etta.idle@medsource.com', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('012584652', 'Jonny Lee', 'Shawn', '0529876543', '33 Bishop BlvdHuddinge', 'jonnylee.shawn@cis.br', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('999833209', 'Ozzy', 'Rundgren', '0529876543', '33 Bishop BlvdHuddinge', 'ozzy.rundgren@kingston.ca', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('242316965', 'Jeffrey', 'Caan', '0529876543', '33 Bishop BlvdHuddinge', 'jeffrey.caan@quicksilverresour', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('056054703', 'Juliet', 'Dillane', '0529876543', '33 Bishop BlvdHuddinge', 'juliet.dillane@solutionbuilder', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('483453321', 'Clea', 'Cross', '0529876543', '33 Bishop BlvdHuddinge', 'clea.cross@cardtronics.de', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('929475618', 'Marc', 'Tempest', '0529876543', '33 Bishop BlvdHuddinge', 'm.tempest@clorox.com', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('175781268', 'Fisher', 'Joli', '0529876543', '33 Bishop BlvdHuddinge', 'fisher.j@innovativelighting.co', 'retired', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('687549039', 'Frances', 'Hawke', '0529876543', '33 Bishop BlvdHuddinge', 'fhawke@newmedia.com', 'in process', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('190466061', 'Seann', 'Anderson', '0529876543', '33 Bishop BlvdHuddinge', 'sanderson@procurementcentre.pe', 'active', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('517541852', 'Tia', 'Shepherd', '0529876543', '33 Bishop BlvdHuddinge', 'tia.shepherd@walmartstores.jp', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('585289028', 'Kyle', 'Shalhoub', '0529876543', '33 Bishop BlvdHuddinge', 'kshalhoub@biosite.uk', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('058760424', 'Yolanda', 'Klugh', '0529876543', '33 Bishop BlvdHuddinge', 'y.klugh@safeway.li', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('629756673', 'Chet', 'Pollak', '0529876543', '33 Bishop BlvdHuddinge', 'c.pollak@anworthmortgage.de', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('200291980', 'Giancarlo', 'Stowe', '0529876543', '33 Bishop BlvdHuddinge', 'giancarlo@studiobproductions.c', 'in process', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('916533775', 'Benicio', 'Jeffreys', '0529876543', '33 Bishop BlvdHuddinge', 'benicio.jeffreys@mavericktechn', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('541317968', 'Keith', 'Twilley', '0529876543', '33 Bishop BlvdHuddinge', 'keith.twilley@morganresearch.d', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('671800521', 'Kirk', 'LuPone', '0529876543', '33 Bishop BlvdHuddinge', 'kirk.lupone@aristotle.es', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('913942557', 'Vertical', 'Schneider', '0529876543', '33 Bishop BlvdHuddinge', 'vertical.schneider@componentgr', 'retired', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('785897554', 'Gordie', 'Aglukark', '0529876543', '33 Bishop BlvdHuddinge', 'gordie.aglukark@news.com', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('489718006', 'Gwyneth', 'Imbruglia', '0529876543', '33 Bishop BlvdHuddinge', 'gwyneth.imbruglia@serentec.it', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('647035053', 'Burt', 'Morton', '0529876543', '33 Bishop BlvdHuddinge', 'burt.morton@nobrainerblindscom', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('724367146', 'Charles', 'Aglukark', '0529876543', '33 Bishop BlvdHuddinge', 'charles.aglukark@hotmail.be', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('610341868', 'Richie', 'Vega', '0529876543', '33 Bishop BlvdHuddinge', 'rvega@aci.de', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('654060128', 'Arturo', 'Balaban', '0529876543', '33 Bishop BlvdHuddinge', 'a.balaban@tarragonrealty.com', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('934021441', 'Joseph', 'Boyle', '0529876543', '33 Bishop BlvdHuddinge', 'joseph.boyle@saksinc.pt', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('904803417', 'Zooey', 'Stiers', '0529876543', '33 Bishop BlvdHuddinge', 'zooey.stiers@glacierbancorp.be', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('552163784', 'Pete', 'Rudd', '0529876543', '33 Bishop BlvdHuddinge', 'pete.rudd@ait.com', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('946938069', 'Jackie', 'Ferrell', '0529876543', '33 Bishop BlvdHuddinge', 'jackie.f@actechnologies.uk', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('048142005', 'Bryan', 'Gellar', '0529876543', '33 Bishop BlvdHuddinge', 'bgellar@serentec.com', 'retired', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('667505144', 'Julie', 'Wiedlin', '0529876543', '33 Bishop BlvdHuddinge', 'julie.wiedlin@dcgroup.uk', 'in process', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('780987486', 'Burton', 'Janssen', '0529876543', '33 Bishop BlvdHuddinge', 'burton.janssen@kellogg.de', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('370632269', 'Amy', 'Lucien', '0529876543', '33 Bishop BlvdHuddinge', 'amy@solutionbuilders.ca', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('569879560', 'Joey', 'Cagle', '0529876543', '33 Bishop BlvdHuddinge', 'joey.c@refinery.br', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('711285053', 'Ali', 'Biehn', '0529876543', '33 Bishop BlvdHuddinge', 'abiehn@invisioncom.de', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('009223928', 'Ronny', 'Trevino', '0529876543', '33 Bishop BlvdHuddinge', 'ronny.trevino@tilsonlandscape.', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('725569007', 'Kid', 'Getty', '0529876543', '33 Bishop BlvdHuddinge', 'kid.getty@arkidata.com', 'in process', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('057913650', 'Geggy', 'Maxwell', '0529876543', '33 Bishop BlvdHuddinge', 'g.maxwell@capitolbancorp.il', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('402786140', 'Parker', 'Rhymes', '0529876543', '33 Bishop BlvdHuddinge', 'parker.rhymes@sbc.se', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('889872686', 'Goran', 'King', '0529876543', '33 Bishop BlvdHuddinge', 'goran.king@mls.com', 'in process', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('243329904', 'Colm', 'Wills', '0529876543', '33 Bishop BlvdHuddinge', 'c.wills@talx.za', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('104654240', 'Veruca', 'Hoskins', '0529876543', '33 Bishop BlvdHuddinge', 'veruca.hoskins@apexsystems.ht', 'retired', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('185498109', 'Pat', 'Soul', '0529876543', '33 Bishop BlvdHuddinge', 'pat@pis.it', 'in process', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('998752021', 'Steve', 'Holiday', '0529876543', '33 Bishop BlvdHuddinge', 'steve.holiday@intraspheretechn', 'retired', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('117964189', 'Simon', 'Buffalo', '0529876543', '33 Bishop BlvdHuddinge', 'simonb@trx.ca', 'active', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('321643516', 'Trace', 'Solido', '0529876543', '33 Bishop BlvdHuddinge', 'trace@grs.li', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('807810311', 'Sylvester', 'Carlton', '0529876543', '33 Bishop BlvdHuddinge', 'sylvester.carlton@fam.de', 'active', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('135856510', 'Rosanne', 'Gallant', '0529876543', '33 Bishop BlvdHuddinge', 'rgallant@fds.com', 'retired', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('127611024', 'Hilary', 'Hatfield', '0529876543', '33 Bishop BlvdHuddinge', 'hilary.h@emt.br', 'in process', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('306609285', 'Herbie', 'Goldberg', '0529876543', '33 Bishop BlvdHuddinge', 'herbie.goldberg@wav.il', 'active', '7');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('449103116', 'Noah', 'Curry', '0529876543', '33 Bishop BlvdHuddinge', 'noah.c@creditorsinterchange.it', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('160539133', 'Mekhi', 'Phillips', '0529876543', '33 Bishop BlvdHuddinge', 'mphillips@parker.com', 'in process', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('656361203', 'Rosanna', 'Penn', '0529876543', '33 Bishop BlvdHuddinge', 'rosanna.penn@morganresearch.ch', 'active', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('499419072', 'Samuel', 'Numan', '0529876543', '33 Bishop BlvdHuddinge', 'samuel.numan@ibm.com', 'retired', '8');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('312041206', 'Anjelica', 'McAnally', '0529876543', '33 Bishop BlvdHuddinge', 'anjelica@monitronicsinternatio', 'in process', '4');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('616117735', 'Miriam', 'Rains', '0529876543', '33 Bishop BlvdHuddinge', 'miriam@aoe.de', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('099929610', 'Ricky', 'Eldard', '0529876543', '33 Bishop BlvdHuddinge', 'ricky.eldard@parksite.it', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('692375929','Dorry', 'Blanchett', '0529876543', '33 Bishop BlvdHuddinge', 'dorry.blanchett@arkidata.br', 'active', '9');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('242952342', 'Natacha', 'Gayle', '0529876543', '33 Bishop BlvdHuddinge', 'ngayle@sci.de', 'retired', '2');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('119591809', 'Jamie', 'Shandling', '0529876543', '33 Bishop BlvdHuddinge', 'jshandling@ipsadvisory.it', 'active', '3');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('922303690', 'Ritchie', 'Ferry', '0529876543', '33 Bishop BlvdHuddinge', 'ritchie.ferry@portosan.com', 'in process', '5');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('291811666', 'Claire', 'Aaron', '0529876543', '33 Bishop BlvdHuddinge', 'claire@topicsentertainment.de', 'retired', '1');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('118056743', 'Gordie', 'Epps', '0529876543', '33 Bishop BlvdHuddinge', 'gordie@myricom.pl', 'active', '6');
insert into VOLUNTEERS (volunteer_id, first_name, last_name, phone_number, address, email, status, role_id)
values ('178613896', 'Toni', 'Maguire', '0529876543', '33 Bishop BlvdHuddinge', 'toni@topicsentertainment.br', 'retired', '3');
prompt 120 records loaded
prompt Loading VS_IN_SHIFTS...
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1114, '51712418');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1115, '64688411');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1117, '64688411');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1120, '29669002');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1123, '54847459');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1123, '72343408');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1123, '83195889');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1125, '67428606');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1125, '48453909');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1125, '95529902');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1128, '65711016');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1129, '82279791');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1130, '9526964');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1131, '71180441');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1132, '34227047');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1136, '42123442');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1139, '6620430');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1139, '64688411');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1147, '67428606');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1148, '65711016');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1148, '85500480');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1151, '96332473');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1152, '2682763');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1153, '64688411');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1153, '80575918');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1156, '81342207');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1156, '88392782');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1159, '54769341');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1161, '73496705');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1164, '18686498');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1164, '76951103');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1168, '12891104');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1168, '51341300');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1169, '41959159');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1169, '54050319');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1170, '21909765');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1172, '96332473');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1172, '96826918');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1178, '95529902');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1183, '51740030');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1191, '61352929');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1191, '96438825');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1194, '68008097');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1197, '481806');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1202, '41959159');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1202, '82649898');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1203, '22599727');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1204, '95529902');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1206, '52381941');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1209, '8915765');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1209, '55581133');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1210, '34337359');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1212, '10483145');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1215, '86764508');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1216, '23278645');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1217, '81342207');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1219, '66627080');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1220, '43566695');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1222, '98555181');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1223, '27436501');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1226, '1789328');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1229, '10874127');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1229, '41959159');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1231, '54769341');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1232, '17931708');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1233, '42123442');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1234, '6620430');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1234, '88392782');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1236, '67892990');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1238, '23278645');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1241, '87733598');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1244, '89909407');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1245, '25336053');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1246, '64688411');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1247, '2466843');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1247, '96332473');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1249, '25336053');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1249, '36360656');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1250, '68008097');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1254, '20010208');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1255, '67248251');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1257, '44244985');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1260, '7091539');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1260, '32594085');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1262, '91257481');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1264, '618888');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1265, '87733598');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1270, '2466843');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1271, '23278645');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1272, '2466843');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1273, '74221195');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1277, '10874127');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1277, '44244985');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1280, '27436501');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1280, '54050319');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1282, '27325989');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1282, '97383747');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1287, '42118637');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1293, '10483145');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1297, '81342207');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1297, '83368780');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1299, '6536148');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1299, '62871038');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1302, '36519502');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1302, '41113324');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1303, '40841618');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1305, '81342207');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1307, '86764508');
INSERT INTO VS_IN_SHIFTS (shift_id, volunteer_id) VALUES (1310, '74221195');
prompt 109 records loaded
prompt Enabling foreign key constraints for EVENTS...
alter table EVENTS enable constraint SYS_C008265;
prompt Enabling foreign key constraints for ACTS_IN_EVENTS...
alter table ACTS_IN_EVENTS enable constraint SYS_C008289;
alter table ACTS_IN_EVENTS enable constraint SYS_C008290;
prompt Enabling foreign key constraints for REPORTS...
alter table REPORTS enable constraint SYS_C008272;
prompt Enabling foreign key constraints for VOLUNTEERS...
alter table VOLUNTEERS enable constraint SYS_C008300;
prompt Enabling foreign key constraints for VS_IN_SHIFTS...
alter table VS_IN_SHIFTS enable constraint SYS_C008304;
alter table VS_IN_SHIFTS enable constraint SYS_C008305;
prompt Enabling triggers for ACTIVITES...
alter table ACTIVITES enable all triggers;
prompt Enabling triggers for SHIFTS...
alter table SHIFTS enable all triggers;
prompt Enabling triggers for EVENTS...
alter table EVENTS enable all triggers;
prompt Enabling triggers for ACTS_IN_EVENTS...
alter table ACTS_IN_EVENTS enable all triggers;
prompt Enabling triggers for REPORTS...
alter table REPORTS enable all triggers;
prompt Enabling triggers for ROLES...
alter table ROLES enable all triggers;
prompt Enabling triggers for VOLUNTEERS...
alter table VOLUNTEERS enable all triggers;
prompt Enabling triggers for VS_IN_SHIFTS...
alter table VS_IN_SHIFTS enable all triggers;