prompt PL/SQL Developer import file
prompt Created on יום ראשון 02 יוני 2024 by reutz
set feedback off
set define off
prompt Creating BLOOD...
create table BLOOD
(
  sign CHAR(1) not null,
  type VARCHAR2(2) not null
)
alter table BLOOD
  add primary key (SIGN, TYPE)
 ;

prompt Creating DONATION_PLACE...
create table DONATION_PLACE
(
  place_id    NUMBER(5) not null,
  place_phone VARCHAR2(10) not null,
  manager     VARCHAR2(20) not null,
  address     VARCHAR2(25) not null
)
alter table DONATION_PLACE
  add primary key (PLACE_ID)
  ;

prompt Creating PERSON...
create table PERSON
(
  pid    VARCHAR2(9) not null,
  l_name VARCHAR2(10) not null,
  f_name VARCHAR2(10) not null,
  email  VARCHAR2(30)
)
alter table PERSON
  add primary key (PID)
  ;

prompt Creating DONOR...
create table DONOR
(
  gender     CHAR(1) not null,
  birth_date DATE not null,
  donor_id   VARCHAR2(9) not null,
  sign       CHAR(1) not null,
  type       VARCHAR2(2) not null
)
alter table DONOR
  add primary key (DONOR_ID)
  ;
alter table DONOR
  add foreign key (DONOR_ID)
  references PERSON (PID);
alter table DONOR
  add foreign key (SIGN, TYPE)
  references BLOOD (SIGN, TYPE);

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  license_num  NUMBER(5) not null,
  seniority    NUMBER(2) default 0,
  paramedic_id VARCHAR2(9) not null,
  salary       NUMBER(6) default 0
)
alter table PARAMEDIC
  add primary key (PARAMEDIC_ID)
  ;
alter table PARAMEDIC
  add foreign key (PARAMEDIC_ID)
  references PERSON (PID);

prompt Creating RECEIVER...
create table RECEIVER
(
  hospital_id    NUMBER(5) not null,
  hospital_name  VARCHAR2(20) not null,
  city           VARCHAR2(15) not null,
  delivery_date  DATE not null,
  hospital_phone VARCHAR2(10) not null
)
alter table RECEIVER
  add primary key (HOSPITAL_ID)
 ;

prompt Creating DONATION...
create table DONATION
(
  donation_id   NUMBER(10) not null,
  pass_tests    CHAR(1),
  donation_date DATE not null,
  valid         CHAR(1),
  paramedic_id  VARCHAR2(9) not null,
  donor_id      VARCHAR2(9) not null,
  place_id      NUMBER(5) not null,
  hospital_id   NUMBER(5)
)
alter table DONATION
  add primary key (DONATION_ID)
  ;
alter table DONATION
  add foreign key (PARAMEDIC_ID)
  references PARAMEDIC (PARAMEDIC_ID);
alter table DONATION
  add foreign key (DONOR_ID)
  references DONOR (DONOR_ID);
alter table DONATION
  add foreign key (PLACE_ID)
  references DONATION_PLACE (PLACE_ID);
alter table DONATION
  add foreign key (HOSPITAL_ID)
  references RECEIVER (HOSPITAL_ID);

prompt Creating PERSON_PHONE_NUMBER...
create table PERSON_PHONE_NUMBER
(
  phone_number VARCHAR2(12) not null,
  pid          VARCHAR2(9) not null
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
alter table PERSON_PHONE_NUMBER
  add primary key (PHONE_NUMBER, PID)
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
alter table PERSON_PHONE_NUMBER
  add foreign key (PID)
  references PERSON (PID);

prompt Disabling triggers for BLOOD...
alter table BLOOD disable all triggers;
prompt Disabling triggers for DONATION_PLACE...
alter table DONATION_PLACE disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for RECEIVER...
alter table RECEIVER disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for PERSON_PHONE_NUMBER...
alter table PERSON_PHONE_NUMBER disable all triggers;
prompt Disabling foreign key constraints for DONOR...
alter table DONOR disable constraint SYS_C007179;
alter table DONOR disable constraint SYS_C007180;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C007168;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C007187;
alter table DONATION disable constraint SYS_C007188;
alter table DONATION disable constraint SYS_C007189;
alter table DONATION disable constraint SYS_C007190;
prompt Disabling foreign key constraints for PERSON_PHONE_NUMBER...
alter table PERSON_PHONE_NUMBER disable constraint SYS_C007172;
prompt Deleting PERSON_PHONE_NUMBER...
delete from PERSON_PHONE_NUMBER;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting RECEIVER...
delete from RECEIVER;
commit;
prompt Deleting PARAMEDIC...
delete from PARAMEDIC;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Deleting DONATION_PLACE...
delete from DONATION_PLACE;
commit;
prompt Deleting BLOOD...
delete from BLOOD;
commit;
prompt Loading BLOOD...
insert into BLOOD (sign, type)
values ('+', 'A');
insert into BLOOD (sign, type)
values ('+', 'AB');
insert into BLOOD (sign, type)
values ('+', 'B');
insert into BLOOD (sign, type)
values ('+', 'O');
insert into BLOOD (sign, type)
values ('-', 'A');
insert into BLOOD (sign, type)
values ('-', 'AB');
insert into BLOOD (sign, type)
values ('-', 'B');
insert into BLOOD (sign, type)
values ('-', 'O');
commit;
prompt 8 records loaded
prompt Loading DONATION_PLACE...
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (81582, '040608256', 'Will  Sartain', '92 Nugent Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37672, '090499157', 'Rade  Salt', '40 Albright Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (93715, '095621775', 'Shirley  Boorem', '50 Willis Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (31471, '049441074', 'Andie  Payton', '15 Spiner Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55511, '033504865', 'Gil  Cara', '10 William Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94895, '047049008', 'Olga  Kilmer', '81 Emerson Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (56874, '090715465', 'Chantי  Kidman', '30 Sorvino Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25888, '091338753', 'Jean-Luc  Bryson', '67 Deborah Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46151, '084624955', 'Debby  Patton', '75 Lynch Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83722, '037561539', 'Praga  Speaks', '89 Hermitage Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41668, '027590948', 'Joan  McDowall', '66 Giraldo Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64358, '044218191', 'Kim  Phillippe', '32 Luis Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89911, '025919721', 'Arturo  Llewelyn', '63rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37652, '099519184', 'Ali  Reinhold', '7 Merrilee Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (33126, '031358582', 'Donna  Grant', '13rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (95166, '092978845', 'Juice  Stowe', '78 Blossoms Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (62641, '088855061', 'Bernie  Latifah', '97 Rooker Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (27465, '035701197', 'Chi  Kadison', '75 Warszawa Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (92496, '093667345', 'Hikaru  Spector', '7 Spine Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (81645, '045274983', 'Crispin  Mewes', '976 Jerry Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44671, '032470058', 'Luis  Gunton', '985 Raleigh Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (87731, '034395820', 'Roddy  Lynskey', '95 Lightfoot Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (38776, '029627666', 'Samuel  Englund', '80 Lynette Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (97938, '091287666', 'Gabriel  Berkoff', '35 Diamond Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (43238, '090930029', 'Julianna  Krabbe', '861 Long Island City');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55124, '038577363', 'Humberto  Moriarty', '90 Warren Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41644, '095306005', 'Leon  Cooper', '13 Mito Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48163, '084039239', 'Roddy  Valentin', '34 Van Helden Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36945, '085936372', 'Lena  Tierney', '59 Wichita Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (95566, '029953185', 'Rutger  Clayton', '65 Rob Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (99531, '022818180', 'Denny  El-Saher', '93 Streep Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (91352, '029897536', 'Busta  Isaacs', '36 Mellencamp Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73717, '025684354', 'Cathy  Barnett', '751 James Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55256, '099984464', 'Benjamin  Galecki', '3 Epps Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78828, '095674885', 'Kid  Bright', '27 Rosas Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51299, '099336315', 'Gordon  English', '957 Vanian Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39555, '027217878', 'Samantha  Rispoli', '80 Hilversum Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85689, '033120205', 'Wade  LuPone', '4 Kadison Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (84829, '026806143', 'First  Benson', '33 Harper Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71553, '080808940', 'Candice  Osmond', '83rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82939, '022637890', 'Jackson  Kier', '12nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (75561, '042354629', 'Denis  Holliday', '11 Paal Beringen');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58775, '035086628', 'Vonda  Harper', '18 Lexington Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (98616, '098420507', 'Gord  Suvari', '1 Shaw Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82364, '094532845', 'Natacha  Lovitz', '65 Mann Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54175, '042473224', 'Frances  Hiatt', '587 Lou Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86381, '025779425', 'Heath  McElhone', '63 Geneve Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36729, '094959889', 'Andre  Burke', '951 Hamilton Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (81874, '086103142', 'Rod  Greenwood', '99 Hagar Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (69585, '024679223', 'Emm  Bryson', '81 Machine Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (13358, '032527663', 'Omar  Valentin', '33 Ned Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (76244, '080769719', 'Ty  Brando', '93 Gifu Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86947, '032124316', 'Karen  Studi', '138 Jamal');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58434, '020686019', 'Garland  Giannini', '88 Warwick Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85267, '090948621', 'Wade  Pantoliano', '779 Wainwright Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (68776, '095089729', 'Jared  Wariner', '42 Llewelyn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65568, '042626851', 'King  Diffie', '66 Klein Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (19196, '036220726', 'Lari  Malkovich', '53 Coventry Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (53416, '024461913', 'Vincent  Paige', '70 Morse Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71762, '042235278', 'Vern  Vince', '41 Bergara Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (12845, '036807775', 'Meredith  Estevez', '43rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (42627, '038327965', 'Taye  McClinton', '40 Coldmeece Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94395, '085710383', 'Marina  Banderas', '82 MacDonald Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65269, '085647824', 'Clea  El-Saher', '638 Phoenix Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46819, '037719973', 'Brendan  Spader', '82 Berkeley Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57522, '088268232', 'Nora  Starr', '23rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (95717, '035745621', 'Fionnula  Klein', '33 Skaggs');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28748, '039005499', 'Johnnie  Hawkins', '27 Solido Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57583, '020444667', 'Gloria  Harrison', '50 Kier Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51455, '021702777', 'Reese  Aaron', '67 Newbury Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (84454, '095473898', 'Ernest  McGovern', '2 Lake Forest Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86683, '043146233', 'Shawn  Lunch', '60 Whitford Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54959, '093777010', 'Ozzy  Creek', '98 Wien Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (99338, '035415536', 'Jim  Shue', '92nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (63578, '026190120', 'Mark  Adkins', '52 Wilson Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (59846, '037403620', 'Carla  Richter', '832 Cazale Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (59785, '082377158', 'Peabo  Benet', '75 Krumholtz Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46276, '029685004', 'Rhett  Cromwell', '35 Rosario Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (14491, '040181620', 'Carlene  Cagle', '42 Dysart Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (29744, '021396164', 'Azucar  Keith', '6 Cuba Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (32598, '086699689', 'Carole  McAnally', '50 Gena Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (26145, '046680170', 'Meryl  Dzundza', '12 Nelly Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41456, '099800354', 'Ossie  McDormand', '17 Sisto Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22689, '044420602', 'Kim  Davidtz', '47 Guest Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (19354, '025408005', 'Eric  Chao', '84 Candice Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (97646, '097801948', 'Rhett  Jessee', '1 Radney Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (33657, '032895540', 'Kyra  Avital', '814 DeVita Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24215, '084797165', 'Viggo  Strathairn', '11 Stockard Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (12956, '085198098', 'Carlos  Hatfield', '78 Farrell Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (13517, '091742573', 'Shannyn  Gore', '15 Cooper Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57478, '043848934', 'Alessandro  Kudrow', '69 Neil');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61349, '035480172', 'Taryn  Porter', '91 Calcutta Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (62163, '021694901', 'Helen  Jeffreys', '82 Richardson Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66398, '095006869', 'Maura  Suvari', '7 Suvari Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (45416, '040020765', 'Domingo  Whitaker', '60 Lucas');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25536, '092140416', 'Marianne  Wen', '4 New Hope Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65295, '093945428', 'Walter  Springfield', '80 Fukui Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94167, '020934366', 'Mindy  Lange', '4 Mainz-kastel Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85931, '090673474', 'Neneh  Hawn', '54 Solikamsk Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48488, '030793850', 'Udo  Kenoly', '35 Benson Street');
commit;
prompt 100 records committed...
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78159, '044796508', 'Toshiro  Leoni', '42nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88766, '047403191', 'Stanley  Brown', '33 Liotta Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86895, '098692111', 'Ossie  Smith', '5 McNarland Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66743, '034435079', 'Don  Esposito', '111 Taylor Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79968, '049218077', 'Dan  Cara', '80 Burlington Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15814, '045628173', 'Joan  Church', '64 Laws Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28463, '082952498', 'Grace  Lonsdale', '22nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25499, '041729755', 'Lily  Cazale', '85 Lahr Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (47741, '090999713', 'Rascal  Birch', '65 Hunt Valley Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (32589, '041408292', 'Alex  Mahoney', '6 Chapman Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58944, '043179412', 'Eileen  Paige', '83 Margulies Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86192, '033619826', 'Ice  Sorvino', '93 Kozani Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (92889, '034412050', 'Bret  Colman', '53 Neil Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (98579, '030272228', 'Cathy  Hidalgo', '67 Tzi Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (76448, '030421937', 'Roy  Whitaker', '95 Butner Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (14132, '025542308', 'Kathy  Gano', '10 Nelly Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (67426, '025933432', 'Katie  Hauser', '19 Bacharach Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (17435, '023878403', 'Frankie  Whitmore', '29 Chris');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65253, '039899467', 'Rawlins  Holmes', '75 Hurt Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36833, '046755353', 'Lynette  Dunn', '32 Plymouth Meeting Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22277, '025944882', 'Dar  Clooney', '74 Hurt Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (69958, '091485403', 'Liquid  Pfeiffer', '21st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88991, '037954622', 'Rachel  Wine', '32 Cate Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25648, '037905462', 'Jill  Parsons', '42 Weir Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83321, '022037344', 'Rod  Swank', '87 Oberwangen Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44422, '031648013', 'Terri  Blackmore', '112 Pasadena Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (74399, '090284882', 'Rodney  Garofalo', '74 Hugh Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (77488, '029531203', 'Taye  Marsden', '95 Sarandon Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24479, '085699316', 'Daryle  Postlethwait', '867 Balk');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44996, '029455694', 'Meredith  Idle', '63 Borger Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96595, '028443272', 'Joseph  Tyler', '61 Herford Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83828, '035372189', 'Vendetta  Hyde', '31st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (52994, '030892793', 'Howard  Ammons', '235 Duesseldorf Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39243, '092272389', 'Laurie  Weisz', '54 Ismaning Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36454, '029780978', 'Stewart  Short', '92nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (68826, '090123158', 'Bob  Moorer', '69 Myles Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37574, '085414520', 'Parker  Tisdale', '84 Berry Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (63671, '028431639', 'Geggy  Hatosy', '88 Waldbronn');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (12888, '086669629', 'Chris  Lowe', '56 Henstridge Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96613, '083170704', 'Forest  Holly', '27 Buffy Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (12658, '021819173', 'Rickie  Hutton', '84 Gifu Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55959, '048804336', 'Talvin  Uggams', '10 Albuquerque Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (59261, '032102998', 'Andrea  Fraser', '929 Vince Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15693, '024685457', 'Carolyn  O''Donnell', '97 Mantegna Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48382, '092829278', 'Robbie  Lonsdale', '6 Recife Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24344, '098516685', 'Lauren  Field', '7 Battle Creek Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71948, '020657831', 'Brian  Hayes', '100 Mickey Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (76974, '034242513', 'King  Hagar', '95 Skarsgard Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (12846, '028692510', 'Jaime  Gill', '83 Sevilla Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65496, '043988607', 'Albert  Hersh', '12 Summerside Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65853, '088119913', 'Clive  Rankin', '100 Posener Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25134, '090170139', 'Rob  Quinones', '706 Freddie Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66926, '024637601', 'Kim  Gill', '92 Burstyn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57213, '087171780', 'Christian  Steagall', '44 Spencer Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (56366, '023148980', 'Alana  Davies', '89 Pulheim-brauweiler Roa');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41326, '023152963', 'Chubby  Swank', '28 Dolenz Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36279, '047865565', 'Hugh  Addy', '74 Nelly Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51932, '092899872', 'Viggo  Garcia', '81st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (74331, '092219599', 'Lloyd  Ripley', '78 Austin Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (43614, '080567010', 'Kitty  Kier', '9 Irkutsk Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (43757, '088794380', 'Vivica  Jackson', '70 Yokohama Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (19631, '043743325', 'Jessica  Sample', '53 Butler');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44546, '026797339', 'Scott  Yankovic', '69 Burr Ridge');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36629, '029433291', 'Derek  Gugino', '73 Cruz Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (17415, '091719688', 'Merillee  Cleary', '230 Calgary Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88768, '042192076', 'Adina  Marsden', '11st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48969, '021997099', 'Cathy  Warwick', '62nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96976, '099325378', 'Ossie  Arkin', '25 Jack Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (72949, '038557630', 'Lynn  McBride', '84 Carlyle Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82229, '036044820', 'Julianne  Meyer', '44 Gordon Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48689, '093300100', 'Alfred  Broadbent', '65 Willie');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (31426, '037792692', 'Micky  Johnson', '264 Lakeville Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (68623, '040982063', 'Merrilee  Archer', '64 Carr');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (18367, '030856873', 'Laurence  Lizzy', '82 Maura Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (98457, '083646944', 'Phil  Cornell', '23 Blaine Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78624, '089330316', 'Phoebe  Lyonne', '27 Shandling Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (38674, '096628658', 'Jesse  Sandler', '86 Mueller-Stahl Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89655, '085388146', 'Ashley  Rhodes', '75 Tamala');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94778, '023579509', 'Fats  Downey', '33 Rickman Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51268, '028132221', 'Xander  Rain', '91 Kid Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85466, '022193717', 'Rhett  McNeice', '238 Fukuoka Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46195, '041577862', 'Carla  Farrow', '9 Shalhoub Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25749, '027074032', 'Philip  Nicks', '93 Mitra Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71786, '021479303', 'Drew  Flanery', '33 Jeremy Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24379, '043429215', 'Nanci  Craddock', '52nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51566, '029469850', 'Rik  Conley', '19 Dayne Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24931, '096874620', 'Marty  Henstridge', '12nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (36814, '020730395', 'Annette  Richards', '87 Ani Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (31345, '032709758', 'Marley  Ness', '74 Edgar Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94696, '097730872', 'Roberta  Nielsen', '88 Stans Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79129, '098392033', 'Lou  Damon', '25 Kirsten Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61565, '039613040', 'Joaquim  Feore', '66 Vertical Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24563, '083411061', 'Colin  Cara', '619 Seth Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48376, '043401101', 'Al  Lopez', '20 Terri Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73857, '086187158', 'Meredith  Patillo', '21 Paris Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (35785, '091289182', 'Terri  Pollak', '32 Isaac Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55395, '039319821', 'Candice  Buffalo', '841 Boise Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (33828, '028501136', 'Eliza  Drive', '20 Magnuson Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (75715, '035753073', 'Nina  Hoffman', '51 Blair Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (75118, '096388485', 'Arnold  Bancroft', '4 Shalhoub Blvd');
commit;
prompt 200 records committed...
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (91966, '099617895', 'Bobby  Cattrall', '31 Rotterdam Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83832, '081805725', 'Colleen  Summer', '889 Diesel');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51231, '042321449', 'Lynn  Johansson', '78 Sylvian Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28466, '033183616', 'Candice  Mazar', '468 Keen Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (27486, '080729639', 'Dabney  Schwarzenegg', '98 Holliston Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25889, '097787398', 'Junior  Channing', '34 Joanna Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54514, '020649049', 'Ivan  Arquette', '73rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51447, '033976317', 'Nicholas  Steenburge', '49 Philadelphia Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82538, '092395840', 'Bebe  Lewis', '77 Crouse Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66689, '049743044', 'Isaac  Henstridge', '40 Harriet Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (69545, '038042680', 'Franco  Frakes', '63 Lily Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64121, '040046273', 'Eric  Burmester', '1 Kyra Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66614, '034716308', 'Katie  Woodward', '82nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (38992, '033316106', 'Earl  Lipnicki', '19 Paris Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (66591, '085096332', 'Max  Langella', '5 Koteas Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57991, '041612592', 'Nikka  Mahoney', '100 Macclesfield Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73885, '094768283', 'Mitchell  Payton', '87 Cochran Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79584, '031591768', 'Edward  Condition', '65 Christina');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (77149, '080409631', 'Janice  Avital', '240 Springville Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (65883, '023158260', 'Crispin  Choice', '60 Cesena Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (53299, '025028757', 'Praga  Kimball', '77 Zaandam Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (32254, '091134014', 'Elle  Brock', '334 Begley Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (18439, '096806728', 'Ricky  Favreau', '50 Kier Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96488, '033707479', 'Sylvester  Steagall', '75 Balk Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39145, '048327169', 'Balthazar  Morton', '18 Ashley Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39963, '026405614', 'Orlando  Olyphant', '8 Reading Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41673, '090518135', 'Debra  MacDonald', '99 Brittany Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (56469, '095167986', 'Nikki  Rush', '76 Wolf Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22514, '037577143', 'Humberto  Fiorentino', '2 Lightfoot Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39269, '039754748', 'Tracy  Child', '25 Carl Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96672, '020794489', 'Richie  Holm', '239 Dayne Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (18442, '028737621', 'Ricky  Cagle', '79 Amos Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24919, '087375548', 'Lucinda  Hawkins', '252 Fichtner');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (56381, '033921332', 'Allison  Owen', '68 James Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (33578, '041307687', 'Nora  O''Neill', '65 Devon Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22586, '037347545', 'Oded  Wariner', '88 Burmester Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (52573, '083507664', 'Tommy  Hudson', '43 Holden Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (34333, '030870090', 'Mary  Vinton', '11 Breslin Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88711, '082738804', 'Bo  Giraldo', '31 Vicious Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86219, '048551980', 'Cloris  Arkin', '93rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (99345, '095852058', 'Victoria  Brothers', '17 Beckham Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (35724, '049451842', 'Horace  Nelson', '53 urban Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89948, '082677648', 'Breckin  Yankovic', '32 Oakland Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46424, '043093707', 'Emilio  Williams', '84 Redding Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (35911, '085823672', 'Nickel  Del Toro', '37 Steven Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (45461, '047950070', 'Kimberly  Leachman', '70 Marina Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (87316, '043214930', 'Mekhi  Blackwell', '20 Levy Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28952, '038991606', 'Stephanie  Garfunkel', '147 Lowe Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88414, '088120618', 'Charlie  Negbaur', '92nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79649, '090707274', 'Machine  Richardson', '98 Suwon-city Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (38356, '032745534', 'Illeana  Byrd', '23 Utrecht Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (42587, '024854184', 'Nik  King', '18 Elche Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (32343, '099720750', 'Randall  Marin', '80 Michaels Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (57331, '021581908', 'Miranda  McGinley', '940 Winslet Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82179, '083486704', 'Elijah  Santa Rosa', '46 Aglukark Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (67738, '034961261', 'Lucy  Jeffreys', '54 Duncan Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61144, '093283316', 'Hookah  Deejay', '38 DeLuise Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64656, '049178685', 'Tamala  Sinise', '46 Craig Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37517, '041512085', 'Vienna  Hutton', '61 Joseph Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37618, '032442838', 'Natacha  Kinnear', '56 Buffy Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (97475, '089602830', 'Trick  Secada', '61 Ming-Na Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64766, '047456570', 'Marie  Kutcher', '89 Blair Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44955, '046929740', 'Lucinda  Tah', '91 Rebhorn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58325, '094538150', 'Jet  Armatrading', '659 Waco');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61912, '043331100', 'Kristin  Assante', '58 Terry Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73382, '049605628', 'Trini  Diddley', '28 O''Sullivan Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24169, '094129073', 'Shannon  Marin', '83 Richmond');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (53162, '037309586', 'Madeline  O''Donnell', '54 Aachen Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (68558, '091601582', 'Owen  Turturro', '83 Charles Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (14434, '082108543', 'Janeane  Rawls', '17 Bell Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (99258, '043671263', 'Mitchell  Hackman', '28 Brock Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37552, '034543376', 'Allison  Lofgren', '16 Gavin Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (45156, '097483036', 'Rosanna  Callow', '91 Collective');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (62992, '092431859', 'Larnelle  Botti', '82 Cash Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (77481, '048555610', 'Andrew  Galecki', '10 Lucy Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64265, '089196601', 'Marianne  Prinze', '32 Reeves Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28596, '093674361', 'Azucar  Baldwin', '39 Judi Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (91773, '049359326', 'Lin  Gyllenhaal', '418 Philadelphia Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (49573, '032350400', 'Marty  Gosdin', '20 Levine Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39921, '035301719', 'Samuel  Gershon', '64 Coburn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78775, '031332187', 'Bo  Black', '21 Szazhalombatta Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (32298, '043955296', 'Candice  Rundgren', '79 Hannover Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (76179, '024624016', 'Jill  Gooding', '97 Geraldine Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61319, '030629857', 'Jeroen  Atkins', '51 Dan');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (69587, '028244606', 'Bryan  Vincent', '36 Walsh Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (41828, '096890727', 'Thomas  Dickinson', '82 San Francisco Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (31464, '046838351', 'Hank  Ronstadt', '31 Zaandam Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96762, '093006346', 'Mili  Payne', '81st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (35331, '092174943', 'Glenn  Thompson', '63 New Castle Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96963, '022824444', 'Reese  Channing', '399 Rosemead Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (61993, '047650892', 'Rose  Swinton', '87 Danger Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (68932, '086496272', 'Jay  Levy', '19 Chemnitz Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78888, '022749713', 'Dianne  Hutch', '19 Mac Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (82736, '099756033', 'Suzanne  Watson', '509 Wilkinson Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (63365, '094555516', 'Tracy  Dillon', '7 Sorvino');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58177, '049672696', 'CeCe  McDonnell', '82nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83772, '029776297', 'Belinda  Sweet', '333 Kirk Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (97516, '035655536', 'Earl  Red', '58 Stuart Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89235, '044156609', 'Donald  Day-Lewis', '53 Maura Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (18131, '038073838', 'Dom  Wilder', '33rd Street');
commit;
prompt 300 records committed...
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (27382, '090160720', 'Cary  Plummer', '143 Morrison Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (46796, '091223555', 'Kelly  Shelton', '28 Saffron');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (67669, '080065410', 'Steve  Weaver', '93 Terrence Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (95833, '029417817', 'Chloe  Rhames', '73rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51611, '085894539', 'Joaquin  Scaggs', '37 Kurtwood Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (35743, '035206807', 'Sander  Lange', '61 Pitstone');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (86846, '023653591', 'Nastassja  Platt', '37 Pitney');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (37634, '021114158', 'Scott  Stanley', '30 Kitty');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89466, '087484830', 'Alana  Alda', '809 Belle Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28835, '048292245', 'Sona  Gyllenhaal', '50 Peter Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (14757, '030704177', 'Amanda  Sarsgaard', '38 Perrineau Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (67864, '030933570', 'Natasha  Osment', '87 Wheel');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (59339, '098844172', 'Ozzy  Aglukark', '41 McLachlan Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (18671, '037300879', 'Vin  Griffin', '55 Kahn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (17919, '021209043', 'Gabrielle  Biehn', '77 Glover Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22673, '080806253', 'Dermot  Hedaya', '37 Krabbe Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51673, '041160989', 'Frank  Sainte-Marie', '33 Hector Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (14656, '041724554', 'Andy  Lemmon', '34 Spresiano');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78954, '028357263', 'Jonny  Carr', '865 Campbell Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (74465, '031228579', 'Chazz  Love', '458 Leslie Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (28984, '044795117', 'Ritchie  Sewell', '29 Lemmon Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96359, '031440637', 'Morgan  Shannon', '46 Lesley');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (19739, '089965822', 'Rosario  Sepulveda', '40 Suwon Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73341, '035032081', 'Fred  Loggins', '21 Gary Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (23968, '097024375', 'Randall  Molina', '40 Mitchell Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (96858, '092798480', 'Dorry  Thewlis', '84 Coverdale Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (75754, '085371820', 'Rosco  Weston', '40 Murdock Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54855, '031660881', 'Kay  McKennitt', '22nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (89243, '085589736', 'Jeanne  Sewell', '5 Shepard Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (52339, '086335684', 'Ricky  Gilliam', '27 Ted Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (74717, '038773989', 'Suzy  Campbell', '21 Salt Lake City Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39337, '028322697', 'Keith  Winans', '41 Jonathan Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15468, '020680008', 'Christine  Eder', '27 Fonda Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85463, '043105040', 'Morris  Kleinenberg', '68 Hughes Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (24938, '027922962', 'Lin  Bosco', '51 Miami Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (49313, '035056174', 'Cliff  Stigers', '28 Koteas Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (39931, '049015341', 'Ali  Mattea', '7 Garry Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88682, '093120290', 'Matt  Pierce', '92 Short Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78345, '083988114', 'Merillee  Spall', '23rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54149, '085043948', 'Harvey  Flanery', '72 Gaby Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79765, '090538223', 'Gordon  Mattea', '91 Savage Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (21117, '090487464', 'Powers  Himmelman', '46 Albert Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (64513, '022071049', 'Rawlins  Hawthorne', '7 Kadison Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (16941, '036842254', 'Julie  Dutton', '43rd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (54147, '098983924', 'Colin  Pesci', '856 Johnette Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (53616, '038389661', 'Lance  Hatfield', '90 Adamstown Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (52277, '047099664', 'Rosanne  Nelligan', '78 Chestnut');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (69998, '083907790', 'Nigel  Margulies', '15 Rollins Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (92597, '047585655', 'Tal  Shelton', '81 Candy Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58186, '032515186', 'Sona  Blanchett', '72nd Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (59816, '032716423', 'Rita  Paige', '11st Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78789, '036356824', 'Gord  Macht', '15 Burr Ridge Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (11131, '020561566', 'Lindsey  Penn', '79 Carlton Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (47431, '046806665', 'Maggie  Tisdale', '87 Paige Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (78249, '049697462', 'Hikaru  Haslam', '85 Mצnchengladbach');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (95955, '030241989', 'Rich  Oldman', '100 Cube Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94289, '097251542', 'Anita  Bullock', '10 Freeman Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (27573, '033179065', 'Charlton  Kenoly', '86 Epps');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (23725, '039294060', 'Howard  Street', '5 Nantes Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22145, '035904091', 'Jackie  Coleman', '40 Haysbert');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73442, '049994966', 'Diamond  Pollak', '44 James Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48374, '089697890', 'Sheryl  Easton', '74 Kelly Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79172, '082545176', 'Andy  Dzundza', '25 Zagreb Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85739, '080728928', 'Teena  McGowan', '41 Mel Ave');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (72541, '031696361', 'Demi  Dillon', '33 Stanley Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (55879, '042934693', 'Anne  Laws', '17 Martin Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15643, '031524441', 'Neve  Cumming', '37 Thornton Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48995, '024875674', 'Marianne  Griffiths', '26 Cherry Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (17632, '035525577', 'Walter  Rippy', '70 Rawlins Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (94184, '096227767', 'David  Bullock', '23 Percy Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (33265, '096946400', 'Charlie  Shatner', '32 Oyten Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (22353, '081584866', 'Aidan  Singh', '903 LeVar Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (53641, '049544552', 'Charlize  Snow', '68 Lynskey Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (79811, '045624371', 'Casey  Palminteri', '55 Warwick Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (77415, '038695481', 'Aida  Skaggs', '45 McGill Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (25388, '086409834', 'Avril  Wahlberg', '682 Cheadle Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (81361, '099510512', 'Rhona  Crystal', '23 Victoria Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15638, '034353526', 'Reese  Lovitz', '47 Hirsch Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (85941, '039263721', 'Jean-Claude  Reinhol', '84 Bening Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (73453, '096993041', 'Sally  Pesci', '58 Paquin Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (26645, '098451170', 'Phoebe  Flemyng', '27 Yaphet');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (16675, '028698426', 'Janice  Horizon', '78 Fiona Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71729, '034069011', 'Jeff  Biel', '30 Canal Winchester Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (58923, '030794324', 'Rory  Stigers', '33 Zrich Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (38486, '090700753', 'Charlize  Jackson', '484 Hawn Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (15254, '037226944', 'Julia  McDonnell', '39 Palo Alto Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (92677, '034862258', 'Ellen  Evett', '100 Hawke Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (51931, '049347271', 'Carl  Kirshner', '899 Anne Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (67679, '035494612', 'Denny  El-Saher', '42 Rhona Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (48197, '084515600', 'Sandra  Gertner', '10 Barnett Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (29371, '082056468', 'Gabrielle  Beatty', '470 St Leonards Drive');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (93651, '037400078', 'Wade  Plimpton', '92 Vega Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (49942, '034861321', 'Jann  Wagner', '100 Darren');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88349, '024490143', 'Sigourney  Wheel', '40 Duschel Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (88291, '085985608', 'Gilberto  Fariq', '95 Knutsford Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (92154, '046661841', 'Kristin  Allan', '19 Buckingham Road');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (71898, '049136547', 'Karon  Imperioli', '4 Rhea Street');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (44222, '025132848', 'Willem  Streep', '918 Gyllenhaal Blvd');
insert into DONATION_PLACE (place_id, place_phone, manager, address)
values (83133, '097717562', 'Gin  Clayton', '29 Malone Road');
commit;
prompt 399 records loaded
prompt Loading PERSON...
insert into PERSON (pid, l_name, f_name, email)
values ('741001511', 'Mills', 'Gina', 'gina.mills@biosite.se');
insert into PERSON (pid, l_name, f_name, email)
values ('879327263', 'Grant', 'Jared', 'j.grant@dynacqinternational.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('705284364', 'Redford', 'Franco', 'franco.redford@pinnaclestaffin');
insert into PERSON (pid, l_name, f_name, email)
values ('027847108', 'Damon', 'Chalee', 'chalee.damon@jollyenterprises.');
insert into PERSON (pid, l_name, f_name, email)
values ('314936445', 'Kimball', 'Bridgette', 'bridgette.kimball@gha.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('957003822', 'Wagner', 'Rufus', 'rufus@kroger.com');
insert into PERSON (pid, l_name, f_name, email)
values ('338160998', 'Robards', 'Illeana', 'illeana.robards@intel.com');
insert into PERSON (pid, l_name, f_name, email)
values ('671348563', 'McDormand', 'Boyd', 'bmcdormand@capstone.fi');
insert into PERSON (pid, l_name, f_name, email)
values ('883953054', 'McKennitt', 'Randy', 'rmckennitt@pacificdatadesigns.');
insert into PERSON (pid, l_name, f_name, email)
values ('971987270', 'Carlton', 'Phoebe', 'phoebe.carlton@sms.de');
insert into PERSON (pid, l_name, f_name, email)
values ('696511331', 'Dzundza', 'Alice', 'alice.d@generalmotors.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('102088648', 'Parsons', 'Rod', 'rod.parsons@sprint.au');
insert into PERSON (pid, l_name, f_name, email)
values ('122410288', 'Dunst', 'Natalie', 'natalie.dunst@infopros.it');
insert into PERSON (pid, l_name, f_name, email)
values ('327291998', 'Dafoe', 'Jeffrey', 'jeffrey.dafoe@americanland.th');
insert into PERSON (pid, l_name, f_name, email)
values ('048646646', 'Ermey', 'Frank', 'fermey@adeasolutions.au');
insert into PERSON (pid, l_name, f_name, email)
values ('086786677', 'Danes', 'Udo', 'u.danes@neogen.de');
insert into PERSON (pid, l_name, f_name, email)
values ('955866429', 'Mars', 'Brian', 'brian.mars@valleyoaksystems.za');
insert into PERSON (pid, l_name, f_name, email)
values ('905128014', 'Stiller', 'Rory', 'r.stiller@parker.com');
insert into PERSON (pid, l_name, f_name, email)
values ('805079576', 'Conlee', 'Spencer', 'spencer.conlee@teoco.com');
insert into PERSON (pid, l_name, f_name, email)
values ('669496513', 'Thewlis', 'Ethan', 'ethan.thewlis@pearllawgroup.at');
insert into PERSON (pid, l_name, f_name, email)
values ('814578172', 'Blige', 'Armand', 'armand@greene.com');
insert into PERSON (pid, l_name, f_name, email)
values ('705852145', 'Laurie', 'Ali', 'alaurie@fns.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('678607374', 'Starr', 'Night', 'night.s@infinity.com');
insert into PERSON (pid, l_name, f_name, email)
values ('168999525', 'Murray', 'Embeth', 'embeth.murray@trafficmanagemen');
insert into PERSON (pid, l_name, f_name, email)
values ('529867055', 'Dolenz', 'Eugene', 'eugened@generalelectric.com');
insert into PERSON (pid, l_name, f_name, email)
values ('235438802', 'McIntosh', 'Nik', 'nik.mcintosh@techbooks.com');
insert into PERSON (pid, l_name, f_name, email)
values ('624208805', 'Kahn', 'Maceo', 'maceo.kahn@travizon.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('237161395', 'Eldard', 'Colin', 'colin.e@mds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('254115667', 'Botti', 'Pelvic', 'pelvic@officedepot.is');
insert into PERSON (pid, l_name, f_name, email)
values ('222632263', 'Lemmon', 'Graham', 'graham@paintedword.com');
insert into PERSON (pid, l_name, f_name, email)
values ('405976889', 'Redford', 'Desmond', 'desmond.redford@mastercardinte');
insert into PERSON (pid, l_name, f_name, email)
values ('824629561', 'LaMond', 'Bonnie', 'bonnie.lamond@ivorysystems.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('640174589', 'Sossamon', 'Marisa', 'm.sossamon@capital.com');
insert into PERSON (pid, l_name, f_name, email)
values ('146114543', 'Redford', 'Terri', 'terri.redford@horizonorganic.u');
insert into PERSON (pid, l_name, f_name, email)
values ('748990413', 'Washington', 'Michael', 'mwashington@fmb.de');
insert into PERSON (pid, l_name, f_name, email)
values ('921565805', 'Devine', 'Vonda', 'vonda@3tsystems.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('026254013', 'Latifah', 'Ritchie', 'ritchie.latifah@processplus.br');
insert into PERSON (pid, l_name, f_name, email)
values ('850736037', 'Gleeson', 'Rik', 'rik.gleeson@taycorfinancial.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('609830431', 'Cronin', 'Lenny', 'l.cronin@air.com');
insert into PERSON (pid, l_name, f_name, email)
values ('936285481', 'Tisdale', 'Ralph', 'ralph.tisdale@fmb.com');
insert into PERSON (pid, l_name, f_name, email)
values ('973262503', 'Michaels', 'First', 'firstm@servicesource.com');
insert into PERSON (pid, l_name, f_name, email)
values ('725345981', 'Womack', 'Nicolas', 'nicolas.womack@esoftsolutions.');
insert into PERSON (pid, l_name, f_name, email)
values ('135639362', 'Postlethwa', 'Ann', 'ann.postlethwaite@pioneermortg');
insert into PERSON (pid, l_name, f_name, email)
values ('751102104', 'Rapaport', 'Chet', 'chet.rapaport@abs.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('037723814', 'Dalley', 'Holland', 'h.dalley@ibfh.com');
insert into PERSON (pid, l_name, f_name, email)
values ('847649340', 'Duke', 'Praga', 'praga@hersheyfoods.de');
insert into PERSON (pid, l_name, f_name, email)
values ('127774563', 'Jane', 'Edgar', 'edgar.jane@capitalautomotive.b');
insert into PERSON (pid, l_name, f_name, email)
values ('744075988', 'Connery', 'Sydney', 'sconnery@lifelinesystems.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('284787689', 'Rundgren', 'Loreena', 'l.rundgren@loreal.com');
insert into PERSON (pid, l_name, f_name, email)
values ('686870106', 'Dorn', 'Wesley', 'wesleyd@prahs.com');
insert into PERSON (pid, l_name, f_name, email)
values ('302017993', 'Hanks', 'Reese', 'reese@usainstruments.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('863266868', 'Cole', 'Philip', 'pcole@yashtechnologies.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('144998512', 'Red', 'Thomas', 'thomas.red@meridiangold.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('007114333', 'Affleck', 'Cesar', 'cesar.affleck@sears.com');
insert into PERSON (pid, l_name, f_name, email)
values ('158592795', 'Carnes', 'Remy', 'remyc@linersdirect.com');
insert into PERSON (pid, l_name, f_name, email)
values ('337702606', 'McKellen', 'Julia', 'julia.mckellen@cooktek.com');
insert into PERSON (pid, l_name, f_name, email)
values ('745115342', 'Mathis', 'Jonathan', 'jonathan.mathis@nat.com');
insert into PERSON (pid, l_name, f_name, email)
values ('636744011', 'Spacek', 'Kathleen', 'kathleen@webgroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('194954711', 'Eldard', 'Dennis', 'dennis.eldard@allegiantbancorp');
insert into PERSON (pid, l_name, f_name, email)
values ('877800245', 'Moore', 'Harrison', 'harrison@atxforms.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('511568325', 'Davies', 'Milla', 'milla.davies@fpf.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('685918534', 'Aniston', 'Merrill', 'merrill.aniston@cardinalcartri');
insert into PERSON (pid, l_name, f_name, email)
values ('187686067', 'Leto', 'Etta', 'etta.leto@idas.za');
insert into PERSON (pid, l_name, f_name, email)
values ('607883888', 'Adkins', 'Adam', 'adam.adkins@peerlessmanufactur');
insert into PERSON (pid, l_name, f_name, email)
values ('581109827', 'Def', 'David', 'david.d@ungertechnologies.com');
insert into PERSON (pid, l_name, f_name, email)
values ('912029990', 'Lizzy', 'Ron', 'ron.lizzy@emt.com');
insert into PERSON (pid, l_name, f_name, email)
values ('234448967', 'Candy', 'Alicia', 'alicia.candy@atxforms.it');
insert into PERSON (pid, l_name, f_name, email)
values ('682887687', 'Garofalo', 'Rosco', 'r.garofalo@hitechpharmacal.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('420963265', 'Benson', 'Kathleen', 'kathleen.benson@iss.au');
insert into PERSON (pid, l_name, f_name, email)
values ('025814164', 'Brandt', 'Saffron', 's.brandt@officedepot.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('255902165', 'Reubens', 'Nancy', 'nancy.r@cardinalcartridge.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('498813862', 'McFadden', 'Mika', 'mmcfadden@columbiabancorp.de');
insert into PERSON (pid, l_name, f_name, email)
values ('364832044', 'Shand', 'Cherry', 'c.shand@sms.cl');
insert into PERSON (pid, l_name, f_name, email)
values ('155686878', 'Checker', 'Nick', 'nick.checker@comglobalsystems.');
insert into PERSON (pid, l_name, f_name, email)
values ('703928930', 'Goodman', 'Diamond', 'diamond.goodman@investorstitle');
insert into PERSON (pid, l_name, f_name, email)
values ('608234327', 'Callow', 'Ian', 'ian@tilsonlandscape.com');
insert into PERSON (pid, l_name, f_name, email)
values ('569849442', 'Calle', 'Kiefer', 'kiefer.calle@hps.au');
insert into PERSON (pid, l_name, f_name, email)
values ('484654164', 'Schreiber', 'Alannah', 'alannah.schreiber@safeway.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('984430684', 'Cage', 'Reese', 'reese.cage@coadvantageresource');
insert into PERSON (pid, l_name, f_name, email)
values ('165166680', 'Lucien', 'Elizabeth', 'elizabeth.lucien@mavericktechn');
insert into PERSON (pid, l_name, f_name, email)
values ('300360696', 'Linney', 'Mary', 'mary.linney@conagra.com');
insert into PERSON (pid, l_name, f_name, email)
values ('047437879', 'Garcia', 'Gin', 'g.garcia@americanmegacom.de');
insert into PERSON (pid, l_name, f_name, email)
values ('570331042', 'Duschel', 'Garry', 'garryd@staffone.com');
insert into PERSON (pid, l_name, f_name, email)
values ('720532971', 'Tyson', 'Alana', 'alana.tyson@whitewave.com');
insert into PERSON (pid, l_name, f_name, email)
values ('710020129', 'Moreno', 'Rhona', 'rhona.moreno@portosan.de');
insert into PERSON (pid, l_name, f_name, email)
values ('975627046', 'Baker', 'Keanu', 'keanu.b@catamount.com');
insert into PERSON (pid, l_name, f_name, email)
values ('108935075', 'Diaz', 'Rascal', 'rascal@gci.ee');
insert into PERSON (pid, l_name, f_name, email)
values ('869446489', 'Holbrook', 'Lindsey', 'lindsey.h@gra.com');
insert into PERSON (pid, l_name, f_name, email)
values ('579667581', 'Steiger', 'Maceo', 'maceo.steiger@slt.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('998387270', 'Quinones', 'Victoria', 'victoria.quinones@marsinc.de');
insert into PERSON (pid, l_name, f_name, email)
values ('724101704', 'Maxwell', 'Gena', 'gena.maxwell@priorityleasing.j');
insert into PERSON (pid, l_name, f_name, email)
values ('152572605', 'Clarkson', 'Charlie', 'c.clarkson@sis.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('864233203', 'Idol', 'Stockard', 'stockard.idol@globalwireless.i');
insert into PERSON (pid, l_name, f_name, email)
values ('309682546', 'Jane', 'Roberta', 'r.jane@educationaldevelopment.');
insert into PERSON (pid, l_name, f_name, email)
values ('033422444', 'Katt', 'Anita', 'a.katt@sandyspringbancorp.gr');
insert into PERSON (pid, l_name, f_name, email)
values ('235987479', 'Patton', 'Lionel', 'lionel.patton@prometheuslabora');
insert into PERSON (pid, l_name, f_name, email)
values ('210816127', 'Tate', 'Mint', 'mint.tate@yes.de');
insert into PERSON (pid, l_name, f_name, email)
values ('275373015', 'Bullock', 'Bobby', 'bobbyb@otbd.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('189838507', 'Miles', 'Terrence', 'terrence@gulfmarkoffshore.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('177101709', 'Estevez', 'Gina', 'gestevez@meghasystems.fr');
commit;
prompt 100 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('780366947', 'Wariner', 'Debbie', 'debbie.w@procter.com');
insert into PERSON (pid, l_name, f_name, email)
values ('187579649', 'Chesnutt', 'Pat', 'pat.chesnutt@fflcbancorp.de');
insert into PERSON (pid, l_name, f_name, email)
values ('652031992', 'Close', 'Lucinda', 'l.close@campbellsoup.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('047371408', 'Stallone', 'Frankie', 'f.stallone@spectrum.com');
insert into PERSON (pid, l_name, f_name, email)
values ('924624068', 'Hobson', 'Olga', 'olga.hobson@venoco.com');
insert into PERSON (pid, l_name, f_name, email)
values ('696814618', 'Ermey', 'Moe', 'mermey@gltg.gr');
insert into PERSON (pid, l_name, f_name, email)
values ('543955576', 'Ratzenberg', 'Earl', 'earl@qas.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('299685315', 'Burrows', 'Norm', 'norm.burrows@abs.it');
insert into PERSON (pid, l_name, f_name, email)
values ('318447492', 'Fisher', 'Kyle', 'k.fisher@iss.in');
insert into PERSON (pid, l_name, f_name, email)
values ('799167503', 'McDowall', 'Vertical', 'vertical.mcdowall@sm.com');
insert into PERSON (pid, l_name, f_name, email)
values ('833298755', 'Reeves', 'Vanessa', 'vanessa.reeves@mai.com');
insert into PERSON (pid, l_name, f_name, email)
values ('754632393', 'Levert', 'Lee', 'lee@epamsystems.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('895770231', 'Broza', 'Gil', 'gil@innovateecommerce.br');
insert into PERSON (pid, l_name, f_name, email)
values ('400917628', 'Flatts', 'Aaron', 'aaron.f@unitedasset.com');
insert into PERSON (pid, l_name, f_name, email)
values ('614391180', 'Pierce', 'Mac', 'mpierce@grt.com');
insert into PERSON (pid, l_name, f_name, email)
values ('768494443', 'Cheadle', 'Marc', 'marc.cheadle@knightsbridge.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('843231819', 'Mars', 'Lynn', 'lynn.mars@bayer.com');
insert into PERSON (pid, l_name, f_name, email)
values ('007507474', 'Horton', 'Jena', 'jena.horton@sht.ee');
insert into PERSON (pid, l_name, f_name, email)
values ('042237113', 'Wine', 'Rupert', 'rupert.wine@gci.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('072168409', 'Rebhorn', 'Edie', 'e.rebhorn@scheringplough.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('076083621', 'Schneider', 'Hank', 'hank.schneider@americanexpress');
insert into PERSON (pid, l_name, f_name, email)
values ('307716898', 'Flatts', 'Edie', 'edie.flatts@abs.it');
insert into PERSON (pid, l_name, f_name, email)
values ('082557774', 'Rush', 'Chazz', 'chazz.rush@viacell.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('720298946', 'Guilfoyle', 'Liam', 'liam.guilfoyle@saralee.com');
insert into PERSON (pid, l_name, f_name, email)
values ('562748536', 'Wine', 'Ice', 'ice.wine@formatech.au');
insert into PERSON (pid, l_name, f_name, email)
values ('477713746', 'Warwick', 'Nils', 'nils@spenser.com');
insert into PERSON (pid, l_name, f_name, email)
values ('539682561', 'Kingsley', 'Anne', 'anne.kingsley@scriptsave.at');
insert into PERSON (pid, l_name, f_name, email)
values ('948688656', 'Madsen', 'Hikaru', 'hikaru.madsen@mag.com');
insert into PERSON (pid, l_name, f_name, email)
values ('871930292', 'McCormack', 'Pamela', 'pamela.mccormack@comnetinterna');
insert into PERSON (pid, l_name, f_name, email)
values ('432174519', 'Isaak', 'Rob', 'rob@pib.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('961032191', 'D''Onofrio', 'Mary-Louis', 'marylouise.donofrio@tps.be');
insert into PERSON (pid, l_name, f_name, email)
values ('658306554', 'Abraham', 'Maureen', 'mabraham@sfgo.com');
insert into PERSON (pid, l_name, f_name, email)
values ('558068638', 'Dupree', 'Teena', 'teena.dupree@wrgservices.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('979932926', 'Cage', 'Taylor', 'taylor.cage@mre.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('555029781', 'Loeb', 'Marianne', 'marianne.loeb@usdairyproducers');
insert into PERSON (pid, l_name, f_name, email)
values ('053878653', 'Prinze', 'Neve', 'neve.prinze@northhighland.za');
insert into PERSON (pid, l_name, f_name, email)
values ('276143046', 'Idle', 'Etta', 'etta.idle@medsource.com');
insert into PERSON (pid, l_name, f_name, email)
values ('012584652', 'Shawn', 'Jonny Lee', 'jonnylee.shawn@cis.br');
insert into PERSON (pid, l_name, f_name, email)
values ('999833209', 'Rundgren', 'Ozzy', 'ozzy.rundgren@kingston.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('242316965', 'Caan', 'Jeffrey', 'jeffrey.caan@quicksilverresour');
insert into PERSON (pid, l_name, f_name, email)
values ('056054703', 'Dillane', 'Juliet', 'juliet.dillane@solutionbuilder');
insert into PERSON (pid, l_name, f_name, email)
values ('483453321', 'Cross', 'Clea', 'clea.cross@cardtronics.de');
insert into PERSON (pid, l_name, f_name, email)
values ('929475618', 'Tempest', 'Marc', 'm.tempest@clorox.com');
insert into PERSON (pid, l_name, f_name, email)
values ('175781268', 'Joli', 'Fisher', 'fisher.j@innovativelighting.co');
insert into PERSON (pid, l_name, f_name, email)
values ('687549039', 'Hawke', 'Frances', 'fhawke@newmedia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('190466061', 'Anderson', 'Seann', 'sanderson@procurementcentre.pe');
insert into PERSON (pid, l_name, f_name, email)
values ('517541852', 'Shepherd', 'Tia', 'tia.shepherd@walmartstores.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('585289028', 'Shalhoub', 'Kyle', 'kshalhoub@biosite.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('058760424', 'Klugh', 'Yolanda', 'y.klugh@safeway.li');
insert into PERSON (pid, l_name, f_name, email)
values ('629756673', 'Pollak', 'Chet', 'c.pollak@anworthmortgage.de');
insert into PERSON (pid, l_name, f_name, email)
values ('200291980', 'Stowe', 'Giancarlo', 'giancarlo@studiobproductions.c');
insert into PERSON (pid, l_name, f_name, email)
values ('916533775', 'Jeffreys', 'Benicio', 'benicio.jeffreys@mavericktechn');
insert into PERSON (pid, l_name, f_name, email)
values ('541317968', 'Twilley', 'Keith', 'keith.twilley@morganresearch.d');
insert into PERSON (pid, l_name, f_name, email)
values ('671800521', 'LuPone', 'Kirk', 'kirk.lupone@aristotle.es');
insert into PERSON (pid, l_name, f_name, email)
values ('913942557', 'Schneider', 'Vertical', 'vertical.schneider@componentgr');
insert into PERSON (pid, l_name, f_name, email)
values ('785897554', 'Aglukark', 'Gordie', 'gordie.aglukark@news.com');
insert into PERSON (pid, l_name, f_name, email)
values ('489718006', 'Imbruglia', 'Gwyneth', 'gwyneth.imbruglia@serentec.it');
insert into PERSON (pid, l_name, f_name, email)
values ('647035053', 'Morton', 'Burt', 'burt.morton@nobrainerblindscom');
insert into PERSON (pid, l_name, f_name, email)
values ('724367146', 'Aglukark', 'Charles', 'charles.aglukark@hotmail.be');
insert into PERSON (pid, l_name, f_name, email)
values ('610341868', 'Vega', 'Richie', 'rvega@aci.de');
insert into PERSON (pid, l_name, f_name, email)
values ('654060128', 'Balaban', 'Arturo', 'a.balaban@tarragonrealty.com');
insert into PERSON (pid, l_name, f_name, email)
values ('934021441', 'Boyle', 'Joseph', 'joseph.boyle@saksinc.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('904803417', 'Stiers', 'Zooey', 'zooey.stiers@glacierbancorp.be');
insert into PERSON (pid, l_name, f_name, email)
values ('552163784', 'Rudd', 'Pete', 'pete.rudd@ait.com');
insert into PERSON (pid, l_name, f_name, email)
values ('946938069', 'Ferrell', 'Jackie', 'jackie.f@actechnologies.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('048142005', 'Gellar', 'Bryan', 'bgellar@serentec.com');
insert into PERSON (pid, l_name, f_name, email)
values ('667505144', 'Wiedlin', 'Julie', 'julie.wiedlin@dcgroup.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('780987486', 'Janssen', 'Burton', 'burton.janssen@kellogg.de');
insert into PERSON (pid, l_name, f_name, email)
values ('370632269', 'Lucien', 'Amy', 'amy@solutionbuilders.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('569879560', 'Cagle', 'Joey', 'joey.c@refinery.br');
insert into PERSON (pid, l_name, f_name, email)
values ('711285053', 'Biehn', 'Ali', 'abiehn@invisioncom.de');
insert into PERSON (pid, l_name, f_name, email)
values ('009223928', 'Trevino', 'Ronny', 'ronny.trevino@tilsonlandscape.');
insert into PERSON (pid, l_name, f_name, email)
values ('725569007', 'Getty', 'Kid', 'kid.getty@arkidata.com');
insert into PERSON (pid, l_name, f_name, email)
values ('057913650', 'Maxwell', 'Geggy', 'g.maxwell@capitolbancorp.il');
insert into PERSON (pid, l_name, f_name, email)
values ('402786140', 'Rhymes', 'Parker', 'parker.rhymes@sbc.se');
insert into PERSON (pid, l_name, f_name, email)
values ('889872686', 'King', 'Goran', 'goran.king@mls.com');
insert into PERSON (pid, l_name, f_name, email)
values ('243329904', 'Wills', 'Colm', 'c.wills@talx.za');
insert into PERSON (pid, l_name, f_name, email)
values ('104654240', 'Hoskins', 'Veruca', 'veruca.hoskins@apexsystems.ht');
insert into PERSON (pid, l_name, f_name, email)
values ('185498109', 'Soul', 'Pat', 'pat@pis.it');
insert into PERSON (pid, l_name, f_name, email)
values ('998752021', 'Holiday', 'Steve', 'steve.holiday@intraspheretechn');
insert into PERSON (pid, l_name, f_name, email)
values ('117964189', 'Buffalo', 'Simon', 'simonb@trx.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('321643516', 'Solido', 'Trace', 'trace@grs.li');
insert into PERSON (pid, l_name, f_name, email)
values ('807810311', 'Carlton', 'Sylvester', 'sylvester.carlton@fam.de');
insert into PERSON (pid, l_name, f_name, email)
values ('135856510', 'Gallant', 'Rosanne', 'rgallant@fds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('127611024', 'Hatfield', 'Hilary', 'hilary.h@emt.br');
insert into PERSON (pid, l_name, f_name, email)
values ('306609285', 'Goldberg', 'Herbie', 'herbie.goldberg@wav.il');
insert into PERSON (pid, l_name, f_name, email)
values ('449103116', 'Curry', 'Noah', 'noah.c@creditorsinterchange.it');
insert into PERSON (pid, l_name, f_name, email)
values ('160539133', 'Phillips', 'Mekhi', 'mphillips@parker.com');
insert into PERSON (pid, l_name, f_name, email)
values ('656361203', 'Penn', 'Rosanna', 'rosanna.penn@morganresearch.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('499419072', 'Numan', 'Samuel', 'samuel.numan@ibm.com');
insert into PERSON (pid, l_name, f_name, email)
values ('312041206', 'McAnally', 'Anjelica', 'anjelica@monitronicsinternatio');
insert into PERSON (pid, l_name, f_name, email)
values ('616117735', 'Rains', 'Miriam', 'miriam@aoe.de');
insert into PERSON (pid, l_name, f_name, email)
values ('099929610', 'Eldard', 'Ricky', 'ricky.eldard@parksite.it');
insert into PERSON (pid, l_name, f_name, email)
values ('692375929', 'Blanchett', 'Dorry', 'dorry.blanchett@arkidata.br');
insert into PERSON (pid, l_name, f_name, email)
values ('242952342', 'Gayle', 'Natacha', 'ngayle@sci.de');
insert into PERSON (pid, l_name, f_name, email)
values ('119591809', 'Shandling', 'Jamie', 'jshandling@ipsadvisory.it');
insert into PERSON (pid, l_name, f_name, email)
values ('922303690', 'Ferry', 'Ritchie', 'ritchie.ferry@portosan.com');
insert into PERSON (pid, l_name, f_name, email)
values ('291811666', 'Aaron', 'Claire', 'claire@topicsentertainment.de');
insert into PERSON (pid, l_name, f_name, email)
values ('118056743', 'Epps', 'Gordie', 'gordie@myricom.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('178613896', 'Maguire', 'Toni', 'toni@topicsentertainment.br');
commit;
prompt 200 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('639454824', 'Hornsby', 'Red', 'red.h@cocacola.com');
insert into PERSON (pid, l_name, f_name, email)
values ('526197154', 'Schwimmer', 'Dianne', 'dschwimmer@quicksilverresource');
insert into PERSON (pid, l_name, f_name, email)
values ('843853299', 'Sevigny', 'Boyd', 'boyd.sevigny@biosite.de');
insert into PERSON (pid, l_name, f_name, email)
values ('164633012', 'Brooks', 'Curtis', 'curtis.brooks@yashtechnologies');
insert into PERSON (pid, l_name, f_name, email)
values ('169295786', 'McDowell', 'Benicio', 'b.mcdowell@educationaldevelopm');
insert into PERSON (pid, l_name, f_name, email)
values ('472188320', 'Maxwell', 'Jean', 'jeanm@nha.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('975197627', 'McGowan', 'Natalie', 'natalie@topicsentertainment.co');
insert into PERSON (pid, l_name, f_name, email)
values ('096150305', 'Richter', 'Giovanni', 'g.richter@limitedbrands.de');
insert into PERSON (pid, l_name, f_name, email)
values ('837205710', 'Ingram', 'Earl', 'earl.i@floorgraphics.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('385432292', 'McKean', 'Teri', 'teri.mckean@yashtechnologies.c');
insert into PERSON (pid, l_name, f_name, email)
values ('185943132', 'Johansen', 'Darren', 'djohansen@worldcom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('942081370', 'Bachman', 'Jeroen', 'jeroen@talx.com');
insert into PERSON (pid, l_name, f_name, email)
values ('160587152', 'Garza', 'Murray', 'murray.g@vitacostcom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('777329528', 'Scorsese', 'Avenged', 'a.scorsese@pfizer.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('585972131', 'Lachey', 'Beverley', 'beverley.lachey@prosperitybanc');
insert into PERSON (pid, l_name, f_name, email)
values ('262097637', 'Maxwell', 'Ivan', 'ivan.m@technica.com');
insert into PERSON (pid, l_name, f_name, email)
values ('197068774', 'Mahoney', 'Mickey', 'mmahoney@tigris.com');
insert into PERSON (pid, l_name, f_name, email)
values ('918868012', 'Stevenson', 'Donna', 'donna.stevenson@abs.br');
insert into PERSON (pid, l_name, f_name, email)
values ('378544977', 'Scott', 'Cole', 'cole@tama.com');
insert into PERSON (pid, l_name, f_name, email)
values ('870604477', 'Baldwin', 'Dermot', 'dermot.baldwin@kiamotors.com');
insert into PERSON (pid, l_name, f_name, email)
values ('728276285', 'Mirren', 'Christian', 'christian.mirren@qestrel.com');
insert into PERSON (pid, l_name, f_name, email)
values ('684744404', 'Flatts', 'Salma', 'salma@drinkmorewater.com');
insert into PERSON (pid, l_name, f_name, email)
values ('320257722', 'Warren', 'Praga', 'pragaw@kramontrealty.se');
insert into PERSON (pid, l_name, f_name, email)
values ('955756531', 'Foster', 'Geraldine', 'gfoster@tripwire.de');
insert into PERSON (pid, l_name, f_name, email)
values ('421599017', 'MacIsaac', 'Rachel', 'rachelm@ptg.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('683868829', 'Arnold', 'Jeffrey', 'jeffrey.arnold@diageo.com');
insert into PERSON (pid, l_name, f_name, email)
values ('766363065', 'Joli', 'Nigel', 'nigel@monitronicsinternational');
insert into PERSON (pid, l_name, f_name, email)
values ('798501024', 'Danger', 'Marie', 'marie.danger@restaurantpartner');
insert into PERSON (pid, l_name, f_name, email)
values ('566880805', 'Durning', 'Gabrielle', 'gabrielle.d@columbiabancorp.co');
insert into PERSON (pid, l_name, f_name, email)
values ('189173569', 'Tillis', 'Geena', 'geena.tillis@labradanutrition.');
insert into PERSON (pid, l_name, f_name, email)
values ('699031142', 'Place', 'Alfie', 'alfie.place@isd.com');
insert into PERSON (pid, l_name, f_name, email)
values ('717899149', 'Rifkin', 'Denzel', 'd.rifkin@ultimus.my');
insert into PERSON (pid, l_name, f_name, email)
values ('575116250', 'Sherman', 'Azucar', 'azucar@simplycertificates.hk');
insert into PERSON (pid, l_name, f_name, email)
values ('697207496', 'Rawls', 'Christine', 'christine.rawls@qls.es');
insert into PERSON (pid, l_name, f_name, email)
values ('885461855', 'Pepper', 'Adam', 'adam.pepper@spd.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('758794404', 'Lonsdale', 'Tori', 'tori.lonsdale@unilever.au');
insert into PERSON (pid, l_name, f_name, email)
values ('735718988', 'Tobolowsky', 'Bobbi', 'b.tobolowsky@cynergydata.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('867821231', 'Orbit', 'Ty', 'ty.o@portosan.it');
insert into PERSON (pid, l_name, f_name, email)
values ('633842121', 'Quaid', 'Davy', 'd.quaid@avr.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('846145465', 'Carrey', 'Andie', 'acarrey@yashtechnologies.de');
insert into PERSON (pid, l_name, f_name, email)
values ('394672992', 'Place', 'Davy', 'davy@jsa.com');
insert into PERSON (pid, l_name, f_name, email)
values ('549198520', 'Lucien', 'Omar', 'omar.l@qssgroup.de');
insert into PERSON (pid, l_name, f_name, email)
values ('348429042', 'Laurie', 'Sammy', 'sammy.laurie@aldensystems.it');
insert into PERSON (pid, l_name, f_name, email)
values ('987143521', 'Suvari', 'Phoebe', 'phoebe.suvari@prahs.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('460950567', 'Studi', 'Miles', 'm.studi@learningvoyage.se');
insert into PERSON (pid, l_name, f_name, email)
values ('028499772', 'Mac', 'Mae', 'mae@anworthmortgage.de');
insert into PERSON (pid, l_name, f_name, email)
values ('487945649', 'Johnson', 'Jack', 'jack.j@sds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('267941315', 'Rodriguez', 'Adina', 'adina.rodriguez@accucode.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('607145805', 'Boone', 'Frances', 'frances.b@ois.au');
insert into PERSON (pid, l_name, f_name, email)
values ('769552944', 'Dale', 'Kelli', 'kelli.dale@at.com');
insert into PERSON (pid, l_name, f_name, email)
values ('801867813', 'Michaels', 'Julie', 'julie.michaels@trafficmanageme');
insert into PERSON (pid, l_name, f_name, email)
values ('553172301', 'Dushku', 'Jesse', 'jesse.dushku@kroger.com');
insert into PERSON (pid, l_name, f_name, email)
values ('217964120', 'Shelton', 'Lila', 'lshelton@multimedialive.hu');
insert into PERSON (pid, l_name, f_name, email)
values ('268303729', 'O''Keefe', 'Lindsay', 'lindsay.okeefe@nsd.au');
insert into PERSON (pid, l_name, f_name, email)
values ('781615940', 'Rollins', 'Gordon', 'gordon@globalwireless.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('825718771', 'Midler', 'Marley', 'marley.midler@volkswagen.com');
insert into PERSON (pid, l_name, f_name, email)
values ('676507263', 'Cole', 'Penelope', 'penelope.cole@sps.hk');
insert into PERSON (pid, l_name, f_name, email)
values ('014472246', 'Murdock', 'Jim', 'jim.murdock@mitsubishimotors.d');
insert into PERSON (pid, l_name, f_name, email)
values ('960125605', 'Burke', 'Isaiah', 'iburke@marriottinternational.c');
insert into PERSON (pid, l_name, f_name, email)
values ('306519991', 'McAnally', 'Colm', 'c.mcanally@onesourceprinting.d');
insert into PERSON (pid, l_name, f_name, email)
values ('936071589', 'Raye', 'Ricky', 'rickyr@volkswagen.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('155290755', 'Minogue', 'Katrin', 'kminogue@venoco.com');
insert into PERSON (pid, l_name, f_name, email)
values ('277620976', 'Kinney', 'Lois', 'lois.kinney@montpelierplastics');
insert into PERSON (pid, l_name, f_name, email)
values ('485394887', 'O''Sullivan', 'Jann', 'josullivan@bestbuy.com');
insert into PERSON (pid, l_name, f_name, email)
values ('338471203', 'LaMond', 'Donal', 'donal.lamond@iss.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('382880573', 'Whitley', 'Leslie', 'l.whitley@worldcom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('903441905', 'Eat World', 'Ann', 'ann.eatworld@hotmail.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('546866848', 'McKean', 'Cloris', 'cmckean@arkidata.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('892697604', 'Buckingham', 'Caroline', 'caroline.buckingham@accessus.c');
insert into PERSON (pid, l_name, f_name, email)
values ('237230933', 'Hopper', 'Clea', 'clea.h@floorgraphics.it');
insert into PERSON (pid, l_name, f_name, email)
values ('555251729', 'Lonsdale', 'Christian', 'c.lonsdale@nat.com');
insert into PERSON (pid, l_name, f_name, email)
values ('980638570', 'Crudup', 'Anthony', 'anthony.crudup@gillani.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('735680597', 'Cochran', 'Balthazar', 'balthazar.c@swi.it');
insert into PERSON (pid, l_name, f_name, email)
values ('804262485', 'Prowse', 'Jill', 'jill.prowse@knightsbridge.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('450416883', 'Campbell', 'Tzi', 'tcampbell@trafficmanagement.co');
insert into PERSON (pid, l_name, f_name, email)
values ('328315189', 'Lithgow', 'Carla', 'carla.lithgow@lydiantrust.de');
insert into PERSON (pid, l_name, f_name, email)
values ('888234961', 'Davies', 'Uma', 'uma.davies@topicsentertainment');
insert into PERSON (pid, l_name, f_name, email)
values ('025463211', 'Duncan', 'Julianne', 'julianne@infopros.com');
insert into PERSON (pid, l_name, f_name, email)
values ('535041462', 'Osment', 'Robby', 'robby.osment@younginnovations.');
insert into PERSON (pid, l_name, f_name, email)
values ('733752111', 'Lunch', 'Kenneth', 'kenneth.l@asa.ge');
insert into PERSON (pid, l_name, f_name, email)
values ('758274846', 'Palmieri', 'Stellan', 'stellan.palmieri@capstone.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('589644176', 'Balaban', 'Brendan', 'b.balaban@ssi.il');
insert into PERSON (pid, l_name, f_name, email)
values ('591978627', 'Kadison', 'Faye', 'fayek@emt.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('405441891', 'Madsen', 'Kylie', 'kylie.madsen@dbprofessionals.h');
insert into PERSON (pid, l_name, f_name, email)
values ('258054874', 'Crow', 'Brittany', 'brittany.c@gtp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('574670543', 'Popper', 'Denis', 'denis.popper@spenser.com');
insert into PERSON (pid, l_name, f_name, email)
values ('934604634', 'Benet', 'Sona', 'sona.benet@generalmotors.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('397861085', 'Frost', 'George', 'george@gillani.com');
insert into PERSON (pid, l_name, f_name, email)
values ('148142939', 'Mazzello', 'Franz', 'franz.m@noodles.com');
insert into PERSON (pid, l_name, f_name, email)
values ('975087097', 'Hewett', 'Eddie', 'eddie.hewett@owm.de');
insert into PERSON (pid, l_name, f_name, email)
values ('083033817', 'Lineback', 'George', 'george.lineback@campbellsoup.u');
insert into PERSON (pid, l_name, f_name, email)
values ('651709121', 'Burns', 'Claire', 'c.burns@dearbornbancorp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('966599466', 'Tate', 'Stanley', 'stanley@ccfholding.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('137408341', 'Vinton', 'Franco', 'francov@ams.com');
insert into PERSON (pid, l_name, f_name, email)
values ('610422260', 'Tsettos', 'Freda', 'f.tsettos@appriss.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('120237174', 'Pacino', 'Emm', 'emm.pacino@hersheyfoods.com');
insert into PERSON (pid, l_name, f_name, email)
values ('096753723', 'Ledger', 'Anna', 'annal@viacom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('040189678', 'Mason', 'Ahmad', 'ahmad.mason@contract.com');
insert into PERSON (pid, l_name, f_name, email)
values ('723445327', 'Hunt', 'Ty', 'ty.hunt@ezecastlesoftware.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('491908247', 'Barkin', 'Rufus', 'rbarkin@spas.il');
commit;
prompt 300 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('553126149', 'MacDowell', 'Quentin', 'quentin.macdowell@parksite.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('662192261', 'Hutch', 'Paula', 'paulah@telepoint.in');
insert into PERSON (pid, l_name, f_name, email)
values ('319449185', 'Curfman', 'Jessica', 'jessica.curfman@actechnologies');
insert into PERSON (pid, l_name, f_name, email)
values ('051082800', 'Nivola', 'Jeanne', 'jeanne.nivola@fsffinancial.com');
insert into PERSON (pid, l_name, f_name, email)
values ('064148482', 'Sinatra', 'Wade', 'wades@bis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('810335751', 'Leary', 'Davis', 'd.leary@airmethods.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('363254369', 'Brothers', 'Rosario', 'rosario@epamsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('062397734', 'Cartlidge', 'Ruth', 'ruth.cartlidge@emt.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('196320530', 'McGregor', 'Salma', 'salma.mcgregor@providentbancor');
insert into PERSON (pid, l_name, f_name, email)
values ('736496191', 'Mulroney', 'Forest', 'forestm@globalwireless.com');
insert into PERSON (pid, l_name, f_name, email)
values ('509099107', 'Soul', 'Coley', 'coley.s@gltg.com');
insert into PERSON (pid, l_name, f_name, email)
values ('710171141', 'Romijn-Sta', 'Bobbi', 'bobbi@unitedasset.be');
insert into PERSON (pid, l_name, f_name, email)
values ('226160015', 'Lemmon', 'Sophie', 'sophie.lemmon@kelmooreinvestme');
insert into PERSON (pid, l_name, f_name, email)
values ('729784083', 'Weber', 'Radney', 'radney.weber@astute.com');
insert into PERSON (pid, l_name, f_name, email)
values ('117282105', 'Palmer', 'Radney', 'radney.p@gltg.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('266733257', 'Lithgow', 'Albertina', 'albertina.lithgow@printtech.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('906351253', 'Shatner', 'Hank', 'hank.shatner@outsourcegroup.co');
insert into PERSON (pid, l_name, f_name, email)
values ('277449834', 'Oldman', 'Rachael', 'roldman@typhoon.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('903657654', 'Oakenfold', 'Paula', 'p.oakenfold@sbc.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('980953239', 'Solido', 'Joseph', 'joseph@mindiq.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('706458768', 'Oldman', 'Jude', 'jude.o@newhorizons.com');
insert into PERSON (pid, l_name, f_name, email)
values ('229285022', 'Firth', 'Curtis', 'cfirth@benecongroup.de');
insert into PERSON (pid, l_name, f_name, email)
values ('230001479', 'Mazzello', 'Sona', 'sona.mazzello@hcoa.com');
insert into PERSON (pid, l_name, f_name, email)
values ('826771104', 'Caine', 'Herbie', 'herbie.caine@tama.de');
insert into PERSON (pid, l_name, f_name, email)
values ('539935524', 'Warden', 'Geoff', 'geoff@capital.it');
insert into PERSON (pid, l_name, f_name, email)
values ('807196691', 'Pacino', 'Jaime', 'jaimep@diamondtechnologies.com');
insert into PERSON (pid, l_name, f_name, email)
values ('811692127', 'Buffalo', 'Kiefer', 'kieferb@pulaskifinancial.com');
insert into PERSON (pid, l_name, f_name, email)
values ('789725238', 'Nightingal', 'Merrilee', 'merrilee@worldcom.br');
insert into PERSON (pid, l_name, f_name, email)
values ('617696093', 'Lithgow', 'Gailard', 'gailard.lithgow@mastercardinte');
insert into PERSON (pid, l_name, f_name, email)
values ('175321868', 'Moorer', 'Cherry', 'cherry.moorer@volkswagen.com');
insert into PERSON (pid, l_name, f_name, email)
values ('430122909', 'Nicholson', 'Steve', 'steve.n@usenergyservices.com');
insert into PERSON (pid, l_name, f_name, email)
values ('289180854', 'England', 'Katrin', 'k.england@pioneerdatasystems.c');
insert into PERSON (pid, l_name, f_name, email)
values ('503465463', 'Chandler', 'Patti', 'patti.c@electricalsolutions.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('181089406', 'Theron', 'Curt', 'curt.t@pfizer.com');
insert into PERSON (pid, l_name, f_name, email)
values ('493961904', 'Cusack', 'Jeroen', 'jeroenc@mwh.com');
insert into PERSON (pid, l_name, f_name, email)
values ('623731843', 'Haslam', 'Jessica', 'jessica.haslam@fsffinancial.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('809620168', 'Brock', 'Lynn', 'lynn.brock@scjohnson.com');
insert into PERSON (pid, l_name, f_name, email)
values ('318213261', 'Irons', 'Brendan', 'b.irons@topicsentertainment.de');
insert into PERSON (pid, l_name, f_name, email)
values ('053144728', 'McGregor', 'Isabella', 'isabella.mcgregor@sis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('735103801', 'Douglas', 'Sonny', 'sdouglas@advancedneuromodulati');
insert into PERSON (pid, l_name, f_name, email)
values ('757024709', 'Studi', 'Darren', 'darrens@hitechpharmacal.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('915523925', 'Warwick', 'Susan', 'susan.warwick@pharmacia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('320079562', 'Ontiveros', 'Thelma', 'thelma.o@sps.com');
insert into PERSON (pid, l_name, f_name, email)
values ('551911744', 'Conners', 'Garth', 'garth.conners@curagroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('093051335', 'Polley', 'Casey', 'casey.polley@drinkmorewater.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('987133432', 'Spacek', 'Andrea', 'andrea@woronocobancorp.za');
insert into PERSON (pid, l_name, f_name, email)
values ('781568676', 'Hunter', 'Robert', 'robert@perfectorder.com');
insert into PERSON (pid, l_name, f_name, email)
values ('822051253', 'Goldwyn', 'Jeffrey', 'jeffrey.goldwyn@y2marketing.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('364681609', 'Swayze', 'Gil', 'gil@hfn.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('339753654', 'Cale', 'Daryle', 'daryle.cale@mindiq.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('151254801', 'Lennox', 'Famke', 'famke.lennox@networkdisplay.co');
insert into PERSON (pid, l_name, f_name, email)
values ('292509980', 'Stuart', 'Edie', 'edies@datawarehouse.at');
insert into PERSON (pid, l_name, f_name, email)
values ('652371262', 'Heron', 'Lily', 'lily.heron@ssci.com');
insert into PERSON (pid, l_name, f_name, email)
values ('897680025', 'Pitney', 'Adam', 'apitney@wendysinternational.co');
insert into PERSON (pid, l_name, f_name, email)
values ('116730303', 'Keener', 'Matt', 'matt.keener@printcafesoftware.');
insert into PERSON (pid, l_name, f_name, email)
values ('423925364', 'Harper', 'Donald', 'donald.harper@scriptsave.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('750647486', 'Thewlis', 'Nick', 'nick.t@faef.com');
insert into PERSON (pid, l_name, f_name, email)
values ('182848987', 'Orlando', 'Selma', 'sorlando@powerlight.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('065927959', 'Spacek', 'Quentin', 'qspacek@sfmai.de');
insert into PERSON (pid, l_name, f_name, email)
values ('299296442', 'Plimpton', 'Emerson', 'e.plimpton@marketbased.com');
insert into PERSON (pid, l_name, f_name, email)
values ('893537844', 'Plowright', 'Belinda', 'belinda.plowright@grayhawksyst');
insert into PERSON (pid, l_name, f_name, email)
values ('364367353', 'Moorer', 'Alannah', 'alannah.moorer@multimedialive.');
insert into PERSON (pid, l_name, f_name, email)
values ('465536168', 'Smith', 'Frankie', 'frankies@signature.com');
insert into PERSON (pid, l_name, f_name, email)
values ('760777052', 'Marin', 'Liev', 'liev.marin@calence.com');
insert into PERSON (pid, l_name, f_name, email)
values ('976460507', 'McClinton', 'Joanna', 'joanna.mcclinton@nhr.it');
insert into PERSON (pid, l_name, f_name, email)
values ('760837533', 'Griffith', 'Emerson', 'egriffith@hfn.fi');
insert into PERSON (pid, l_name, f_name, email)
values ('995091462', 'Eastwood', 'Mekhi', 'mekhi.eastwood@infopros.com');
insert into PERSON (pid, l_name, f_name, email)
values ('148634100', 'Holm', 'Nina', 'nina.holm@paisley.com');
insert into PERSON (pid, l_name, f_name, email)
values ('850880715', 'Spears', 'Roy', 'rspears@mindworks.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('840379495', 'Camp', 'Angelina', 'angelina.c@eagleone.de');
insert into PERSON (pid, l_name, f_name, email)
values ('810158730', 'Murphy', 'Earl', 'earl.murphy@profitline.com');
insert into PERSON (pid, l_name, f_name, email)
values ('749011451', 'Pantoliano', 'Herbie', 'herbie.pantoliano@tlsservicebu');
insert into PERSON (pid, l_name, f_name, email)
values ('282967132', 'Ermey', 'Maxine', 'mermey@kmart.com');
insert into PERSON (pid, l_name, f_name, email)
values ('027326738', 'Orlando', 'Andre', 'andre.o@hewlettpackard.de');
insert into PERSON (pid, l_name, f_name, email)
values ('938023231', 'Matheson', 'Burt', 'burt.matheson@meridiangold.com');
insert into PERSON (pid, l_name, f_name, email)
values ('571220005', 'Evett', 'Mira', 'mira.evett@pioneerdatasystems.');
insert into PERSON (pid, l_name, f_name, email)
values ('702371190', 'Mitchell', 'Vincent', 'vmitchell@ultimus.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('683895199', 'Viterelli', 'Yolanda', 'yolanda.viterelli@homedepot.co');
insert into PERSON (pid, l_name, f_name, email)
values ('478202044', 'Leguizamo', 'Emerson', 'emersonl@linksys.com');
insert into PERSON (pid, l_name, f_name, email)
values ('741343717', 'Hagerty', 'Ani', 'ahagerty@gdi.com');
insert into PERSON (pid, l_name, f_name, email)
values ('169349395', 'Santana', 'Garry', 'garry.santana@philipmorris.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('521821510', 'Loring', 'Machine', 'machine.loring@comnetinternati');
insert into PERSON (pid, l_name, f_name, email)
values ('291897460', 'Benson', 'Rachid', 'rachid.benson@trinityhomecare.');
insert into PERSON (pid, l_name, f_name, email)
values ('605263411', 'Gambon', 'Terrence', 't.gambon@networkdisplay.de');
insert into PERSON (pid, l_name, f_name, email)
values ('264346014', 'Curfman', 'Albertina', 'albertina.c@aoe.com');
insert into PERSON (pid, l_name, f_name, email)
values ('790611373', 'Marsden', 'Delroy', 'delroy.marsden@speakeasy.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('577641871', 'Sobieski', 'Gran', 'gran.s@typhoon.com');
insert into PERSON (pid, l_name, f_name, email)
values ('213743877', 'Chappelle', 'Kate', 'kate.c@coridiantechnologies.in');
insert into PERSON (pid, l_name, f_name, email)
values ('613813399', 'Pride', 'Cherry', 'cherry.pride@baesch.com');
insert into PERSON (pid, l_name, f_name, email)
values ('058207275', 'Parm', 'Omar', 'omarp@peerlessmanufacturing.co');
insert into PERSON (pid, l_name, f_name, email)
values ('780106789', 'Johansen', 'Vern', 'vernj@americanhealthways.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('657771509', 'Steagall', 'Sylvester', 's.steagall@blueoceansoftware.c');
insert into PERSON (pid, l_name, f_name, email)
values ('632140770', 'Leary', 'Bernie', 'bernie.leary@diageo.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('571485844', 'Humphrey', 'Cameron', 'cameronh@alternativetechnology');
insert into PERSON (pid, l_name, f_name, email)
values ('135327150', 'Magnuson', 'Denzel', 'denzel.magnuson@progressivedes');
insert into PERSON (pid, l_name, f_name, email)
values ('305517179', 'Addy', 'Saffron', 'saffron.addy@bps.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('439668090', 'Iglesias', 'Nickel', 'nickel.iglesias@bigyanksports.');
insert into PERSON (pid, l_name, f_name, email)
values ('601914969', 'Reinhold', 'Emma', 'e.reinhold@computersource.de');
insert into PERSON (pid, l_name, f_name, email)
values ('049091541', 'Torino', 'Famke', 'famke.torino@spd.at');
insert into PERSON (pid, l_name, f_name, email)
values ('681119933', 'Neil', 'Kathy', 'kathy.neil@acsis.nl');
commit;
prompt 400 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('071086247', 'Cattrall', 'Tommy', 'tommyc@whitewave.se');
insert into PERSON (pid, l_name, f_name, email)
values ('549154410', 'Tobolowsky', 'Johnny', 'johnnyt@lloydgroup.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('735069057', 'Reno', 'Ivan', 'ivan.reno@solutionbuilders.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('333334713', 'Ruiz', 'Harris', 'harris.ruiz@gsat.se');
insert into PERSON (pid, l_name, f_name, email)
values ('957767584', 'Parsons', 'Nigel', 'nigel.parsons@smi.br');
insert into PERSON (pid, l_name, f_name, email)
values ('205345717', 'Kinney', 'Garry', 'garry.kinney@epamsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('359598513', 'Rebhorn', 'Cheryl', 'cheryl.rebhorn@ccb.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('325057906', 'Griggs', 'Debra', 'debra.griggs@gillani.com');
insert into PERSON (pid, l_name, f_name, email)
values ('613809499', 'Thorton', 'Vin', 'vin@learningvoyage.de');
insert into PERSON (pid, l_name, f_name, email)
values ('519174701', 'Arkin', 'Phil', 'phil.arkin@kelmooreinvestment.');
insert into PERSON (pid, l_name, f_name, email)
values ('684307055', 'Lynskey', 'Tanya', 'tanyal@hewlettpackard.it');
insert into PERSON (pid, l_name, f_name, email)
values ('993636785', 'Lauper', 'Famke', 'famke.l@kmart.de');
insert into PERSON (pid, l_name, f_name, email)
values ('220944241', 'Cox', 'Dick', 'dick.cox@gha.it');
insert into PERSON (pid, l_name, f_name, email)
values ('446457625', 'Whitmore', 'Vanessa', 'vwhitmore@tmt.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('899733095', 'Hurt', 'Radney', 'rhurt@msdw.com');
insert into PERSON (pid, l_name, f_name, email)
values ('190954933', 'Hingle', 'Rip', 'rhingle@pib.de');
insert into PERSON (pid, l_name, f_name, email)
values ('399907956', 'Pepper', 'Merle', 'm.pepper@axis.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('591634323', 'LaPaglia', 'Sophie', 'sophie.lapaglia@ait.com');
insert into PERSON (pid, l_name, f_name, email)
values ('816100549', 'DeGraw', 'Kitty', 'kitty.d@securitycheck.de');
insert into PERSON (pid, l_name, f_name, email)
values ('912855518', 'Dayne', 'Wes', 'wes.dayne@meghasystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('687036127', 'Garr', 'Greg', 'g.garr@printingforlesscom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('870864036', 'King', 'Lynette', 'lking@asapstaffing.at');
insert into PERSON (pid, l_name, f_name, email)
values ('230926425', 'Gellar', 'Andie', 'agellar@target.com');
insert into PERSON (pid, l_name, f_name, email)
values ('931607645', 'Creek', 'Nile', 'nile.creek@hondamotor.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('666196307', 'Keeslar', 'Taryn', 'taryn@wrgservices.com');
insert into PERSON (pid, l_name, f_name, email)
values ('771703424', 'Culkin', 'Dom', 'dom@fflcbancorp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('365883743', 'Marsden', 'Juliana', 'juliana@banfeproducts.com');
insert into PERSON (pid, l_name, f_name, email)
values ('216860273', 'Allison', 'Patty', 'patty.allison@cimalabs.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('817077179', 'Wayans', 'Brad', 'b.wayans@veritekinternational.');
insert into PERSON (pid, l_name, f_name, email)
values ('909147578', 'Reubens', 'Molly', 'molly.reubens@saltgroup.it');
insert into PERSON (pid, l_name, f_name, email)
values ('295968888', 'Skaggs', 'Ossie', 'ossie@dbprofessionals.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('727983845', 'Clark', 'Denise', 'denise@diamondtechnologies.com');
insert into PERSON (pid, l_name, f_name, email)
values ('233541785', 'Woods', 'Tzi', 'tzi@ccfholding.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('004214981', 'Gertner', 'Tracy', 'tracy@lfg.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('335018902', 'Crystal', 'Michelle', 'michelle.crystal@paisley.br');
insert into PERSON (pid, l_name, f_name, email)
values ('137941986', 'Gold', 'Jimmie', 'jgold@sfmai.de');
insert into PERSON (pid, l_name, f_name, email)
values ('608382546', 'Rucker', 'Miriam', 'miriam@wendysinternational.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('229837931', 'Utada', 'Boz', 'boz.utada@sysconmedia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('197150109', 'Loeb', 'Stephen', 'stephen.loeb@callhenry.it');
insert into PERSON (pid, l_name, f_name, email)
values ('338577904', 'Lonsdale', 'Spencer', 'spencer.lonsdale@americanland.');
insert into PERSON (pid, l_name, f_name, email)
values ('678665314', 'Khan', 'Willem', 'willem@air.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('780200822', 'Hayes', 'Lea', 'lea.hayes@mcdonalds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('607367998', 'Christie', 'Shelby', 'shelby.christie@diamondgroup.a');
insert into PERSON (pid, l_name, f_name, email)
values ('810902392', 'Nicholson', 'Armin', 'armin@morganresearch.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('833221223', 'Vaughan', 'Oded', 'oded@johnson.com');
insert into PERSON (pid, l_name, f_name, email)
values ('162817820', 'Firth', 'Danni', 'danni.firth@paisley.com');
insert into PERSON (pid, l_name, f_name, email)
values ('448322939', 'Blossoms', 'Lynn', 'lynn.blossoms@its.com');
insert into PERSON (pid, l_name, f_name, email)
values ('339713112', 'Neville', 'Kathy', 'kathyn@gentrasystems.de');
insert into PERSON (pid, l_name, f_name, email)
values ('987783098', 'Wheel', 'Cliff', 'cliff.wheel@adeasolutions.br');
insert into PERSON (pid, l_name, f_name, email)
values ('252275109', 'Day-Lewis', 'Elvis', 'elvis.daylewis@envisiontelepho');
insert into PERSON (pid, l_name, f_name, email)
values ('806197423', 'Warden', 'Bill', 'bill.w@3tsystems.br');
insert into PERSON (pid, l_name, f_name, email)
values ('311853595', 'Perrineau', 'Treat', 'tperrineau@tmt.com');
insert into PERSON (pid, l_name, f_name, email)
values ('542360342', 'Irving', 'Vanessa', 'v.irving@bowman.in');
insert into PERSON (pid, l_name, f_name, email)
values ('571442972', 'Jovovich', 'Scott', 'scott.j@unit.com');
insert into PERSON (pid, l_name, f_name, email)
values ('130724276', 'Lewin', 'Vern', 'vern.lewin@jma.com');
insert into PERSON (pid, l_name, f_name, email)
values ('390395805', 'Vaughn', 'Brenda', 'bvaughn@servicesource.com');
insert into PERSON (pid, l_name, f_name, email)
values ('291511425', 'Gordon', 'Bette', 'bette@simplycertificates.com');
insert into PERSON (pid, l_name, f_name, email)
values ('395530762', 'Whitwam', 'Adam', 'adam.whitwam@sprint.com');
insert into PERSON (pid, l_name, f_name, email)
values ('713332687', 'Bloch', 'Elizabeth', 'e.bloch@fns.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('424708748', 'Visnjic', 'Nelly', 'n.visnjic@pds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('375496232', 'Rock', 'Ben', 'ben@midwestmedia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('937748671', 'Venora', 'Saul', 'saul.venora@swi.br');
insert into PERSON (pid, l_name, f_name, email)
values ('504079554', 'Berkley', 'Thin', 'thin@hardwoodwholesalers.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('483410625', 'Weiland', 'Luke', 'luke.weiland@shufflemaster.de');
insert into PERSON (pid, l_name, f_name, email)
values ('371881430', 'Vincent', 'Pat', 'pvincent@ivci.de');
insert into PERSON (pid, l_name, f_name, email)
values ('664257780', 'Curfman', 'Liquid', 'liquid@hospitalsolutions.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('133134505', 'Fender', 'Judd', 'judd.fender@linacsystems.de');
insert into PERSON (pid, l_name, f_name, email)
values ('530889775', 'Sandler', 'Ossie', 'ossie.sandler@jcpenney.com');
insert into PERSON (pid, l_name, f_name, email)
values ('852575300', 'Schwarzene', 'Geena', 'g.schwarzenegger@pacificdatade');
insert into PERSON (pid, l_name, f_name, email)
values ('919483211', 'Lavigne', 'Lizzy', 'llavigne@paisley.com');
insert into PERSON (pid, l_name, f_name, email)
values ('066625266', 'Shocked', 'King', 'king.shocked@gha.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('489500072', 'Ferrer', 'Lena', 'lena.ferrer@tmt.de');
insert into PERSON (pid, l_name, f_name, email)
values ('459154999', 'Wells', 'Vin', 'vin.wells@virbac.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('998045350', 'McDonnell', 'Tom', 'tom.mcdonnell@mqsoftware.de');
insert into PERSON (pid, l_name, f_name, email)
values ('015892659', 'Thornton', 'Patricia', 'patricia@teamstudio.com');
insert into PERSON (pid, l_name, f_name, email)
values ('085390024', 'Gaynor', 'Jeanne', 'jeanne.gaynor@mosaic.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('597995474', 'Pearce', 'Keith', 'keith.pearce@paintedword.com');
insert into PERSON (pid, l_name, f_name, email)
values ('087806495', 'Rippy', 'Petula', 'p.rippy@younginnovations.com');
insert into PERSON (pid, l_name, f_name, email)
values ('210887015', 'Molina', 'Uma', 'uma.molina@totalentertainment.');
insert into PERSON (pid, l_name, f_name, email)
values ('318308556', 'Carter', 'Jimmy', 'jimmyc@qestrel.com');
insert into PERSON (pid, l_name, f_name, email)
values ('897793693', 'Paymer', 'Geggy', 'geggy.paymer@millersystems.nz');
insert into PERSON (pid, l_name, f_name, email)
values ('273963341', 'Lithgow', 'Dick', 'dickl@bowman.com');
insert into PERSON (pid, l_name, f_name, email)
values ('173025640', 'Tilly', 'Kurt', 'kurt.tilly@americanmegacom.de');
insert into PERSON (pid, l_name, f_name, email)
values ('813092669', 'Adkins', 'Nickel', 'nickel.adkins@tmt.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('891313788', 'Head', 'Marie', 'marie.head@balchem.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('980953702', 'Hewett', 'Karen', 'karen.hewett@owm.com');
insert into PERSON (pid, l_name, f_name, email)
values ('127506315', 'Loggia', 'Clea', 'clea.loggia@commworks.es');
insert into PERSON (pid, l_name, f_name, email)
values ('356366312', 'Kilmer', 'Murray', 'murrayk@diversitech.au');
insert into PERSON (pid, l_name, f_name, email)
values ('325174227', 'Dalley', 'Geoff', 'geoff.dalley@keymark.com');
insert into PERSON (pid, l_name, f_name, email)
values ('541529973', 'Wainwright', 'Alec', 'alecw@comglobalsystems.br');
insert into PERSON (pid, l_name, f_name, email)
values ('482424220', 'Shearer', 'Juan', 'juan.shearer@tlsservicebureau.');
insert into PERSON (pid, l_name, f_name, email)
values ('167068855', 'Olyphant', 'Morris', 'morris.olyphant@bowman.de');
insert into PERSON (pid, l_name, f_name, email)
values ('041264980', 'Hoffman', 'Jeanne', 'jeanne@marriottinternational.a');
insert into PERSON (pid, l_name, f_name, email)
values ('708025907', 'Beckinsale', 'Andy', 'andy.beckinsale@mds.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('039651469', 'Playboys', 'Lupe', 'lupe.playboys@hersheyfoods.com');
insert into PERSON (pid, l_name, f_name, email)
values ('371583821', 'Bedelia', 'Jimmy', 'j.bedelia@eastmankodak.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('900633096', 'Shaye', 'Boyd', 'boyd.shaye@avs.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('636686610', 'Trevino', 'Lindsay', 'lindsay@medsource.de');
insert into PERSON (pid, l_name, f_name, email)
values ('125724898', 'Thomas', 'Garland', 'garland.thomas@terrafirma.com');
insert into PERSON (pid, l_name, f_name, email)
values ('087692790', 'Byrne', 'Jude', 'judeb@procurementcentre.com');
commit;
prompt 500 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('315698623', 'Kweller', 'Jake', 'jake.kweller@monarchcasino.com');
insert into PERSON (pid, l_name, f_name, email)
values ('437154772', 'Chandler', 'Crystal', 'c.chandler@slt.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('980168101', 'Finney', 'Phil', 'p.finney@ogi.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('982871108', 'Curtis-Hal', 'Ahmad', 'a.curtishall@abs.com');
insert into PERSON (pid, l_name, f_name, email)
values ('602276868', 'Akins', 'Gailard', 'gailard@nsd.ht');
insert into PERSON (pid, l_name, f_name, email)
values ('281373620', 'Rifkin', 'Lena', 'lena.rifkin@gulfmarkoffshore.d');
insert into PERSON (pid, l_name, f_name, email)
values ('184623309', 'Adams', 'Tal', 'tal@fiberlink.com');
insert into PERSON (pid, l_name, f_name, email)
values ('555092086', 'McDonald', 'Vertical', 'vertical.mcdonald@microtek.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('630952415', 'Gunton', 'Millie', 'millie.gunton@neogen.com');
insert into PERSON (pid, l_name, f_name, email)
values ('062801371', 'Howard', 'Lila', 'lila@fordmotor.de');
insert into PERSON (pid, l_name, f_name, email)
values ('786181809', 'McDowell', 'Charlize', 'charlize.mcdowell@sps.za');
insert into PERSON (pid, l_name, f_name, email)
values ('014700822', 'Allen', 'Sydney', 'sydney.allen@ssci.de');
insert into PERSON (pid, l_name, f_name, email)
values ('234623164', 'Chaykin', 'Gaby', 'gaby.chaykin@qas.de');
insert into PERSON (pid, l_name, f_name, email)
values ('759729703', 'Amos', 'Candice', 'candice.amos@bedfordbancshares');
insert into PERSON (pid, l_name, f_name, email)
values ('985365506', 'Lithgow', 'Joely', 'jlithgow@trinityhomecare.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('683224221', 'Ryder', 'Julie', 'julie.ryder@saralee.se');
insert into PERSON (pid, l_name, f_name, email)
values ('109061764', 'Wariner', 'Collective', 'collective.w@terrafirma.br');
insert into PERSON (pid, l_name, f_name, email)
values ('502582320', 'Colin Youn', 'Beverley', 'beverley.colinyoung@educationa');
insert into PERSON (pid, l_name, f_name, email)
values ('987544346', 'Kilmer', 'Miriam', 'miriam.kilmer@nmr.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('549387738', 'Vance', 'Franco', 'franco@colgatepalmolive.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('921955127', 'Gallagher', 'Geggy', 'geggy@seiaarons.com');
insert into PERSON (pid, l_name, f_name, email)
values ('141001787', 'Hayes', 'Rosie', 'rosieh@cyberthink.com');
insert into PERSON (pid, l_name, f_name, email)
values ('824399945', 'Plummer', 'Nathan', 'nathan.plummer@atxforms.au');
insert into PERSON (pid, l_name, f_name, email)
values ('203168013', 'Feuerstein', 'Sander', 'sander.feuerstein@heritagemicr');
insert into PERSON (pid, l_name, f_name, email)
values ('723421602', 'Ramis', 'Jeffery', 'jeffery.ramis@dillards.de');
insert into PERSON (pid, l_name, f_name, email)
values ('134423569', 'Red', 'Gilbert', 'g.red@timberlanewoodcrafters.c');
insert into PERSON (pid, l_name, f_name, email)
values ('081319655', 'Kudrow', 'Raymond', 'rkudrow@fmb.com');
insert into PERSON (pid, l_name, f_name, email)
values ('889060302', 'Banderas', 'Lenny', 'lenny.banderas@fnb.it');
insert into PERSON (pid, l_name, f_name, email)
values ('259941739', 'Kahn', 'Patricia', 'patricia.kahn@gdatechnologies.');
insert into PERSON (pid, l_name, f_name, email)
values ('274382117', 'Grant', 'Gwyneth', 'gwyneth@clubone.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('206201345', 'Gough', 'Natascha', 'natascha.gough@voicelog.com');
insert into PERSON (pid, l_name, f_name, email)
values ('018933518', 'Norton', 'Carole', 'cnorton@hondamotor.au');
insert into PERSON (pid, l_name, f_name, email)
values ('909626210', 'Bello', 'Donna', 'dbello@dbprofessionals.com');
insert into PERSON (pid, l_name, f_name, email)
values ('419099143', 'Lindo', 'Rip', 'rip@bioanalytical.com');
insert into PERSON (pid, l_name, f_name, email)
values ('659988335', 'Goodman', 'Corey', 'cgoodman@escalade.com');
insert into PERSON (pid, l_name, f_name, email)
values ('484771335', 'Sobieski', 'Nikki', 'nsobieski@fmi.com');
insert into PERSON (pid, l_name, f_name, email)
values ('037245771', 'Guinness', 'Dom', 'dom.guinness@navigatorsystems.');
insert into PERSON (pid, l_name, f_name, email)
values ('999821449', 'Garza', 'Jessica', 'jessica.garza@millersystems.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('898554198', 'Margulies', 'Parker', 'parker.margulies@kis.it');
insert into PERSON (pid, l_name, f_name, email)
values ('993836190', 'Cleary', 'Albertina', 'albertina.cleary@ptg.com');
insert into PERSON (pid, l_name, f_name, email)
values ('855872783', 'Hutch', 'Mary Beth', 'marybeth.hutch@lms.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('334670235', 'Hopper', 'Vivica', 'vivica.h@hotmail.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('709634152', 'MacNeil', 'Julia', 'julia.macneil@mag.com');
insert into PERSON (pid, l_name, f_name, email)
values ('783115766', 'Wolf', 'Lindsay', 'lindsay.wolf@lms.it');
insert into PERSON (pid, l_name, f_name, email)
values ('257286453', 'Leto', 'Rhona', 'rhona.leto@msdw.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('424893711', 'Judd', 'Art', 'art.judd@aci.com');
insert into PERSON (pid, l_name, f_name, email)
values ('229266261', 'Snow', 'Jon', 'jon.snow@y2marketing.com');
insert into PERSON (pid, l_name, f_name, email)
values ('358504098', 'Wine', 'Spike', 'spike.wine@bioanalytical.il');
insert into PERSON (pid, l_name, f_name, email)
values ('151249354', 'McFerrin', 'Davis', 'davis.mcferrin@bedfordbancshar');
insert into PERSON (pid, l_name, f_name, email)
values ('869576204', 'Lopez', 'Glen', 'glen.lopez@mag.com');
insert into PERSON (pid, l_name, f_name, email)
values ('341181722', 'Mohr', 'Sean', 'sean.m@curagroup.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('714371122', 'Haysbert', 'Rip', 'rip.haysbert@johnson.com');
insert into PERSON (pid, l_name, f_name, email)
values ('102771731', 'Hauer', 'Sona', 'sona.hauer@team.de');
insert into PERSON (pid, l_name, f_name, email)
values ('017143611', 'Choice', 'Deborah', 'deborah.choice@aldensystems.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('068567763', 'Delta', 'Tanya', 'tanya.delta@aoltimewarner.com');
insert into PERSON (pid, l_name, f_name, email)
values ('536612940', 'Elwes', 'Chaka', 'chaka@kmart.it');
insert into PERSON (pid, l_name, f_name, email)
values ('290334866', 'Ranger', 'Molly', 'molly@swp.de');
insert into PERSON (pid, l_name, f_name, email)
values ('561743365', 'Lonsdale', 'Cesar', 'cesar@doraldentalusa.com');
insert into PERSON (pid, l_name, f_name, email)
values ('787953072', 'Smurfit', 'Kenneth', 'k.smurfit@trinityhomecare.com');
insert into PERSON (pid, l_name, f_name, email)
values ('692936013', 'Larter', 'Seann', 'seann.l@peerlessmanufacturing.');
insert into PERSON (pid, l_name, f_name, email)
values ('462617863', 'Shearer', 'Marianne', 'marianne@isd.se');
insert into PERSON (pid, l_name, f_name, email)
values ('310144566', 'Cruz', 'Willem', 'wcruz@diversitech.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('200246319', 'Pollack', 'Walter', 'wpollack@kingston.com');
insert into PERSON (pid, l_name, f_name, email)
values ('238418580', 'Douglas', 'Edgar', 'e.douglas@conquestsystems.au');
insert into PERSON (pid, l_name, f_name, email)
values ('564292169', 'Lauper', 'Fiona', 'fiona.lauper@americanexpress.n');
insert into PERSON (pid, l_name, f_name, email)
values ('424650791', 'Ranger', 'Rosco', 'rosco.ranger@chipssolutions.it');
insert into PERSON (pid, l_name, f_name, email)
values ('035198344', 'Broderick', 'Harry', 'harry.broderick@atlanticnet.co');
insert into PERSON (pid, l_name, f_name, email)
values ('579208908', 'Adkins', 'Seth', 'seth.adkins@kellogg.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('368067148', 'Chestnut', 'Elias', 'elias.chestnut@sms.in');
insert into PERSON (pid, l_name, f_name, email)
values ('273455017', 'Nightingal', 'Tony', 'tony.nightingale@conquest.es');
insert into PERSON (pid, l_name, f_name, email)
values ('522338180', 'Roundtree', 'Nathan', 'n.roundtree@boldtechsystems.at');
insert into PERSON (pid, l_name, f_name, email)
values ('121008642', 'Choice', 'Nils', 'n.choice@newviewgifts.com');
insert into PERSON (pid, l_name, f_name, email)
values ('858439996', 'Buscemi', 'Sophie', 'sophie.buscemi@cooktek.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('847380247', 'Colman', 'Ron', 'ron.colman@shot.com');
insert into PERSON (pid, l_name, f_name, email)
values ('155951899', 'Getty', 'Bret', 'bret.getty@base.gr');
insert into PERSON (pid, l_name, f_name, email)
values ('118672560', 'Wilkinson', 'Emerson', 'emerson.wilkinson@career.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('680478146', 'Wolf', 'Alfie', 'alfie@sds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('164927027', 'Kinney', 'Gary', 'gary@technica.com');
insert into PERSON (pid, l_name, f_name, email)
values ('289304877', 'Diggs', 'Charles', 'charles.diggs@vspan.be');
insert into PERSON (pid, l_name, f_name, email)
values ('060735713', 'Imbruglia', 'Gailard', 'gailard@nexxtworks.com');
insert into PERSON (pid, l_name, f_name, email)
values ('852882111', 'Shorter', 'Delbert', 'delbert.shorter@bioreference.c');
insert into PERSON (pid, l_name, f_name, email)
values ('479117663', 'Harry', 'Willem', 'w.harry@aci.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('351120700', 'Stamp', 'Hank', 'hank@doraldentalusa.za');
insert into PERSON (pid, l_name, f_name, email)
values ('540024147', 'Rush', 'Carla', 'carla.rush@wlt.com');
insert into PERSON (pid, l_name, f_name, email)
values ('259407722', 'Ruffalo', 'Greg', 'gruffalo@esoftsolutions.es');
insert into PERSON (pid, l_name, f_name, email)
values ('435616074', 'Hughes', 'Rory', 'rory.hughes@mse.com');
insert into PERSON (pid, l_name, f_name, email)
values ('827480676', 'Pleasure', 'Harry', 'harry@floorgraphics.com');
insert into PERSON (pid, l_name, f_name, email)
values ('240111208', 'Bloch', 'Goran', 'goran.bloch@vms.br');
insert into PERSON (pid, l_name, f_name, email)
values ('874173884', 'Shepard', 'Robby', 'robbys@generalelectric.com');
insert into PERSON (pid, l_name, f_name, email)
values ('275795786', 'Dale', 'Hugh', 'hugh.dale@trekequipment.de');
insert into PERSON (pid, l_name, f_name, email)
values ('346388516', 'Karyo', 'Wendy', 'w.karyo@timberlanewoodcrafters');
insert into PERSON (pid, l_name, f_name, email)
values ('243465115', 'Stewart', 'Wayne', 'waynes@nat.com');
insert into PERSON (pid, l_name, f_name, email)
values ('869894785', 'Neeson', 'Lonnie', 'lonnie.neeson@infovision.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('102044528', 'Boorem', 'Amanda', 'a.boorem@marketfirst.at');
insert into PERSON (pid, l_name, f_name, email)
values ('354683638', 'Street', 'Carl', 'carl.street@spenser.com');
insert into PERSON (pid, l_name, f_name, email)
values ('709545772', 'Reinhold', 'Shelby', 'shelby.reinhold@execuscribe.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('215396573', 'Romijn-Sta', 'Aimee', 'aimee.romijnstamos@catamount.c');
insert into PERSON (pid, l_name, f_name, email)
values ('147206940', 'Lattimore', 'Antonio', 'antonio.lattimore@providentban');
insert into PERSON (pid, l_name, f_name, email)
values ('834188366', 'Dzundza', 'Giovanni', 'giovanni.dzundza@ceom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('353521370', 'Camp', 'Etta', 'etta.camp@paisley.ch');
commit;
prompt 600 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('283952085', 'Weiland', 'Helen', 'hweiland@gtp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('349734903', 'Belushi', 'Chaka', 'chaka.belushi@heritagemicrofil');
insert into PERSON (pid, l_name, f_name, email)
values ('234039968', 'Thewlis', 'Jann', 'jann.thewlis@cendant.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('346544542', 'Blackmore', 'Andrae', 'andrae.blackmore@oneidafinanci');
insert into PERSON (pid, l_name, f_name, email)
values ('475834164', 'Silverman', 'Julianna', 'julianna@aristotle.com');
insert into PERSON (pid, l_name, f_name, email)
values ('662335163', 'Michaels', 'Beth', 'beth.m@onstaff.com');
insert into PERSON (pid, l_name, f_name, email)
values ('591921979', 'Copeland', 'Owen', 'owenc@thinktanksystems.br');
insert into PERSON (pid, l_name, f_name, email)
values ('835803033', 'Elwes', 'Darren', 'darren.elwes@quakercitybancorp');
insert into PERSON (pid, l_name, f_name, email)
values ('749427523', 'Redford', 'Mia', 'mia.redford@smg.com');
insert into PERSON (pid, l_name, f_name, email)
values ('122884225', 'Sweet', 'Solomon', 'solomon.sweet@reckittbenckiser');
insert into PERSON (pid, l_name, f_name, email)
values ('323308058', 'Hidalgo', 'Glenn', 'glenn.hidalgo@firstsouthbancor');
insert into PERSON (pid, l_name, f_name, email)
values ('998586188', 'Leigh', 'Kelly', 'kelly.leigh@ssci.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('567425416', 'Arquette', 'Earl', 'earl.arquette@fnb.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('482138217', 'Kurtz', 'Molly', 'molly.kurtz@tilia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('617833949', 'Driver', 'Rose', 'rose.driver@sht.ve');
insert into PERSON (pid, l_name, f_name, email)
values ('057092021', 'McGowan', 'Ving', 'ving.mcgowan@horizonorganic.mx');
insert into PERSON (pid, l_name, f_name, email)
values ('214371905', 'Blades', 'Lea', 'lblades@virbac.com');
insert into PERSON (pid, l_name, f_name, email)
values ('766797561', 'Cronin', 'Roger', 'roger.c@peerlessmanufacturing.');
insert into PERSON (pid, l_name, f_name, email)
values ('655711740', 'Wagner', 'Johnnie', 'johnnie.wagner@sandyspringbanc');
insert into PERSON (pid, l_name, f_name, email)
values ('746215683', 'Mohr', 'Neneh', 'neneh.mohr@smi.de');
insert into PERSON (pid, l_name, f_name, email)
values ('583755012', 'Holden', 'Domingo', 'dholden@questarcapital.com');
insert into PERSON (pid, l_name, f_name, email)
values ('851082137', 'Lithgow', 'Gino', 'gino@clorox.com');
insert into PERSON (pid, l_name, f_name, email)
values ('240305668', 'Marie', 'Nelly', 'nellym@aquickdelivery.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('100752928', 'Steiger', 'Lorraine', 'lorraines@northhighland.com');
insert into PERSON (pid, l_name, f_name, email)
values ('645206623', 'Witt', 'Kurt', 'kurt.witt@worldcom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('940553428', 'Ball', 'Ann', 'a.ball@sfb.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('129012870', 'Niven', 'Millie', 'millie.niven@mls.com');
insert into PERSON (pid, l_name, f_name, email)
values ('366234028', 'Weiss', 'Bret', 'bret.weiss@sis.de');
insert into PERSON (pid, l_name, f_name, email)
values ('005705487', 'Cash', 'Robby', 'robby.cash@ogiointernational.j');
insert into PERSON (pid, l_name, f_name, email)
values ('182905537', 'Tripplehor', 'Carole', 'ctripplehorn@stm.com');
insert into PERSON (pid, l_name, f_name, email)
values ('939829538', 'Myles', 'Tamala', 'tamala.myles@learningvoyage.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('137727593', 'Bryson', 'Eugene', 'ebryson@fetchlogistics.com');
insert into PERSON (pid, l_name, f_name, email)
values ('733612090', 'McLean', 'Sarah', 'sarah.mclean@younginnovations.');
insert into PERSON (pid, l_name, f_name, email)
values ('263170660', 'Koyana', 'Rob', 'rob.koyana@gulfmarkoffshore.co');
insert into PERSON (pid, l_name, f_name, email)
values ('615121626', 'Russell', 'Murray', 'murray.russell@infopros.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('731452579', 'Greene', 'Rufus', 'rufus.greene@americanland.hu');
insert into PERSON (pid, l_name, f_name, email)
values ('702668533', 'Curtis', 'Rascal', 'rascal.c@spenser.il');
insert into PERSON (pid, l_name, f_name, email)
values ('490885968', 'O''Connor', 'Grant', 'grant.oconnor@connected.com');
insert into PERSON (pid, l_name, f_name, email)
values ('914381355', 'Tilly', 'Donald', 'donald.tilly@peerlessmanufactu');
insert into PERSON (pid, l_name, f_name, email)
values ('363800111', 'Ontiveros', 'Dwight', 'dontiveros@cooktek.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('275365706', 'Scaggs', 'Alec', 'alec@alternativetechnology.au');
insert into PERSON (pid, l_name, f_name, email)
values ('438752269', 'Kristoffer', 'Moe', 'moe.kristofferson@usgovernment');
insert into PERSON (pid, l_name, f_name, email)
values ('531615147', 'Tempest', 'Alicia', 'alicia.tempest@gdatechnologies');
insert into PERSON (pid, l_name, f_name, email)
values ('309661257', 'Arjona', 'Albertina', 'albertina.arjona@maverick.com');
insert into PERSON (pid, l_name, f_name, email)
values ('243034980', 'Crouse', 'Vienna', 'vienna.crouse@mms.de');
insert into PERSON (pid, l_name, f_name, email)
values ('807343932', 'Durning', 'Kevin', 'kevind@kiamotors.com');
insert into PERSON (pid, l_name, f_name, email)
values ('126139999', 'Conley', 'Paul', 'paul.conley@mqsoftware.de');
insert into PERSON (pid, l_name, f_name, email)
values ('409938518', 'Harry', 'Matt', 'matt.harry@hondamotor.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('955370738', 'Zane', 'Dan', 'danz@intraspheretechnologies.c');
insert into PERSON (pid, l_name, f_name, email)
values ('856916785', 'Holiday', 'Caroline', 'caroline@vivendiuniversal.com');
insert into PERSON (pid, l_name, f_name, email)
values ('580000436', 'Stone', 'Jaime', 'jaime.stone@prosum.br');
insert into PERSON (pid, l_name, f_name, email)
values ('426380908', 'Robinson', 'Barry', 'barry.r@loreal.com');
insert into PERSON (pid, l_name, f_name, email)
values ('787746558', 'Chestnut', 'Etta', 'etta.chestnut@generalelectric.');
insert into PERSON (pid, l_name, f_name, email)
values ('795339454', 'Fishburne', 'Jena', 'jena.fishburne@axis.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('115073052', 'Springfiel', 'Ali', 'ali.springfield@astute.de');
insert into PERSON (pid, l_name, f_name, email)
values ('366643188', 'McGill', 'Courtney', 'courtney.mcgill@typhoon.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('067704806', 'Harry', 'Horace', 'horace.harry@deutschetelekom.c');
insert into PERSON (pid, l_name, f_name, email)
values ('723216818', 'Bragg', 'Angelina', 'angelina@gci.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('795966607', 'Levine', 'Bruce', 'blevine@angieslist.za');
insert into PERSON (pid, l_name, f_name, email)
values ('086595664', 'Potter', 'Guy', 'guy.p@northhighland.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('431602139', 'Lipnicki', 'Johnette', 'johnettel@linacsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('996383746', 'Matarazzo', 'Seann', 'seann.matarazzo@gdi.com');
insert into PERSON (pid, l_name, f_name, email)
values ('770532937', 'Franklin', 'Javon', 'javon.franklin@viacell.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('720517910', 'Bean', 'Dionne', 'd.bean@wendysinternational.de');
insert into PERSON (pid, l_name, f_name, email)
values ('154805861', 'Tanon', 'Alec', 'alec.tanon@aventis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('641022334', 'Buffalo', 'Leon', 'lbuffalo@marlabs.de');
insert into PERSON (pid, l_name, f_name, email)
values ('497517836', 'Krumholtz', 'Larnelle', 'larnellek@pds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('852517928', 'urban', 'Timothy', 'timothy.urban@ghrsystems.br');
insert into PERSON (pid, l_name, f_name, email)
values ('848218933', 'Duncan', 'Bob', 'bob.duncan@sunstream.it');
insert into PERSON (pid, l_name, f_name, email)
values ('611719441', 'Popper', 'Jimmie', 'jimmie.popper@sourcegear.ar');
insert into PERSON (pid, l_name, f_name, email)
values ('654249625', 'Popper', 'Clint', 'clint.p@otbd.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('646508379', 'Reed', 'Samantha', 'samantha.reed@priorityexpress.');
insert into PERSON (pid, l_name, f_name, email)
values ('358023527', 'Dafoe', 'Maura', 'maura@toyotamotor.com');
insert into PERSON (pid, l_name, f_name, email)
values ('508158601', 'Winwood', 'Adam', 'adam.winwood@marriottinternati');
insert into PERSON (pid, l_name, f_name, email)
values ('693992628', 'Nelligan', 'Norm', 'n.nelligan@heritagemicrofilm.c');
insert into PERSON (pid, l_name, f_name, email)
values ('871894052', 'Uggams', 'Alicia', 'auggams@innovativelighting.br');
insert into PERSON (pid, l_name, f_name, email)
values ('771995680', 'Head', 'Allan', 'allan.head@networkdisplay.com');
insert into PERSON (pid, l_name, f_name, email)
values ('477653417', 'James', 'Joan', 'joan.james@printcafesoftware.j');
insert into PERSON (pid, l_name, f_name, email)
values ('381184710', 'Cook', 'Nickel', 'nickel@lydiantrust.de');
insert into PERSON (pid, l_name, f_name, email)
values ('113488805', 'Chan', 'Daryle', 'daryle.chan@envisiontelephony.');
insert into PERSON (pid, l_name, f_name, email)
values ('036492757', 'Hidalgo', 'Jimmie', 'jimmie.hidalgo@columbiabancorp');
insert into PERSON (pid, l_name, f_name, email)
values ('359802512', 'Baranski', 'Jeffrey', 'jeffrey@limitedbrands.com');
insert into PERSON (pid, l_name, f_name, email)
values ('644424460', 'Whitford', 'Trey', 'trey.whitford@activeservices.a');
insert into PERSON (pid, l_name, f_name, email)
values ('470670123', 'Stallone', 'Jody', 'jody@valleyoaksystems.de');
insert into PERSON (pid, l_name, f_name, email)
values ('563077478', 'Blair', 'Emm', 'emm.blair@glaxosmithkline.be');
insert into PERSON (pid, l_name, f_name, email)
values ('951860128', 'Postlethwa', 'Roger', 'roger.postlethwaite@securitych');
insert into PERSON (pid, l_name, f_name, email)
values ('799097031', 'Niven', 'Laurie', 'laurie.niven@greene.de');
insert into PERSON (pid, l_name, f_name, email)
values ('514972615', 'Frost', 'Tamala', 't.frost@gulfmarkoffshore.com');
insert into PERSON (pid, l_name, f_name, email)
values ('392533402', 'Ponce', 'Carol', 'carol.ponce@scriptsave.in');
insert into PERSON (pid, l_name, f_name, email)
values ('594359980', 'Gilliam', 'Leonardo', 'l.gilliam@shar.de');
insert into PERSON (pid, l_name, f_name, email)
values ('798435974', 'Todd', 'Eddie', 'eddie@navigatorsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('408874915', 'Cale', 'Debra', 'd.cale@horizon.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('267506309', 'Graham', 'Dianne', 'dgraham@alogent.com');
insert into PERSON (pid, l_name, f_name, email)
values ('021510732', 'Winwood', 'Rob', 'rob@newhorizons.com');
insert into PERSON (pid, l_name, f_name, email)
values ('683533120', 'Sedaka', 'Clive', 'clive.s@elite.de');
insert into PERSON (pid, l_name, f_name, email)
values ('644185876', 'Baez', 'Maury', 'maury.b@paisley.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('080849238', 'McCoy', 'Sam', 's.mccoy@seafoxboat.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('495290518', 'Michael', 'Hookah', 'hookah.michael@americanland.nz');
insert into PERSON (pid, l_name, f_name, email)
values ('151716759', 'Doucette', 'Lynn', 'lynn.d@esoftsolutions.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('923262202', 'Brooke', 'Beverley', 'beverley.brooke@prosperitybanc');
commit;
prompt 700 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('844961356', 'Moorer', 'Armand', 'armandm@trm.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('810470136', 'Finney', 'Bernie', 'bernie.f@keymark.lt');
insert into PERSON (pid, l_name, f_name, email)
values ('113442252', 'McGovern', 'Andrea', 'andrea.mcgovern@columbiabancor');
insert into PERSON (pid, l_name, f_name, email)
values ('288128062', 'Gordon', 'Vanessa', 'vanessag@aristotle.it');
insert into PERSON (pid, l_name, f_name, email)
values ('416239499', 'Murdock', 'Kelly', 'kelly@gci.at');
insert into PERSON (pid, l_name, f_name, email)
values ('182761224', 'Lewin', 'Anna', 'a.lewin@ataservices.com');
insert into PERSON (pid, l_name, f_name, email)
values ('919897956', 'DeLuise', 'Taryn', 'tarynd@pds.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('439959523', 'Lachey', 'Chrissie', 'chrissie@novartis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('688241765', 'Howard', 'Mira', 'mira@carteretmortgage.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('426187630', 'Benoit', 'Radney', 'radney.benoit@mitsubishimotors');
insert into PERSON (pid, l_name, f_name, email)
values ('333348436', 'Esposito', 'Alex', 'alex@kramontrealty.de');
insert into PERSON (pid, l_name, f_name, email)
values ('805125593', 'Sainte-Mar', 'Alec', 'alec@otbd.au');
insert into PERSON (pid, l_name, f_name, email)
values ('580713986', 'Carradine', 'Kay', 'kay.carradine@spectrum.com');
insert into PERSON (pid, l_name, f_name, email)
values ('071856120', 'Adler', 'Carrie', 'c.adler@unilever.com');
insert into PERSON (pid, l_name, f_name, email)
values ('639666988', 'Polley', 'Lloyd', 'lloyd.polley@networkdisplay.de');
insert into PERSON (pid, l_name, f_name, email)
values ('422090889', 'Lewis', 'Stellan', 'stellan.lewis@kelmooreinvestme');
insert into PERSON (pid, l_name, f_name, email)
values ('440438749', 'Stallone', 'Robby', 'robby.stallone@portageenvironm');
insert into PERSON (pid, l_name, f_name, email)
values ('060862838', 'Janney', 'Marie', 'marie.janney@colgatepalmolive.');
insert into PERSON (pid, l_name, f_name, email)
values ('648655917', 'LaMond', 'Angela', 'angela.lamond@apexsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('262480569', 'Morse', 'Arturo', 'arturo.morse@datawarehouse.com');
insert into PERSON (pid, l_name, f_name, email)
values ('292706194', 'Wolf', 'Liam', 'liam.wolf@studiobproductions.c');
insert into PERSON (pid, l_name, f_name, email)
values ('473950663', 'Levy', 'Halle', 'halle.levy@bowman.com');
insert into PERSON (pid, l_name, f_name, email)
values ('945997798', 'Paymer', 'Grace', 'grace@nike.com');
insert into PERSON (pid, l_name, f_name, email)
values ('621900616', 'Wainwright', 'Phoebe', 'p.wainwright@midwestmedia.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('704300951', 'Elizabeth', 'Bridgette', 'bridgette.elizabeth@adeasoluti');
insert into PERSON (pid, l_name, f_name, email)
values ('168902440', 'Winter', 'Nikki', 'nikki@faef.com');
insert into PERSON (pid, l_name, f_name, email)
values ('271292537', 'Rhodes', 'Isaiah', 'isaiah.rhodes@alohanysystems.b');
insert into PERSON (pid, l_name, f_name, email)
values ('517920020', 'Depp', 'Mindy', 'mindy.depp@keith.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('843478897', 'Torn', 'Sally', 'storn@deutschetelekom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('652327528', 'Studi', 'Gena', 'gena.studi@younginnovations.co');
insert into PERSON (pid, l_name, f_name, email)
values ('581195954', 'Drive', 'Richard', 'richard.drive@neogen.de');
insert into PERSON (pid, l_name, f_name, email)
values ('722968346', 'Irons', 'Elvis', 'elvis@lloydgroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('256967718', 'Buscemi', 'Ving', 'ving.buscemi@mag.de');
insert into PERSON (pid, l_name, f_name, email)
values ('568104707', 'Michael', 'Davey', 'dmichael@mls.nz');
insert into PERSON (pid, l_name, f_name, email)
values ('299901965', 'Cook', 'Christian', 'christian.c@lemproducts.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('999950098', 'Orton', 'Moe', 'moeo@americanvanguard.com');
insert into PERSON (pid, l_name, f_name, email)
values ('187799087', 'Carmen', 'Terence', 'terencec@pscinfogroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('523692621', 'Krabbe', 'Rodney', 'rodney.krabbe@sunstream.com');
insert into PERSON (pid, l_name, f_name, email)
values ('692642433', 'Loveless', 'Jason', 'jason.loveless@pearllawgroup.c');
insert into PERSON (pid, l_name, f_name, email)
values ('943811449', 'Michaels', 'Sonny', 'smichaels@atg.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('678488732', 'Rock', 'Willem', 'willem.rock@tilsonlandscape.br');
insert into PERSON (pid, l_name, f_name, email)
values ('392142161', 'Lightfoot', 'Michael', 'michael@y2marketing.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('495883869', 'Spine', 'Clint', 'clint.s@ptg.de');
insert into PERSON (pid, l_name, f_name, email)
values ('036582867', 'Lynne', 'Loretta', 'loretta@printingforlesscom.es');
insert into PERSON (pid, l_name, f_name, email)
values ('525011460', 'Levy', 'Harvey', 'harvey.levy@esteelauder.is');
insert into PERSON (pid, l_name, f_name, email)
values ('105199084', 'Ledger', 'Morris', 'morris.ledger@datawarehouse.co');
insert into PERSON (pid, l_name, f_name, email)
values ('971155219', 'Lowe', 'Terrence', 'terrence.lowe@smg.de');
insert into PERSON (pid, l_name, f_name, email)
values ('937580305', 'Clayton', 'Trace', 'trace.clayton@career.ar');
insert into PERSON (pid, l_name, f_name, email)
values ('243227351', 'Austin', 'Jeanne', 'jeanne.austin@qls.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('324878971', 'Levin', 'Carlos', 'carlos.levin@onesourceprinting');
insert into PERSON (pid, l_name, f_name, email)
values ('106071827', 'Houston', 'Udo', 'udo@gapinc.hu');
insert into PERSON (pid, l_name, f_name, email)
values ('470059781', 'Secada', 'Mia', 'm.secada@timberlanewoodcrafter');
insert into PERSON (pid, l_name, f_name, email)
values ('918897510', 'Eastwood', 'Larry', 'larry.eastwood@cooktek.com');
insert into PERSON (pid, l_name, f_name, email)
values ('154075422', 'Viterelli', 'Horace', 'hviterelli@americanhealthways.');
insert into PERSON (pid, l_name, f_name, email)
values ('375104960', 'Osborne', 'Merillee', 'm.osborne@astute.com');
insert into PERSON (pid, l_name, f_name, email)
values ('725563629', 'Hauser', 'Connie', 'connie@servicesource.de');
insert into PERSON (pid, l_name, f_name, email)
values ('145729018', 'Hector', 'Rade', 'rade.hector@terrafirma.ar');
insert into PERSON (pid, l_name, f_name, email)
values ('568320004', 'Savage', 'Rebecca', 'rebecca.savage@sfgo.com');
insert into PERSON (pid, l_name, f_name, email)
values ('313406747', 'Marsden', 'Brenda', 'brenda.m@generalelectric.za');
insert into PERSON (pid, l_name, f_name, email)
values ('433660379', 'Gandolfini', 'Ellen', 'elleng@connected.com');
insert into PERSON (pid, l_name, f_name, email)
values ('542989613', 'Costa', 'Grace', 'grace.costa@pfizer.es');
insert into PERSON (pid, l_name, f_name, email)
values ('430593051', 'McDonnell', 'Neve', 'nevem@ceom.de');
insert into PERSON (pid, l_name, f_name, email)
values ('818785981', 'Trejo', 'Edie', 'etrejo@providentbancorp.br');
insert into PERSON (pid, l_name, f_name, email)
values ('746465341', 'Osmond', 'Todd', 'todd@telepoint.id');
insert into PERSON (pid, l_name, f_name, email)
values ('970320341', 'Amos', 'Kay', 'kay@bestbuy.com');
insert into PERSON (pid, l_name, f_name, email)
values ('328635747', 'Cusack', 'Gwyneth', 'gwyneth.cusack@sunstream.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('238511855', 'Phoenix', 'Eugene', 'eugene.phoenix@accuship.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('084607020', 'Dean', 'Chaka', 'chaka.dean@hondamotor.com');
insert into PERSON (pid, l_name, f_name, email)
values ('745440575', 'Hershey', 'Jonny Lee', 'jonnylee@timevision.com');
insert into PERSON (pid, l_name, f_name, email)
values ('165537016', 'Levine', 'Wang', 'wang@mwp.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('529168900', 'Fichtner', 'Neve', 'nevef@news.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('480284180', 'Cummings', 'Jena', 'jena.cummings@faef.com');
insert into PERSON (pid, l_name, f_name, email)
values ('339222343', 'Snider', 'Melba', 'melba.snider@sps.com');
insert into PERSON (pid, l_name, f_name, email)
values ('593266613', 'Osborne', 'Ralph', 'ralph.osborne@powerlight.com');
insert into PERSON (pid, l_name, f_name, email)
values ('821628217', 'Mathis', 'Roger', 'roger.mathis@albertsons.com');
insert into PERSON (pid, l_name, f_name, email)
values ('974550419', 'Stiles', 'Lance', 'lance.stiles@comglobalsystems.');
insert into PERSON (pid, l_name, f_name, email)
values ('558361778', 'Davison', 'Kazem', 'kazem.d@mission.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('206021383', 'Haynes', 'Carrie', 'carrie.haynes@maverick.se');
insert into PERSON (pid, l_name, f_name, email)
values ('134418342', 'Cummings', 'Miguel', 'miguel@loreal.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('060138485', 'Forster', 'Julianne', 'julianne.forster@newmedia.au');
insert into PERSON (pid, l_name, f_name, email)
values ('178510404', 'Raybon', 'Kurt', 'kurt.raybon@gci.it');
insert into PERSON (pid, l_name, f_name, email)
values ('776216289', 'Nash', 'John', 'john.nash@ezecastlesoftware.co');
insert into PERSON (pid, l_name, f_name, email)
values ('173555218', 'Hyde', 'Colin', 'colin.hyde@timberlanewoodcraft');
insert into PERSON (pid, l_name, f_name, email)
values ('289479099', 'Caldwell', 'Renee', 'renee.caldwell@shot.com');
insert into PERSON (pid, l_name, f_name, email)
values ('001389140', 'Garr', 'Guy', 'guy.g@dbprofessionals.com');
insert into PERSON (pid, l_name, f_name, email)
values ('133595224', 'Byrd', 'Bernie', 'b.byrd@advancedneuromodulation');
insert into PERSON (pid, l_name, f_name, email)
values ('462570473', 'Wiedlin', 'Dabney', 'dabney.wiedlin@gltg.com');
insert into PERSON (pid, l_name, f_name, email)
values ('773999246', 'Diaz', 'Morris', 'morris.diaz@unilever.com');
insert into PERSON (pid, l_name, f_name, email)
values ('534953936', 'McIntosh', 'Vickie', 'vickie.mcintosh@mms.com');
insert into PERSON (pid, l_name, f_name, email)
values ('599521985', 'Shannon', 'Hilary', 'hshannon@smartronix.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('596134137', 'Lewin', 'Catherine', 'c.lewin@typhoon.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('460201447', 'Seagal', 'LeVar', 'levars@nike.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('320944228', 'Swayze', 'Peabo', 'peabos@meritagetechnologies.co');
insert into PERSON (pid, l_name, f_name, email)
values ('664166389', 'Balaban', 'Miranda', 'miranda.b@hfn.de');
insert into PERSON (pid, l_name, f_name, email)
values ('214376367', 'Daniels', 'Jonatha', 'jdaniels@fnb.it');
insert into PERSON (pid, l_name, f_name, email)
values ('452597433', 'Shearer', 'Campbell', 'campbell@catamount.com');
insert into PERSON (pid, l_name, f_name, email)
values ('901831943', 'Lovitz', 'Christmas', 'c.lovitz@jewettcameron.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('553830128', 'Capshaw', 'Louise', 'louise@seiaarons.com');
insert into PERSON (pid, l_name, f_name, email)
values ('573459851', 'Merchant', 'Karon', 'k.merchant@pis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('798850878', 'Horizon', 'Daryl', 'darylh@airmethods.in');
commit;
prompt 800 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('773341434', 'von Sydow', 'Gilberto', 'gilberto.vonsydow@campbellsoup');
insert into PERSON (pid, l_name, f_name, email)
values ('530485585', 'Pullman', 'Maggie', 'maggiep@ciwservices.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('033712611', 'O''Donnell', 'Ritchie', 'ritchie.o@palmbeachtan.no');
insert into PERSON (pid, l_name, f_name, email)
values ('424854643', 'McClinton', 'Bobbi', 'bobbim@pib.com');
insert into PERSON (pid, l_name, f_name, email)
values ('745537423', 'Warburton', 'Michael', 'michael.warburton@quicksilverr');
insert into PERSON (pid, l_name, f_name, email)
values ('349136279', 'Osmond', 'Arturo', 'a.osmond@paintedword.br');
insert into PERSON (pid, l_name, f_name, email)
values ('005988217', 'Chilton', 'Rosanne', 'rosanne@shirtfactory.com');
insert into PERSON (pid, l_name, f_name, email)
values ('631563282', 'White', 'Celia', 'c.white@mls.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('756743030', 'Ratzenberg', 'Denise', 'denise.ratzenberger@conquest.c');
insert into PERSON (pid, l_name, f_name, email)
values ('160205383', 'Wakeling', 'Mary', 'mary.w@mds.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('450816060', 'Haynes', 'Temuera', 'temuera.h@fam.com');
insert into PERSON (pid, l_name, f_name, email)
values ('662973383', 'Pleasence', 'Denise', 'denise.pleasence@pharmafab.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('283302396', 'Purefoy', 'Mykelti', 'mpurefoy@venoco.com');
insert into PERSON (pid, l_name, f_name, email)
values ('853599144', 'Black', 'Liv', 'l.black@whitewave.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('579628336', 'Collette', 'Max', 'm.collette@wyeth.se');
insert into PERSON (pid, l_name, f_name, email)
values ('728485742', 'Holeman', 'Chalee', 'chalee.holeman@diamondgroup.il');
insert into PERSON (pid, l_name, f_name, email)
values ('549782997', 'Feliciano', 'Bobby', 'b.feliciano@timberlanewoodcraf');
insert into PERSON (pid, l_name, f_name, email)
values ('338017722', 'Eder', 'Kevin', 'kevin.eder@sfb.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('979142513', 'Aiken', 'Leonardo', 'leonardo@sci.com');
insert into PERSON (pid, l_name, f_name, email)
values ('414116543', 'Kweller', 'Rick', 'rkweller@its.in');
insert into PERSON (pid, l_name, f_name, email)
values ('508924600', 'Williamson', 'Barry', 'bwilliamson@accucode.de');
insert into PERSON (pid, l_name, f_name, email)
values ('455562259', 'Hirsch', 'Todd', 'todd.hirsch@kingland.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('219741983', 'McGinley', 'Bridgette', 'b.mcginley@yumbrands.com');
insert into PERSON (pid, l_name, f_name, email)
values ('046939788', 'Hunt', 'Lois', 'l.hunt@capitalbank.com');
insert into PERSON (pid, l_name, f_name, email)
values ('779545472', 'Ward', 'Kelly', 'kward@securitycheck.com');
insert into PERSON (pid, l_name, f_name, email)
values ('307500304', 'Reeve', 'Jesus', 'jesus.reeve@hitechpharmacal.de');
insert into PERSON (pid, l_name, f_name, email)
values ('313233834', 'Schiff', 'Rosanne', 'rosanne.schiff@bedfordbancshar');
insert into PERSON (pid, l_name, f_name, email)
values ('292203959', 'MacNeil', 'Amy', 'amy.macneil@outsourcegroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('959837164', 'Gore', 'Ben', 'ben@parksite.br');
insert into PERSON (pid, l_name, f_name, email)
values ('047960546', 'Englund', 'Juliana', 'juliana.englund@prometheuslabo');
insert into PERSON (pid, l_name, f_name, email)
values ('275949914', 'Carlyle', 'Jake', 'jake@valleyoaksystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('394921334', 'Esposito', 'Rob', 'r.esposito@evergreenresources.');
insert into PERSON (pid, l_name, f_name, email)
values ('629228565', 'Mollard', 'Corey', 'corey.mollard@travizon.com');
insert into PERSON (pid, l_name, f_name, email)
values ('724161898', 'Moffat', 'Alana', 'amoffat@infopros.com');
insert into PERSON (pid, l_name, f_name, email)
values ('336451229', 'Berkeley', 'Harris', 'harris@procurementcentre.com');
insert into PERSON (pid, l_name, f_name, email)
values ('371775100', 'Shelton', 'Rawlins', 'rawlins.shelton@actechnologies');
insert into PERSON (pid, l_name, f_name, email)
values ('335140071', 'Gryner', 'Shannyn', 'shannyng@blueoceansoftware.com');
insert into PERSON (pid, l_name, f_name, email)
values ('564376993', 'Field', 'Gene', 'genef@ads.br');
insert into PERSON (pid, l_name, f_name, email)
values ('790324046', 'Byrne', 'Penelope', 'penelope.byrne@pharmafab.com');
insert into PERSON (pid, l_name, f_name, email)
values ('408778591', 'Rollins', 'Grace', 'grace.rollins@savela.tr');
insert into PERSON (pid, l_name, f_name, email)
values ('688431905', 'Curfman', 'Davey', 'dcurfman@biosite.be');
insert into PERSON (pid, l_name, f_name, email)
values ('800171132', 'Teng', 'Maureen', 'maureen.teng@safehomesecurity.');
insert into PERSON (pid, l_name, f_name, email)
values ('298645671', 'Ferrell', 'Juice', 'juice.f@sandyspringbancorp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('425467041', 'Belushi', 'Darius', 'darius@officedepot.com');
insert into PERSON (pid, l_name, f_name, email)
values ('402373896', 'Loveless', 'Sheryl', 'sheryl@mwp.de');
insert into PERSON (pid, l_name, f_name, email)
values ('691285942', 'O''Connor', 'Roberta', 'roberta.oconnor@marsinc.com');
insert into PERSON (pid, l_name, f_name, email)
values ('928837486', 'Forrest', 'Benicio', 'benicio.f@elmco.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('238348956', 'Adams', 'Howard', 'howard.adams@pharmacia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('278152544', 'Dayne', 'Danni', 'ddayne@tarragonrealty.com');
insert into PERSON (pid, l_name, f_name, email)
values ('053440950', 'Rydell', 'Bernard', 'bernard.r@qls.de');
insert into PERSON (pid, l_name, f_name, email)
values ('245217745', 'Savage', 'Gary', 'gary.savage@timevision.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('002554127', 'Cash', 'Ashton', 'ashton.cash@callhenry.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('866666849', 'Rudd', 'Rich', 'rich@iss.com');
insert into PERSON (pid, l_name, f_name, email)
values ('160752957', 'Cross', 'Juliette', 'juliette.cross@infinity.au');
insert into PERSON (pid, l_name, f_name, email)
values ('192849062', 'McKennitt', 'Christmas', 'christmas.mckennitt@staffforce');
insert into PERSON (pid, l_name, f_name, email)
values ('714738586', 'Conroy', 'Robbie', 'robbie.conroy@mag.de');
insert into PERSON (pid, l_name, f_name, email)
values ('567041750', 'Crosby', 'Geggy', 'geggy.crosby@mwp.br');
insert into PERSON (pid, l_name, f_name, email)
values ('328690242', 'Atkinson', 'Clea', 'clea.atkinson@lms.es');
insert into PERSON (pid, l_name, f_name, email)
values ('501142152', 'Gordon', 'Buddy', 'buddy.g@atlanticcredit.com');
insert into PERSON (pid, l_name, f_name, email)
values ('162799501', 'Valentin', 'Manu', 'manu.valentin@sysconmedia.de');
insert into PERSON (pid, l_name, f_name, email)
values ('729610652', 'Fender', 'Carlene', 'carlene.fender@lydiantrust.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('735976872', 'Sedgwick', 'Juliana', 'juliana@hps.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('609343955', 'Bridges', 'Rick', 'rick.bridges@globalwireless.si');
insert into PERSON (pid, l_name, f_name, email)
values ('915820055', 'Flatts', 'Neve', 'neve.f@ghrsystems.com');
insert into PERSON (pid, l_name, f_name, email)
values ('137669479', 'Holmes', 'Rod', 'rholmes@innovativelighting.com');
insert into PERSON (pid, l_name, f_name, email)
values ('266267564', 'Dourif', 'Debi', 'debi@newviewgifts.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('693085728', 'Palminteri', 'Rosco', 'rosco@axis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('986571242', 'McCann', 'Jackie', 'jackie.mccann@americanpan.pt');
insert into PERSON (pid, l_name, f_name, email)
values ('009278966', 'Reeves', 'Powers', 'powers.reeves@midwestmedia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('806081230', 'Loeb', 'Al', 'al.loeb@pds.de');
insert into PERSON (pid, l_name, f_name, email)
values ('031240584', 'Mewes', 'Olga', 'olga.m@mindiq.com');
insert into PERSON (pid, l_name, f_name, email)
values ('360157179', 'Jones', 'Christian', 'christianj@vertexsolutions.de');
insert into PERSON (pid, l_name, f_name, email)
values ('085630234', 'Strathairn', 'Michelle', 'michelles@usphysicaltherapy.co');
insert into PERSON (pid, l_name, f_name, email)
values ('462497141', 'LaBelle', 'Rhys', 'rhys.labelle@viacom.br');
insert into PERSON (pid, l_name, f_name, email)
values ('635348517', 'Monk', 'Joaquin', 'joaquin.monk@ogiointernational');
insert into PERSON (pid, l_name, f_name, email)
values ('009934088', 'McNeice', 'Allison', 'allison.m@qls.com');
insert into PERSON (pid, l_name, f_name, email)
values ('369093284', 'Vince', 'Giancarlo', 'giancarlo.vince@elitemedical.i');
insert into PERSON (pid, l_name, f_name, email)
values ('893736845', 'Minogue', 'Wesley', 'w.minogue@circuitcitystores.co');
insert into PERSON (pid, l_name, f_name, email)
values ('613689167', 'Krabbe', 'Stephanie', 'stephanie.krabbe@sunstream.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('318657191', 'Gagnon', 'Tilda', 't.gagnon@jma.de');
insert into PERSON (pid, l_name, f_name, email)
values ('685875750', 'Meniketti', 'Selma', 's.meniketti@smg.se');
insert into PERSON (pid, l_name, f_name, email)
values ('441166212', 'Tisdale', 'Karen', 'k.tisdale@chipssolutions.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('772399394', 'Wariner', 'Praga', 'praga.wariner@kelmooreinvestme');
insert into PERSON (pid, l_name, f_name, email)
values ('680172578', 'Askew', 'Scott', 'saskew@solutionbuilders.com');
insert into PERSON (pid, l_name, f_name, email)
values ('093460285', 'Overstreet', 'Julia', 'juliao@yashtechnologies.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('813420981', 'Shepherd', 'Diane', 'diane.shepherd@data.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('128122177', 'Worrell', 'Kazem', 'kazem.worrell@dps.is');
insert into PERSON (pid, l_name, f_name, email)
values ('485749616', 'Biggs', 'Miriam', 'miriamb@toyotamotor.br');
insert into PERSON (pid, l_name, f_name, email)
values ('579917842', 'Botti', 'Udo', 'u.botti@chipssolutions.de');
insert into PERSON (pid, l_name, f_name, email)
values ('317837716', 'Burns', 'Daryle', 'daryle.b@jlphor.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('131166588', 'Kinski', 'Heather', 'h.kinski@denaliventures.es');
insert into PERSON (pid, l_name, f_name, email)
values ('566372714', 'Stevens', 'Edwin', 'edwin.s@capital.com');
insert into PERSON (pid, l_name, f_name, email)
values ('103951857', 'Weiss', 'Night', 'night.weiss@dcgroup.il');
insert into PERSON (pid, l_name, f_name, email)
values ('534346136', 'Goodman', 'Deborah', 'deborah@cooktek.com');
insert into PERSON (pid, l_name, f_name, email)
values ('798334799', 'Swayze', 'Kiefer', 'kiefer.swayze@tps.hk');
insert into PERSON (pid, l_name, f_name, email)
values ('958133138', 'Coughlan', 'Jerry', 'jerry.coughlan@gulfmarkoffshor');
insert into PERSON (pid, l_name, f_name, email)
values ('945698309', 'Redgrave', 'April', 'april.redgrave@diversitech.nl');
insert into PERSON (pid, l_name, f_name, email)
values ('048374256', 'Pryce', 'Stephanie', 'stephanie.pryce@pscinfogroup.c');
insert into PERSON (pid, l_name, f_name, email)
values ('752785736', 'Lapointe', 'Merrill', 'merrill.l@atlanticnet.com');
insert into PERSON (pid, l_name, f_name, email)
values ('344180344', 'Fariq', 'Jean', 'jean.fariq@astute.com');
commit;
prompt 900 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('165323833', 'Broadbent', 'Leslie', 'leslieb@prahs.de');
insert into PERSON (pid, l_name, f_name, email)
values ('218095746', 'Washington', 'Rod', 'rod@vfs.de');
insert into PERSON (pid, l_name, f_name, email)
values ('591817202', 'Caldwell', 'Liev', 'liev.caldwell@dbprofessionals.');
insert into PERSON (pid, l_name, f_name, email)
values ('193556691', 'Fonda', 'Kurtwood', 'kurtwoodf@prosperitybancshares');
insert into PERSON (pid, l_name, f_name, email)
values ('455747246', 'Gray', 'Hal', 'hal.gray@kellogg.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('708511967', 'Def', 'Ike', 'ike.def@waltdisney.il');
insert into PERSON (pid, l_name, f_name, email)
values ('969250919', 'Macht', 'Mandy', 'mandy.macht@fab.de');
insert into PERSON (pid, l_name, f_name, email)
values ('243237202', 'Wainwright', 'Rhys', 'rhys.w@asapstaffing.com');
insert into PERSON (pid, l_name, f_name, email)
values ('685164958', 'Wilder', 'Ike', 'ikew@medamicus.at');
insert into PERSON (pid, l_name, f_name, email)
values ('829724664', 'Clark', 'Rod', 'rod.clark@gillette.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('937684812', 'O''Neill', 'Arnold', 'arnold@dynacqinternational.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('288392205', 'Lonsdale', 'Lydia', 'lydia.lonsdale@outsourcegroup.');
insert into PERSON (pid, l_name, f_name, email)
values ('950159072', 'Collins', 'Ann', 'ann.collins@kingland.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('048335437', 'Elwes', 'Elias', 'elias@tracertechnologies.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('624367005', 'Ponty', 'Cameron', 'cameron@gna.com');
insert into PERSON (pid, l_name, f_name, email)
values ('363303405', 'Coughlan', 'Wes', 'wesc@abs.com');
insert into PERSON (pid, l_name, f_name, email)
values ('684008443', 'Fox', 'Randy', 'randy.fox@kellogg.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('373058261', 'Hanks', 'Gordie', 'gordie.hanks@callhenry.com');
insert into PERSON (pid, l_name, f_name, email)
values ('512687180', 'McLachlan', 'Fionnula', 'fionnula@aquascapedesigns.com');
insert into PERSON (pid, l_name, f_name, email)
values ('159478573', 'Spall', 'Beverley', 'beverley.spall@myricom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('716522491', 'Liotta', 'Walter', 'w.liotta@tracertechnologies.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('182026505', 'Warwick', 'Mary-Louis', 'marylouise.warwick@tilia.com');
insert into PERSON (pid, l_name, f_name, email)
values ('510135691', 'Driver', 'Lily', 'lily.d@progressivemedical.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('741067991', 'Morales', 'Liv', 'liv.m@curagroup.com');
insert into PERSON (pid, l_name, f_name, email)
values ('715742239', 'Getty', 'Judi', 'judig@officedepot.com');
insert into PERSON (pid, l_name, f_name, email)
values ('517173374', 'LaMond', 'Terry', 'terryl@nha.com');
insert into PERSON (pid, l_name, f_name, email)
values ('735454477', 'Tolkan', 'Swoosie', 'swoosie.tolkan@sfgo.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('374563910', 'Bloch', 'Wayman', 'wayman.bloch@idas.com');
insert into PERSON (pid, l_name, f_name, email)
values ('679634057', 'Kirshner', 'Lou', 'lkirshner@cendant.com');
insert into PERSON (pid, l_name, f_name, email)
values ('245843519', 'Rush', 'Demi', 'drush@solutionbuilders.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('897155427', 'Hedaya', 'Ronnie', 'rhedaya@unilever.com');
insert into PERSON (pid, l_name, f_name, email)
values ('626190956', 'Jones', 'Bobbi', 'bobbi.jones@bashen.de');
insert into PERSON (pid, l_name, f_name, email)
values ('775083908', 'Addy', 'Quentin', 'quentina@simplycertificates.gr');
insert into PERSON (pid, l_name, f_name, email)
values ('822670622', 'Steenburge', 'Roscoe', 'roscoe.steenburgen@officedepot');
insert into PERSON (pid, l_name, f_name, email)
values ('824648175', 'Hershey', 'Martin', 'martin.hershey@otbd.com');
insert into PERSON (pid, l_name, f_name, email)
values ('091115833', 'Skaggs', 'Jet', 'jet.skaggs@diageo.de');
insert into PERSON (pid, l_name, f_name, email)
values ('693359794', 'Cook', 'Pam', 'pam.cook@securitycheck.br');
insert into PERSON (pid, l_name, f_name, email)
values ('891033589', 'Laws', 'Kazem', 'kazem@pepsico.br');
insert into PERSON (pid, l_name, f_name, email)
values ('699304048', 'Benson', 'Kenneth', 'kenneth.benson@servicelink.de');
insert into PERSON (pid, l_name, f_name, email)
values ('144241662', 'Crowe', 'Geena', 'geena.crowe@walmartstores.com');
insert into PERSON (pid, l_name, f_name, email)
values ('883233226', 'Sample', 'Eddie', 'eddie.sample@mls.com');
insert into PERSON (pid, l_name, f_name, email)
values ('544584584', 'Nash', 'Queen', 'queen.nash@teamstudio.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('385327967', 'Skerritt', 'Famke', 'famke.skerritt@comnetinternati');
insert into PERSON (pid, l_name, f_name, email)
values ('969313022', 'Rain', 'Linda', 'linda.rain@ivci.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('246530018', 'Richards', 'CeCe', 'cece.richards@trainersoft.tw');
insert into PERSON (pid, l_name, f_name, email)
values ('319137744', 'Robbins', 'Gavin', 'grobbins@diversitech.com');
insert into PERSON (pid, l_name, f_name, email)
values ('887179841', 'Richardson', 'Kylie', 'k.richardson@esoftsolutions.co');
insert into PERSON (pid, l_name, f_name, email)
values ('444679738', 'Matthau', 'Jimmy', 'jimmy.matthau@ceom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('309146979', 'Suvari', 'Gilbert', 'gilbert@americanpan.com');
insert into PERSON (pid, l_name, f_name, email)
values ('398323674', 'Mazzello', 'Jonatha', 'jonatha@gra.com');
insert into PERSON (pid, l_name, f_name, email)
values ('826779473', 'Kirkwood', 'Jeffrey', 'jeffrey.kirkwood@commworks.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('629219354', 'Lee', 'Sigourney', 'sigourneyl@progressivedesigns.');
insert into PERSON (pid, l_name, f_name, email)
values ('537321778', 'Dunaway', 'Hikaru', 'hikaru.dunaway@netnumina.pl');
insert into PERSON (pid, l_name, f_name, email)
values ('898034681', 'Sewell', 'Tara', 'taras@servicesource.mx');
insert into PERSON (pid, l_name, f_name, email)
values ('859643900', 'Gleeson', 'Gladys', 'gladys@oneidafinancial.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('379738455', 'Copeland', 'Kris', 'k.copeland@pioneermortgage.com');
insert into PERSON (pid, l_name, f_name, email)
values ('527027619', 'Dempsey', 'Eliza', 'eliza@interfacesoftware.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('603911711', 'Patrick', 'Garth', 'garth.patrick@techrx.com');
insert into PERSON (pid, l_name, f_name, email)
values ('490388060', 'Burrows', 'Kevin', 'kevinb@doraldentalusa.de');
insert into PERSON (pid, l_name, f_name, email)
values ('166963478', 'Davidson', 'Darren', 'darrend@novartis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('957568433', 'Spears', 'Ted', 'teds@scriptsave.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('990745050', 'Quatro', 'Neneh', 'neneh@electricalsolutions.mx');
insert into PERSON (pid, l_name, f_name, email)
values ('002413679', 'Himmelman', 'Ashton', 'a.himmelman@mls.com');
insert into PERSON (pid, l_name, f_name, email)
values ('408098993', 'Mellencamp', 'Lou', 'lou.mellencamp@alogent.com');
insert into PERSON (pid, l_name, f_name, email)
values ('307081120', 'Sherman', 'Grace', 'grace.sherman@tps.es');
insert into PERSON (pid, l_name, f_name, email)
values ('085605134', 'Gagnon', 'Ned', 'ned.gagnon@innovativelighting.');
insert into PERSON (pid, l_name, f_name, email)
values ('413614582', 'Boyle', 'Dave', 'dave.boyle@ctg.be');
insert into PERSON (pid, l_name, f_name, email)
values ('074081051', 'Conlee', 'Dianne', 'dianne.conlee@linersdirect.es');
insert into PERSON (pid, l_name, f_name, email)
values ('347949461', 'Carrington', 'Freddy', 'freddy.carrington@allegiantban');
insert into PERSON (pid, l_name, f_name, email)
values ('755920284', 'Bacharach', 'Ellen', 'ellen.bacharach@nexxtworks.com');
insert into PERSON (pid, l_name, f_name, email)
values ('470099123', 'Hewett', 'Louise', 'lhewett@parksite.com');
insert into PERSON (pid, l_name, f_name, email)
values ('733678399', 'Domino', 'Marie', 'm.domino@generalelectric.com');
insert into PERSON (pid, l_name, f_name, email)
values ('172623234', 'Vincent', 'Larry', 'larry.vincent@linersdirect.de');
insert into PERSON (pid, l_name, f_name, email)
values ('393974266', 'Rapaport', 'Frances', 'frances.rapaport@commworks.be');
insert into PERSON (pid, l_name, f_name, email)
values ('663516006', 'Lineback', 'Fisher', 'fisher.lineback@monitronicsint');
insert into PERSON (pid, l_name, f_name, email)
values ('405534830', 'McNarland', 'Naomi', 'naomi.m@circuitcitystores.sg');
insert into PERSON (pid, l_name, f_name, email)
values ('285751992', 'Blanchett', 'Earl', 'earl.blanchett@gcd.be');
insert into PERSON (pid, l_name, f_name, email)
values ('632883384', 'Fehr', 'Omar', 'omar.fehr@providentbancorp.br');
insert into PERSON (pid, l_name, f_name, email)
values ('159818385', 'Michaels', 'Merillee', 'm.michaels@glmt.com');
insert into PERSON (pid, l_name, f_name, email)
values ('827333300', 'Caldwell', 'Taye', 'taye.caldwell@hudsonriverbanco');
insert into PERSON (pid, l_name, f_name, email)
values ('762595642', 'Mantegna', 'Jared', 'jared@isd.se');
insert into PERSON (pid, l_name, f_name, email)
values ('165821288', 'Cassidy', 'Molly', 'molly@gapinc.de');
insert into PERSON (pid, l_name, f_name, email)
values ('877652677', 'Cozier', 'Charlie', 'charlie.cozier@sfgo.com');
insert into PERSON (pid, l_name, f_name, email)
values ('132122147', 'Lapointe', 'Ralph', 'ralphl@paintedword.com');
insert into PERSON (pid, l_name, f_name, email)
values ('894820834', 'Thorton', 'Morris', 'morris.thorton@diversitech.si');
insert into PERSON (pid, l_name, f_name, email)
values ('884465511', 'Haslam', 'Katrin', 'katrin.haslam@volkswagen.com');
insert into PERSON (pid, l_name, f_name, email)
values ('841337498', 'White', 'Jena', 'jena.white@contract.ca');
insert into PERSON (pid, l_name, f_name, email)
values ('914978294', 'Wainwright', 'Queen', 'queen.wainwright@gna.hu');
insert into PERSON (pid, l_name, f_name, email)
values ('364965899', 'Jenkins', 'Emilio', 'emilio@gna.com');
insert into PERSON (pid, l_name, f_name, email)
values ('004437338', 'Leguizamo', 'Katrin', 'katrin.leguizamo@pearllawgroup');
insert into PERSON (pid, l_name, f_name, email)
values ('358565731', 'Chung', 'Emmylou', 'emmylou.chung@hitechpharmacal.');
insert into PERSON (pid, l_name, f_name, email)
values ('318741729', 'Schneider', 'Bryan', 'bryan.s@biosite.com');
insert into PERSON (pid, l_name, f_name, email)
values ('100713766', 'Gosdin', 'Maceo', 'maceo.gosdin@abs.com');
insert into PERSON (pid, l_name, f_name, email)
values ('637020775', 'Scott', 'Allison', 'allisons@bioreference.com');
insert into PERSON (pid, l_name, f_name, email)
values ('215143637', 'Abraham', 'Lee', 'lee.abraham@thinktanksystems.c');
insert into PERSON (pid, l_name, f_name, email)
values ('529679514', 'Roundtree', 'Ethan', 'ethan.roundtree@gapinc.gr');
insert into PERSON (pid, l_name, f_name, email)
values ('958905680', 'Tisdale', 'Keith', 'keith.tisdale@contract.it');
insert into PERSON (pid, l_name, f_name, email)
values ('684169296', 'Barnett', 'Lin', 'lin.barnett@ibm.es');
insert into PERSON (pid, l_name, f_name, email)
values ('724920930', 'McConaughe', 'Emmylou', 'emmylou.mcconaughey@generalele');
insert into PERSON (pid, l_name, f_name, email)
values ('714824861', 'Parker', 'Burton', 'burton.p@max.ca');
commit;
prompt 1000 records committed...
insert into PERSON (pid, l_name, f_name, email)
values ('672905392', 'Summer', 'Renee', 'renees@capital.de');
insert into PERSON (pid, l_name, f_name, email)
values ('940598817', 'Michaels', 'Janice', 'janice.michaels@aop.it');
insert into PERSON (pid, l_name, f_name, email)
values ('044352560', 'McConaughe', 'Murray', 'murray.mcconaughey@kiamotors.a');
insert into PERSON (pid, l_name, f_name, email)
values ('046919723', 'Collins', 'Nikka', 'nikka.collins@sms.com');
insert into PERSON (pid, l_name, f_name, email)
values ('929827015', 'Weiland', 'Kitty', 'kitty.weiland@staffforce.fr');
insert into PERSON (pid, l_name, f_name, email)
values ('590746015', 'Thompson', 'Richie', 'richie.thompson@lemproducts.co');
insert into PERSON (pid, l_name, f_name, email)
values ('128369427', 'Coverdale', 'Johnette', 'johnette.c@pib.com');
insert into PERSON (pid, l_name, f_name, email)
values ('773013219', 'Conway', 'Nile', 'nile.conway@bat.it');
insert into PERSON (pid, l_name, f_name, email)
values ('951406869', 'Marsden', 'April', 'april.marsden@diamondtechnolog');
insert into PERSON (pid, l_name, f_name, email)
values ('403751552', 'Stiles', 'Ned', 'ned.stiles@mcdonalds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('276597478', 'Ali', 'Michelle', 'michelle@globalwireless.com');
insert into PERSON (pid, l_name, f_name, email)
values ('881618330', 'Bancroft', 'Wesley', 'wesleyb@mitsubishimotors.com');
insert into PERSON (pid, l_name, f_name, email)
values ('650436166', 'Hynde', 'Meredith', 'mhynde@powerlight.com');
insert into PERSON (pid, l_name, f_name, email)
values ('740704902', 'Adler', 'Gloria', 'gloria.adler@multimedialive.co');
insert into PERSON (pid, l_name, f_name, email)
values ('620341445', 'Banderas', 'Jimmie', 'jimmie.banderas@netnumina.com');
insert into PERSON (pid, l_name, f_name, email)
values ('032070336', 'Heatherly', 'Adrien', 'adrien@questarcapital.com');
insert into PERSON (pid, l_name, f_name, email)
values ('553866781', 'Colon', 'Katie', 'katiec@accessus.com');
insert into PERSON (pid, l_name, f_name, email)
values ('696752326', 'Stamp', 'Rory', 'rory.stamp@pis.de');
insert into PERSON (pid, l_name, f_name, email)
values ('933237910', 'Kirkwood', 'Allan', 'akirkwood@newmedia.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('888505515', 'Gates', 'Marc', 'marc.g@serentec.com');
insert into PERSON (pid, l_name, f_name, email)
values ('971326374', 'Benet', 'Mykelti', 'mykelti.benet@stiknowledge.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('108104963', 'Flack', 'Denzel', 'denzel.flack@waltdisney.com');
insert into PERSON (pid, l_name, f_name, email)
values ('273995455', 'Frampton', 'Debby', 'debby.f@jlphor.at');
insert into PERSON (pid, l_name, f_name, email)
values ('559736783', 'Akins', 'Leslie', 'l.akins@cardinalcartridge.com');
insert into PERSON (pid, l_name, f_name, email)
values ('116458811', 'Tolkan', 'Dom', 'dtolkan@gtp.com');
insert into PERSON (pid, l_name, f_name, email)
values ('664976546', 'Ontiveros', 'Ashton', 'ashtono@sds.de');
insert into PERSON (pid, l_name, f_name, email)
values ('372210613', 'Chaplin', 'Keith', 'keith.chaplin@larkinenterprise');
insert into PERSON (pid, l_name, f_name, email)
values ('240100155', 'Carmen', 'Stephanie', 'stephanie.carmen@dbprofessiona');
insert into PERSON (pid, l_name, f_name, email)
values ('694103782', 'Chapman', 'Connie', 'connie.chapman@cws.de');
insert into PERSON (pid, l_name, f_name, email)
values ('142225890', 'Astin', 'Jason', 'jason.astin@idas.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('118298056', 'Woodward', 'Alfie', 'a.woodward@alohanysystems.ar');
insert into PERSON (pid, l_name, f_name, email)
values ('106758411', 'Craig', 'Queen', 'queen@capstone.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('823811487', 'Richardson', 'Lari', 'lari.richardson@questarcapital');
insert into PERSON (pid, l_name, f_name, email)
values ('627820755', 'Landau', 'Ryan', 'ryan.landau@gentrasystems.fi');
insert into PERSON (pid, l_name, f_name, email)
values ('642604802', 'Madonna', 'Brad', 'brad.madonna@componentgraphics');
insert into PERSON (pid, l_name, f_name, email)
values ('288926877', 'Burmester', 'Jason', 'jason.burmester@ivorysystems.i');
insert into PERSON (pid, l_name, f_name, email)
values ('025800738', 'Creek', 'Albertina', 'albertina.creek@bps.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('612006367', 'Sherman', 'Mary', 'mary.sherman@ctg.cz');
insert into PERSON (pid, l_name, f_name, email)
values ('591456995', 'Pitt', 'Harvey', 'hpitt@shirtfactory.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('739957966', 'Day-Lewis', 'Casey', 'casey.d@conagra.it');
insert into PERSON (pid, l_name, f_name, email)
values ('962374483', 'Campbell', 'Sophie', 's.campbell@signalperfection.co');
insert into PERSON (pid, l_name, f_name, email)
values ('286100323', 'Malone', 'Rory', 'rory.malone@digitalmotorworks.');
insert into PERSON (pid, l_name, f_name, email)
values ('384427644', 'Craddock', 'Jann', 'jannc@smi.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('700886061', 'Jessee', 'Ted', 'tedj@sms.com');
insert into PERSON (pid, l_name, f_name, email)
values ('966583525', 'Crowe', 'Hex', 'h.crowe@safeway.mx');
insert into PERSON (pid, l_name, f_name, email)
values ('146916207', 'Hawkins', 'Remy', 'remy.hawkins@waltdisney.com');
insert into PERSON (pid, l_name, f_name, email)
values ('008470299', 'Twilley', 'Robin', 'robin.twilley@sis.it');
insert into PERSON (pid, l_name, f_name, email)
values ('327770767', 'Gaines', 'Merillee', 'merillee@catamount.ie');
insert into PERSON (pid, l_name, f_name, email)
values ('245109099', 'Reeve', 'Daryl', 'daryl.reeve@conquestsystems.be');
insert into PERSON (pid, l_name, f_name, email)
values ('133060414', 'Mills', 'Dabney', 'dabney@airmethods.ar');
insert into PERSON (pid, l_name, f_name, email)
values ('233658208', 'Yulin', 'Jena', 'jena.yulin@elite.com');
insert into PERSON (pid, l_name, f_name, email)
values ('968732165', 'Giamatti', 'Chazz', 'cgiamatti@evergreenresources.c');
insert into PERSON (pid, l_name, f_name, email)
values ('099046356', 'Clarkson', 'Marc', 'marc.clarkson@johnson.de');
insert into PERSON (pid, l_name, f_name, email)
values ('315420007', 'Judd', 'Danni', 'dannij@genghisgrill.in');
insert into PERSON (pid, l_name, f_name, email)
values ('673035604', 'Pride', 'Edward', 'edward.pride@ibfh.de');
insert into PERSON (pid, l_name, f_name, email)
values ('331176583', 'Archer', 'Diane', 'diane.archer@larkinenterprises');
insert into PERSON (pid, l_name, f_name, email)
values ('141337002', 'Ojeda', 'Toshiro', 'toshiro@techbooks.com');
insert into PERSON (pid, l_name, f_name, email)
values ('986457175', 'Cleese', 'Arturo', 'arturo@myricom.com');
insert into PERSON (pid, l_name, f_name, email)
values ('991193712', 'Nash', 'Angie', 'angie.nash@americanhealthways.');
insert into PERSON (pid, l_name, f_name, email)
values ('871634320', 'Danes', 'Carlos', 'carlos.danes@bioanalytical.de');
insert into PERSON (pid, l_name, f_name, email)
values ('593607007', 'Polley', 'Ossie', 'ossiep@gci.com');
insert into PERSON (pid, l_name, f_name, email)
values ('873326782', 'Coyote', 'Salma', 's.coyote@bioreference.com');
insert into PERSON (pid, l_name, f_name, email)
values ('297681739', 'Sewell', 'Swoosie', 'swoosie@gsat.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('021114490', 'Baldwin', 'Davis', 'davis.baldwin@faef.se');
insert into PERSON (pid, l_name, f_name, email)
values ('984918806', 'Richter', 'Anjelica', 'arichter@sps.de');
insert into PERSON (pid, l_name, f_name, email)
values ('140218590', 'Ingram', 'Anna', 'a.ingram@naturescure.dk');
insert into PERSON (pid, l_name, f_name, email)
values ('485182489', 'Overstreet', 'Noah', 'noah@balchem.com');
insert into PERSON (pid, l_name, f_name, email)
values ('665558724', 'Banderas', 'Laurence', 'laurence.banderas@idlabel.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('781611704', 'Weir', 'Suzy', 'suzy.weir@ultimus.de');
insert into PERSON (pid, l_name, f_name, email)
values ('014391481', 'McKean', 'Ernie', 'ernie.mckean@contract.com');
insert into PERSON (pid, l_name, f_name, email)
values ('249125666', 'Coolidge', 'Gabriel', 'gabriel.coolidge@calence.it');
insert into PERSON (pid, l_name, f_name, email)
values ('555967422', 'Marx', 'Rosco', 'roscom@fds.com');
insert into PERSON (pid, l_name, f_name, email)
values ('492686052', 'Feore', 'Jim', 'jim.feore@toyotamotor.com');
insert into PERSON (pid, l_name, f_name, email)
values ('062725544', 'Sweeney', 'Juliette', 'juliette.sweeney@dillards.com');
insert into PERSON (pid, l_name, f_name, email)
values ('802729941', 'Saucedo', 'Dan', 'dsaucedo@printingforlesscom.br');
insert into PERSON (pid, l_name, f_name, email)
values ('670864103', 'Davies', 'Cyndi', 'cyndi.davies@innovativelightin');
insert into PERSON (pid, l_name, f_name, email)
values ('472407924', 'Robbins', 'Judd', 'judd.robbins@ads.it');
insert into PERSON (pid, l_name, f_name, email)
values ('984379035', 'Mewes', 'Donald', 'd.mewes@data.com');
insert into PERSON (pid, l_name, f_name, email)
values ('651790012', 'Gary', 'Matt', 'matt.gary@cooktek.uk');
insert into PERSON (pid, l_name, f_name, email)
values ('534952370', 'Worrell', 'Dan', 'dworrell@jsa.com');
insert into PERSON (pid, l_name, f_name, email)
values ('667896819', 'Wills', 'Ahmad', 'a.wills@computersource.jp');
insert into PERSON (pid, l_name, f_name, email)
values ('044901032', 'Stevenson', 'Aidan', 'aidan.stevenson@gulfmarkoffsho');
insert into PERSON (pid, l_name, f_name, email)
values ('689521503', 'Schwimmer', 'Lynn', 'lynns@jma.br');
insert into PERSON (pid, l_name, f_name, email)
values ('071509079', 'Easton', 'Kirk', 'kirke@veritekinternational.com');
insert into PERSON (pid, l_name, f_name, email)
values ('532015902', 'Logue', 'Teena', 'teena.logue@larkinenterprises.');
insert into PERSON (pid, l_name, f_name, email)
values ('230155515', 'Rippy', 'Kenneth', 'kenneth@larkinenterprises.cz');
insert into PERSON (pid, l_name, f_name, email)
values ('286991816', 'Browne', 'Lonnie', 'lonnie.b@bigdoughcom.ch');
insert into PERSON (pid, l_name, f_name, email)
values ('072622442', 'Kretschman', 'Cole', 'ckretschmann@wendysinternation');
insert into PERSON (pid, l_name, f_name, email)
values ('881032236', 'Hamilton', 'Harris', 'h.hamilton@aventis.ge');
insert into PERSON (pid, l_name, f_name, email)
values ('338800563', 'McKean', 'Christmas', 'christmasm@cardtronics.cy');
insert into PERSON (pid, l_name, f_name, email)
values ('798318022', 'Marx', 'Raul', 'raul.marx@zoneperfectnutrition');
insert into PERSON (pid, l_name, f_name, email)
values ('877620359', 'Singh', 'Gwyneth', 'gwyneth.singh@jlphor.com');
insert into PERSON (pid, l_name, f_name, email)
values ('850092806', 'Carlton', 'Lloyd', 'lloyd.carlton@efcbancorp.de');
insert into PERSON (pid, l_name, f_name, email)
values ('663179236', 'Colman', 'Eddie', 'eddie.colman@vertexsolutions.c');
insert into PERSON (pid, l_name, f_name, email)
values ('456099156', 'Coughlan', 'Forest', 'fcoughlan@accucode.br');
insert into PERSON (pid, l_name, f_name, email)
values ('539087374', 'Harris', 'Alfie', 'alfie.h@sis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('003904199', 'Child', 'Alfie', 'alfie.c@processplus.com');
insert into PERSON (pid, l_name, f_name, email)
values ('465075631', 'Gooding', 'Edgar', 'edgar.gooding@gna.it');
insert into PERSON (pid, l_name, f_name, email)
values ('517900008', 'Snow', 'Dwight', 'dsnow@pis.com');
insert into PERSON (pid, l_name, f_name, email)
values ('819059056', 'Heslov', 'Kurt', 'kurt@wellsfinancial.com');
commit;
prompt 1100 records loaded
prompt Loading DONOR...
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-06-1977', 'dd-mm-yyyy'), '238348956', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-08-1961', 'dd-mm-yyyy'), '549782997', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-01-1979', 'dd-mm-yyyy'), '307500304', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-12-1994', 'dd-mm-yyyy'), '128369427', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-12-2002', 'dd-mm-yyyy'), '903441905', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-01-1999', 'dd-mm-yyyy'), '591456995', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-06-1964', 'dd-mm-yyyy'), '237230933', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-06-1993', 'dd-mm-yyyy'), '370632269', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-01-1978', 'dd-mm-yyyy'), '679634057', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-01-1965', 'dd-mm-yyyy'), '483410625', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('21-06-1998', 'dd-mm-yyyy'), '288128062', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-01-1968', 'dd-mm-yyyy'), '262097637', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-05-1995', 'dd-mm-yyyy'), '134423569', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-07-1984', 'dd-mm-yyyy'), '775083908', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-02-1979', 'dd-mm-yyyy'), '529867055', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-09-1976', 'dd-mm-yyyy'), '735976872', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-10-1998', 'dd-mm-yyyy'), '652327528', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-07-1999', 'dd-mm-yyyy'), '680478146', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-05-1979', 'dd-mm-yyyy'), '093051335', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-08-1974', 'dd-mm-yyyy'), '262480569', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-05-1998', 'dd-mm-yyyy'), '529679514', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-12-1980', 'dd-mm-yyyy'), '705284364', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-06-1993', 'dd-mm-yyyy'), '159478573', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-09-1978', 'dd-mm-yyyy'), '508158601', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-01-1960', 'dd-mm-yyyy'), '919897956', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-12-1999', 'dd-mm-yyyy'), '532015902', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-02-1999', 'dd-mm-yyyy'), '359802512', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-10-1995', 'dd-mm-yyyy'), '966583525', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-08-1977', 'dd-mm-yyyy'), '295968888', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-11-1993', 'dd-mm-yyyy'), '062725544', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-02-1981', 'dd-mm-yyyy'), '335018902', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-06-1995', 'dd-mm-yyyy'), '850880715', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-12-1960', 'dd-mm-yyyy'), '951406869', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('14-05-1998', 'dd-mm-yyyy'), '235438802', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-10-1990', 'dd-mm-yyyy'), '142225890', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-03-1987', 'dd-mm-yyyy'), '056054703', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-01-1987', 'dd-mm-yyyy'), '423925364', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-09-1962', 'dd-mm-yyyy'), '725563629', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-06-2003', 'dd-mm-yyyy'), '799167503', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-04-1995', 'dd-mm-yyyy'), '958905680', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-04-1969', 'dd-mm-yyyy'), '950159072', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-03-1989', 'dd-mm-yyyy'), '616117735', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-07-1968', 'dd-mm-yyyy'), '439959523', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('20-06-1999', 'dd-mm-yyyy'), '609343955', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('21-12-1997', 'dd-mm-yyyy'), '851082137', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-04-1981', 'dd-mm-yyyy'), '912855518', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-05-1963', 'dd-mm-yyyy'), '960125605', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-09-2004', 'dd-mm-yyyy'), '632140770', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-01-1981', 'dd-mm-yyyy'), '971326374', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-10-1994', 'dd-mm-yyyy'), '918868012', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-11-2001', 'dd-mm-yyyy'), '086786677', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-01-1998', 'dd-mm-yyyy'), '144241662', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-02-1988', 'dd-mm-yyyy'), '365883743', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-11-1975', 'dd-mm-yyyy'), '687549039', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-04-1975', 'dd-mm-yyyy'), '121008642', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-12-1964', 'dd-mm-yyyy'), '823811487', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('10-08-1971', 'dd-mm-yyyy'), '215143637', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-01-1969', 'dd-mm-yyyy'), '601914969', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-04-2002', 'dd-mm-yyyy'), '858439996', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-08-1977', 'dd-mm-yyyy'), '541317968', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('10-12-1992', 'dd-mm-yyyy'), '589644176', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-03-1979', 'dd-mm-yyyy'), '229837931', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('23-12-1982', 'dd-mm-yyyy'), '693359794', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-03-1998', 'dd-mm-yyyy'), '678665314', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-03-1989', 'dd-mm-yyyy'), '169349395', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-12-1978', 'dd-mm-yyyy'), '987544346', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('23-05-1995', 'dd-mm-yyyy'), '046919723', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('18-08-1971', 'dd-mm-yyyy'), '603911711', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-09-1983', 'dd-mm-yyyy'), '943811449', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-11-1962', 'dd-mm-yyyy'), '137408341', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-07-1969', 'dd-mm-yyyy'), '650436166', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-02-1961', 'dd-mm-yyyy'), '480284180', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-09-1977', 'dd-mm-yyyy'), '064148482', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-01-1974', 'dd-mm-yyyy'), '591921979', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-04-1963', 'dd-mm-yyyy'), '998387270', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-04-1968', 'dd-mm-yyyy'), '651790012', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-12-1963', 'dd-mm-yyyy'), '666196307', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-01-2001', 'dd-mm-yyyy'), '120237174', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-06-1989', 'dd-mm-yyyy'), '320079562', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-05-1970', 'dd-mm-yyyy'), '439668090', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('20-05-1972', 'dd-mm-yyyy'), '364681609', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-10-1997', 'dd-mm-yyyy'), '485749616', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-07-1999', 'dd-mm-yyyy'), '855872783', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-11-1982', 'dd-mm-yyyy'), '151254801', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-04-1997', 'dd-mm-yyyy'), '333334713', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-05-1976', 'dd-mm-yyyy'), '539935524', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('25-04-1960', 'dd-mm-yyyy'), '771703424', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('27-10-2000', 'dd-mm-yyyy'), '699304048', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('12-10-1996', 'dd-mm-yyyy'), '837205710', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('31-07-1968', 'dd-mm-yyyy'), '190466061', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('21-09-2002', 'dd-mm-yyyy'), '291511425', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-09-1998', 'dd-mm-yyyy'), '923262202', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-01-1985', 'dd-mm-yyyy'), '937684812', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-01-1967', 'dd-mm-yyyy'), '039651469', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('31-08-1974', 'dd-mm-yyyy'), '435616074', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('18-07-1960', 'dd-mm-yyyy'), '654060128', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-12-1986', 'dd-mm-yyyy'), '129012870', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-12-1996', 'dd-mm-yyyy'), '432174519', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-06-1974', 'dd-mm-yyyy'), '975627046', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-09-1978', 'dd-mm-yyyy'), '969313022', '-', 'A');
commit;
prompt 100 records committed...
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('07-12-1988', 'dd-mm-yyyy'), '951860128', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-10-1979', 'dd-mm-yyyy'), '200246319', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('29-12-1979', 'dd-mm-yyyy'), '671800521', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-09-1998', 'dd-mm-yyyy'), '745537423', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-03-1970', 'dd-mm-yyyy'), '553126149', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-12-1979', 'dd-mm-yyyy'), '116730303', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-01-1974', 'dd-mm-yyyy'), '936071589', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-01-1978', 'dd-mm-yyyy'), '062801371', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-04-1991', 'dd-mm-yyyy'), '656361203', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-10-1995', 'dd-mm-yyyy'), '485394887', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-09-1991', 'dd-mm-yyyy'), '462497141', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('31-05-1996', 'dd-mm-yyyy'), '160587152', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-09-1978', 'dd-mm-yyyy'), '433660379', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-12-2005', 'dd-mm-yyyy'), '746465341', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('21-09-1998', 'dd-mm-yyyy'), '495883869', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-06-1984', 'dd-mm-yyyy'), '495290518', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('09-07-1991', 'dd-mm-yyyy'), '187799087', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-08-1967', 'dd-mm-yyyy'), '336451229', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-07-1975', 'dd-mm-yyyy'), '127506315', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('11-04-1983', 'dd-mm-yyyy'), '482138217', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('21-10-1977', 'dd-mm-yyyy'), '462617863', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-11-1998', 'dd-mm-yyyy'), '009934088', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-12-1986', 'dd-mm-yyyy'), '267941315', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-02-1977', 'dd-mm-yyyy'), '735103801', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-03-1981', 'dd-mm-yyyy'), '267506309', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('21-09-1970', 'dd-mm-yyyy'), '555251729', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-07-1987', 'dd-mm-yyyy'), '843853299', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-10-1969', 'dd-mm-yyyy'), '795966607', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-05-1998', 'dd-mm-yyyy'), '549198520', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('04-08-1964', 'dd-mm-yyyy'), '658306554', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-12-1997', 'dd-mm-yyyy'), '184623309', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-01-1992', 'dd-mm-yyyy'), '905128014', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-08-1975', 'dd-mm-yyyy'), '940598817', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-01-1993', 'dd-mm-yyyy'), '948688656', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-08-1991', 'dd-mm-yyyy'), '607883888', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-03-1972', 'dd-mm-yyyy'), '243227351', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-06-1991', 'dd-mm-yyyy'), '152572605', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-02-1960', 'dd-mm-yyyy'), '579208908', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-12-1998', 'dd-mm-yyyy'), '918897510', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('12-03-1964', 'dd-mm-yyyy'), '096150305', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('20-11-1989', 'dd-mm-yyyy'), '617833949', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-07-1975', 'dd-mm-yyyy'), '912029990', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-11-1978', 'dd-mm-yyyy'), '108104963', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('04-07-1969', 'dd-mm-yyyy'), '924624068', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-11-1975', 'dd-mm-yyyy'), '669496513', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-06-1986', 'dd-mm-yyyy'), '683868829', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-10-2001', 'dd-mm-yyyy'), '897680025', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-10-1988', 'dd-mm-yyyy'), '555029781', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-02-1974', 'dd-mm-yyyy'), '289304877', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-12-2005', 'dd-mm-yyyy'), '781615940', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-11-1989', 'dd-mm-yyyy'), '014700822', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-03-1964', 'dd-mm-yyyy'), '987133432', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-10-1960', 'dd-mm-yyyy'), '397861085', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('14-11-1971', 'dd-mm-yyyy'), '655711740', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('12-05-1997', 'dd-mm-yyyy'), '353521370', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-03-1993', 'dd-mm-yyyy'), '047371408', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('27-08-1995', 'dd-mm-yyyy'), '883233226', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('18-10-1992', 'dd-mm-yyyy'), '888505515', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-06-1981', 'dd-mm-yyyy'), '302017993', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-04-1963', 'dd-mm-yyyy'), '321643516', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('28-08-1974', 'dd-mm-yyyy'), '835803033', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('04-02-1979', 'dd-mm-yyyy'), '306609285', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-02-1984', 'dd-mm-yyyy'), '562748536', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-01-1970', 'dd-mm-yyyy'), '489718006', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-11-1972', 'dd-mm-yyyy'), '798850878', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-02-1976', 'dd-mm-yyyy'), '642604802', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('31-01-1993', 'dd-mm-yyyy'), '249125666', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-05-1984', 'dd-mm-yyyy'), '534953936', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('17-03-1998', 'dd-mm-yyyy'), '580000436', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('26-03-1964', 'dd-mm-yyyy'), '810470136', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-03-1960', 'dd-mm-yyyy'), '871930292', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-04-1992', 'dd-mm-yyyy'), '398323674', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-02-1989', 'dd-mm-yyyy'), '315420007', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-05-1997', 'dd-mm-yyyy'), '141001787', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-09-1971', 'dd-mm-yyyy'), '197068774', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-04-1980', 'dd-mm-yyyy'), '084607020', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-07-1985', 'dd-mm-yyyy'), '076083621', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-12-1997', 'dd-mm-yyyy'), '158592795', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-08-1968', 'dd-mm-yyyy'), '450816060', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-09-1966', 'dd-mm-yyyy'), '852575300', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-12-1991', 'dd-mm-yyyy'), '841337498', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-11-1977', 'dd-mm-yyyy'), '555092086', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-05-1972', 'dd-mm-yyyy'), '883953054', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-02-1967', 'dd-mm-yyyy'), '189838507', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-02-1989', 'dd-mm-yyyy'), '289180854', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-05-1977', 'dd-mm-yyyy'), '392142161', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-05-1986', 'dd-mm-yyyy'), '349136279', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-06-1972', 'dd-mm-yyyy'), '082557774', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-09-1971', 'dd-mm-yyyy'), '662973383', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-08-1974', 'dd-mm-yyyy'), '291811666', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-07-1986', 'dd-mm-yyyy'), '921565805', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-02-1964', 'dd-mm-yyyy'), '238511855', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-10-1972', 'dd-mm-yyyy'), '798318022', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-06-1967', 'dd-mm-yyyy'), '243034980', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('28-01-2003', 'dd-mm-yyyy'), '189173569', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-05-1985', 'dd-mm-yyyy'), '424650791', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('29-03-1961', 'dd-mm-yyyy'), '728276285', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-06-1960', 'dd-mm-yyyy'), '681119933', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-07-1998', 'dd-mm-yyyy'), '750647486', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-06-2001', 'dd-mm-yyyy'), '731452579', '+', 'O');
commit;
prompt 200 records committed...
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-07-1985', 'dd-mm-yyyy'), '283302396', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-07-1971', 'dd-mm-yyyy'), '234448967', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-04-1991', 'dd-mm-yyyy'), '807196691', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-12-1980', 'dd-mm-yyyy'), '080849238', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-07-2003', 'dd-mm-yyyy'), '583755012', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('29-09-1980', 'dd-mm-yyyy'), '242316965', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('07-07-1982', 'dd-mm-yyyy'), '151716759', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('23-11-1999', 'dd-mm-yyyy'), '339222343', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('23-05-1960', 'dd-mm-yyyy'), '154075422', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('07-05-2005', 'dd-mm-yyyy'), '615121626', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-03-1969', 'dd-mm-yyyy'), '980638570', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('31-03-1995', 'dd-mm-yyyy'), '472188320', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-01-1992', 'dd-mm-yyyy'), '769552944', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('12-12-1988', 'dd-mm-yyyy'), '810902392', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-10-1981', 'dd-mm-yyyy'), '614391180', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('09-03-2000', 'dd-mm-yyyy'), '590746015', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('28-04-1994', 'dd-mm-yyyy'), '639454824', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('01-07-2000', 'dd-mm-yyyy'), '957568433', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-01-2001', 'dd-mm-yyyy'), '381184710', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-06-1982', 'dd-mm-yyyy'), '220944241', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('05-09-1990', 'dd-mm-yyyy'), '569849442', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('21-11-1977', 'dd-mm-yyyy'), '165537016', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-10-1989', 'dd-mm-yyyy'), '133134505', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-01-2003', 'dd-mm-yyyy'), '242952342', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-03-1978', 'dd-mm-yyyy'), '402373896', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-03-1992', 'dd-mm-yyyy'), '847380247', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-10-1989', 'dd-mm-yyyy'), '025800738', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-03-1971', 'dd-mm-yyyy'), '939829538', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-04-1964', 'dd-mm-yyyy'), '776216289', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('05-07-1964', 'dd-mm-yyyy'), '254115667', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-11-1989', 'dd-mm-yyyy'), '881032236', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-04-1982', 'dd-mm-yyyy'), '438752269', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('09-12-1996', 'dd-mm-yyyy'), '993636785', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-09-1963', 'dd-mm-yyyy'), '957003822', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-06-1991', 'dd-mm-yyyy'), '277620976', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-08-1970', 'dd-mm-yyyy'), '773999246', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('28-10-1987', 'dd-mm-yyyy'), '005988217', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-03-1997', 'dd-mm-yyyy'), '456099156', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-12-2004', 'dd-mm-yyyy'), '680172578', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-07-1985', 'dd-mm-yyyy'), '610341868', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-05-1999', 'dd-mm-yyyy'), '904803417', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-01-1998', 'dd-mm-yyyy'), '933237910', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-11-1977', 'dd-mm-yyyy'), '309661257', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-06-1998', 'dd-mm-yyyy'), '852882111', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('01-07-1996', 'dd-mm-yyyy'), '133060414', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-10-1972', 'dd-mm-yyyy'), '665558724', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-06-1988', 'dd-mm-yyyy'), '998752021', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-01-1999', 'dd-mm-yyyy'), '766797561', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-02-1971', 'dd-mm-yyyy'), '744075988', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-05-2000', 'dd-mm-yyyy'), '328315189', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-07-1997', 'dd-mm-yyyy'), '285751992', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('20-02-1966', 'dd-mm-yyyy'), '563077478', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('20-05-1968', 'dd-mm-yyyy'), '729610652', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('07-02-1977', 'dd-mm-yyyy'), '723445327', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('01-06-1972', 'dd-mm-yyyy'), '175321868', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-03-1989', 'dd-mm-yyyy'), '684744404', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-05-1967', 'dd-mm-yyyy'), '684008443', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-01-2003', 'dd-mm-yyyy'), '018933518', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('20-09-1964', 'dd-mm-yyyy'), '297681739', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('17-08-1998', 'dd-mm-yyyy'), '969250919', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-03-1982', 'dd-mm-yyyy'), '245217745', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-10-1993', 'dd-mm-yyyy'), '664976546', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-11-1981', 'dd-mm-yyyy'), '523692621', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-03-2005', 'dd-mm-yyyy'), '385327967', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-12-1970', 'dd-mm-yyyy'), '629219354', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-01-1968', 'dd-mm-yyyy'), '864233203', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('29-05-1983', 'dd-mm-yyyy'), '751102104', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-02-1976', 'dd-mm-yyyy'), '338800563', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-02-1993', 'dd-mm-yyyy'), '099929610', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-12-1988', 'dd-mm-yyyy'), '530485585', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-01-2000', 'dd-mm-yyyy'), '745115342', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('10-03-1983', 'dd-mm-yyyy'), '424893711', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-11-1972', 'dd-mm-yyyy'), '213743877', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-07-1982', 'dd-mm-yyyy'), '937580305', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-01-2004', 'dd-mm-yyyy'), '071856120', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('17-02-1968', 'dd-mm-yyyy'), '460950567', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-02-1980', 'dd-mm-yyyy'), '517900008', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-09-1988', 'dd-mm-yyyy'), '131166588', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-11-1960', 'dd-mm-yyyy'), '724101704', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-10-2003', 'dd-mm-yyyy'), '693085728', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-02-1960', 'dd-mm-yyyy'), '363800111', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-06-2001', 'dd-mm-yyyy'), '364367353', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-11-1962', 'dd-mm-yyyy'), '772399394', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-11-1963', 'dd-mm-yyyy'), '984379035', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-08-2005', 'dd-mm-yyyy'), '274382117', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('17-11-1965', 'dd-mm-yyyy'), '974550419', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-06-1965', 'dd-mm-yyyy'), '973262503', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-09-2005', 'dd-mm-yyyy'), '483453321', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-08-1994', 'dd-mm-yyyy'), '003904199', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-11-1961', 'dd-mm-yyyy'), '358023527', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('25-06-1981', 'dd-mm-yyyy'), '243237202', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('23-11-1968', 'dd-mm-yyyy'), '736496191', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('12-10-1967', 'dd-mm-yyyy'), '037245771', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('08-02-1962', 'dd-mm-yyyy'), '071509079', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-04-1989', 'dd-mm-yyyy'), '735718988', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-08-1979', 'dd-mm-yyyy'), '215396573', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('01-01-1982', 'dd-mm-yyyy'), '901831943', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('17-04-2001', 'dd-mm-yyyy'), '125724898', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('25-05-1998', 'dd-mm-yyyy'), '033712611', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-04-1999', 'dd-mm-yyyy'), '162817820', '+', 'A');
commit;
prompt 300 records committed...
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-02-1989', 'dd-mm-yyyy'), '325057906', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-04-1997', 'dd-mm-yyyy'), '722968346', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('09-05-1987', 'dd-mm-yyyy'), '968732165', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('05-10-1992', 'dd-mm-yyyy'), '372210613', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-01-1969', 'dd-mm-yyyy'), '986571242', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('07-08-1982', 'dd-mm-yyyy'), '938023231', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('31-10-2001', 'dd-mm-yyyy'), '222632263', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-05-1978', 'dd-mm-yyyy'), '312041206', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-05-1989', 'dd-mm-yyyy'), '569879560', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('13-12-1970', 'dd-mm-yyyy'), '339713112', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-03-1998', 'dd-mm-yyyy'), '299901965', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('13-04-1962', 'dd-mm-yyyy'), '132122147', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('31-07-1974', 'dd-mm-yyyy'), '119591809', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('14-04-1969', 'dd-mm-yyyy'), '093460285', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('27-10-1963', 'dd-mm-yyyy'), '957767584', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('01-04-1987', 'dd-mm-yyyy'), '709634152', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-03-1975', 'dd-mm-yyyy'), '113488805', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('21-05-1979', 'dd-mm-yyyy'), '318741729', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-11-1990', 'dd-mm-yyyy'), '757024709', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-03-1971', 'dd-mm-yyyy'), '684307055', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-06-1999', 'dd-mm-yyyy'), '007507474', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('30-05-1990', 'dd-mm-yyyy'), '885461855', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-10-1976', 'dd-mm-yyyy'), '288926877', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-10-1970', 'dd-mm-yyyy'), '405534830', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('04-04-1970', 'dd-mm-yyyy'), '937748671', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('29-05-1989', 'dd-mm-yyyy'), '646508379', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-03-1975', 'dd-mm-yyyy'), '283952085', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('21-10-1999', 'dd-mm-yyyy'), '169295786', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-03-1982', 'dd-mm-yyyy'), '579628336', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-11-1965', 'dd-mm-yyyy'), '256967718', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('02-01-2006', 'dd-mm-yyyy'), '884465511', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('02-11-1965', 'dd-mm-yyyy'), '230926425', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('03-08-1979', 'dd-mm-yyyy'), '004214981', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('06-01-1997', 'dd-mm-yyyy'), '320944228', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('31-08-1990', 'dd-mm-yyyy'), '108935075', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-03-1983', 'dd-mm-yyyy'), '602276868', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-05-1995', 'dd-mm-yyyy'), '840379495', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-08-1979', 'dd-mm-yyyy'), '958133138', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-12-1991', 'dd-mm-yyyy'), '512687180', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('18-10-1962', 'dd-mm-yyyy'), '519174701', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-04-1996', 'dd-mm-yyyy'), '048142005', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('16-08-1975', 'dd-mm-yyyy'), '714371122', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-07-2005', 'dd-mm-yyyy'), '240111208', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-08-1974', 'dd-mm-yyyy'), '980953702', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('14-06-1960', 'dd-mm-yyyy'), '627820755', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-12-1988', 'dd-mm-yyyy'), '175781268', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('24-11-1971', 'dd-mm-yyyy'), '431602139', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-10-1978', 'dd-mm-yyyy'), '475834164', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-07-1979', 'dd-mm-yyyy'), '118056743', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('30-08-1961', 'dd-mm-yyyy'), '585972131', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-09-1980', 'dd-mm-yyyy'), '644185876', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('07-06-1968', 'dd-mm-yyyy'), '014472246', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('17-06-1994', 'dd-mm-yyyy'), '048646646', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('11-11-1967', 'dd-mm-yyyy'), '263170660', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('11-08-1977', 'dd-mm-yyyy'), '324878971', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-05-1997', 'dd-mm-yyyy'), '053878653', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-07-1978', 'dd-mm-yyyy'), '408874915', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-10-1983', 'dd-mm-yyyy'), '160205383', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('05-01-2006', 'dd-mm-yyyy'), '980953239', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-07-1979', 'dd-mm-yyyy'), '833298755', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('27-01-1982', 'dd-mm-yyyy'), '484771335', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-01-1980', 'dd-mm-yyyy'), '490388060', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-01-1961', 'dd-mm-yyyy'), '773013219', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-11-1980', 'dd-mm-yyyy'), '850736037', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('14-09-1989', 'dd-mm-yyyy'), '692936013', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-10-1986', 'dd-mm-yyyy'), '708025907', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('20-11-2003', 'dd-mm-yyyy'), '979142513', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('15-12-1975', 'dd-mm-yyyy'), '955370738', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('05-11-1965', 'dd-mm-yyyy'), '358565731', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('04-10-1989', 'dd-mm-yyyy'), '703928930', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('04-07-1979', 'dd-mm-yyyy'), '245843519', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-01-1988', 'dd-mm-yyyy'), '705852145', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('21-01-1991', 'dd-mm-yyyy'), '309146979', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-08-1980', 'dd-mm-yyyy'), '624208805', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('12-11-1985', 'dd-mm-yyyy'), '416239499', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('22-01-1972', 'dd-mm-yyyy'), '741001511', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('26-08-1972', 'dd-mm-yyyy'), '292509980', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-04-1988', 'dd-mm-yyyy'), '234623164', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-09-1967', 'dd-mm-yyyy'), '299296442', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('20-03-1992', 'dd-mm-yyyy'), '723216818', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('24-03-1999', 'dd-mm-yyyy'), '543955576', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-07-1986', 'dd-mm-yyyy'), '305517179', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-08-1962', 'dd-mm-yyyy'), '909147578', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('14-06-1961', 'dd-mm-yyyy'), '874173884', '+', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('03-04-1975', 'dd-mm-yyyy'), '559736783', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('16-08-1980', 'dd-mm-yyyy'), '863266868', '-', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-06-1986', 'dd-mm-yyyy'), '637020775', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('19-02-1975', 'dd-mm-yyyy'), '781611704', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-03-1986', 'dd-mm-yyyy'), '025814164', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-03-1963', 'dd-mm-yyyy'), '258054874', '+', 'O');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('15-11-1988', 'dd-mm-yyyy'), '218095746', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('23-09-2004', 'dd-mm-yyyy'), '008470299', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('09-02-1981', 'dd-mm-yyyy'), '193556691', '+', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('10-12-1998', 'dd-mm-yyyy'), '591817202', '-', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('22-01-1966', 'dd-mm-yyyy'), '654249625', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('11-09-1972', 'dd-mm-yyyy'), '608382546', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('08-03-1986', 'dd-mm-yyyy'), '083033817', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('20-01-1967', 'dd-mm-yyyy'), '804262485', '+', 'A');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('29-06-2001', 'dd-mm-yyyy'), '741343717', '-', 'B');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('06-12-1985', 'dd-mm-yyyy'), '641022334', '-', 'O');
commit;
prompt 400 records committed...
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('05-08-1995', 'dd-mm-yyyy'), '281373620', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('M', to_date('28-02-1997', 'dd-mm-yyyy'), '530889775', '-', 'AB');
insert into DONOR (gender, birth_date, donor_id, sign, type)
values ('F', to_date('19-03-1988', 'dd-mm-yyyy'), '148142939', '-', 'O');
commit;
prompt 403 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25654, 32, '971155219', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (67432, 37, '987133432', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (28637, 7, '581109827', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (78628, 5, '216860273', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63763, 10, '155290755', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76582, 32, '382880573', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45262, 7, '760837533', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (73315, 32, '591978627', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (27378, 32, '409938518', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87282, 33, '339753654', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51946, 9, '162799501', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12872, 35, '975087097', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (46761, 15, '534346136', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16333, 18, '080849238', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (42267, 38, '151716759', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (49361, 4, '323308058', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63829, 34, '168999525', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21736, 14, '074081051', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32211, 40, '318657191', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21919, 28, '178510404', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (38422, 32, '922303690', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (67332, 44, '610341868', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (43282, 35, '532015902', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (33781, 40, '490388060', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88385, 30, '242316965', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (38957, 29, '608382546', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13784, 16, '644185876', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (46949, 23, '771703424', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39325, 19, '414116543', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (17641, 39, '629219354', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87951, 50, '570331042', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (72744, 8, '781611704', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21446, 13, '919897956', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39159, 40, '696511331', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (59564, 21, '477713746', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (23291, 23, '918868012', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (73474, 49, '119591809', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (72447, 45, '652031992', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (79474, 44, '027847108', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (36664, 44, '104654240', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (89258, 36, '307716898', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12579, 18, '522338180', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (52329, 49, '976460507', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (38346, 42, '035198344', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (15614, 5, '773999246', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63438, 17, '871634320', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91541, 43, '273455017', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91342, 40, '178613896', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (67718, 13, '455747246', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (37176, 1, '874173884', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (37584, 3, '819059056', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63871, 5, '780987486', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25372, 37, '637020775', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (59524, 24, '368067148', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (99736, 34, '731452579', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (69365, 5, '833221223', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39423, 25, '159478573', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (48743, 38, '485749616', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (42622, 6, '147206940', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66923, 3, '113488805', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (93969, 0, '551911744', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13758, 44, '318741729', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (35645, 18, '921955127', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13136, 10, '062725544', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (64563, 39, '615121626', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (48479, 38, '072622442', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66191, 38, '158592795', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (83579, 21, '237161395', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (35318, 18, '942081370', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39916, 41, '591817202', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (46622, 24, '498813862', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91293, 27, '102771731', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (46777, 42, '995091462', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47479, 23, '657771509', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (22146, 32, '213743877', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (71179, 4, '249125666', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63352, 27, '448322939', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74678, 38, '948688656', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (72294, 40, '392142161', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66848, 24, '313406747', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (99953, 35, '684307055', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86728, 29, '684169296', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (77694, 18, '218095746', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97684, 15, '238418580', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32926, 11, '841337498', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39226, 8, '816100549', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (89636, 25, '771995680', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (41416, 4, '385432292', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (55757, 13, '172623234', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26385, 40, '817077179', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51659, 21, '859643900', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32948, 33, '048142005', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81397, 50, '182761224', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (22735, 44, '423925364', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45168, 14, '659988335', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (69995, 9, '871894052', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54353, 36, '725569007', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (18248, 11, '599521985', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (24396, 8, '810158730', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (35337, 33, '840379495', 5700);
commit;
prompt 100 records committed...
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (77927, 19, '370632269', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87995, 48, '160587152', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98357, 39, '909147578', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (27154, 2, '980638570', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81565, 1, '371775100', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (43415, 9, '780106789', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26942, 39, '267506309', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68148, 10, '421599017', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (53329, 26, '957767584', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86726, 19, '014700822', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81736, 38, '083033817', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (53448, 18, '433660379', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (14712, 50, '740704902', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51143, 21, '508158601', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54219, 11, '929475618', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32961, 46, '292509980', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97235, 39, '086595664', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (18158, 18, '044352560', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88993, 40, '234039968', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (36511, 14, '624367005', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91775, 12, '285751992', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (56166, 48, '002554127', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (19571, 3, '489718006', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (34924, 34, '683895199', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (28736, 5, '955370738', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74481, 30, '441166212', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47932, 41, '420963265', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16936, 26, '699031142', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26744, 47, '360157179', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54481, 28, '009223928', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26499, 29, '274382117', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16136, 24, '262097637', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39635, 12, '403751552', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (27582, 12, '009934088', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82316, 8, '511568325', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (65746, 38, '680478146', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (44158, 16, '141337002', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12685, 41, '133134505', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (36551, 12, '525011460', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (42834, 22, '502582320', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26575, 15, '664166389', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (93262, 8, '585289028', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82156, 27, '048374256', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81532, 49, '267941315', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (48796, 19, '680172578', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87721, 16, '758794404', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68127, 40, '133060414', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47884, 9, '597995474', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (49174, 39, '725345981', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76379, 10, '752785736', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (19195, 33, '937684812', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54416, 45, '144998512', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25412, 9, '759729703', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (89452, 42, '493961904', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75717, 40, '575116250', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (55865, 38, '973262503', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (71424, 46, '320257722', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32143, 28, '722968346', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (19773, 1, '799167503', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (84815, 47, '539935524', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (19424, 18, '621900616', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13929, 27, '593607007', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (23718, 36, '128122177', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76672, 17, '891313788', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16741, 15, '237230933', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47365, 45, '671348563', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (89317, 37, '514972615', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68773, 32, '026254013', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (79534, 32, '375496232', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (93278, 49, '311853595', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75393, 29, '999821449', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16329, 15, '354683638', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87819, 34, '353521370', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (52821, 37, '487945649', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97532, 8, '230155515', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91248, 17, '728485742', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (92358, 31, '031240584', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (31598, 16, '669496513', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75433, 16, '036492757', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (55967, 22, '901831943', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (32958, 18, '363254369', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (38417, 28, '617696093', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (78939, 27, '160752957', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16248, 44, '687549039', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86629, 4, '974550419', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (83334, 18, '855872783', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51434, 2, '485394887', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (61293, 50, '617833949', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51661, 31, '708511967', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88828, 46, '573459851', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (42636, 9, '291511425', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74653, 31, '369093284', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87599, 5, '693992628', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (71785, 21, '281373620', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (36424, 9, '200291980', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (69689, 26, '349136279', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45173, 24, '325057906', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76677, 47, '623731843', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (71137, 31, '519174701', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (57281, 24, '432174519', 6800);
commit;
prompt 200 records committed...
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74429, 13, '364832044', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (57679, 37, '229266261', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (22396, 47, '004437338', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (23867, 48, '998752021', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54542, 44, '327770767', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (99379, 10, '255902165', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (33146, 17, '449103116', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54495, 33, '749011451', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (58295, 33, '609343955', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (33612, 25, '716522491', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (22932, 50, '276143046', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68123, 4, '062397734', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95967, 3, '807810311', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76794, 3, '987783098', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (56494, 34, '652371262', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (99634, 3, '822051253', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98487, 17, '616117735', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (28949, 14, '405534830', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29842, 18, '327291998', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (27957, 34, '940598817', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26883, 37, '517900008', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (54299, 17, '064148482', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (11129, 1, '897793693', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86599, 8, '642604802', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (17723, 25, '824648175', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (57665, 7, '166963478', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (19416, 21, '465075631', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68453, 21, '318308556', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (59487, 45, '479117663', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66844, 32, '256967718', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (11755, 33, '439668090', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51557, 17, '938023231', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (22381, 49, '264346014', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (62142, 48, '610422260', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (41656, 6, '705852145', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (53666, 40, '187686067', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98272, 11, '184623309', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66937, 30, '214371905', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87117, 46, '566372714', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (31776, 29, '982871108', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86744, 38, '850092806', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82456, 26, '259941739', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (85964, 45, '559736783', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (72767, 34, '959837164', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45792, 18, '710020129', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (85163, 15, '093460285', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (73719, 44, '307081120', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76394, 44, '312041206', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (79391, 10, '971987270', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82965, 21, '574670543', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66133, 21, '460950567', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45881, 50, '268303729', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (11647, 42, '581195954', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (31499, 5, '683868829', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12515, 24, '879327263', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (34583, 48, '915523925', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29559, 42, '408874915', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81442, 35, '306519991', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (31175, 36, '685164958', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81932, 0, '684744404', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51893, 11, '729784083', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (37959, 25, '881032236', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (64966, 5, '424650791', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76836, 44, '912029990', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97689, 1, '275949914', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (36137, 13, '245843519', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97271, 33, '452597433', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95254, 30, '359598513', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (85855, 2, '766363065', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97272, 12, '825718771', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (41684, 24, '275365706', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98895, 45, '240100155', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (52512, 48, '185943132', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (94463, 37, '769552944', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (35332, 5, '934021441', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29882, 15, '898034681', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87932, 12, '984430684', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (96595, 45, '033712611', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21656, 17, '057913650', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88151, 16, '945997798', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47191, 47, '319137744', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91682, 18, '884465511', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97465, 33, '003904199', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51445, 14, '347949461', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (83497, 1, '693085728', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (85734, 29, '258054874', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88869, 7, '321643516', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (73187, 18, '215396573', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (18912, 21, '118056743', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (62322, 35, '273963341', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (49862, 30, '126139999', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (56456, 20, '299685315', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (84971, 22, '169295786', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87252, 15, '688241765', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95628, 6, '652327528', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (57177, 34, '663516006', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45898, 28, '697207496', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51238, 1, '137669479', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (59327, 14, '482424220', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (15397, 10, '106758411', 14700);
commit;
prompt 300 records committed...
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (78946, 22, '135639362', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (76743, 20, '686870106', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95579, 4, '798435974', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97791, 6, '679634057', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (81424, 13, '384427644', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82322, 25, '837205710', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75638, 34, '478202044', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (88344, 43, '571220005', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (24747, 22, '654249625', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (78676, 26, '021114490', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98754, 7, '475834164', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (97849, 30, '867821231', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95991, 22, '032070336', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (58675, 40, '120237174', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (91894, 4, '897680025', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (18961, 29, '984379035', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (56285, 19, '996383746', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (93871, 35, '273995455', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (58271, 27, '192849062', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (43415, 46, '693359794', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75245, 15, '943811449', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (49467, 8, '672905392', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (89579, 12, '309682546', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (17433, 20, '233658208', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (65117, 8, '624208805', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21747, 10, '833298755', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (21918, 48, '400917628', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45512, 3, '425467041', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12357, 5, '735103801', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29398, 45, '999950098', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (43541, 43, '049091541', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (67542, 19, '555029781', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (61241, 46, '328635747', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (11987, 9, '924624068', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (95792, 50, '399907956', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45851, 29, '319449185', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (17315, 18, '702371190', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87436, 19, '807196691', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (51544, 4, '060138485', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26945, 24, '577641871', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (78116, 48, '108935075', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (48687, 8, '338160998', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (11446, 3, '975627046', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98434, 0, '529679514', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45967, 25, '651790012', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (73449, 29, '993636785', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (92381, 24, '805125593', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26899, 16, '093051335', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16525, 16, '282967132', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (85784, 24, '375104960', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (68899, 29, '772399394', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86669, 12, '768494443', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29139, 37, '194954711', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74744, 26, '087806495', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (69753, 30, '012584652', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (12719, 43, '254115667', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25772, 0, '187579649', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (82588, 24, '220944241', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (63534, 9, '579667581', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25677, 3, '318447492', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39748, 7, '984918806', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (34411, 0, '757024709', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86184, 6, '913942557', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (66861, 25, '813092669', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (79522, 31, '897155427', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29475, 6, '692375929', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (92797, 17, '534953936', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13321, 26, '004214981', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (15367, 41, '106071827', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (26422, 4, '852882111', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (84416, 9, '877652677', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (29478, 30, '175321868', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (24274, 32, '259407722', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (75736, 37, '939829538', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (45119, 26, '530485585', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (93282, 31, '563077478', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (64259, 25, '703928930', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (61883, 23, '683533120', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (52548, 29, '579208908', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (46734, 30, '553830128', 6800);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86766, 23, '756743030', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (87149, 27, '091115833', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (86525, 4, '018933518', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (48721, 27, '692936013', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (64974, 35, '720298946', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (98926, 14, '333348436', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (23622, 1, '851082137', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (25174, 13, '766797561', 9400);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (39831, 21, '539087374', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (13984, 0, '714371122', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (59735, 41, '962374483', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (99258, 18, '931607645', 10500);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (42126, 41, '613689167', 12600);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (74463, 3, '222632263', 5700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (14561, 14, '108104963', 14700);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (16982, 28, '484771335', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (49284, 3, '709634152', 11300);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (47672, 25, '650436166', 8900);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (27774, 34, '594359980', 7200);
insert into PARAMEDIC (license_num, seniority, paramedic_id, salary)
values (24962, 19, '714824861', 11300);
commit;
prompt 400 records loaded
prompt Loading RECEIVER...
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61216, 'Cleveland Clinic Flo', 'St-bruno', to_date('11-01-2023', 'dd-mm-yyyy'), '030115468');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (46664, 'Stanford Health Care', 'Frankfurt am Ma', to_date('01-08-2023', 'dd-mm-yyyy'), '031924152');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (77777, 'UT Southwestern', 'Amsterdam', to_date('06-02-2020', 'dd-mm-yyyy'), '081112152');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (22853, 'Barnes-Jewish', 'Blacksburg', to_date('15-10-2022', 'dd-mm-yyyy'), '091949373');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42243, 'Mount Sinai', 'Kצln', to_date('08-12-2013', 'dd-mm-yyyy'), '035968149');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27482, 'Yale-New Haven', 'N. ft. Myers', to_date('20-07-2020', 'dd-mm-yyyy'), '032966685');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36183, 'Vanderbilt Universit', 'Annandale', to_date('12-09-2012', 'dd-mm-yyyy'), '098672087');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (47582, 'University of Miami', 'Gothenburg', to_date('17-01-2024', 'dd-mm-yyyy'), '023167438');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (56389, 'Ochsner Medical Cent', 'Wichita', to_date('17-10-2018', 'dd-mm-yyyy'), '033867856');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27639, 'UCSF Medical Center', 'Schaumburg', to_date('20-04-2010', 'dd-mm-yyyy'), '087783313');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (91833, 'Mayo Clinic Arizona', 'West Launceston', to_date('19-03-2014', 'dd-mm-yyyy'), '049938729');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82274, 'Baylor University', 'Wehrheim', to_date('14-10-2011', 'dd-mm-yyyy'), '088266258');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64678, 'Keck Hospital', 'Woodbridge', to_date('23-09-2011', 'dd-mm-yyyy'), '023463766');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32777, 'University of Michig', 'Dortmund', to_date('12-09-2023', 'dd-mm-yyyy'), '022512597');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (21227, 'Barnes-Jewish', 'San Francisco', to_date('12-08-2021', 'dd-mm-yyyy'), '084337996');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95574, 'Mayo Clinic Florida', 'Rio de janeiro', to_date('27-01-2021', 'dd-mm-yyyy'), '037252467');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (73163, 'New York-Presbyteria', 'Redondo beach', to_date('24-04-2013', 'dd-mm-yyyy'), '049434728');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37478, 'University of Miami', 'Delafield', to_date('03-08-2014', 'dd-mm-yyyy'), '039650175');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (12146, 'Vanderbilt Universit', 'Odense', to_date('29-11-2022', 'dd-mm-yyyy'), '039523571');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27651, 'Jefferson Health', 'Ferraz  vasconc', to_date('18-05-2018', 'dd-mm-yyyy'), '091355780');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54673, 'University of Michig', 'North bethesda', to_date('18-06-2012', 'dd-mm-yyyy'), '034436909');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (99234, 'Mayo Clinic Florida', 'Canal Wincheste', to_date('23-03-2016', 'dd-mm-yyyy'), '090162939');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (79385, 'Mayo Clinic Arizona', 'Dietikon', to_date('04-09-2013', 'dd-mm-yyyy'), '094305887');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32884, 'University of Michig', 'Golden', to_date('20-12-2019', 'dd-mm-yyyy'), '022812410');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (94497, 'Mayo Clinic Florida', 'Regina', to_date('18-07-2019', 'dd-mm-yyyy'), '029306940');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (71249, 'Stanford Health Care', 'Oshawa', to_date('06-07-2022', 'dd-mm-yyyy'), '099932095');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59716, 'Houston Methodist', 'Oldenburg', to_date('25-04-2013', 'dd-mm-yyyy'), '089929522');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (92331, 'Johns Hopkins', 'Fort Collins', to_date('07-11-2011', 'dd-mm-yyyy'), '098986629');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51115, 'Cleveland Clinic Flo', 'Carlingford', to_date('19-12-2016', 'dd-mm-yyyy'), '034037251');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28595, 'Mayo Clinic Arizona', 'Ellicott City', to_date('16-10-2019', 'dd-mm-yyyy'), '094967717');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82647, 'UT Southwestern', 'Dartmouth', to_date('14-04-2020', 'dd-mm-yyyy'), '093285638');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25844, 'University of Wiscon', 'Nanaimo', to_date('06-12-2019', 'dd-mm-yyyy'), '027495759');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76341, 'Barnes-Jewish', 'Toledo', to_date('29-01-2019', 'dd-mm-yyyy'), '035260241');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84291, 'Ochsner Medical Cent', 'Bismarck', to_date('08-08-2016', 'dd-mm-yyyy'), '035589478');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (93413, 'UCLA Medical Center', 'Shreveport', to_date('31-07-2014', 'dd-mm-yyyy'), '022320974');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (47799, 'Mayo Clinic Florida', 'Luzern', to_date('16-05-2010', 'dd-mm-yyyy'), '081984707');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76829, 'Brigham and Women\''s', 'Highton', to_date('05-09-2011', 'dd-mm-yyyy'), '045468882');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68664, 'Mayo Clinic Arizona', 'Halfway house', to_date('22-11-2015', 'dd-mm-yyyy'), '035978872');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (46818, 'UT Southwestern', 'Irati', to_date('17-01-2012', 'dd-mm-yyyy'), '046086446');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36449, 'Froedtert Hospital', 'Pitstone', to_date('04-05-2020', 'dd-mm-yyyy'), '044698752');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84859, 'NYU Langone', 'Hהssleholm', to_date('11-03-2014', 'dd-mm-yyyy'), '024187475');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (14242, 'Johns Hopkins', 'Fort Saskatchew', to_date('26-10-2014', 'dd-mm-yyyy'), '030396777');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96266, 'UT Southwestern', 'Bischofshofen', to_date('10-12-2018', 'dd-mm-yyyy'), '040975495');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95166, 'Houston Methodist', 'Koppl', to_date('11-05-2017', 'dd-mm-yyyy'), '086947169');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27123, 'Houston Methodist', 'Englewood Cliff', to_date('11-06-2021', 'dd-mm-yyyy'), '082091705');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34645, 'Mayo Clinic', 'Vejle', to_date('09-10-2016', 'dd-mm-yyyy'), '084204804');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96528, 'Cleveland Clinic', 'Billund', to_date('14-06-2019', 'dd-mm-yyyy'), '047256058');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57115, 'University of Miami', 'Louisville', to_date('26-10-2011', 'dd-mm-yyyy'), '026420366');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (52787, 'UC Davis Medical Cen', 'Dubai', to_date('28-04-2017', 'dd-mm-yyyy'), '036005499');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (43867, 'Jefferson Health', 'Rueil-Malmaison', to_date('07-04-2014', 'dd-mm-yyyy'), '041133659');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (35471, 'Mayo Clinic Florida', 'Vallauris', to_date('08-10-2020', 'dd-mm-yyyy'), '083531624');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32194, 'University of Miami', 'Gattico', to_date('07-08-2019', 'dd-mm-yyyy'), '080562619');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (98589, 'Mayo Clinic', 'California', to_date('31-01-2022', 'dd-mm-yyyy'), '039375403');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37447, 'Emory University', 'Minneapolis', to_date('23-03-2013', 'dd-mm-yyyy'), '037345553');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61456, 'University of Utah', 'Lahr', to_date('08-11-2011', 'dd-mm-yyyy'), '084579799');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (33616, 'Mayo Clinic Arizona', 'Cambridge', to_date('03-04-2021', 'dd-mm-yyyy'), '098188055');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54377, 'Rush University', 'Brisbane', to_date('18-04-2015', 'dd-mm-yyyy'), '086045922');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45678, 'Cleveland Clinic', 'Mclean', to_date('15-08-2018', 'dd-mm-yyyy'), '080190400');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32725, 'Mayo Clinic Florida', 'Milton Keynes', to_date('22-06-2011', 'dd-mm-yyyy'), '081556544');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31117, 'Barnes-Jewish', 'Horsham', to_date('23-06-2014', 'dd-mm-yyyy'), '028258471');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31584, 'University of Colora', 'Fuchstal-asch', to_date('25-09-2013', 'dd-mm-yyyy'), '095583312');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44247, 'Duke University', 'Summerside', to_date('30-08-2016', 'dd-mm-yyyy'), '041750421');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (63859, 'Ochsner Medical Cent', 'Kungki', to_date('21-05-2020', 'dd-mm-yyyy'), '049710611');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28588, 'Duke University', 'West Monroe', to_date('09-07-2023', 'dd-mm-yyyy'), '026515688');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (38463, 'University of Miami', 'Ternitz', to_date('04-09-2013', 'dd-mm-yyyy'), '035614794');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (58624, 'MedStar Georgetown', 'Sapulpa', to_date('09-12-2017', 'dd-mm-yyyy'), '028232644');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27366, 'Stanford Health Care', 'Omaha', to_date('23-03-2016', 'dd-mm-yyyy'), '080854416');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32848, 'University of Colora', 'Cromwell', to_date('28-04-2014', 'dd-mm-yyyy'), '098332641');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74157, 'Ochsner Medical Cent', 'Waterloo', to_date('17-11-2012', 'dd-mm-yyyy'), '086095571');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (88585, 'Cleveland Clinic', 'Traralgon', to_date('02-12-2014', 'dd-mm-yyyy'), '029439812');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89573, 'Massachusetts Genera', 'Turku', to_date('12-08-2021', 'dd-mm-yyyy'), '087131306');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36433, 'Froedtert Hospital', 'Arlington', to_date('25-03-2020', 'dd-mm-yyyy'), '031486721');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97195, 'Cleveland Clinic', 'Highlands Ranch', to_date('25-04-2017', 'dd-mm-yyyy'), '024155367');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (21394, 'University of Miami', 'Takamatsu', to_date('04-09-2014', 'dd-mm-yyyy'), '024522797');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (39932, 'Johns Hopkins', 'Westport', to_date('28-06-2019', 'dd-mm-yyyy'), '029144181');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54848, 'Emory University', 'Herzogenrath', to_date('19-02-2021', 'dd-mm-yyyy'), '099434615');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (49232, 'Northwestern Memoria', 'Bay Shore', to_date('04-07-2023', 'dd-mm-yyyy'), '084815700');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (88614, 'Cleveland Clinic Flo', 'Ft. Leavenworth', to_date('18-04-2022', 'dd-mm-yyyy'), '032314019');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68949, 'University of Miami', 'Jacksonville', to_date('22-04-2017', 'dd-mm-yyyy'), '036307382');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (85727, 'Froedtert Hospital', 'Sao roque', to_date('29-07-2020', 'dd-mm-yyyy'), '082470864');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (14649, 'Jefferson Health', 'Oberwangen', to_date('19-06-2020', 'dd-mm-yyyy'), '081705085');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96138, 'Vanderbilt Universit', 'League city', to_date('22-07-2014', 'dd-mm-yyyy'), '080792850');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25485, 'Emory University', 'Redding', to_date('28-08-2018', 'dd-mm-yyyy'), '024829269');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74798, 'Houston Methodist', 'Long Island Cit', to_date('12-03-2010', 'dd-mm-yyyy'), '096111921');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64598, 'Ochsner Medical Cent', 'Horsens', to_date('09-04-2019', 'dd-mm-yyyy'), '088359941');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27372, 'Brigham and Women\''s', 'Verwood', to_date('12-12-2012', 'dd-mm-yyyy'), '085759907');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (86671, 'Stanford Health Care', 'Milsons Point', to_date('15-11-2019', 'dd-mm-yyyy'), '095279073');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (77727, 'Ochsner Medical Cent', 'Leawood', to_date('15-05-2014', 'dd-mm-yyyy'), '037751632');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74489, 'Yale-New Haven', 'Lathrop', to_date('09-11-2018', 'dd-mm-yyyy'), '085632722');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95781, 'UC San Diego Health', 'Hilversum', to_date('15-03-2012', 'dd-mm-yyyy'), '089032905');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (35443, 'University of Colora', 'Amsterdam', to_date('01-03-2024', 'dd-mm-yyyy'), '089226758');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87661, 'University of Alabam', 'Lbeck', to_date('29-09-2016', 'dd-mm-yyyy'), '099891153');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54114, 'Vanderbilt Universit', 'Lengdorf', to_date('31-07-2017', 'dd-mm-yyyy'), '022714252');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74357, 'Ochsner Medical Cent', 'Yomgok-dong', to_date('09-10-2023', 'dd-mm-yyyy'), '089345723');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (24578, 'University of Iowa', 'Bonn', to_date('15-02-2012', 'dd-mm-yyyy'), '090847725');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (78274, 'Vanderbilt Universit', 'Vienna', to_date('10-08-2019', 'dd-mm-yyyy'), '094671179');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59677, 'Massachusetts Genera', 'Offenburg', to_date('30-05-2011', 'dd-mm-yyyy'), '035281294');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34713, 'Vanderbilt Universit', 'Burgess Hill', to_date('30-12-2018', 'dd-mm-yyyy'), '040631226');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25521, 'University of Wiscon', 'Plymouth Meetin', to_date('18-01-2024', 'dd-mm-yyyy'), '037243068');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (43121, 'Emory University', 'Aomori', to_date('24-06-2010', 'dd-mm-yyyy'), '033968816');
commit;
prompt 100 records committed...
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (73647, 'NYU Langone', 'Portsmouth', to_date('19-02-2011', 'dd-mm-yyyy'), '032231504');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (71372, 'Johns Hopkins', 'Pretoria', to_date('21-04-2014', 'dd-mm-yyyy'), '049033523');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59614, 'UCSF Medical Center', 'Fairborn', to_date('25-07-2017', 'dd-mm-yyyy'), '046469438');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (91868, 'Massachusetts Genera', 'Waldbronn', to_date('27-09-2015', 'dd-mm-yyyy'), '090462500');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (81435, 'UT Southwestern', 'Warrington', to_date('26-08-2016', 'dd-mm-yyyy'), '080628847');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54218, 'UC Davis Medical Cen', 'Or-yehuda', to_date('08-04-2016', 'dd-mm-yyyy'), '027061648');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31234, 'New York-Presbyteria', 'Ringwood', to_date('09-09-2016', 'dd-mm-yyyy'), '097595127');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84352, 'UC San Diego Health', 'St. Louis', to_date('30-08-2013', 'dd-mm-yyyy'), '088863744');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89641, 'Houston Methodist', 'Osaka', to_date('18-02-2022', 'dd-mm-yyyy'), '080677339');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18238, 'Cleveland Clinic', 'Las Vegas', to_date('20-08-2010', 'dd-mm-yyyy'), '033925675');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27525, 'New York-Presbyteria', 'Auckland', to_date('11-04-2021', 'dd-mm-yyyy'), '086178471');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45713, 'UCLA Medical Center', 'Pompeia', to_date('11-01-2019', 'dd-mm-yyyy'), '097578135');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62235, 'Ochsner Medical Cent', 'Raleigh', to_date('27-04-2021', 'dd-mm-yyyy'), '032466894');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55667, 'Vanderbilt Universit', 'Mantova', to_date('09-05-2020', 'dd-mm-yyyy'), '028221975');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84351, 'Barnes-Jewish', 'Monmouth', to_date('22-07-2020', 'dd-mm-yyyy'), '037291564');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (86581, 'Yale-New Haven', 'Oldham', to_date('17-08-2022', 'dd-mm-yyyy'), '038217662');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84419, 'Yale-New Haven', 'Glasgow', to_date('19-08-2019', 'dd-mm-yyyy'), '044633757');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64136, 'Johns Hopkins', 'Carlsbad', to_date('27-07-2015', 'dd-mm-yyyy'), '037999863');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (48564, 'University of Colora', 'Exeter', to_date('09-03-2013', 'dd-mm-yyyy'), '025707999');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27992, 'Johns Hopkins', 'Bountiful', to_date('19-04-2023', 'dd-mm-yyyy'), '094657358');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23314, 'University of Alabam', 'Suberg', to_date('17-05-2022', 'dd-mm-yyyy'), '099981369');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89568, 'UT Southwestern', 'Port Macquarie', to_date('17-09-2018', 'dd-mm-yyyy'), '085908579');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (22798, 'UC Davis Medical Cen', 'Berlin-Adlersho', to_date('17-08-2016', 'dd-mm-yyyy'), '037105210');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (81579, 'Emory University', 'North Point', to_date('13-08-2020', 'dd-mm-yyyy'), '098559106');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97229, 'Rush University', 'Valencia', to_date('08-08-2015', 'dd-mm-yyyy'), '084129724');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (88425, 'University of Wiscon', 'Hamburg', to_date('16-02-2017', 'dd-mm-yyyy'), '082861370');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27692, 'UC San Diego Health', 'Ettlingen', to_date('18-10-2012', 'dd-mm-yyyy'), '092750843');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (66926, 'University of Colora', 'Yucca', to_date('15-09-2015', 'dd-mm-yyyy'), '031160976');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28622, 'Yale-New Haven', 'Thalwil', to_date('30-04-2024', 'dd-mm-yyyy'), '091222266');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55445, 'Ochsner Medical Cent', 'Offenburg', to_date('08-01-2013', 'dd-mm-yyyy'), '087192251');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18298, 'Mayo Clinic Florida', 'Herndon', to_date('04-06-2021', 'dd-mm-yyyy'), '041955429');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27194, 'Mayo Clinic Florida', 'Goslar', to_date('24-08-2021', 'dd-mm-yyyy'), '082949941');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (13641, 'Mayo Clinic', 'Williamstown', to_date('07-03-2019', 'dd-mm-yyyy'), '046168898');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53443, 'University of Alabam', 'Aurora', to_date('29-03-2023', 'dd-mm-yyyy'), '094312945');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (33114, 'Mayo Clinic', 'Harsum', to_date('10-04-2010', 'dd-mm-yyyy'), '038274719');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (83495, 'Mercy', 'Long Island Cit', to_date('21-11-2013', 'dd-mm-yyyy'), '023340406');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (66436, 'University of Miami', 'Zafferana Etnea', to_date('16-02-2024', 'dd-mm-yyyy'), '031232865');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (71446, 'Ochsner Medical Cent', 'Soest', to_date('23-07-2014', 'dd-mm-yyyy'), '022204734');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (73425, 'Duke University', 'Araras', to_date('09-06-2019', 'dd-mm-yyyy'), '025039689');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61899, 'University of Alabam', 'Naestved', to_date('12-06-2018', 'dd-mm-yyyy'), '040345513');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28589, 'UCSF Medical Center', 'Lodi', to_date('19-05-2017', 'dd-mm-yyyy'), '098391190');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (75168, 'Houston Methodist', 'Echirolles', to_date('14-04-2023', 'dd-mm-yyyy'), '092825464');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76995, 'Keck Hospital', 'Billerica', to_date('24-02-2015', 'dd-mm-yyyy'), '088844403');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (15749, 'Emory University', 'Waldorf', to_date('28-01-2012', 'dd-mm-yyyy'), '038748427');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (63354, 'NYU Langone', 'Sydney', to_date('16-07-2017', 'dd-mm-yyyy'), '093639906');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (13668, 'Ochsner Medical Cent', 'Lexington', to_date('04-08-2010', 'dd-mm-yyyy'), '024333443');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89637, 'New York-Presbyteria', 'Sainte-foy', to_date('17-07-2021', 'dd-mm-yyyy'), '085570411');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (52551, 'University of Miami', 'Alcobendas', to_date('12-12-2019', 'dd-mm-yyyy'), '028919763');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (79476, 'Cedars-Sinai', 'Loveland', to_date('17-02-2018', 'dd-mm-yyyy'), '043547027');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (39142, 'UC San Diego Health', 'Dubai', to_date('25-07-2023', 'dd-mm-yyyy'), '041001550');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (41348, 'University of Michig', 'Madison', to_date('07-11-2014', 'dd-mm-yyyy'), '040134486');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (11311, 'University of Michig', 'Vienna', to_date('21-01-2016', 'dd-mm-yyyy'), '096458622');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (16513, 'Barnes-Jewish', 'Utsunomiya', to_date('03-11-2019', 'dd-mm-yyyy'), '029523124');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89689, 'University of Colora', 'Saint Paul', to_date('12-03-2011', 'dd-mm-yyyy'), '031400296');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (66624, 'University of Utah', 'Rorschach', to_date('23-02-2016', 'dd-mm-yyyy'), '030972155');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (83712, 'New York-Presbyteria', 'Tokushima', to_date('10-03-2014', 'dd-mm-yyyy'), '033775354');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51633, 'UCSF Medical Center', 'Harsum', to_date('10-01-2018', 'dd-mm-yyyy'), '091472931');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97578, 'Mount Sinai', 'Changwon-si', to_date('14-12-2023', 'dd-mm-yyyy'), '030944804');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95975, 'Mount Sinai', 'Lbeck', to_date('23-12-2020', 'dd-mm-yyyy'), '043719111');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (83517, 'Mayo Clinic', 'Borger', to_date('04-03-2017', 'dd-mm-yyyy'), '047496451');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (88172, 'Vanderbilt Universit', 'Dinslaken', to_date('01-08-2019', 'dd-mm-yyyy'), '028128722');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (17429, 'University of Wiscon', 'Warrenton', to_date('31-01-2023', 'dd-mm-yyyy'), '082458738');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18377, 'Northwestern Memoria', 'Goiania', to_date('19-11-2019', 'dd-mm-yyyy'), '033272792');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (86285, 'Duke University', 'Reno', to_date('15-06-2021', 'dd-mm-yyyy'), '030700627');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44589, 'Vanderbilt Universit', 'West Chester', to_date('08-12-2013', 'dd-mm-yyyy'), '048569349');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (17231, 'Cedars-Sinai', 'Schlieren', to_date('17-12-2022', 'dd-mm-yyyy'), '046470077');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97592, 'Massachusetts Genera', 'Utsunomiya', to_date('06-02-2011', 'dd-mm-yyyy'), '023044410');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (72144, 'UCSF Medical Center', 'Juno Beach', to_date('06-04-2017', 'dd-mm-yyyy'), '033886110');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62619, 'Stanford Health Care', 'Cobham', to_date('10-10-2010', 'dd-mm-yyyy'), '082018162');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87267, 'Froedtert Hospital', 'Avon', to_date('30-11-2012', 'dd-mm-yyyy'), '042478798');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (46595, 'Keck Hospital', 'Waite Park', to_date('21-04-2017', 'dd-mm-yyyy'), '089861054');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68342, 'University of Miami', 'Port Macquarie', to_date('27-10-2021', 'dd-mm-yyyy'), '097544299');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (43957, 'University of Colora', 'Longview', to_date('16-03-2014', 'dd-mm-yyyy'), '034784456');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (52875, 'Emory University', 'Bonn', to_date('28-09-2022', 'dd-mm-yyyy'), '096541196');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62786, 'New York-Presbyteria', 'Greenwood Villa', to_date('09-07-2022', 'dd-mm-yyyy'), '092752731');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76168, 'Massachusetts Genera', 'Uetikon am See', to_date('12-10-2019', 'dd-mm-yyyy'), '087779719');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (67936, 'Yale-New Haven', 'Grand-mere', to_date('06-09-2013', 'dd-mm-yyyy'), '083536339');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (58584, 'Jefferson Health', 'Fukuoka', to_date('10-01-2012', 'dd-mm-yyyy'), '088167929');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62869, 'Emory University', 'Lisboa', to_date('21-08-2019', 'dd-mm-yyyy'), '047850823');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51828, 'University of Michig', 'Augsburg', to_date('09-05-2010', 'dd-mm-yyyy'), '081728245');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55683, 'MedStar Georgetown', 'Nagasaki', to_date('09-01-2022', 'dd-mm-yyyy'), '037761862');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (92616, 'Stanford Health Care', 'Delafield', to_date('09-06-2017', 'dd-mm-yyyy'), '039551801');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (66455, 'Vanderbilt Universit', 'Hounslow', to_date('16-11-2011', 'dd-mm-yyyy'), '093777121');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (21541, 'Baylor University', 'Tהby', to_date('04-10-2017', 'dd-mm-yyyy'), '091314496');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (92131, 'Cedars-Sinai', 'Lakewood', to_date('05-02-2015', 'dd-mm-yyyy'), '033846263');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51477, 'MedStar Georgetown', 'Douala', to_date('30-01-2019', 'dd-mm-yyyy'), '044999596');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87569, 'Ochsner Medical Cent', 'Shreveport', to_date('15-09-2015', 'dd-mm-yyyy'), '033033744');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (49189, 'MedStar Georgetown', 'Immenstaad', to_date('27-09-2014', 'dd-mm-yyyy'), '043102540');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89644, 'Froedtert Hospital', 'Wilmington', to_date('28-10-2014', 'dd-mm-yyyy'), '028510114');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37825, 'Rush University', 'Barueri', to_date('06-04-2011', 'dd-mm-yyyy'), '048486322');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (85637, 'Ochsner Medical Cent', 'North Point', to_date('02-07-2020', 'dd-mm-yyyy'), '021865784');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96596, 'Stanford Health Care', 'Happy Valley', to_date('06-04-2024', 'dd-mm-yyyy'), '048764514');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27455, 'Rush University', 'Avon', to_date('15-04-2019', 'dd-mm-yyyy'), '042866866');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37239, 'Houston Methodist', 'Waldbronn', to_date('28-03-2022', 'dd-mm-yyyy'), '086915019');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (26529, 'University of Utah', 'South Weber', to_date('07-05-2013', 'dd-mm-yyyy'), '096610378');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76578, 'MedStar Georgetown', 'Slmea', to_date('18-11-2012', 'dd-mm-yyyy'), '041096041');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55686, 'Vanderbilt Universit', 'Perth', to_date('21-10-2011', 'dd-mm-yyyy'), '098953811');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (85959, 'UC San Diego Health', 'Coldmeece', to_date('26-12-2014', 'dd-mm-yyyy'), '093679535');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (85175, 'University of Michig', 'Biel', to_date('21-03-2022', 'dd-mm-yyyy'), '038365106');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (33156, 'University of Wiscon', 'Nizhnevartovsk', to_date('01-03-2022', 'dd-mm-yyyy'), '094523950');
commit;
prompt 200 records committed...
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82564, 'Mayo Clinic', 'Chinnor', to_date('17-04-2018', 'dd-mm-yyyy'), '047520380');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45358, 'Barnes-Jewish', 'Huntington Beac', to_date('03-11-2010', 'dd-mm-yyyy'), '029986314');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28428, 'Houston Methodist', 'Framingham', to_date('01-07-2019', 'dd-mm-yyyy'), '040787460');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54222, 'Duke University', 'New Hyde Park', to_date('30-07-2013', 'dd-mm-yyyy'), '089224088');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82163, 'University of Michig', 'Olsztyn', to_date('08-04-2022', 'dd-mm-yyyy'), '049172133');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (63572, 'Northwestern Memoria', 'Buffalo', to_date('25-04-2010', 'dd-mm-yyyy'), '095480778');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87589, 'Emory University', 'Changwon-si', to_date('25-06-2016', 'dd-mm-yyyy'), '091592427');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18344, 'Cleveland Clinic', 'Nizhnevartovsk', to_date('07-05-2013', 'dd-mm-yyyy'), '049367109');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (78686, 'Stanford Health Care', 'Orlando', to_date('24-07-2015', 'dd-mm-yyyy'), '083314580');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34752, 'UCLA Medical Center', 'New Delhi', to_date('08-03-2015', 'dd-mm-yyyy'), '084671701');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (79832, 'Rush University', 'Winterthur', to_date('23-02-2021', 'dd-mm-yyyy'), '046971716');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53436, 'Mayo Clinic', 'Kaysville', to_date('24-02-2010', 'dd-mm-yyyy'), '020851924');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96779, 'UCSF Medical Center', 'Thalwil', to_date('10-09-2016', 'dd-mm-yyyy'), '026918754');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82144, 'MedStar Georgetown', 'Santa Clarita', to_date('29-05-2016', 'dd-mm-yyyy'), '025616898');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (99192, 'New York-Presbyteria', 'New Hope', to_date('23-01-2012', 'dd-mm-yyyy'), '080016323');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36946, 'UC Davis Medical Cen', 'Aurora', to_date('12-11-2013', 'dd-mm-yyyy'), '028978683');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (22143, 'University of Miami', 'Omaha', to_date('30-06-2014', 'dd-mm-yyyy'), '047984143');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57957, 'Cleveland Clinic Flo', 'Oldwick', to_date('09-04-2023', 'dd-mm-yyyy'), '087792585');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (96796, 'Cleveland Clinic Flo', 'Gainesville', to_date('23-01-2010', 'dd-mm-yyyy'), '090140108');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34187, 'UC Davis Medical Cen', 'Beaverton', to_date('12-04-2018', 'dd-mm-yyyy'), '029114163');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (14875, 'University of Miami', 'South Hadley', to_date('10-03-2023', 'dd-mm-yyyy'), '038235414');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (86818, 'Mayo Clinic Florida', 'Tours', to_date('07-03-2010', 'dd-mm-yyyy'), '093432765');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64693, 'UC Davis Medical Cen', 'Gummersbach', to_date('05-11-2014', 'dd-mm-yyyy'), '097435722');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23651, 'University of Wiscon', 'West Chester', to_date('04-02-2023', 'dd-mm-yyyy'), '099759548');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37424, 'MedStar Georgetown', 'Alpharetta', to_date('01-02-2024', 'dd-mm-yyyy'), '039786056');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57286, 'University of Alabam', 'Porto alegre', to_date('30-03-2022', 'dd-mm-yyyy'), '082186511');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76713, 'University of Wiscon', 'Hartmannsdorf', to_date('30-01-2017', 'dd-mm-yyyy'), '032746313');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68731, 'UT Southwestern', 'Sidney', to_date('30-07-2011', 'dd-mm-yyyy'), '093522294');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27563, 'Stanford Health Care', 'Lake Forest', to_date('26-05-2010', 'dd-mm-yyyy'), '091423543');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (79796, 'University of Michig', 'Herzogenrath', to_date('02-12-2015', 'dd-mm-yyyy'), '081210677');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (38234, 'NYU Langone', 'Karlsruhe', to_date('04-07-2020', 'dd-mm-yyyy'), '037801583');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31919, 'UC San Diego Health', 'Butner', to_date('13-04-2020', 'dd-mm-yyyy'), '028474965');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84123, 'UT Southwestern', 'Longview', to_date('17-12-2020', 'dd-mm-yyyy'), '030739073');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (99752, 'Cleveland Clinic Flo', 'High Wycombe', to_date('07-06-2023', 'dd-mm-yyyy'), '043874105');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45639, 'UT Southwestern', 'Tampa', to_date('19-01-2020', 'dd-mm-yyyy'), '033878403');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (69472, 'UC Davis Medical Cen', 'Buffalo Grove', to_date('05-12-2021', 'dd-mm-yyyy'), '043213411');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31327, 'University of Michig', 'Meerbusch', to_date('04-11-2021', 'dd-mm-yyyy'), '044103987');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25717, 'Northwestern Memoria', 'Szazhalombatta', to_date('12-09-2012', 'dd-mm-yyyy'), '092821507');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (47823, 'UC Davis Medical Cen', 'Mapo-gu', to_date('16-01-2016', 'dd-mm-yyyy'), '081934073');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (13322, 'Barnes-Jewish', 'Duisburg', to_date('20-07-2011', 'dd-mm-yyyy'), '095568613');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37469, 'University of Utah', 'Tilst', to_date('03-12-2021', 'dd-mm-yyyy'), '048515501');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25751, 'UCLA Medical Center', 'Fukuoka', to_date('21-04-2018', 'dd-mm-yyyy'), '082591410');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (38961, 'University of Utah', 'Milan', to_date('17-04-2012', 'dd-mm-yyyy'), '034119748');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68523, 'Yale-New Haven', 'Seattle', to_date('26-12-2023', 'dd-mm-yyyy'), '096977424');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (38518, 'Cleveland Clinic Flo', 'Lake Oswego', to_date('04-05-2016', 'dd-mm-yyyy'), '030355314');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42525, 'University of Alabam', 'Berkshire', to_date('01-06-2019', 'dd-mm-yyyy'), '039529582');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59672, 'University of Michig', 'Manchester', to_date('25-07-2019', 'dd-mm-yyyy'), '023551962');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (11953, 'University of Michig', 'Guelph', to_date('28-11-2013', 'dd-mm-yyyy'), '020900432');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (49182, 'Baylor University', 'Mississauga', to_date('27-11-2020', 'dd-mm-yyyy'), '045689279');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (93396, 'University of Iowa', 'Kרbenhavn', to_date('06-09-2011', 'dd-mm-yyyy'), '048530685');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (93533, 'Northwestern Memoria', 'Olivette', to_date('25-11-2014', 'dd-mm-yyyy'), '083127613');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55386, 'University of Alabam', 'Rockland', to_date('05-01-2021', 'dd-mm-yyyy'), '086748539');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23489, 'Stanford Health Care', 'Bristol', to_date('17-06-2015', 'dd-mm-yyyy'), '085772842');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44354, 'Ochsner Medical Cent', 'Regensburg', to_date('10-01-2015', 'dd-mm-yyyy'), '094113749');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28811, 'Mount Sinai', 'Franklin', to_date('12-12-2014', 'dd-mm-yyyy'), '048015132');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55631, 'Massachusetts Genera', 'Rorschach', to_date('29-02-2012', 'dd-mm-yyyy'), '045692751');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57631, 'Baylor University', 'Cerritos', to_date('04-11-2019', 'dd-mm-yyyy'), '028158540');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (26128, 'Johns Hopkins', 'Sacramento', to_date('18-05-2014', 'dd-mm-yyyy'), '044121337');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95839, 'Mayo Clinic', 'Miyazaki', to_date('02-08-2015', 'dd-mm-yyyy'), '086646015');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87413, 'Mercy', 'Petach-Tikva', to_date('12-07-2014', 'dd-mm-yyyy'), '095560558');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (12732, 'Mayo Clinic', 'Essen', to_date('19-06-2020', 'dd-mm-yyyy'), '096168286');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (83779, 'NYU Langone', 'Rochester', to_date('31-03-2020', 'dd-mm-yyyy'), '042241046');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (67486, 'University of Wiscon', 'Lubbock', to_date('15-04-2020', 'dd-mm-yyyy'), '048843329');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (43162, 'Cleveland Clinic', 'Tilst', to_date('13-09-2020', 'dd-mm-yyyy'), '031986558');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (73483, 'University of Colora', 'Londrina', to_date('06-07-2023', 'dd-mm-yyyy'), '035250979');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (22894, 'University of Alabam', 'Rochester', to_date('14-05-2023', 'dd-mm-yyyy'), '093190217');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (24263, 'Northwestern Memoria', 'Neuquen', to_date('17-10-2018', 'dd-mm-yyyy'), '045684744');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (91278, 'Northwestern Memoria', 'Melrose park', to_date('14-03-2022', 'dd-mm-yyyy'), '021402049');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27617, 'Cleveland Clinic', 'Nuernberg', to_date('18-02-2014', 'dd-mm-yyyy'), '037748455');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (81863, 'Jefferson Health', 'Milsons Point', to_date('14-01-2022', 'dd-mm-yyyy'), '025500299');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62521, 'University of Iowa', 'Bracknell', to_date('23-08-2017', 'dd-mm-yyyy'), '081994387');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34459, 'University of Colora', 'Sursee', to_date('13-02-2024', 'dd-mm-yyyy'), '086360221');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (56444, 'Yale-New Haven', 'Woodbridge', to_date('27-08-2017', 'dd-mm-yyyy'), '087524737');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (49938, 'University of Miami', 'Swannanoa', to_date('04-07-2017', 'dd-mm-yyyy'), '041110959');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (37191, 'UC Davis Medical Cen', 'Mt. Laurel', to_date('20-10-2013', 'dd-mm-yyyy'), '040454059');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (67929, 'MedStar Georgetown', 'Draper', to_date('01-01-2013', 'dd-mm-yyyy'), '030510394');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61998, 'Emory University', 'Cerritos', to_date('15-08-2018', 'dd-mm-yyyy'), '031592061');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36751, 'Mayo Clinic Arizona', 'Oxon', to_date('06-08-2014', 'dd-mm-yyyy'), '086490257');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (81922, 'Barnes-Jewish', 'Cherepovets', to_date('27-08-2014', 'dd-mm-yyyy'), '035337325');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57416, 'Stanford Health Care', 'Leinfelden-Echt', to_date('25-08-2012', 'dd-mm-yyyy'), '042599737');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (26629, 'University of Michig', 'Mechanicsburg', to_date('06-01-2019', 'dd-mm-yyyy'), '082614260');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89372, 'Emory University', 'San Ramon', to_date('14-03-2012', 'dd-mm-yyyy'), '087846333');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34383, 'Brigham and Women\''s', 'Leawood', to_date('15-07-2015', 'dd-mm-yyyy'), '099357573');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32256, 'Ochsner Medical Cent', 'New Castle', to_date('29-12-2018', 'dd-mm-yyyy'), '098454880');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (81995, 'UT Southwestern', 'Pompton Plains', to_date('26-09-2015', 'dd-mm-yyyy'), '041799658');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (35593, 'UC San Diego Health', 'Zaandam', to_date('17-03-2010', 'dd-mm-yyyy'), '036623858');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74389, 'UC Davis Medical Cen', 'Shelton', to_date('24-10-2023', 'dd-mm-yyyy'), '030539148');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (92575, 'University of Utah', 'Hochwald', to_date('22-04-2015', 'dd-mm-yyyy'), '040705841');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55964, 'Froedtert Hospital', 'Oslo', to_date('17-02-2018', 'dd-mm-yyyy'), '043005510');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23499, 'Ochsner Medical Cent', 'Kumamoto', to_date('15-11-2015', 'dd-mm-yyyy'), '040112480');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32772, 'University of Chicag', 'Seoul', to_date('12-12-2010', 'dd-mm-yyyy'), '043724882');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (56543, 'UT Southwestern', 'Copenhagen', to_date('15-11-2021', 'dd-mm-yyyy'), '096916247');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (16364, 'University of Iowa', 'Leeds', to_date('26-10-2010', 'dd-mm-yyyy'), '023771831');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59736, 'MedStar Georgetown', 'Meerbusch', to_date('14-10-2013', 'dd-mm-yyyy'), '025569592');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23661, 'Jefferson Health', 'Kansas City', to_date('07-12-2016', 'dd-mm-yyyy'), '026753504');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42477, 'Emory University', 'Biel', to_date('24-08-2013', 'dd-mm-yyyy'), '093795528');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59346, 'Johns Hopkins', 'Arlington', to_date('27-11-2015', 'dd-mm-yyyy'), '021688781');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (88457, 'University of Chicag', 'Dreieich', to_date('08-01-2012', 'dd-mm-yyyy'), '039580165');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (36532, 'Johns Hopkins', 'Bremen', to_date('16-09-2014', 'dd-mm-yyyy'), '040991701');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89332, 'New York-Presbyteria', 'New Delhi', to_date('20-03-2021', 'dd-mm-yyyy'), '040980175');
commit;
prompt 300 records committed...
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95258, 'UCSF Medical Center', 'Wilmington', to_date('18-12-2012', 'dd-mm-yyyy'), '039652993');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45119, 'Rush University', 'Dallas', to_date('09-10-2019', 'dd-mm-yyyy'), '093125487');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (24372, 'Johns Hopkins', 'Brossard', to_date('05-07-2017', 'dd-mm-yyyy'), '027834417');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (78599, 'Keck Hospital', 'Chapel hill', to_date('01-08-2020', 'dd-mm-yyyy'), '046091024');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (99913, 'University of Michig', 'Barcelona', to_date('13-07-2022', 'dd-mm-yyyy'), '040871166');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (19523, 'University of Michig', 'Annandale', to_date('24-08-2016', 'dd-mm-yyyy'), '099348898');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84715, 'Cleveland Clinic', 'Ben-Gurion', to_date('09-03-2023', 'dd-mm-yyyy'), '085125140');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64759, 'NYU Langone', 'Park Ridge', to_date('21-03-2024', 'dd-mm-yyyy'), '031477283');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42228, 'University of Alabam', 'Saudarkrokur', to_date('28-07-2021', 'dd-mm-yyyy'), '095566767');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97874, 'Mayo Clinic', 'Jun-nam', to_date('26-09-2012', 'dd-mm-yyyy'), '048860422');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23592, 'Houston Methodist', 'Thalwil', to_date('23-02-2020', 'dd-mm-yyyy'), '082651452');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45254, 'Cleveland Clinic', 'Warrenton', to_date('16-11-2011', 'dd-mm-yyyy'), '095713877');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53834, 'Mayo Clinic Arizona', 'Boise', to_date('05-03-2016', 'dd-mm-yyyy'), '033753783');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (86925, 'Brigham and Women\''s', 'Goiania', to_date('29-03-2017', 'dd-mm-yyyy'), '029498663');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (91748, 'Cleveland Clinic Flo', 'Regina', to_date('28-02-2013', 'dd-mm-yyyy'), '044840233');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (28753, 'Mount Sinai', 'Greenville', to_date('04-05-2010', 'dd-mm-yyyy'), '030563921');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (72225, 'University of Utah', 'Lippetal', to_date('30-05-2016', 'dd-mm-yyyy'), '032534072');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (32339, 'Mayo Clinic', 'Protvino', to_date('10-12-2022', 'dd-mm-yyyy'), '028020655');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (98857, 'Baylor University', 'North Sydney', to_date('26-05-2010', 'dd-mm-yyyy'), '044477769');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (57523, 'Jefferson Health', 'Paal Beringen', to_date('20-10-2015', 'dd-mm-yyyy'), '030014445');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (67654, 'UT Southwestern', 'Cambridge', to_date('27-01-2011', 'dd-mm-yyyy'), '095035945');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18172, 'Stanford Health Care', 'Vanderbijlpark', to_date('08-05-2013', 'dd-mm-yyyy'), '046507501');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (23638, 'New York-Presbyteria', 'Sapporo', to_date('02-03-2021', 'dd-mm-yyyy'), '082353686');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (45111, 'Houston Methodist', 'Kochi', to_date('15-07-2011', 'dd-mm-yyyy'), '044662167');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44989, 'Barnes-Jewish', 'Budapest', to_date('24-06-2021', 'dd-mm-yyyy'), '028682411');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (95217, 'Mount Sinai', 'Rheinfelden', to_date('15-02-2012', 'dd-mm-yyyy'), '022678010');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18468, 'Jefferson Health', 'Stuttgart', to_date('30-09-2013', 'dd-mm-yyyy'), '092199287');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (84991, 'UC San Diego Health', 'Oxon', to_date('02-10-2018', 'dd-mm-yyyy'), '023380002');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (49431, 'Barnes-Jewish', 'Coslada', to_date('17-12-2012', 'dd-mm-yyyy'), '046505792');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (12715, 'University of Alabam', 'Tours', to_date('10-06-2019', 'dd-mm-yyyy'), '096053952');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (31169, 'Houston Methodist', 'New Delhi', to_date('11-02-2011', 'dd-mm-yyyy'), '085916123');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (77164, 'Emory University', 'Winterthur', to_date('13-06-2018', 'dd-mm-yyyy'), '036444479');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (54769, 'Vanderbilt Universit', 'El Paso', to_date('17-07-2011', 'dd-mm-yyyy'), '032805557');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (38714, 'Mayo Clinic Florida', 'Solikamsk', to_date('19-03-2019', 'dd-mm-yyyy'), '029094301');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (16516, 'Barnes-Jewish', 'Rochester', to_date('19-01-2011', 'dd-mm-yyyy'), '025062440');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (94783, 'Mayo Clinic', 'Brussel', to_date('08-06-2012', 'dd-mm-yyyy'), '085235383');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51758, 'University of Chicag', 'Snoqualmie', to_date('10-12-2014', 'dd-mm-yyyy'), '080458940');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76181, 'Mayo Clinic Arizona', 'North Sydney', to_date('25-06-2011', 'dd-mm-yyyy'), '034195358');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (87375, 'Rush University', 'Fairfax', to_date('19-05-2015', 'dd-mm-yyyy'), '031062192');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55239, 'Mayo Clinic Arizona', 'Prague', to_date('24-11-2021', 'dd-mm-yyyy'), '049162363');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25915, 'Jefferson Health', 'Redwood City', to_date('02-11-2018', 'dd-mm-yyyy'), '023640484');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (73261, 'Jefferson Health', 'Telford', to_date('21-06-2021', 'dd-mm-yyyy'), '033957768');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42465, 'Cleveland Clinic', 'Pasadena', to_date('05-06-2014', 'dd-mm-yyyy'), '047326188');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62328, 'Ochsner Medical Cent', 'Mogi Guacu', to_date('12-12-2011', 'dd-mm-yyyy'), '092823933');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (78846, 'Mayo Clinic', 'Grand Rapids', to_date('23-05-2012', 'dd-mm-yyyy'), '037565938');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44939, 'Cedars-Sinai', 'Wellington', to_date('12-10-2015', 'dd-mm-yyyy'), '091861805');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (56619, 'Barnes-Jewish', 'Bolton', to_date('09-02-2016', 'dd-mm-yyyy'), '083155759');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82365, 'Northwestern Memoria', 'Rozenburg', to_date('07-08-2011', 'dd-mm-yyyy'), '023150041');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (39559, 'Stanford Health Care', 'Long Island Cit', to_date('26-08-2011', 'dd-mm-yyyy'), '099780289');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64634, 'Houston Methodist', 'Matsue', to_date('14-07-2021', 'dd-mm-yyyy'), '098887309');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51732, 'Yale-New Haven', 'Belo Horizonte', to_date('15-06-2014', 'dd-mm-yyyy'), '047272691');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62216, 'Johns Hopkins', 'Yokohama', to_date('28-04-2015', 'dd-mm-yyyy'), '080602254');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (29596, 'UT Southwestern', 'Rosario', to_date('08-06-2019', 'dd-mm-yyyy'), '048528296');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53743, 'Emory University', 'Rockland', to_date('03-01-2022', 'dd-mm-yyyy'), '095480609');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (79181, 'Johns Hopkins', 'Kista', to_date('23-12-2020', 'dd-mm-yyyy'), '095243151');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34494, 'University of Chicag', 'Salisbury', to_date('04-04-2011', 'dd-mm-yyyy'), '031589087');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51435, 'Cleveland Clinic Flo', 'Syracuse', to_date('30-09-2022', 'dd-mm-yyyy'), '046417214');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97217, 'Cedars-Sinai', 'Springfield', to_date('31-07-2013', 'dd-mm-yyyy'), '043947112');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (25848, 'UT Southwestern', 'Montrיal', to_date('21-11-2013', 'dd-mm-yyyy'), '048481285');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62719, 'UCLA Medical Center', 'Ricardson', to_date('03-04-2023', 'dd-mm-yyyy'), '032010157');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (34489, 'Duke University', 'Ft. Lauderdale', to_date('27-09-2013', 'dd-mm-yyyy'), '036418931');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (62964, 'Johns Hopkins', 'Berkshire', to_date('16-02-2019', 'dd-mm-yyyy'), '088819367');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (82623, 'Houston Methodist', 'Stans', to_date('27-05-2021', 'dd-mm-yyyy'), '045476487');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27799, 'Stanford Health Care', 'Hercules', to_date('12-04-2022', 'dd-mm-yyyy'), '038152389');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53131, 'Froedtert Hospital', 'High Wycombe', to_date('17-08-2022', 'dd-mm-yyyy'), '090864316');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27367, 'New York-Presbyteria', 'Venice', to_date('01-04-2023', 'dd-mm-yyyy'), '038221602');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (16983, 'Brigham and Women\''s', 'Timonium', to_date('09-09-2021', 'dd-mm-yyyy'), '048792220');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (89536, 'University of Chicag', 'Malmצ', to_date('31-01-2023', 'dd-mm-yyyy'), '085234761');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (44652, 'UCLA Medical Center', 'Brampton', to_date('28-05-2011', 'dd-mm-yyyy'), '032170034');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (33442, 'University of Wiscon', 'Lucca', to_date('15-08-2014', 'dd-mm-yyyy'), '029380875');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (53564, 'Mount Sinai', 'Nordhausen', to_date('27-01-2014', 'dd-mm-yyyy'), '099767836');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (17736, 'University of Alabam', 'Hamburg', to_date('22-10-2023', 'dd-mm-yyyy'), '082769419');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (14752, 'University of Wiscon', 'Padova', to_date('04-02-2022', 'dd-mm-yyyy'), '028299940');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64851, 'University of Iowa', 'St. Petersburg', to_date('10-10-2022', 'dd-mm-yyyy'), '029154131');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68312, 'Froedtert Hospital', 'Birmensdorf', to_date('08-11-2014', 'dd-mm-yyyy'), '021489349');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (85499, 'Emory University', 'Eden prairie', to_date('29-07-2021', 'dd-mm-yyyy'), '039760348');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (91114, 'Emory University', 'El Dorado Hills', to_date('24-12-2014', 'dd-mm-yyyy'), '025825948');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (97834, 'Northwestern Memoria', 'Hillerרd', to_date('25-02-2014', 'dd-mm-yyyy'), '081562256');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (42823, 'Cedars-Sinai', 'El Masnou', to_date('04-09-2018', 'dd-mm-yyyy'), '083787138');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (78754, 'Mayo Clinic Arizona', 'Takapuna', to_date('22-10-2014', 'dd-mm-yyyy'), '043117459');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (71558, 'Stanford Health Care', 'Belgrad', to_date('04-09-2021', 'dd-mm-yyyy'), '044883926');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (46365, 'MedStar Georgetown', 'Sao caetano do ', to_date('18-08-2016', 'dd-mm-yyyy'), '089094406');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (29496, 'Yale-New Haven', 'Verdun', to_date('08-07-2012', 'dd-mm-yyyy'), '044662668');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (64521, 'Vanderbilt Universit', 'Offenburg', to_date('28-05-2020', 'dd-mm-yyyy'), '044298598');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (56488, 'Mercy', 'Dublin', to_date('10-05-2016', 'dd-mm-yyyy'), '046039158');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (15355, 'Northwestern Memoria', 'Leeds', to_date('10-06-2018', 'dd-mm-yyyy'), '087613471');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (51218, 'Stanford Health Care', 'Ludbreg', to_date('08-04-2023', 'dd-mm-yyyy'), '082066491');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (55187, 'Baylor University', 'Sidney', to_date('25-03-2011', 'dd-mm-yyyy'), '038790004');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (74446, 'Mayo Clinic', 'Matsue', to_date('29-11-2010', 'dd-mm-yyyy'), '020319142');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (68841, 'Mayo Clinic Arizona', 'Thalwil', to_date('25-06-2019', 'dd-mm-yyyy'), '080257170');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (18854, 'Massachusetts Genera', 'Fort gordon', to_date('06-07-2014', 'dd-mm-yyyy'), '024820738');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59429, 'University of Colora', 'St. Louis', to_date('29-06-2021', 'dd-mm-yyyy'), '032025087');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (69485, 'University of Wiscon', 'Ben-Gurion', to_date('26-11-2012', 'dd-mm-yyyy'), '030486904');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61188, 'Jefferson Health', 'Dalmine', to_date('26-12-2020', 'dd-mm-yyyy'), '097841060');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (59961, 'NYU Langone', 'Udine', to_date('11-03-2017', 'dd-mm-yyyy'), '091541366');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (61615, 'Stanford Health Care', 'Salt Lake City', to_date('14-12-2013', 'dd-mm-yyyy'), '080476199');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (75269, 'Ochsner Medical Cent', 'Runcorn', to_date('29-12-2012', 'dd-mm-yyyy'), '031191793');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (27554, 'Baylor University', 'Arlington', to_date('31-12-2011', 'dd-mm-yyyy'), '083041930');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (76242, 'Massachusetts Genera', 'Suwon-city', to_date('27-05-2014', 'dd-mm-yyyy'), '026423759');
insert into RECEIVER (hospital_id, hospital_name, city, delivery_date, hospital_phone)
values (94448, 'University of Chicag', 'Budapest', to_date('02-07-2016', 'dd-mm-yyyy'), '097949088');
commit;
prompt 400 records loaded
prompt Loading DONATION...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (745791198, 'N', to_date('06-03-2012', 'dd-mm-yyyy'), 'N', '323308058', '291511425', 13358, 89332);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (178748698, 'N', to_date('30-07-2015', 'dd-mm-yyyy'), 'N', '594359980', '064148482', 51931, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (596428579, 'Y', to_date('24-10-2010', 'dd-mm-yyyy'), 'Y', '996383746', '632140770', 43757, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (687229331, 'Y', to_date('23-10-2023', 'dd-mm-yyyy'), 'Y', '264346014', '402373896', 84454, 68949);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (449559659, 'Y', to_date('30-09-2012', 'dd-mm-yyyy'), 'N', '517900008', '885461855', 65496, 67486);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (442162166, 'Y', to_date('15-11-2015', 'dd-mm-yyyy'), 'N', '555029781', '745115342', 32598, 56389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (626181297, 'Y', to_date('12-06-2014', 'dd-mm-yyyy'), 'N', '758794404', '912029990', 54514, 66624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (871499711, 'Y', to_date('10-09-2010', 'dd-mm-yyyy'), 'Y', '184623309', '855872783', 86683, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (766137744, 'N', to_date('21-09-2019', 'dd-mm-yyyy'), 'N', '229266261', '629219354', 98616, 67486);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (968976591, 'Y', to_date('23-06-2018', 'dd-mm-yyyy'), 'Y', '725569007', '288128062', 22145, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (755349864, 'Y', to_date('30-08-2023', 'dd-mm-yyyy'), 'N', '003904199', '799167503', 46151, 54222);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (259773262, 'N', to_date('11-01-2012', 'dd-mm-yyyy'), 'N', '559736783', '549198520', 53616, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (242769439, 'Y', to_date('14-08-2012', 'dd-mm-yyyy'), 'N', '106071827', '048142005', 92597, 72144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (747412479, 'Y', to_date('28-09-2012', 'dd-mm-yyyy'), 'N', '652031992', '798318022', 64766, 55683);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (929826945, 'N', to_date('16-07-2021', 'dd-mm-yyyy'), 'Y', '200291980', '757024709', 22689, 54673);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (984717418, 'Y', to_date('15-12-2018', 'dd-mm-yyyy'), 'Y', '881032236', '187799087', 38674, 16983);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (753717824, 'N', to_date('23-04-2019', 'dd-mm-yyyy'), 'Y', '757024709', '218095746', 62992, 84351);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (119448177, 'N', to_date('06-04-2020', 'dd-mm-yyyy'), 'Y', '877652677', '624208805', 55124, 77164);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (565896919, 'Y', to_date('28-05-2023', 'dd-mm-yyyy'), 'N', '057913650', '456099156', 15468, 38518);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (567278692, 'Y', to_date('13-11-2011', 'dd-mm-yyyy'), 'Y', '995091462', '799167503', 35331, 83712);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (928851956, 'Y', to_date('29-11-2013', 'dd-mm-yyyy'), 'Y', '080849238', '370632269', 51299, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (413443437, 'Y', to_date('23-03-2023', 'dd-mm-yyyy'), 'N', '369093284', '312041206', 79811, 28622);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (964268857, 'N', to_date('03-07-2019', 'dd-mm-yyyy'), 'N', '610341868', '772399394', 78159, 92616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (395179231, 'Y', to_date('24-09-2017', 'dd-mm-yyyy'), 'N', '942081370', '617833949', 53299, 59961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (491783588, 'N', to_date('15-02-2017', 'dd-mm-yyyy'), 'Y', '144998512', '151254801', 28596, 84351);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (512241281, 'Y', to_date('19-09-2021', 'dd-mm-yyyy'), 'Y', '319449185', '850880715', 78954, 33114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (258551513, 'N', to_date('27-12-2017', 'dd-mm-yyyy'), 'Y', '009934088', '921565805', 15693, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (437542612, 'Y', to_date('10-02-2024', 'dd-mm-yyyy'), 'N', '998752021', '083033817', 43614, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (144452736, 'N', to_date('29-03-2010', 'dd-mm-yyyy'), 'N', '307081120', '245843519', 82939, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (327472123, 'Y', to_date('08-06-2019', 'dd-mm-yyyy'), 'Y', '151716759', '218095746', 95955, 55445);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (334597222, 'Y', to_date('12-04-2016', 'dd-mm-yyyy'), 'Y', '822051253', '245217745', 15638, 44354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (814212861, 'N', to_date('21-02-2022', 'dd-mm-yyyy'), 'Y', '710020129', '955370738', 58944, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (344325276, 'Y', to_date('12-02-2021', 'dd-mm-yyyy'), 'Y', '192849062', '751102104', 57331, 14875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (261217912, 'N', to_date('18-08-2023', 'dd-mm-yyyy'), 'Y', '493961904', '823811487', 24479, 83779);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (478173673, 'N', to_date('14-05-2015', 'dd-mm-yyyy'), 'Y', '731452579', '495883869', 17919, 37239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (138877155, 'N', to_date('18-11-2020', 'dd-mm-yyyy'), 'Y', '924624068', '187799087', 94778, 95975);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (341955367, 'Y', to_date('19-11-2023', 'dd-mm-yyyy'), 'N', '663516006', '968732165', 78249, 25844);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (688133388, 'N', to_date('27-06-2016', 'dd-mm-yyyy'), 'N', '276143046', '243237202', 39555, 36751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (242375576, 'Y', to_date('27-10-2019', 'dd-mm-yyyy'), 'N', '760837533', '553126149', 73885, 28622);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (698421558, 'N', to_date('20-08-2018', 'dd-mm-yyyy'), 'N', '624208805', '025814164', 74399, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (854264273, 'Y', to_date('30-07-2010', 'dd-mm-yyyy'), 'Y', '772399394', '364681609', 33828, 88425);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (376646395, 'Y', to_date('11-06-2012', 'dd-mm-yyyy'), 'N', '696511331', '353521370', 78828, 38463);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (567714955, 'Y', to_date('24-06-2023', 'dd-mm-yyyy'), 'N', '133134505', '569849442', 79811, 32725);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (469283884, 'Y', to_date('17-04-2017', 'dd-mm-yyyy'), 'Y', '120237174', '969250919', 33265, 68731);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (861191197, 'Y', to_date('21-10-2019', 'dd-mm-yyyy'), 'Y', '980638570', '858439996', 92889, 17429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (214795816, 'Y', to_date('05-03-2015', 'dd-mm-yyyy'), 'Y', '178613896', '288926877', 11131, 55239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (362142346, 'N', to_date('30-09-2023', 'dd-mm-yyyy'), 'N', '291511425', '960125605', 47741, 84859);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (585521978, 'Y', to_date('30-04-2022', 'dd-mm-yyyy'), 'N', '975087097', '709634152', 25536, 89644);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (666892238, 'N', to_date('09-02-2022', 'dd-mm-yyyy'), 'N', '805125593', '339713112', 14132, 76713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (625452921, 'Y', to_date('11-08-2017', 'dd-mm-yyyy'), 'N', '339753654', '336451229', 85267, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (181234828, 'Y', to_date('14-08-2021', 'dd-mm-yyyy'), 'N', '003904199', '408874915', 86846, 68664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (337493882, 'Y', to_date('18-02-2014', 'dd-mm-yyyy'), 'Y', '974550419', '243237202', 46276, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (568259324, 'Y', to_date('11-04-2020', 'dd-mm-yyyy'), 'N', '160587152', '245217745', 12658, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (174292949, 'N', to_date('09-04-2016', 'dd-mm-yyyy'), 'Y', '182761224', '187799087', 35743, 97592);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (235488711, 'Y', to_date('03-09-2021', 'dd-mm-yyyy'), 'N', '262097637', '871930292', 79811, 67929);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (543729193, 'Y', to_date('03-09-2019', 'dd-mm-yyyy'), 'Y', '160587152', '823811487', 15254, 64521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (111877437, 'N', to_date('03-09-2020', 'dd-mm-yyyy'), 'N', '118056743', '033712611', 64265, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (226651133, 'Y', to_date('03-04-2011', 'dd-mm-yyyy'), 'N', '799167503', '627820755', 58177, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (588115828, 'Y', to_date('26-09-2017', 'dd-mm-yyyy'), 'N', '273455017', '431602139', 97646, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (931714218, 'N', to_date('06-03-2012', 'dd-mm-yyyy'), 'Y', '819059056', '903441905', 61565, 83517);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (577883553, 'Y', to_date('03-12-2018', 'dd-mm-yyyy'), 'Y', '036492757', '530485585', 73857, 95258);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274558369, 'Y', to_date('25-07-2020', 'dd-mm-yyyy'), 'Y', '680172578', '741343717', 28748, 71558);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (286846517, 'N', to_date('21-07-2021', 'dd-mm-yyyy'), 'Y', '551911744', '585972131', 61993, 16983);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (771932964, 'Y', to_date('15-06-2011', 'dd-mm-yyyy'), 'N', '555029781', '175321868', 62641, 24263);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (753654398, 'N', to_date('22-03-2014', 'dd-mm-yyyy'), 'N', '581109827', '723445327', 62992, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (157258524, 'N', to_date('23-10-2022', 'dd-mm-yyyy'), 'Y', '420963265', '958133138', 12658, 57631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (595677255, 'Y', to_date('13-10-2019', 'dd-mm-yyyy'), 'Y', '758794404', '939829538', 86192, 61615);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (267141628, 'Y', to_date('21-03-2012', 'dd-mm-yyyy'), 'Y', '072622442', '684744404', 96613, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (468652224, 'Y', to_date('09-09-2023', 'dd-mm-yyyy'), 'Y', '539087374', '960125605', 69587, 75269);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (513853928, 'N', to_date('05-07-2014', 'dd-mm-yyyy'), 'Y', '998752021', '841337498', 12956, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (987795853, 'Y', to_date('31-12-2016', 'dd-mm-yyyy'), 'N', '982871108', '424650791', 51231, 52551);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (186263564, 'N', to_date('13-10-2012', 'dd-mm-yyyy'), 'N', '490388060', '652327528', 91352, 38234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (145799369, 'N', to_date('12-09-2010', 'dd-mm-yyyy'), 'N', '031240584', '751102104', 71762, 45358);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (327271136, 'N', to_date('30-01-2010', 'dd-mm-yyyy'), 'N', '585289028', '234448967', 55395, 84991);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (364631544, 'N', to_date('14-05-2021', 'dd-mm-yyyy'), 'Y', '369093284', '238511855', 22689, 87375);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (215511294, 'Y', to_date('13-01-2015', 'dd-mm-yyyy'), 'Y', '062725544', '529867055', 79765, 92616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (756916723, 'Y', to_date('11-11-2013', 'dd-mm-yyyy'), 'N', '465075631', '943811449', 62992, 89637);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (289141791, 'Y', to_date('19-03-2013', 'dd-mm-yyyy'), 'Y', '574670543', '243237202', 93715, 32848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (762896364, 'N', to_date('19-12-2015', 'dd-mm-yyyy'), 'N', '482424220', '766797561', 12888, 32256);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (566531555, 'N', to_date('12-02-2010', 'dd-mm-yyyy'), 'N', '354683638', '025800738', 33657, 23638);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (519768928, 'Y', to_date('20-01-2018', 'dd-mm-yyyy'), 'Y', '382880573', '517900008', 62641, 36946);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (623724831, 'N', to_date('02-11-2016', 'dd-mm-yyyy'), 'N', '629219354', '254115667', 23968, 61216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (648497193, 'Y', to_date('12-02-2016', 'dd-mm-yyyy'), 'N', '976460507', '693359794', 54175, 32725);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (663929787, 'Y', to_date('30-05-2021', 'dd-mm-yyyy'), 'Y', '184623309', '175781268', 26645, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (914537687, 'Y', to_date('23-09-2011', 'dd-mm-yyyy'), 'Y', '696511331', '751102104', 24169, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (281396746, 'Y', to_date('20-06-2017', 'dd-mm-yyyy'), 'N', '687549039', '874173884', 18671, 91748);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (374622349, 'Y', to_date('25-01-2012', 'dd-mm-yyyy'), 'N', '877652677', '948688656', 15693, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (219958191, 'Y', to_date('26-07-2018', 'dd-mm-yyyy'), 'N', '573459851', '189838507', 76244, 45678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (711138691, 'Y', to_date('31-07-2015', 'dd-mm-yyyy'), 'Y', '519174701', '258054874', 94395, 31234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (352694782, 'Y', to_date('16-03-2015', 'dd-mm-yyyy'), 'N', '940598817', '919897956', 19631, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (771768329, 'Y', to_date('23-12-2011', 'dd-mm-yyyy'), 'Y', '399907956', '655711740', 65253, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (847672271, 'N', to_date('20-10-2017', 'dd-mm-yyyy'), 'Y', '766363065', '555092086', 39931, 31234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (664677225, 'Y', to_date('24-11-2010', 'dd-mm-yyyy'), 'N', '151716759', '795966607', 97475, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (315556739, 'Y', to_date('21-09-2013', 'dd-mm-yyyy'), 'N', '766363065', '495290518', 71553, 44652);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (974411317, 'Y', to_date('03-04-2013', 'dd-mm-yyyy'), 'Y', '048142005', '245217745', 28952, 59429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (825534152, 'Y', to_date('04-04-2010', 'dd-mm-yyyy'), 'Y', '392142161', '958905680', 62992, 18238);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (971442695, 'N', to_date('21-03-2011', 'dd-mm-yyyy'), 'N', '242316965', '365883743', 53616, 58624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (394236669, 'Y', to_date('16-04-2020', 'dd-mm-yyyy'), 'Y', '897155427', '975627046', 64265, 95975);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (313884751, 'Y', to_date('23-11-2016', 'dd-mm-yyyy'), 'N', '573459851', '408874915', 27465, 85499);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (637495696, 'Y', to_date('27-04-2019', 'dd-mm-yyyy'), 'Y', '237161395', '408874915', 48488, 49232);
commit;
prompt 100 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (269895853, 'Y', to_date('29-04-2019', 'dd-mm-yyyy'), 'Y', '651790012', '328315189', 85689, 89536);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (752717722, 'N', to_date('03-02-2017', 'dd-mm-yyyy'), 'N', '185943132', '974550419', 86947, 56543);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (387935673, 'Y', to_date('22-02-2013', 'dd-mm-yyyy'), 'Y', '884465511', '071509079', 24169, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (781373393, 'Y', to_date('19-08-2014', 'dd-mm-yyyy'), 'Y', '281373620', '159478573', 95166, 13641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (973169649, 'Y', to_date('03-12-2012', 'dd-mm-yyyy'), 'N', '452597433', '234623164', 83772, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (466226439, 'Y', to_date('22-07-2018', 'dd-mm-yyyy'), 'N', '833221223', '307500304', 79765, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791435895, 'Y', to_date('01-03-2010', 'dd-mm-yyyy'), 'N', '273995455', '325057906', 88349, 87267);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (922393756, 'N', to_date('01-06-2012', 'dd-mm-yyyy'), 'Y', '897793693', '666196307', 65853, 87413);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (264863179, 'Y', to_date('18-04-2016', 'dd-mm-yyyy'), 'Y', '035198344', '781611704', 45461, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (327184686, 'Y', to_date('11-01-2014', 'dd-mm-yyyy'), 'Y', '273963341', '151716759', 86192, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (776746764, 'Y', to_date('09-09-2019', 'dd-mm-yyyy'), 'Y', '230155515', '705284364', 57583, 28588);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (693211884, 'N', to_date('22-02-2018', 'dd-mm-yyyy'), 'N', '591978627', '654249625', 14434, 27563);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (949762751, 'N', to_date('24-04-2014', 'dd-mm-yyyy'), 'N', '012584652', '108104963', 73341, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (756781252, 'Y', to_date('12-10-2010', 'dd-mm-yyyy'), 'N', '162799501', '795966607', 86192, 89644);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (665943858, 'Y', to_date('21-01-2014', 'dd-mm-yyyy'), 'N', '448322939', '775083908', 47431, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (917484774, 'Y', to_date('17-03-2012', 'dd-mm-yyyy'), 'Y', '151716759', '099929610', 23725, 51633);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (919141422, 'N', to_date('02-02-2024', 'dd-mm-yyyy'), 'Y', '254115667', '424650791', 35785, 91868);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (299493375, 'Y', to_date('25-08-2019', 'dd-mm-yyyy'), 'Y', '408874915', '874173884', 82364, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (874323189, 'Y', to_date('05-03-2012', 'dd-mm-yyyy'), 'Y', '942081370', '529867055', 16941, 88614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (661233698, 'N', to_date('30-07-2021', 'dd-mm-yyyy'), 'Y', '651790012', '240111208', 99345, 46664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (725891735, 'N', to_date('02-05-2023', 'dd-mm-yyyy'), 'N', '807810311', '309661257', 78345, 95839);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (443835689, 'Y', to_date('29-01-2012', 'dd-mm-yyyy'), 'Y', '229266261', '200246319', 96963, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (389197469, 'N', to_date('14-03-2022', 'dd-mm-yyyy'), 'Y', '937684812', '047371408', 46819, 41348);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (692772352, 'Y', to_date('25-06-2019', 'dd-mm-yyyy'), 'Y', '327770767', '579208908', 22277, 16516);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (241179186, 'N', to_date('29-12-2021', 'dd-mm-yyyy'), 'Y', '104654240', '617833949', 25888, 93533);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (387849879, 'N', to_date('27-05-2020', 'dd-mm-yyyy'), 'N', '982871108', '940598817', 89911, 18468);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (134927255, 'N', to_date('17-11-2012', 'dd-mm-yyyy'), 'Y', '913942557', '810902392', 51566, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (872566579, 'N', to_date('22-05-2011', 'dd-mm-yyyy'), 'Y', '819059056', '773013219', 15638, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (562135892, 'Y', to_date('11-04-2019', 'dd-mm-yyyy'), 'N', '692375929', '277620976', 72949, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (245675815, 'N', to_date('26-03-2023', 'dd-mm-yyyy'), 'Y', '363254369', '364681609', 43757, 62235);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (476159825, 'N', to_date('15-11-2013', 'dd-mm-yyyy'), 'N', '610341868', '483453321', 59785, 62786);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (785374431, 'N', to_date('06-09-2020', 'dd-mm-yyyy'), 'N', '874173884', '905128014', 77488, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (218341611, 'N', to_date('17-12-2017', 'dd-mm-yyyy'), 'N', '484771335', '666196307', 81361, 27194);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (579449134, 'N', to_date('28-01-2017', 'dd-mm-yyyy'), 'Y', '318741729', '197068774', 41828, 95975);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (818591381, 'Y', to_date('05-06-2015', 'dd-mm-yyyy'), 'N', '984430684', '957767584', 39555, 98589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (935115498, 'Y', to_date('05-01-2017', 'dd-mm-yyyy'), 'N', '539087374', '118056743', 42627, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (913728576, 'Y', to_date('01-02-2010', 'dd-mm-yyyy'), 'N', '553830128', '267941315', 27382, 32848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (258937871, 'Y', to_date('14-05-2016', 'dd-mm-yyyy'), 'N', '999950098', '200246319', 24479, 61456);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (411672553, 'Y', to_date('13-05-2011', 'dd-mm-yyyy'), 'N', '307081120', '392142161', 61349, 76242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (563295185, 'Y', to_date('07-08-2016', 'dd-mm-yyyy'), 'Y', '086595664', '937580305', 33265, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (658314583, 'N', to_date('08-12-2019', 'dd-mm-yyyy'), 'N', '245843519', '940598817', 82364, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (962199829, 'N', to_date('15-06-2010', 'dd-mm-yyyy'), 'Y', '824648175', '529679514', 37517, 13641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (839324981, 'N', to_date('05-06-2013', 'dd-mm-yyyy'), 'Y', '033712611', '254115667', 46276, 29596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (338987338, 'N', to_date('02-08-2010', 'dd-mm-yyyy'), 'N', '093460285', '048646646', 15814, 62521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (511548268, 'N', to_date('17-01-2018', 'dd-mm-yyyy'), 'Y', '194954711', '662973383', 88991, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (453917358, 'Y', to_date('05-12-2020', 'dd-mm-yyyy'), 'Y', '485394887', '475834164', 57522, 27992);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (624313961, 'Y', to_date('12-08-2022', 'dd-mm-yyyy'), 'N', '938023231', '175781268', 19739, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (725251286, 'Y', to_date('08-05-2022', 'dd-mm-yyyy'), 'N', '328635747', '490388060', 76179, 18298);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (821623151, 'N', to_date('15-07-2021', 'dd-mm-yyyy'), 'N', '264346014', '736496191', 88991, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (655945398, 'N', to_date('25-08-2015', 'dd-mm-yyyy'), 'Y', '855872783', '684008443', 89243, 27554);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (453946584, 'N', to_date('01-11-2014', 'dd-mm-yyyy'), 'Y', '957767584', '084607020', 39269, 46595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (659117242, 'Y', to_date('17-07-2021', 'dd-mm-yyyy'), 'Y', '912029990', '456099156', 46796, 26128);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (619748394, 'Y', to_date('11-06-2022', 'dd-mm-yyyy'), 'Y', '566372714', '736496191', 57583, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (755719392, 'Y', to_date('14-05-2023', 'dd-mm-yyyy'), 'N', '158592795', '008470299', 71898, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749545685, 'Y', to_date('31-07-2012', 'dd-mm-yyyy'), 'N', '321643516', '133060414', 85689, 28753);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (669668787, 'Y', to_date('19-01-2010', 'dd-mm-yyyy'), 'Y', '031240584', '424893711', 51268, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (561845892, 'Y', to_date('20-05-2016', 'dd-mm-yyyy'), 'N', '399907956', '439959523', 76244, 98857);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (545962234, 'Y', to_date('10-02-2019', 'dd-mm-yyyy'), 'N', '758794404', '589644176', 47741, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (929841598, 'N', to_date('07-04-2013', 'dd-mm-yyyy'), 'N', '591978627', '735976872', 79811, 95975);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (116571871, 'Y', to_date('03-01-2022', 'dd-mm-yyyy'), 'Y', '309682546', '148142939', 55879, 34713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (852279371, 'N', to_date('23-11-2016', 'dd-mm-yyyy'), 'Y', '452597433', '909147578', 77149, 68664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (345162793, 'N', to_date('20-02-2010', 'dd-mm-yyyy'), 'N', '375496232', '693085728', 82179, 89689);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (341828824, 'Y', to_date('18-11-2017', 'dd-mm-yyyy'), 'N', '382880573', '607883888', 54149, 42477);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (183323669, 'Y', to_date('24-06-2023', 'dd-mm-yyyy'), 'Y', '530485585', '602276868', 55959, 16983);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (921443252, 'Y', to_date('05-06-2012', 'dd-mm-yyyy'), 'Y', '563077478', '338800563', 98616, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (521385598, 'Y', to_date('17-08-2021', 'dd-mm-yyyy'), 'N', '943811449', '993636785', 93651, 36433);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (283767431, 'N', to_date('02-09-2016', 'dd-mm-yyyy'), 'Y', '768494443', '602276868', 55256, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (596315327, 'N', to_date('07-10-2012', 'dd-mm-yyyy'), 'Y', '692375929', '969313022', 62992, 88457);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (699231516, 'Y', to_date('06-09-2023', 'dd-mm-yyyy'), 'Y', '768494443', '416239499', 33265, 62328);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129268694, 'Y', to_date('07-09-2010', 'dd-mm-yyyy'), 'Y', '593607007', '309661257', 15643, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (551895274, 'Y', to_date('18-10-2017', 'dd-mm-yyyy'), 'N', '975627046', '918868012', 69998, 96138);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (175469677, 'N', to_date('05-06-2020', 'dd-mm-yyyy'), 'N', '158592795', '773999246', 24215, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (744877539, 'N', to_date('13-08-2017', 'dd-mm-yyyy'), 'N', '555029781', '855872783', 46796, 28753);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (771722154, 'N', to_date('25-12-2023', 'dd-mm-yyyy'), 'N', '714371122', '810470136', 73442, 17429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (487976498, 'Y', to_date('02-09-2018', 'dd-mm-yyyy'), 'N', '439668090', '951860128', 19631, 82163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (999424535, 'N', to_date('07-04-2023', 'dd-mm-yyyy'), 'N', '414116543', '744075988', 82229, 87267);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (568443538, 'Y', to_date('03-02-2022', 'dd-mm-yyyy'), 'Y', '400917628', '683868829', 71553, 89689);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (986137867, 'N', to_date('18-06-2011', 'dd-mm-yyyy'), 'N', '064148482', '771703424', 66689, 92131);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (232964874, 'N', to_date('12-04-2020', 'dd-mm-yyyy'), 'Y', '937684812', '363800111', 22353, 51732);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (543876871, 'Y', to_date('04-01-2016', 'dd-mm-yyyy'), 'N', '307081120', '881032236', 55879, 76995);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (383628342, 'N', to_date('27-03-2011', 'dd-mm-yyyy'), 'Y', '259941739', '222632263', 59846, 97874);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (122488153, 'N', to_date('17-08-2012', 'dd-mm-yyyy'), 'Y', '529679514', '850736037', 87316, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (374148229, 'N', to_date('16-11-2012', 'dd-mm-yyyy'), 'N', '408874915', '151254801', 38356, 86818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (522825375, 'Y', to_date('18-04-2011', 'dd-mm-yyyy'), 'Y', '850092806', '312041206', 44546, 23638);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (838398733, 'N', to_date('27-01-2020', 'dd-mm-yyyy'), 'Y', '192849062', '987544346', 77415, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (934682365, 'Y', to_date('01-04-2013', 'dd-mm-yyyy'), 'N', '240100155', '852882111', 73442, 27455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (627758549, 'N', to_date('13-12-2018', 'dd-mm-yyyy'), 'N', '141337002', '370632269', 54149, 27992);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (675786243, 'N', to_date('04-01-2011', 'dd-mm-yyyy'), 'Y', '328635747', '666196307', 79649, 96138);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271418996, 'N', to_date('26-07-2015', 'dd-mm-yyyy'), 'Y', '581195954', '823811487', 28952, 81435);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (632578278, 'N', to_date('03-01-2017', 'dd-mm-yyyy'), 'N', '664166389', '933237910', 66743, 56488);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (287626111, 'Y', to_date('29-07-2021', 'dd-mm-yyyy'), 'N', '591817202', '562748536', 77488, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (163824621, 'Y', to_date('16-08-2020', 'dd-mm-yyyy'), 'Y', '338160998', '579208908', 48995, 57523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (415337459, 'Y', to_date('31-03-2011', 'dd-mm-yyyy'), 'N', '998752021', '708025907', 23968, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (259129871, 'N', to_date('01-11-2016', 'dd-mm-yyyy'), 'Y', '439668090', '359802512', 51673, 49431);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (351736471, 'Y', to_date('01-10-2021', 'dd-mm-yyyy'), 'N', '477713746', '256967718', 51931, 62869);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (268997647, 'N', to_date('16-07-2020', 'dd-mm-yyyy'), 'N', '669496513', '004214981', 25648, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (861637831, 'Y', to_date('23-03-2024', 'dd-mm-yyyy'), 'N', '323308058', '975627046', 96976, 94783);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (331719472, 'N', to_date('31-07-2023', 'dd-mm-yyyy'), 'N', '530485585', '888505515', 25499, 99192);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (688278479, 'N', to_date('20-01-2024', 'dd-mm-yyyy'), 'Y', '768494443', '475834164', 25388, 34645);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (619236524, 'Y', to_date('22-05-2023', 'dd-mm-yyyy'), 'N', '299685315', '243227351', 25648, 13641);
commit;
prompt 200 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (479132294, 'Y', to_date('19-11-2017', 'dd-mm-yyyy'), 'Y', '693359794', '154075422', 55395, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (643366545, 'N', to_date('01-01-2023', 'dd-mm-yyyy'), 'N', '048142005', '237230933', 14491, 63572);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (884471112, 'Y', to_date('22-04-2022', 'dd-mm-yyyy'), 'Y', '759729703', '299296442', 73453, 18344);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (223634945, 'Y', to_date('22-09-2016', 'dd-mm-yyyy'), 'Y', '599521985', '744075988', 82939, 69485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (815746633, 'Y', to_date('03-07-2016', 'dd-mm-yyyy'), 'Y', '439668090', '039651469', 65269, 89637);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (186417736, 'Y', to_date('16-10-2018', 'dd-mm-yyyy'), 'Y', '482424220', '583755012', 66614, 86818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (193267734, 'N', to_date('04-12-2013', 'dd-mm-yyyy'), 'Y', '921955127', '242952342', 27486, 49232);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (269967747, 'N', to_date('11-05-2020', 'dd-mm-yyyy'), 'Y', '048142005', '243227351', 78888, 54673);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (566139474, 'N', to_date('14-04-2019', 'dd-mm-yyyy'), 'Y', '169295786', '680172578', 58325, 18854);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (191326342, 'Y', to_date('15-03-2018', 'dd-mm-yyyy'), 'N', '439668090', '230926425', 71729, 63354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (672432933, 'N', to_date('26-03-2014', 'dd-mm-yyyy'), 'Y', '942081370', '921565805', 92154, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (835893299, 'Y', to_date('06-09-2014', 'dd-mm-yyyy'), 'N', '519174701', '722968346', 92597, 95258);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (659585448, 'N', to_date('05-09-2014', 'dd-mm-yyyy'), 'N', '714824861', '315420007', 76244, 15355);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (924477193, 'Y', to_date('04-10-2017', 'dd-mm-yyyy'), 'Y', '897155427', '810470136', 32298, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (183263511, 'Y', to_date('22-06-2013', 'dd-mm-yyyy'), 'Y', '819059056', '222632263', 56469, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (723333464, 'N', to_date('30-04-2012', 'dd-mm-yyyy'), 'N', '984430684', '364367353', 49942, 83712);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (127825597, 'Y', to_date('22-05-2023', 'dd-mm-yyyy'), 'N', '259941739', '608382546', 92154, 39932);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (622397933, 'Y', to_date('20-07-2017', 'dd-mm-yyyy'), 'Y', '976460507', '187799087', 58177, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (346171489, 'Y', to_date('22-10-2019', 'dd-mm-yyyy'), 'Y', '813092669', '321643516', 79649, 82564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (883591263, 'Y', to_date('11-03-2015', 'dd-mm-yyyy'), 'N', '769552944', '736496191', 69958, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734255856, 'Y', to_date('15-05-2012', 'dd-mm-yyyy'), 'Y', '091115833', '218095746', 15468, 79476);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (115726436, 'N', to_date('06-04-2021', 'dd-mm-yyyy'), 'N', '133060414', '456099156', 22689, 33442);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (289717117, 'Y', to_date('25-04-2016', 'dd-mm-yyyy'), 'N', '382880573', '723216818', 83772, 63572);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (376141345, 'N', to_date('28-05-2014', 'dd-mm-yyyy'), 'N', '460950567', '530485585', 38992, 89637);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (786846992, 'N', to_date('26-10-2023', 'dd-mm-yyyy'), 'Y', '833298755', '243227351', 41673, 44989);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (414114582, 'Y', to_date('30-10-2021', 'dd-mm-yyyy'), 'N', '004214981', '968732165', 78954, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (251157961, 'Y', to_date('27-04-2018', 'dd-mm-yyyy'), 'Y', '282967132', '987133432', 96359, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (485752938, 'N', to_date('12-01-2019', 'dd-mm-yyyy'), 'N', '771995680', '679634057', 32598, 86925);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (593578384, 'N', to_date('11-07-2017', 'dd-mm-yyyy'), 'Y', '360157179', '984379035', 33578, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (265558527, 'N', to_date('07-10-2015', 'dd-mm-yyyy'), 'Y', '577641871', '305517179', 56381, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749489851, 'N', to_date('26-01-2016', 'dd-mm-yyyy'), 'N', '490388060', '099929610', 82179, 51218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (837424534, 'Y', to_date('17-01-2013', 'dd-mm-yyyy'), 'N', '833221223', '450816060', 63671, 68312);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (816766174, 'N', to_date('11-03-2014', 'dd-mm-yyyy'), 'N', '771703424', '980638570', 53162, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (255774878, 'Y', to_date('30-06-2017', 'dd-mm-yyyy'), 'N', '938023231', '364681609', 64265, 54673);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (757934993, 'Y', to_date('20-09-2017', 'dd-mm-yyyy'), 'Y', '222632263', '169349395', 25536, 59429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (541472456, 'Y', to_date('31-08-2012', 'dd-mm-yyyy'), 'Y', '897793693', '306609285', 79584, 34752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (699845367, 'N', to_date('06-10-2023', 'dd-mm-yyyy'), 'Y', '452597433', '007507474', 96488, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (564691419, 'Y', to_date('16-05-2016', 'dd-mm-yyyy'), 'Y', '573459851', '258054874', 59816, 91114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (313543451, 'N', to_date('07-09-2020', 'dd-mm-yyyy'), 'N', '971987270', '678665314', 22689, 64598);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (475361712, 'Y', to_date('13-05-2023', 'dd-mm-yyyy'), 'Y', '511568325', '037245771', 52339, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (149954452, 'N', to_date('14-10-2016', 'dd-mm-yyyy'), 'Y', '974550419', '133060414', 96595, 46664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (243491147, 'Y', to_date('29-08-2019', 'dd-mm-yyyy'), 'Y', '093051335', '291511425', 25888, 76713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (671181883, 'N', to_date('18-08-2011', 'dd-mm-yyyy'), 'Y', '465075631', '235438802', 12888, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (126768581, 'Y', to_date('15-03-2011', 'dd-mm-yyyy'), 'Y', '455747246', '579208908', 56469, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (576785186, 'N', to_date('17-05-2010', 'dd-mm-yyyy'), 'Y', '194954711', '637020775', 92889, 49431);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (828358174, 'N', to_date('14-11-2023', 'dd-mm-yyyy'), 'Y', '482424220', '120237174', 51931, 18468);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (433846122, 'N', to_date('13-10-2023', 'dd-mm-yyyy'), 'N', '687549039', '773013219', 53299, 59614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (917786143, 'N', to_date('24-06-2017', 'dd-mm-yyyy'), 'Y', '780987486', '125724898', 18439, 76995);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (731962342, 'Y', to_date('22-11-2010', 'dd-mm-yyyy'), 'Y', '245843519', '014700822', 59816, 27692);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (286991861, 'Y', to_date('10-10-2014', 'dd-mm-yyyy'), 'N', '867821231', '555092086', 69998, 36532);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (383258169, 'Y', to_date('27-04-2022', 'dd-mm-yyyy'), 'N', '897793693', '490388060', 36629, 56543);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (149556113, 'Y', to_date('05-06-2015', 'dd-mm-yyyy'), 'N', '833298755', '189173569', 64121, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (676791285, 'Y', to_date('18-12-2013', 'dd-mm-yyyy'), 'Y', '477713746', '137408341', 81874, 53834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (337347374, 'N', to_date('20-05-2010', 'dd-mm-yyyy'), 'Y', '685164958', '693085728', 44955, 99192);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (555751273, 'Y', to_date('23-12-2018', 'dd-mm-yyyy'), 'N', '566372714', '766797561', 56469, 67486);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (422715488, 'Y', to_date('06-07-2010', 'dd-mm-yyyy'), 'Y', '119591809', '530485585', 69545, 87589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (411451253, 'Y', to_date('15-10-2018', 'dd-mm-yyyy'), 'Y', '485394887', '998387270', 88349, 42228);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373571391, 'Y', to_date('15-12-2017', 'dd-mm-yyyy'), 'Y', '623731843', '943811449', 38356, 17736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (216627929, 'N', to_date('02-10-2014', 'dd-mm-yyyy'), 'N', '368067148', '283302396', 58775, 62235);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (599131267, 'N', to_date('16-10-2011', 'dd-mm-yyyy'), 'N', '421599017', '064148482', 29371, 28588);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (453522974, 'N', to_date('28-10-2013', 'dd-mm-yyyy'), 'N', '137669479', '924624068', 35785, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (878975272, 'N', to_date('06-09-2019', 'dd-mm-yyyy'), 'Y', '579667581', '863266868', 54514, 62328);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129847321, 'N', to_date('22-03-2014', 'dd-mm-yyyy'), 'Y', '369093284', '969313022', 93715, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (817435721, 'N', to_date('27-07-2017', 'dd-mm-yyyy'), 'N', '805125593', '076083621', 44671, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (544799512, 'Y', to_date('06-10-2019', 'dd-mm-yyyy'), 'Y', '566372714', '372210613', 66926, 34713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (591156339, 'Y', to_date('29-08-2015', 'dd-mm-yyyy'), 'N', '696511331', '297681739', 29744, 93533);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (895939291, 'Y', to_date('18-03-2011', 'dd-mm-yyyy'), 'Y', '771995680', '971326374', 58434, 89637);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (484129654, 'N', to_date('30-05-2015', 'dd-mm-yyyy'), 'Y', '585289028', '005988217', 58186, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (549329159, 'Y', to_date('25-11-2017', 'dd-mm-yyyy'), 'N', '062397734', '262097637', 96672, 72225);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (459955549, 'N', to_date('23-11-2023', 'dd-mm-yyyy'), 'Y', '482424220', '416239499', 96963, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (671557884, 'N', to_date('17-06-2017', 'dd-mm-yyyy'), 'N', '083033817', '709634152', 49942, 87569);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271761883, 'N', to_date('12-10-2010', 'dd-mm-yyyy'), 'N', '258054874', '641022334', 44671, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (664552825, 'N', to_date('06-10-2021', 'dd-mm-yyyy'), 'Y', '309682546', '569879560', 55395, 44989);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (867733719, 'Y', to_date('29-12-2022', 'dd-mm-yyyy'), 'Y', '532015902', '543955576', 64265, 84123);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (613665989, 'Y', to_date('20-08-2019', 'dd-mm-yyyy'), 'N', '987783098', '883233226', 93715, 87267);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (781846517, 'Y', to_date('26-09-2012', 'dd-mm-yyyy'), 'Y', '657771509', '897680025', 77488, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (318865658, 'Y', to_date('25-10-2019', 'dd-mm-yyyy'), 'N', '135639362', '569849442', 67738, 68312);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (179695341, 'Y', to_date('20-10-2023', 'dd-mm-yyyy'), 'N', '759729703', '240111208', 15254, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (672551288, 'N', to_date('24-04-2022', 'dd-mm-yyyy'), 'Y', '517900008', '318741729', 68776, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (521638877, 'N', to_date('02-08-2019', 'dd-mm-yyyy'), 'Y', '781611704', '998752021', 85689, 45713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (223266412, 'N', to_date('31-05-2018', 'dd-mm-yyyy'), 'N', '652371262', '798850878', 24563, 17231);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (262347584, 'Y', to_date('01-02-2012', 'dd-mm-yyyy'), 'Y', '399907956', '385327967', 66743, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271455724, 'N', to_date('28-04-2019', 'dd-mm-yyyy'), 'Y', '841337498', '292509980', 48995, 87589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (518388598, 'Y', to_date('20-11-2018', 'dd-mm-yyyy'), 'N', '009223928', '495290518', 14491, 96138);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373619379, 'Y', to_date('07-03-2013', 'dd-mm-yyyy'), 'N', '200291980', '099929610', 94184, 45639);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (825719436, 'Y', to_date('09-03-2020', 'dd-mm-yyyy'), 'N', '833221223', '137408341', 86219, 34383);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (655129832, 'Y', to_date('26-05-2022', 'dd-mm-yyyy'), 'N', '529679514', '189173569', 39145, 54377);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (725343536, 'N', to_date('10-02-2016', 'dd-mm-yyyy'), 'N', '825718771', '056054703', 97475, 94783);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754424778, 'N', to_date('27-08-2017', 'dd-mm-yyyy'), 'Y', '392142161', '483410625', 35785, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (582174754, 'Y', to_date('18-05-2012', 'dd-mm-yyyy'), 'Y', '722968346', '775083908', 55959, 27617);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (953691112, 'Y', to_date('19-03-2018', 'dd-mm-yyyy'), 'Y', '238418580', '654249625', 68826, 38463);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (755481719, 'Y', to_date('23-04-2020', 'dd-mm-yyyy'), 'N', '048142005', '684307055', 63671, 84419);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (996212448, 'N', to_date('14-04-2020', 'dd-mm-yyyy'), 'Y', '133060414', '235438802', 58775, 36946);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (695515889, 'N', to_date('01-11-2013', 'dd-mm-yyyy'), 'Y', '027847108', '958133138', 63671, 52875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (965985233, 'Y', to_date('04-05-2011', 'dd-mm-yyyy'), 'Y', '984430684', '608382546', 15643, 37424);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (993712821, 'N', to_date('19-06-2015', 'dd-mm-yyyy'), 'N', '702371190', '624208805', 96762, 42243);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (721677242, 'Y', to_date('09-02-2013', 'dd-mm-yyyy'), 'N', '479117663', '924624068', 56874, 76168);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (944841263, 'Y', to_date('29-04-2010', 'dd-mm-yyyy'), 'Y', '897793693', '517900008', 46424, 53131);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (483722251, 'N', to_date('06-04-2024', 'dd-mm-yyyy'), 'N', '999821449', '193556691', 42587, 64598);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (497341284, 'N', to_date('17-10-2017', 'dd-mm-yyyy'), 'N', '126139999', '289304877', 61349, 54769);
commit;
prompt 300 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (921845464, 'Y', to_date('29-05-2020', 'dd-mm-yyyy'), 'Y', '771703424', '288926877', 23968, 81435);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (518817562, 'Y', to_date('10-11-2019', 'dd-mm-yyyy'), 'Y', '714371122', '543955576', 49313, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (453646618, 'N', to_date('30-05-2011', 'dd-mm-yyyy'), 'Y', '766363065', '903441905', 64121, 71372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (131831726, 'N', to_date('09-06-2018', 'dd-mm-yyyy'), 'N', '805125593', '519174701', 96976, 54848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (765376331, 'Y', to_date('22-09-2012', 'dd-mm-yyyy'), 'N', '692375929', '439668090', 64358, 55683);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (428771884, 'N', to_date('15-01-2021', 'dd-mm-yyyy'), 'N', '234039968', '363800111', 52994, 42228);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (213511786, 'N', to_date('04-10-2016', 'dd-mm-yyyy'), 'Y', '027847108', '292509980', 24919, 27366);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (465962594, 'Y', to_date('14-02-2012', 'dd-mm-yyyy'), 'Y', '599521985', '175321868', 25134, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (581459763, 'Y', to_date('03-07-2021', 'dd-mm-yyyy'), 'N', '044352560', '651790012', 46151, 31169);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (322823347, 'Y', to_date('20-05-2010', 'dd-mm-yyyy'), 'Y', '281373620', '687549039', 58177, 28428);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (253634575, 'N', to_date('24-03-2016', 'dd-mm-yyyy'), 'Y', '752785736', '372210613', 63365, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (127635192, 'Y', to_date('24-06-2011', 'dd-mm-yyyy'), 'Y', '493961904', '585972131', 28952, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (131191442, 'N', to_date('14-02-2010', 'dd-mm-yyyy'), 'N', '971987270', '402373896', 27573, 52875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (913872577, 'Y', to_date('24-08-2016', 'dd-mm-yyyy'), 'N', '106071827', '281373620', 89655, 75269);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (586327128, 'N', to_date('23-12-2017', 'dd-mm-yyyy'), 'N', '194954711', '299296442', 77415, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (826362923, 'N', to_date('27-05-2018', 'dd-mm-yyyy'), 'Y', '807810311', '144241662', 58177, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (358325753, 'N', to_date('10-03-2017', 'dd-mm-yyyy'), 'N', '768494443', '591817202', 96595, 13322);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (263556267, 'Y', to_date('08-11-2014', 'dd-mm-yyyy'), 'N', '083033817', '267941315', 21117, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937332552, 'N', to_date('01-06-2019', 'dd-mm-yyyy'), 'Y', '805125593', '485749616', 74399, 66436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (951329992, 'Y', to_date('13-01-2024', 'dd-mm-yyyy'), 'N', '118056743', '654249625', 81361, 64693);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (461493112, 'N', to_date('01-04-2013', 'dd-mm-yyyy'), 'N', '133060414', '154075422', 95166, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (514149316, 'Y', to_date('05-04-2012', 'dd-mm-yyyy'), 'N', '909147578', '014700822', 89243, 55187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (155622553, 'N', to_date('16-07-2021', 'dd-mm-yyyy'), 'Y', '327291998', '579208908', 83828, 59614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (787566291, 'N', to_date('04-02-2023', 'dd-mm-yyyy'), 'Y', '182761224', '039651469', 88349, 33114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (767994941, 'Y', to_date('01-06-2015', 'dd-mm-yyyy'), 'N', '841337498', '460950567', 64358, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (212825115, 'Y', to_date('20-09-2019', 'dd-mm-yyyy'), 'Y', '484771335', '133134505', 39921, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (229487944, 'Y', to_date('04-08-2014', 'dd-mm-yyyy'), 'N', '766797561', '462617863', 69587, 12715);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749792299, 'N', to_date('23-11-2013', 'dd-mm-yyyy'), 'Y', '048374256', '585972131', 94289, 47582);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (218743539, 'N', to_date('21-09-2015', 'dd-mm-yyyy'), 'Y', '049091541', '003904199', 64358, 51758);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (922419134, 'N', to_date('29-12-2022', 'dd-mm-yyyy'), 'N', '980638570', '439959523', 66614, 59716);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (254157627, 'Y', to_date('22-01-2021', 'dd-mm-yyyy'), 'N', '338160998', '333334713', 16941, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (957561312, 'N', to_date('26-08-2012', 'dd-mm-yyyy'), 'N', '032070336', '699304048', 46276, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (459946855, 'Y', to_date('15-02-2024', 'dd-mm-yyyy'), 'N', '119591809', '624208805', 91966, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (164833942, 'N', to_date('08-06-2011', 'dd-mm-yyyy'), 'Y', '822051253', '086786677', 44222, 66926);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (374464161, 'N', to_date('12-01-2024', 'dd-mm-yyyy'), 'N', '571220005', '680172578', 22586, 58584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (471197665, 'N', to_date('05-07-2010', 'dd-mm-yyyy'), 'N', '684307055', '169295786', 85267, 57523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (816883333, 'Y', to_date('01-03-2011', 'dd-mm-yyyy'), 'Y', '644185876', '289180854', 79129, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (542167733, 'Y', to_date('19-12-2020', 'dd-mm-yyyy'), 'Y', '693359794', '363800111', 36729, 84291);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (635292839, 'Y', to_date('01-03-2010', 'dd-mm-yyyy'), 'N', '093460285', '071509079', 24938, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (594381227, 'Y', to_date('07-07-2016', 'dd-mm-yyyy'), 'Y', '758794404', '966583525', 31426, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778833792, 'Y', to_date('12-08-2022', 'dd-mm-yyyy'), 'Y', '455747246', '349136279', 66614, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (929697739, 'N', to_date('12-06-2019', 'dd-mm-yyyy'), 'N', '534346136', '969250919', 46819, 28753);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (731731638, 'N', to_date('11-09-2012', 'dd-mm-yyyy'), 'Y', '980638570', '462497141', 77481, 62869);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (943221462, 'N', to_date('27-08-2014', 'dd-mm-yyyy'), 'N', '339753654', '288926877', 68558, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (827982816, 'N', to_date('06-11-2021', 'dd-mm-yyyy'), 'Y', '692936013', '339713112', 27486, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (165949365, 'N', to_date('19-04-2021', 'dd-mm-yyyy'), 'Y', '452597433', '681119933', 97516, 27482);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (653418597, 'Y', to_date('15-02-2011', 'dd-mm-yyyy'), 'N', '421599017', '004214981', 77481, 49189);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (546932892, 'Y', to_date('21-02-2021', 'dd-mm-yyyy'), 'N', '716522491', '665558724', 59785, 59614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (288215171, 'Y', to_date('28-10-2018', 'dd-mm-yyyy'), 'N', '709634152', '093460285', 48197, 87661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (976143223, 'Y', to_date('16-11-2015', 'dd-mm-yyyy'), 'N', '921955127', '641022334', 64766, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (235959875, 'Y', to_date('11-03-2017', 'dd-mm-yyyy'), 'N', '938023231', '144241662', 33265, 62521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (454269353, 'N', to_date('15-10-2012', 'dd-mm-yyyy'), 'N', '452597433', '772399394', 61319, 47582);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (876732611, 'Y', to_date('26-09-2012', 'dd-mm-yyyy'), 'Y', '147206940', '579628336', 55124, 66624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (686141593, 'N', to_date('10-06-2010', 'dd-mm-yyyy'), 'N', '594359980', '154075422', 97475, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (848347137, 'N', to_date('24-07-2017', 'dd-mm-yyyy'), 'N', '233658208', '549198520', 58944, 81863);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (961622985, 'Y', to_date('24-12-2012', 'dd-mm-yyyy'), 'Y', '299685315', '644185876', 63365, 96138);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (311443336, 'N', to_date('15-09-2020', 'dd-mm-yyyy'), 'Y', '780987486', '086786677', 91773, 54222);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (831357593, 'N', to_date('02-11-2015', 'dd-mm-yyyy'), 'Y', '360157179', '904803417', 27382, 86925);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (941671187, 'Y', to_date('23-10-2016', 'dd-mm-yyyy'), 'Y', '275365706', '083033817', 36454, 91278);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (782268399, 'N', to_date('10-01-2020', 'dd-mm-yyyy'), 'N', '319137744', '439668090', 78249, 95574);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (234753921, 'Y', to_date('09-06-2020', 'dd-mm-yyyy'), 'Y', '810158730', '193556691', 46276, 95217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (296488588, 'N', to_date('01-11-2017', 'dd-mm-yyyy'), 'Y', '477713746', '666196307', 51455, 76341);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (655379957, 'Y', to_date('04-02-2023', 'dd-mm-yyyy'), 'N', '325057906', '960125605', 32254, 27482);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (666154771, 'Y', to_date('24-06-2021', 'dd-mm-yyyy'), 'N', '824648175', '705284364', 54514, 43957);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (519188858, 'Y', to_date('18-11-2021', 'dd-mm-yyyy'), 'N', '571220005', '693359794', 85941, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (773465423, 'Y', to_date('11-02-2020', 'dd-mm-yyyy'), 'Y', '273455017', '607883888', 37672, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (798275984, 'Y', to_date('02-07-2019', 'dd-mm-yyyy'), 'Y', '898034681', '603911711', 56366, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (865924365, 'N', to_date('26-10-2022', 'dd-mm-yyyy'), 'N', '347949461', '141001787', 48382, 51218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (434527465, 'Y', to_date('29-03-2024', 'dd-mm-yyyy'), 'N', '615121626', '641022334', 58434, 31169);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (793268194, 'N', to_date('10-08-2015', 'dd-mm-yyyy'), 'N', '477713746', '014472246', 56874, 77164);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (637255675, 'N', to_date('06-05-2021', 'dd-mm-yyyy'), 'N', '679634057', '646508379', 52277, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (752556922, 'N', to_date('05-10-2018', 'dd-mm-yyyy'), 'N', '693359794', '725563629', 51268, 67936);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (436722273, 'N', to_date('20-12-2015', 'dd-mm-yyyy'), 'N', '824648175', '258054874', 88991, 43867);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (629272853, 'Y', to_date('28-02-2015', 'dd-mm-yyyy'), 'N', '975087097', '589644176', 23725, 86818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (742314811, 'N', to_date('16-11-2018', 'dd-mm-yyyy'), 'Y', '652031992', '004214981', 67864, 26529);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (852752332, 'Y', to_date('12-12-2021', 'dd-mm-yyyy'), 'N', '919897956', '693359794', 73382, 78274);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (139414252, 'N', to_date('06-10-2017', 'dd-mm-yyyy'), 'Y', '338160998', '165537016', 66926, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (282215313, 'Y', to_date('14-11-2018', 'dd-mm-yyyy'), 'N', '957767584', '086786677', 48163, 51435);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (226255516, 'N', to_date('03-04-2020', 'dd-mm-yyyy'), 'Y', '035198344', '905128014', 92496, 64851);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (114934681, 'Y', to_date('09-12-2019', 'dd-mm-yyyy'), 'N', '273995455', '549198520', 65253, 75269);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (416893797, 'Y', to_date('30-11-2010', 'dd-mm-yyyy'), 'Y', '534953936', '132122147', 74465, 51218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (439915958, 'N', to_date('03-02-2016', 'dd-mm-yyyy'), 'N', '825718771', '671800521', 85941, 23489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (725438147, 'N', to_date('22-11-2022', 'dd-mm-yyyy'), 'N', '360157179', '684008443', 44996, 86925);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (669557143, 'Y', to_date('15-03-2018', 'dd-mm-yyyy'), 'Y', '327291998', '958133138', 82229, 82564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (554266917, 'Y', to_date('14-04-2023', 'dd-mm-yyyy'), 'Y', '955370738', '169349395', 44222, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (664635877, 'Y', to_date('29-01-2014', 'dd-mm-yyyy'), 'N', '282967132', '680478146', 36814, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (876921171, 'N', to_date('13-06-2013', 'dd-mm-yyyy'), 'Y', '339753654', '064148482', 39269, 55631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (832392638, 'N', to_date('19-06-2011', 'dd-mm-yyyy'), 'Y', '924624068', '957003822', 28596, 53834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (992974841, 'Y', to_date('01-09-2014', 'dd-mm-yyyy'), 'Y', '490388060', '629219354', 98579, 52787);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (339568499, 'Y', to_date('08-09-2023', 'dd-mm-yyyy'), 'N', '249125666', '709634152', 69545, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (171919328, 'N', to_date('31-10-2010', 'dd-mm-yyyy'), 'N', '982871108', '951860128', 42587, 54848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (396357768, 'N', to_date('12-05-2012', 'dd-mm-yyyy'), 'Y', '031240584', '735976872', 91352, 54218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (461252159, 'Y', to_date('03-02-2020', 'dd-mm-yyyy'), 'N', '255902165', '975627046', 46151, 76341);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (125324969, 'Y', to_date('07-05-2016', 'dd-mm-yyyy'), 'N', '851082137', '650436166', 39243, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (231933694, 'N', to_date('15-03-2023', 'dd-mm-yyyy'), 'N', '479117663', '495290518', 38356, 98589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (922757937, 'Y', to_date('13-10-2022', 'dd-mm-yyyy'), 'N', '996383746', '833298755', 44955, 83495);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (735626928, 'Y', to_date('05-11-2020', 'dd-mm-yyyy'), 'Y', '608382546', '071509079', 51299, 84715);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (919959241, 'Y', to_date('27-01-2010', 'dd-mm-yyyy'), 'N', '573459851', '559736783', 75754, 62786);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271626654, 'N', to_date('23-04-2019', 'dd-mm-yyyy'), 'N', '309682546', '129012870', 35785, 51758);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749157173, 'N', to_date('17-07-2019', 'dd-mm-yyyy'), 'N', '327770767', '919897956', 28835, 72225);
commit;
prompt 400 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (192944985, 'Y', to_date('27-01-2023', 'dd-mm-yyyy'), 'N', '772399394', '338800563', 56366, 84291);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (342727987, 'N', to_date('09-09-2023', 'dd-mm-yyyy'), 'Y', '106071827', '903441905', 45156, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (765234355, 'N', to_date('20-05-2023', 'dd-mm-yyyy'), 'N', '363254369', '132122147', 36629, 56543);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (452621893, 'N', to_date('09-01-2023', 'dd-mm-yyyy'), 'N', '003904199', '424650791', 88766, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (668995786, 'N', to_date('16-11-2023', 'dd-mm-yyyy'), 'N', '610422260', '302017993', 96976, 44354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (462166292, 'N', to_date('02-12-2023', 'dd-mm-yyyy'), 'Y', '012584652', '903441905', 94395, 25717);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749234357, 'Y', to_date('02-02-2023', 'dd-mm-yyyy'), 'N', '931607645', '905128014', 75754, 32725);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (237128638, 'Y', to_date('13-03-2023', 'dd-mm-yyyy'), 'Y', '120237174', '014700822', 83321, 39142);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (922867431, 'N', to_date('04-11-2023', 'dd-mm-yyyy'), 'Y', '027847108', '082557774', 25499, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (966955196, 'Y', to_date('05-09-2023', 'dd-mm-yyyy'), 'N', '169295786', '099929610', 16675, 23489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (711294547, 'Y', to_date('24-04-2024', 'dd-mm-yyyy'), 'N', '508158601', '615121626', 28984, 27617);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (944188932, 'N', to_date('25-07-2023', 'dd-mm-yyyy'), 'N', '939829538', '769552944', 55256, 46365);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (259242724, 'Y', to_date('15-05-2023', 'dd-mm-yyyy'), 'N', '752785736', '642604802', 15693, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (817986494, 'Y', to_date('19-01-2023', 'dd-mm-yyyy'), 'Y', '064148482', '213743877', 27465, 55187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (924347666, 'N', to_date('23-03-2023', 'dd-mm-yyyy'), 'N', '187686067', '766797561', 28835, 91833);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (716168361, 'Y', to_date('16-01-2023', 'dd-mm-yyyy'), 'Y', '128122177', '980953239', 54147, 97217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (688696151, 'Y', to_date('13-02-2024', 'dd-mm-yyyy'), 'N', '002554127', '116730303', 41673, 56389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (896244512, 'N', to_date('13-10-2023', 'dd-mm-yyyy'), 'Y', '539087374', '158592795', 96976, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (157645366, 'Y', to_date('25-04-2024', 'dd-mm-yyyy'), 'Y', '333348436', '151254801', 54147, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (684712552, 'Y', to_date('19-07-2023', 'dd-mm-yyyy'), 'N', '615121626', '234623164', 64656, 29596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (147769454, 'Y', to_date('04-02-2024', 'dd-mm-yyyy'), 'N', '254115667', '904803417', 87316, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (459588613, 'N', to_date('16-12-2023', 'dd-mm-yyyy'), 'N', '581109827', '144241662', 51932, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (893664454, 'Y', to_date('03-02-2023', 'dd-mm-yyyy'), 'Y', '609343955', '735718988', 15638, 41348);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (959522799, 'Y', to_date('01-05-2023', 'dd-mm-yyyy'), 'Y', '539087374', '297681739', 94289, 54218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (381884881, 'Y', to_date('17-04-2024', 'dd-mm-yyyy'), 'Y', '200291980', '615121626', 82736, 95975);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (823618687, 'Y', to_date('29-04-2023', 'dd-mm-yyyy'), 'Y', '487945649', '615121626', 78345, 55187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (284233357, 'Y', to_date('19-05-2023', 'dd-mm-yyyy'), 'Y', '729784083', '798318022', 28984, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (336795155, 'N', to_date('20-08-2023', 'dd-mm-yyyy'), 'N', '312041206', '297681739', 84454, 47799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (621334722, 'N', to_date('20-05-2023', 'dd-mm-yyyy'), 'N', '833298755', '131166588', 58944, 27692);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (161957242, 'N', to_date('19-04-2023', 'dd-mm-yyyy'), 'Y', '799167503', '234448967', 45416, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (686142378, 'Y', to_date('06-01-2024', 'dd-mm-yyyy'), 'N', '942081370', '840379495', 51268, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (542489297, 'N', to_date('19-05-2023', 'dd-mm-yyyy'), 'N', '650436166', '559736783', 85689, 89644);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (546588768, 'N', to_date('09-01-2023', 'dd-mm-yyyy'), 'Y', '399907956', '607883888', 73857, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (989559823, 'N', to_date('16-04-2024', 'dd-mm-yyyy'), 'Y', '321643516', '957568433', 97475, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (557616329, 'N', to_date('28-02-2024', 'dd-mm-yyyy'), 'N', '511568325', '590746015', 55879, 27525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (854359823, 'N', to_date('22-02-2023', 'dd-mm-yyyy'), 'N', '369093284', '583755012', 82364, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (596586555, 'N', to_date('18-11-2023', 'dd-mm-yyyy'), 'N', '347949461', '339222343', 28596, 64678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (712494572, 'Y', to_date('22-01-2023', 'dd-mm-yyyy'), 'N', '108104963', '969250919', 61349, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (898359366, 'Y', to_date('26-04-2023', 'dd-mm-yyyy'), 'Y', '026254013', '046919723', 51268, 77164);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (544176156, 'Y', to_date('05-11-2023', 'dd-mm-yyyy'), 'Y', '720298946', '189173569', 81645, 42243);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (663268439, 'Y', to_date('15-04-2024', 'dd-mm-yyyy'), 'Y', '433660379', '108104963', 24344, 97217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (968981492, 'Y', to_date('06-05-2023', 'dd-mm-yyyy'), 'N', '392142161', '722968346', 38776, 27692);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (544643428, 'Y', to_date('24-12-2023', 'dd-mm-yyyy'), 'N', '382880573', '495290518', 54855, 25485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (326778238, 'Y', to_date('25-01-2024', 'dd-mm-yyyy'), 'Y', '113488805', '495290518', 24563, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (921192781, 'N', to_date('01-04-2024', 'dd-mm-yyyy'), 'Y', '621900616', '654249625', 92677, 36183);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (446132986, 'N', to_date('23-11-2023', 'dd-mm-yyyy'), 'Y', '752785736', '918868012', 67864, 34494);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (959845345, 'Y', to_date('27-08-2023', 'dd-mm-yyyy'), 'N', '684744404', '405534830', 27465, 89573);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (818683847, 'Y', to_date('21-01-2024', 'dd-mm-yyyy'), 'N', '162799501', '773013219', 48995, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (167672911, 'Y', to_date('03-02-2024', 'dd-mm-yyyy'), 'Y', '106758411', '141001787', 31426, 76341);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (923494884, 'N', to_date('19-10-2023', 'dd-mm-yyyy'), 'N', '982871108', '433660379', 39145, 43867);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (683969489, 'Y', to_date('29-02-2024', 'dd-mm-yyyy'), 'Y', '256967718', '601914969', 36945, 88425);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (589374672, 'N', to_date('23-01-2023', 'dd-mm-yyyy'), 'Y', '780106789', '641022334', 51932, 28588);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (563718145, 'N', to_date('24-02-2023', 'dd-mm-yyyy'), 'Y', '375104960', '969250919', 87731, 79181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937254865, 'N', to_date('19-10-2023', 'dd-mm-yyyy'), 'N', '087806495', '555029781', 33265, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (365654949, 'N', to_date('06-09-2023', 'dd-mm-yyyy'), 'N', '687549039', '975627046', 79968, 25844);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (419424763, 'Y', to_date('01-05-2023', 'dd-mm-yyyy'), 'Y', '194954711', '850736037', 39921, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (278464139, 'Y', to_date('01-10-2023', 'dd-mm-yyyy'), 'N', '214371905', '741001511', 15643, 18854);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (814813383, 'N', to_date('25-08-2023', 'dd-mm-yyyy'), 'Y', '359598513', '646508379', 66614, 87661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (291356242, 'Y', to_date('14-05-2023', 'dd-mm-yyyy'), 'N', '859643900', '883233226', 96963, 98857);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (423959445, 'Y', to_date('12-06-2023', 'dd-mm-yyyy'), 'N', '735103801', '485749616', 43757, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (579284565, 'Y', to_date('25-03-2023', 'dd-mm-yyyy'), 'N', '522338180', '335018902', 24938, 66455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (347173681, 'N', to_date('06-06-2023', 'dd-mm-yyyy'), 'N', '363254369', '397861085', 94289, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (444256418, 'N', to_date('22-05-2023', 'dd-mm-yyyy'), 'N', '859643900', '735976872', 46276, 15749);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (227491384, 'Y', to_date('29-08-2023', 'dd-mm-yyyy'), 'Y', '158592795', '903441905', 23725, 64693);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (683585743, 'N', to_date('02-04-2023', 'dd-mm-yyyy'), 'Y', '559736783', '951860128', 79811, 64678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (414619478, 'Y', to_date('21-07-2023', 'dd-mm-yyyy'), 'Y', '897155427', '833298755', 88349, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (685467422, 'Y', to_date('29-03-2024', 'dd-mm-yyyy'), 'N', '032070336', '336451229', 76448, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (981228991, 'Y', to_date('20-03-2023', 'dd-mm-yyyy'), 'N', '276143046', '609343955', 53299, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (458287888, 'N', to_date('23-02-2023', 'dd-mm-yyyy'), 'N', '756743030', '881032236', 86846, 54848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (447782636, 'N', to_date('09-06-2023', 'dd-mm-yyyy'), 'Y', '942081370', '046919723', 47431, 43162);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (623397367, 'Y', to_date('05-02-2024', 'dd-mm-yyyy'), 'N', '998752021', '731452579', 17415, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (185116694, 'N', to_date('12-01-2023', 'dd-mm-yyyy'), 'Y', '318741729', '435616074', 51931, 97592);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (638413867, 'N', to_date('01-12-2023', 'dd-mm-yyyy'), 'N', '924624068', '741001511', 57522, 94448);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (777828445, 'Y', to_date('28-02-2024', 'dd-mm-yyyy'), 'N', '816100549', '541317968', 71762, 32772);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (463834265, 'N', to_date('12-02-2024', 'dd-mm-yyyy'), 'Y', '609343955', '119591809', 67738, 76168);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (154182639, 'N', to_date('08-01-2023', 'dd-mm-yyyy'), 'Y', '687549039', '485749616', 48376, 59672);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (617445141, 'Y', to_date('24-03-2024', 'dd-mm-yyyy'), 'Y', '975627046', '485394887', 24919, 91833);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (289522291, 'N', to_date('23-02-2023', 'dd-mm-yyyy'), 'Y', '083033817', '958133138', 28952, 74389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (489747654, 'Y', to_date('19-02-2023', 'dd-mm-yyyy'), 'Y', '919897956', '979142513', 96613, 29496);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (995474474, 'N', to_date('08-06-2023', 'dd-mm-yyyy'), 'N', '027847108', '033712611', 89911, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (722873239, 'Y', to_date('29-01-2023', 'dd-mm-yyyy'), 'Y', '158592795', '184623309', 45461, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (774749653, 'N', to_date('21-06-2023', 'dd-mm-yyyy'), 'N', '502582320', '263170660', 67738, 34494);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (152432418, 'N', to_date('24-04-2024', 'dd-mm-yyyy'), 'N', '311853595', '121008642', 83828, 55187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (787744735, 'N', to_date('10-07-2023', 'dd-mm-yyyy'), 'Y', '274382117', '671800521', 79811, 87589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (672535968, 'N', to_date('17-10-2023', 'dd-mm-yyyy'), 'N', '934021441', '242316965', 19631, 55445);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (668758668, 'Y', to_date('20-03-2023', 'dd-mm-yyyy'), 'N', '106758411', '679634057', 96672, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271243315, 'Y', to_date('26-02-2023', 'dd-mm-yyyy'), 'N', '384427644', '519174701', 31464, 67486);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791885724, 'N', to_date('12-03-2024', 'dd-mm-yyyy'), 'Y', '593607007', '189173569', 22689, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (351655586, 'N', to_date('20-05-2023', 'dd-mm-yyyy'), 'Y', '021114490', '267941315', 53162, 33114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (377677423, 'Y', to_date('19-06-2023', 'dd-mm-yyyy'), 'N', '213743877', '603911711', 47741, 96796);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (969829671, 'N', to_date('27-06-2023', 'dd-mm-yyyy'), 'Y', '004437338', '385327967', 48197, 97217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (741616787, 'Y', to_date('15-01-2024', 'dd-mm-yyyy'), 'Y', '328635747', '680172578', 33265, 34187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (851316381, 'N', to_date('03-03-2023', 'dd-mm-yyyy'), 'N', '433660379', '165537016', 85931, 84352);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (515312411, 'N', to_date('18-04-2024', 'dd-mm-yyyy'), 'Y', '312041206', '709634152', 43238, 45639);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (585442156, 'Y', to_date('22-02-2024', 'dd-mm-yyyy'), 'N', '268303729', '302017993', 89243, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (554454298, 'N', to_date('21-04-2023', 'dd-mm-yyyy'), 'Y', '262097637', '424893711', 73717, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (772486964, 'Y', to_date('28-06-2023', 'dd-mm-yyyy'), 'Y', '359598513', '053878653', 89655, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (341625398, 'N', to_date('20-06-2023', 'dd-mm-yyyy'), 'Y', '254115667', '984379035', 58923, 51758);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (424834196, 'N', to_date('16-04-2024', 'dd-mm-yyyy'), 'N', '517900008', '003904199', 54514, 81579);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (288772968, 'N', to_date('24-11-2023', 'dd-mm-yyyy'), 'N', '229266261', '014700822', 44546, 83712);
commit;
prompt 500 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (752524242, 'N', to_date('04-09-2023', 'dd-mm-yyyy'), 'N', '307716898', '288128062', 57213, 53834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (813785938, 'N', to_date('20-01-2023', 'dd-mm-yyyy'), 'N', '009223928', '624208805', 92597, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (558922726, 'N', to_date('07-06-2023', 'dd-mm-yyyy'), 'Y', '318447492', '480284180', 25388, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (146473998, 'Y', to_date('29-01-2024', 'dd-mm-yyyy'), 'Y', '369093284', '263170660', 37517, 79385);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (674843279, 'N', to_date('23-05-2023', 'dd-mm-yyyy'), 'N', '980638570', '549198520', 83133, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (745914582, 'N', to_date('20-02-2024', 'dd-mm-yyyy'), 'N', '938023231', '003904199', 73717, 79476);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (922244434, 'N', to_date('21-01-2024', 'dd-mm-yyyy'), 'N', '594359980', '957568433', 28463, 53443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (892464662, 'N', to_date('03-10-2023', 'dd-mm-yyyy'), 'Y', '178613896', '242952342', 79584, 63572);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (612728369, 'N', to_date('19-12-2023', 'dd-mm-yyyy'), 'Y', '327291998', '650436166', 29744, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (623993484, 'Y', to_date('19-02-2024', 'dd-mm-yyyy'), 'Y', '532015902', '901831943', 41644, 37239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (979611459, 'N', to_date('02-09-2023', 'dd-mm-yyyy'), 'Y', '359598513', '958905680', 18671, 43121);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (412175515, 'Y', to_date('07-03-2023', 'dd-mm-yyyy'), 'N', '259941739', '243237202', 52277, 31169);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274765181, 'Y', to_date('27-01-2023', 'dd-mm-yyyy'), 'Y', '657771509', '731452579', 39921, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (634827463, 'N', to_date('19-06-2023', 'dd-mm-yyyy'), 'N', '585289028', '158592795', 56366, 13322);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (189496588, 'Y', to_date('06-02-2024', 'dd-mm-yyyy'), 'N', '036492757', '242952342', 66926, 64851);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734775457, 'Y', to_date('05-04-2024', 'dd-mm-yyyy'), 'Y', '555029781', '871930292', 22586, 76713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (928775571, 'Y', to_date('13-01-2024', 'dd-mm-yyyy'), 'N', '328635747', '218095746', 14656, 22894);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (798535478, 'Y', to_date('14-03-2024', 'dd-mm-yyyy'), 'N', '126139999', '047371408', 27382, 72225);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (174176785, 'N', to_date('07-07-2023', 'dd-mm-yyyy'), 'Y', '222632263', '823811487', 83832, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (441542229, 'Y', to_date('05-12-2023', 'dd-mm-yyyy'), 'N', '184623309', '903441905', 85739, 58624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (999819614, 'N', to_date('10-11-2023', 'dd-mm-yyyy'), 'N', '187686067', '687549039', 57991, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778467424, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'Y', '475834164', '973262503', 59785, 37239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (146468398, 'Y', to_date('29-01-2023', 'dd-mm-yyyy'), 'N', '702371190', '937748671', 94289, 86925);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (856118437, 'Y', to_date('01-06-2023', 'dd-mm-yyyy'), 'Y', '615121626', '359802512', 96762, 35471);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (399334832, 'Y', to_date('14-11-2023', 'dd-mm-yyyy'), 'Y', '135639362', '048646646', 25134, 33114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (231327185, 'N', to_date('28-11-2023', 'dd-mm-yyyy'), 'N', '133134505', '650436166', 18367, 25751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (462266758, 'N', to_date('15-04-2024', 'dd-mm-yyyy'), 'Y', '671348563', '071856120', 54959, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (997986485, 'Y', to_date('23-04-2024', 'dd-mm-yyyy'), 'Y', '477713746', '684744404', 18439, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (447744675, 'N', to_date('27-01-2023', 'dd-mm-yyyy'), 'N', '400917628', '408874915', 59846, 25717);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (153158938, 'N', to_date('17-05-2023', 'dd-mm-yyyy'), 'Y', '919897956', '969313022', 53641, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (598789719, 'Y', to_date('25-08-2023', 'dd-mm-yyyy'), 'N', '371775100', '998752021', 32598, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (933566174, 'N', to_date('14-03-2023', 'dd-mm-yyyy'), 'Y', '683895199', '324878971', 97516, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (972952959, 'N', to_date('18-06-2023', 'dd-mm-yyyy'), 'N', '498813862', '169295786', 66926, 18298);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (764749994, 'Y', to_date('29-11-2023', 'dd-mm-yyyy'), 'Y', '841337498', '160587152', 69587, 76578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (258557277, 'Y', to_date('27-04-2023', 'dd-mm-yyyy'), 'N', '519174701', '731452579', 27465, 99913);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (134722434, 'N', to_date('29-08-2023', 'dd-mm-yyyy'), 'N', '399907956', '190466061', 79172, 27525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (945216932, 'N', to_date('16-05-2023', 'dd-mm-yyyy'), 'N', '108935075', '957003822', 57991, 78754);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (518782386, 'N', to_date('09-12-2023', 'dd-mm-yyyy'), 'N', '237161395', '679634057', 87731, 34494);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (665227459, 'N', to_date('18-02-2023', 'dd-mm-yyyy'), 'Y', '871634320', '530889775', 65269, 86581);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (124461878, 'Y', to_date('08-04-2024', 'dd-mm-yyyy'), 'N', '062397734', '274382117', 78888, 96796);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (442685872, 'Y', to_date('17-02-2024', 'dd-mm-yyyy'), 'N', '240100155', '624208805', 65853, 26529);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (469827388, 'N', to_date('14-07-2023', 'dd-mm-yyyy'), 'Y', '594359980', '162817820', 58944, 61188);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (163779997, 'Y', to_date('04-04-2023', 'dd-mm-yyyy'), 'N', '579667581', '852882111', 12845, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (722841796, 'Y', to_date('14-12-2023', 'dd-mm-yyyy'), 'Y', '313406747', '939829538', 58944, 66926);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (991874412, 'Y', to_date('30-05-2023', 'dd-mm-yyyy'), 'N', '102771731', '285751992', 59785, 51218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (137971769, 'Y', to_date('12-02-2023', 'dd-mm-yyyy'), 'N', '693992628', '615121626', 46276, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (151427564, 'Y', to_date('09-03-2024', 'dd-mm-yyyy'), 'Y', '962374483', '484771335', 28835, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (284715914, 'Y', to_date('16-04-2023', 'dd-mm-yyyy'), 'Y', '072622442', '693085728', 92889, 36532);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (149884435, 'Y', to_date('16-03-2023', 'dd-mm-yyyy'), 'N', '169295786', '349136279', 31471, 18238);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (111152559, 'Y', to_date('07-06-2023', 'dd-mm-yyyy'), 'Y', '652031992', '159478573', 41668, 76168);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (411798955, 'Y', to_date('03-02-2024', 'dd-mm-yyyy'), 'Y', '652327528', '405534830', 24479, 81579);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (724756614, 'Y', to_date('11-03-2023', 'dd-mm-yyyy'), 'Y', '511568325', '385327967', 98579, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (831685939, 'Y', to_date('07-03-2023', 'dd-mm-yyyy'), 'N', '178510404', '489718006', 78159, 77727);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (752738842, 'Y', to_date('24-03-2024', 'dd-mm-yyyy'), 'N', '672905392', '283302396', 65269, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (185349661, 'N', to_date('19-02-2024', 'dd-mm-yyyy'), 'N', '475834164', '936071589', 22586, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (114993851, 'Y', to_date('28-07-2023', 'dd-mm-yyyy'), 'Y', '999950098', '128369427', 18442, 44652);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (469524465, 'Y', to_date('02-05-2023', 'dd-mm-yyyy'), 'N', '093051335', '512687180', 59339, 48564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (758545169, 'N', to_date('04-04-2024', 'dd-mm-yyyy'), 'N', '312041206', '679634057', 68623, 36183);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (511162169, 'Y', to_date('25-02-2023', 'dd-mm-yyyy'), 'Y', '539935524', '483453321', 67669, 49182);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (193572429, 'N', to_date('10-05-2023', 'dd-mm-yyyy'), 'Y', '262097637', '152572605', 78828, 38463);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (154997443, 'N', to_date('31-12-2023', 'dd-mm-yyyy'), 'N', '155290755', '559736783', 34333, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (276346832, 'N', to_date('08-12-2023', 'dd-mm-yyyy'), 'N', '375104960', '243227351', 26145, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (375351815, 'Y', to_date('20-04-2024', 'dd-mm-yyyy'), 'Y', '192849062', '863266868', 54175, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (847145991, 'Y', to_date('11-02-2023', 'dd-mm-yyyy'), 'N', '169295786', '083033817', 86846, 37191);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (742134788, 'N', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '807196691', '993636785', 75754, 81922);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (356311219, 'Y', to_date('04-01-2024', 'dd-mm-yyyy'), 'Y', '934021441', '222632263', 22586, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (179559175, 'Y', to_date('02-02-2023', 'dd-mm-yyyy'), 'Y', '035198344', '047371408', 67738, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (721497625, 'N', to_date('08-10-2023', 'dd-mm-yyyy'), 'Y', '901831943', '699304048', 52573, 74389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (286867669, 'N', to_date('14-03-2023', 'dd-mm-yyyy'), 'Y', '810158730', '508158601', 24919, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (641838284, 'Y', to_date('23-03-2024', 'dd-mm-yyyy'), 'Y', '215396573', '005988217', 72541, 32884);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937398816, 'Y', to_date('06-05-2023', 'dd-mm-yyyy'), 'N', '948688656', '291811666', 48382, 45111);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (346445636, 'Y', to_date('26-11-2023', 'dd-mm-yyyy'), 'N', '859643900', '096150305', 87316, 27455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (672572354, 'N', to_date('21-01-2024', 'dd-mm-yyyy'), 'N', '141337002', '921565805', 88291, 77777);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (786732362, 'Y', to_date('04-05-2023', 'dd-mm-yyyy'), 'Y', '757024709', '305517179', 42587, 97578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (215797829, 'N', to_date('23-11-2023', 'dd-mm-yyyy'), 'N', '987783098', '148142939', 36945, 26529);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (551538592, 'N', to_date('05-10-2023', 'dd-mm-yyyy'), 'Y', '705852145', '580000436', 72541, 61188);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (436754445, 'N', to_date('05-06-2023', 'dd-mm-yyyy'), 'Y', '995091462', '328315189', 61912, 43121);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (719786299, 'Y', to_date('02-02-2023', 'dd-mm-yyyy'), 'N', '392142161', '108935075', 79172, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (571131719, 'Y', to_date('29-11-2023', 'dd-mm-yyyy'), 'N', '551911744', '292509980', 99345, 53443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (493217129, 'Y', to_date('05-12-2023', 'dd-mm-yyyy'), 'Y', '375104960', '684008443', 76244, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (497425976, 'Y', to_date('20-04-2023', 'dd-mm-yyyy'), 'N', '871894052', '238348956', 22353, 89573);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (921941737, 'N', to_date('25-03-2024', 'dd-mm-yyyy'), 'Y', '159478573', '534953936', 94778, 36532);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (645554431, 'Y', to_date('22-03-2024', 'dd-mm-yyyy'), 'Y', '172623234', '807196691', 67669, 46818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (454276431, 'Y', to_date('25-12-2023', 'dd-mm-yyyy'), 'Y', '027847108', '258054874', 18367, 97834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (421525816, 'Y', to_date('06-05-2023', 'dd-mm-yyyy'), 'N', '489718006', '159478573', 67426, 18344);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (763924258, 'N', to_date('06-11-2023', 'dd-mm-yyyy'), 'N', '291511425', '025800738', 15638, 64851);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (532125132, 'Y', to_date('02-05-2023', 'dd-mm-yyyy'), 'Y', '731452579', '904803417', 48995, 36751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (259643771, 'N', to_date('05-11-2023', 'dd-mm-yyyy'), 'Y', '062397734', '353521370', 15814, 14649);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (597411514, 'Y', to_date('23-07-2023', 'dd-mm-yyyy'), 'N', '805125593', '007507474', 58944, 84352);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (823349879, 'N', to_date('08-05-2023', 'dd-mm-yyyy'), 'Y', '363254369', '302017993', 59816, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (586696443, 'N', to_date('25-01-2024', 'dd-mm-yyyy'), 'Y', '369093284', '048142005', 86381, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (494654726, 'N', to_date('05-10-2023', 'dd-mm-yyyy'), 'N', '155290755', '309146979', 35743, 18172);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (356798691, 'N', to_date('08-04-2024', 'dd-mm-yyyy'), 'Y', '086595664', '938023231', 53416, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (366943545, 'N', to_date('27-02-2023', 'dd-mm-yyyy'), 'N', '184623309', '309661257', 24563, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (397391939, 'N', to_date('05-04-2024', 'dd-mm-yyyy'), 'N', '405534830', '048142005', 76244, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (378854264, 'N', to_date('22-04-2024', 'dd-mm-yyyy'), 'Y', '187579649', '699304048', 54147, 31117);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (527417983, 'Y', to_date('27-06-2023', 'dd-mm-yyyy'), 'Y', '758794404', '262097637', 38486, 23499);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (334923198, 'Y', to_date('05-01-2024', 'dd-mm-yyyy'), 'Y', '729784083', '249125666', 78954, 33114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (556563886, 'Y', to_date('01-06-2023', 'dd-mm-yyyy'), 'Y', '441166212', '912029990', 15468, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (353945937, 'Y', to_date('30-09-2023', 'dd-mm-yyyy'), 'N', '333348436', '283952085', 82736, 87661);
commit;
prompt 600 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (853361635, 'Y', to_date('14-07-2023', 'dd-mm-yyyy'), 'Y', '616117735', '680172578', 26645, 81995);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (468767731, 'Y', to_date('03-01-2023', 'dd-mm-yyyy'), 'N', '354683638', '549782997', 67864, 28589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (386243221, 'Y', to_date('08-01-2024', 'dd-mm-yyyy'), 'N', '318308556', '841337498', 18367, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (943144569, 'N', to_date('26-04-2023', 'dd-mm-yyyy'), 'N', '049091541', '165537016', 64265, 69485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (656962129, 'Y', to_date('29-01-2023', 'dd-mm-yyyy'), 'Y', '574670543', '008470299', 54855, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (347991866, 'N', to_date('18-03-2024', 'dd-mm-yyyy'), 'N', '593607007', '858439996', 32298, 18344);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (952221684, 'Y', to_date('02-08-2023', 'dd-mm-yyyy'), 'Y', '158592795', '335018902', 41828, 82365);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (264571347, 'Y', to_date('08-04-2023', 'dd-mm-yyyy'), 'Y', '974550419', '665558724', 46796, 55445);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (335771856, 'Y', to_date('14-10-2023', 'dd-mm-yyyy'), 'Y', '840379495', '424893711', 87316, 95574);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (145678125, 'N', to_date('20-01-2024', 'dd-mm-yyyy'), 'Y', '166963478', '148142939', 28835, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (934691651, 'Y', to_date('08-12-2023', 'dd-mm-yyyy'), 'N', '274382117', '243034980', 63365, 27455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (194626268, 'Y', to_date('06-03-2024', 'dd-mm-yyyy'), 'Y', '987133432', '297681739', 12846, 55187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (439734761, 'N', to_date('28-08-2023', 'dd-mm-yyyy'), 'N', '971987270', '283302396', 32589, 22798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (894778366, 'N', to_date('10-04-2023', 'dd-mm-yyyy'), 'N', '166963478', '637020775', 57522, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (322228495, 'N', to_date('30-03-2023', 'dd-mm-yyyy'), 'N', '307081120', '489718006', 83832, 77727);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (827355257, 'N', to_date('22-04-2024', 'dd-mm-yyyy'), 'Y', '281373620', '966583525', 63671, 14649);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (912965991, 'N', to_date('07-09-2023', 'dd-mm-yyyy'), 'N', '624367005', '229837931', 71898, 51828);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (257789882, 'N', to_date('14-04-2024', 'dd-mm-yyyy'), 'N', '871634320', '703928930', 48374, 64851);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (739422247, 'Y', to_date('30-12-2023', 'dd-mm-yyyy'), 'N', '091115833', '306609285', 43238, 87375);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (436684565, 'N', to_date('26-07-2023', 'dd-mm-yyyy'), 'Y', '274382117', '665558724', 48197, 79181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (356668845, 'N', to_date('15-11-2023', 'dd-mm-yyyy'), 'N', '780106789', '116730303', 67426, 96528);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778457188, 'N', to_date('07-03-2023', 'dd-mm-yyyy'), 'N', '799167503', '099929610', 37634, 84859);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (843213336, 'Y', to_date('14-09-2023', 'dd-mm-yyyy'), 'N', '705852145', '274382117', 67864, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (467761959, 'Y', to_date('13-07-2023', 'dd-mm-yyyy'), 'N', '637020775', '723445327', 13517, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (681513995, 'Y', to_date('22-03-2023', 'dd-mm-yyyy'), 'Y', '708511967', '064148482', 75561, 86671);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (676424513, 'Y', to_date('12-01-2023', 'dd-mm-yyyy'), 'Y', '768494443', '724101704', 88349, 11311);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (111975636, 'Y', to_date('09-03-2024', 'dd-mm-yyyy'), 'Y', '577641871', '108104963', 55395, 32772);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (981357128, 'N', to_date('16-06-2023', 'dd-mm-yyyy'), 'N', '242316965', '723216818', 39963, 61188);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (654336296, 'Y', to_date('21-09-2023', 'dd-mm-yyyy'), 'N', '874173884', '485749616', 85267, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (142249316, 'N', to_date('05-04-2023', 'dd-mm-yyyy'), 'N', '816100549', '781611704', 24379, 94448);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (253153134, 'Y', to_date('16-08-2023', 'dd-mm-yyyy'), 'N', '213743877', '771703424', 89466, 46365);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (576939995, 'N', to_date('02-04-2024', 'dd-mm-yyyy'), 'N', '274382117', '480284180', 42627, 27482);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (498151686, 'Y', to_date('18-09-2023', 'dd-mm-yyyy'), 'N', '974550419', '980953239', 22353, 78599);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (557854589, 'Y', to_date('11-08-2023', 'dd-mm-yyyy'), 'Y', '233658208', '729610652', 35743, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (384295956, 'N', to_date('04-03-2023', 'dd-mm-yyyy'), 'N', '498813862', '591456995', 24563, 88614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (748822933, 'Y', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '168999525', '014700822', 49573, 97874);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (929372754, 'N', to_date('12-03-2023', 'dd-mm-yyyy'), 'Y', '984430684', '456099156', 94184, 47799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (667259539, 'N', to_date('29-02-2024', 'dd-mm-yyyy'), 'N', '525011460', '240111208', 71898, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (768495644, 'Y', to_date('30-04-2024', 'dd-mm-yyyy'), 'Y', '563077478', '984379035', 74717, 34645);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (325244697, 'N', to_date('19-02-2023', 'dd-mm-yyyy'), 'Y', '574670543', '714371122', 24344, 93533);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (843567992, 'Y', to_date('28-10-2023', 'dd-mm-yyyy'), 'Y', '159478573', '004214981', 95717, 76578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (569212973, 'N', to_date('03-01-2024', 'dd-mm-yyyy'), 'Y', '487945649', '243237202', 24344, 57631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (956863852, 'Y', to_date('07-08-2023', 'dd-mm-yyyy'), 'Y', '688241765', '773999246', 48382, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (565588787, 'Y', to_date('20-05-2023', 'dd-mm-yyyy'), 'Y', '353521370', '113488805', 39145, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (699555344, 'Y', to_date('09-08-2023', 'dd-mm-yyyy'), 'Y', '943811449', '033712611', 16675, 27194);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (486789911, 'N', to_date('20-11-2023', 'dd-mm-yyyy'), 'Y', '178510404', '966583525', 59339, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (877927775, 'N', to_date('22-02-2023', 'dd-mm-yyyy'), 'Y', '574670543', '957767584', 31464, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (658638326, 'N', to_date('02-07-2023', 'dd-mm-yyyy'), 'N', '740704902', '986571242', 12658, 95781);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (342589757, 'N', to_date('16-07-2023', 'dd-mm-yyyy'), 'Y', '083033817', '158592795', 47431, 44989);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778582586, 'Y', to_date('21-07-2023', 'dd-mm-yyyy'), 'Y', '874173884', '804262485', 24479, 86671);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (456525442, 'N', to_date('17-02-2024', 'dd-mm-yyyy'), 'Y', '975087097', '741001511', 48382, 38463);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (491571756, 'Y', to_date('26-05-2023', 'dd-mm-yyyy'), 'N', '158592795', '472188320', 64656, 17231);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (173624712, 'Y', to_date('14-08-2023', 'dd-mm-yyyy'), 'Y', '571220005', '249125666', 41456, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (292142143, 'N', to_date('31-01-2023', 'dd-mm-yyyy'), 'N', '119591809', '484771335', 43757, 31169);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937457483, 'Y', to_date('20-01-2024', 'dd-mm-yyyy'), 'Y', '032070336', '681119933', 55879, 15749);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (547475465, 'Y', to_date('02-05-2023', 'dd-mm-yyyy'), 'Y', '200291980', '837205710', 65883, 37478);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (312676899, 'N', to_date('06-03-2024', 'dd-mm-yyyy'), 'N', '581109827', '462497141', 57478, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (944394399, 'N', to_date('25-03-2024', 'dd-mm-yyyy'), 'Y', '692375929', '937580305', 88766, 68312);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (181928362, 'N', to_date('02-06-2023', 'dd-mm-yyyy'), 'N', '126139999', '508158601', 35911, 35471);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (238972231, 'N', to_date('18-11-2023', 'dd-mm-yyyy'), 'N', '807196691', '652327528', 91352, 87413);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (786345976, 'N', to_date('22-03-2023', 'dd-mm-yyyy'), 'Y', '617833949', '141001787', 85931, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (246438227, 'N', to_date('29-09-2023', 'dd-mm-yyyy'), 'N', '657771509', '297681739', 73717, 91748);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (625654384, 'N', to_date('20-01-2023', 'dd-mm-yyyy'), 'N', '805125593', '197068774', 73341, 23638);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754885294, 'Y', to_date('18-04-2023', 'dd-mm-yyyy'), 'N', '172623234', '725563629', 59785, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (361783177, 'N', to_date('27-01-2023', 'dd-mm-yyyy'), 'N', '392142161', '940598817', 53162, 12715);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (349744886, 'Y', to_date('13-01-2024', 'dd-mm-yyyy'), 'Y', '259941739', '120237174', 98457, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (566922568, 'Y', to_date('14-02-2024', 'dd-mm-yyyy'), 'Y', '971155219', '046919723', 17919, 86818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (829213691, 'N', to_date('25-02-2024', 'dd-mm-yyyy'), 'Y', '683533120', '151716759', 86846, 66455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (247366773, 'Y', to_date('25-09-2023', 'dd-mm-yyyy'), 'N', '937684812', '705284364', 77149, 54377);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (112853714, 'Y', to_date('08-11-2023', 'dd-mm-yyyy'), 'N', '062397734', '987133432', 32598, 31327);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (168184535, 'N', to_date('15-02-2024', 'dd-mm-yyyy'), 'N', '679634057', '553126149', 92154, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (352274116, 'Y', to_date('14-01-2024', 'dd-mm-yyyy'), 'N', '984430684', '237230933', 51299, 44989);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (625581495, 'Y', to_date('15-03-2024', 'dd-mm-yyyy'), 'Y', '399907956', '610341868', 41673, 27692);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (538723438, 'Y', to_date('14-08-2023', 'dd-mm-yyyy'), 'Y', '859643900', '924624068', 18442, 14875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (912173859, 'N', to_date('25-07-2023', 'dd-mm-yyyy'), 'Y', '275365706', '408874915', 96963, 64693);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (328468331, 'Y', to_date('14-07-2023', 'dd-mm-yyyy'), 'Y', '009934088', '549198520', 17632, 53131);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (544355158, 'N', to_date('25-10-2023', 'dd-mm-yyyy'), 'N', '309682546', '975627046', 23968, 61899);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (941628917, 'Y', to_date('28-01-2024', 'dd-mm-yyyy'), 'Y', '684307055', '046919723', 58434, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (886514745, 'N', to_date('08-04-2023', 'dd-mm-yyyy'), 'N', '399907956', '705284364', 37652, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (213552474, 'N', to_date('22-07-2023', 'dd-mm-yyyy'), 'Y', '948688656', '874173884', 88291, 34187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (784614611, 'N', to_date('27-07-2023', 'dd-mm-yyyy'), 'N', '359598513', '485749616', 36279, 43162);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (772853536, 'Y', to_date('22-08-2023', 'dd-mm-yyyy'), 'Y', '807196691', '850880715', 78954, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (934248381, 'Y', to_date('25-01-2023', 'dd-mm-yyyy'), 'N', '901831943', '655711740', 19354, 27617);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (617669711, 'N', to_date('06-01-2024', 'dd-mm-yyyy'), 'N', '175321868', '283302396', 25648, 49182);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (522941741, 'Y', to_date('16-06-2023', 'dd-mm-yyyy'), 'N', '579208908', '980638570', 22673, 54222);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (616147497, 'Y', to_date('23-09-2023', 'dd-mm-yyyy'), 'N', '773999246', '979142513', 35724, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (483865947, 'N', to_date('16-02-2023', 'dd-mm-yyyy'), 'Y', '837205710', '735718988', 91966, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (378123697, 'Y', to_date('01-11-2023', 'dd-mm-yyyy'), 'N', '339753654', '133134505', 56381, 84352);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274733751, 'N', to_date('25-10-2023', 'dd-mm-yyyy'), 'N', '108935075', '627820755', 43614, 25751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (643148352, 'N', to_date('03-06-2023', 'dd-mm-yyyy'), 'N', '409938518', '402373896', 69958, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (841887589, 'N', to_date('13-12-2023', 'dd-mm-yyyy'), 'Y', '617696093', '736496191', 57583, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (556491143, 'Y', to_date('04-08-2023', 'dd-mm-yyyy'), 'Y', '420963265', '958905680', 76974, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (489919665, 'Y', to_date('23-12-2023', 'dd-mm-yyyy'), 'Y', '490388060', '735976872', 84829, 79832);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (181223357, 'Y', to_date('20-06-2023', 'dd-mm-yyyy'), 'Y', '702371190', '307500304', 96858, 71249);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (198522982, 'N', to_date('13-09-2023', 'dd-mm-yyyy'), 'N', '766797561', '666196307', 92677, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (523278159, 'N', to_date('13-03-2024', 'dd-mm-yyyy'), 'N', '539087374', '591456995', 93715, 26529);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (212714442, 'Y', to_date('10-08-2023', 'dd-mm-yyyy'), 'Y', '409938518', '998752021', 74717, 21541);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (483772487, 'Y', to_date('14-08-2023', 'dd-mm-yyyy'), 'Y', '982871108', '162817820', 47741, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (278846583, 'Y', to_date('18-07-2023', 'dd-mm-yyyy'), 'N', '230155515', '735718988', 47741, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (911673889, 'Y', to_date('29-03-2024', 'dd-mm-yyyy'), 'Y', '086595664', '053878653', 49942, 22798);
commit;
prompt 700 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (645299669, 'Y', to_date('14-01-2024', 'dd-mm-yyyy'), 'Y', '897155427', '267941315', 47741, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (325456167, 'N', to_date('14-12-2023', 'dd-mm-yyyy'), 'N', '725345981', '637020775', 44222, 36433);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (428533613, 'Y', to_date('23-08-2023', 'dd-mm-yyyy'), 'Y', '009934088', '495290518', 51447, 76341);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (727933121, 'N', to_date('21-12-2023', 'dd-mm-yyyy'), 'Y', '735103801', '705852145', 79649, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (316274632, 'Y', to_date('05-04-2024', 'dd-mm-yyyy'), 'N', '113488805', '687549039', 55395, 84123);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (785184925, 'N', to_date('21-07-2023', 'dd-mm-yyyy'), 'N', '780987486', '639454824', 61565, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (426884226, 'N', to_date('01-03-2023', 'dd-mm-yyyy'), 'Y', '555029781', '664976546', 83133, 45254);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (131611443, 'Y', to_date('19-12-2023', 'dd-mm-yyyy'), 'N', '460950567', '118056743', 84829, 97217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (725368561, 'Y', to_date('15-08-2023', 'dd-mm-yyyy'), 'Y', '581195954', '632140770', 91352, 87569);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (194852929, 'N', to_date('03-03-2023', 'dd-mm-yyyy'), 'N', '187686067', '336451229', 96762, 94783);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (872346929, 'N', to_date('09-04-2024', 'dd-mm-yyyy'), 'Y', '354683638', '243227351', 59816, 99913);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (134688975, 'N', to_date('22-10-2023', 'dd-mm-yyyy'), 'Y', '328635747', '062801371', 69545, 51732);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (874713336, 'N', to_date('09-02-2023', 'dd-mm-yyyy'), 'N', '984918806', '684744404', 79765, 89568);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (793259436, 'Y', to_date('19-11-2023', 'dd-mm-yyyy'), 'N', '192849062', '288128062', 82179, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (719667328, 'Y', to_date('19-02-2024', 'dd-mm-yyyy'), 'Y', '353521370', '532015902', 91352, 92575);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (511795183, 'Y', to_date('01-06-2023', 'dd-mm-yyyy'), 'Y', '841337498', '651790012', 64121, 42477);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937974315, 'Y', to_date('21-01-2024', 'dd-mm-yyyy'), 'N', '321643516', '773013219', 56381, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (478622587, 'Y', to_date('10-02-2023', 'dd-mm-yyyy'), 'Y', '327770767', '108935075', 54175, 76242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (675729676, 'Y', to_date('01-04-2024', 'dd-mm-yyyy'), 'N', '650436166', '969250919', 48376, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (316468223, 'N', to_date('13-01-2023', 'dd-mm-yyyy'), 'N', '623731843', '151716759', 28748, 62235);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (523358292, 'Y', to_date('17-02-2024', 'dd-mm-yyyy'), 'N', '850092806', '009934088', 74331, 91748);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (397392222, 'Y', to_date('07-12-2023', 'dd-mm-yyyy'), 'N', '452597433', '714371122', 74465, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (857935735, 'Y', to_date('14-10-2023', 'dd-mm-yyyy'), 'Y', '525011460', '320079562', 81645, 27639);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (492949293, 'Y', to_date('31-03-2023', 'dd-mm-yyyy'), 'Y', '579208908', '162817820', 38992, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (988864729, 'N', to_date('30-12-2023', 'dd-mm-yyyy'), 'Y', '998752021', '781611704', 38356, 59672);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (311268171, 'N', to_date('05-02-2023', 'dd-mm-yyyy'), 'N', '553830128', '312041206', 53616, 76168);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (446521692, 'N', to_date('27-07-2023', 'dd-mm-yyyy'), 'N', '617833949', '666196307', 21117, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (346444235, 'Y', to_date('20-08-2023', 'dd-mm-yyyy'), 'N', '850092806', '523692621', 97646, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (489566256, 'Y', to_date('28-04-2023', 'dd-mm-yyyy'), 'N', '525011460', '709634152', 47431, 53436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (241622546, 'N', to_date('09-01-2023', 'dd-mm-yyyy'), 'N', '897155427', '385327967', 93651, 76713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (166444473, 'N', to_date('07-06-2023', 'dd-mm-yyyy'), 'N', '760837533', '159478573', 64121, 76578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (656667364, 'Y', to_date('11-02-2024', 'dd-mm-yyyy'), 'N', '912029990', '234623164', 64358, 87589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (997717752, 'N', to_date('08-06-2023', 'dd-mm-yyyy'), 'N', '339753654', '679634057', 47741, 62235);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (664484943, 'N', to_date('15-10-2023', 'dd-mm-yyyy'), 'Y', '035198344', '624208805', 61319, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (483376722, 'Y', to_date('18-07-2023', 'dd-mm-yyyy'), 'N', '113488805', '328315189', 78828, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (276948185, 'N', to_date('09-08-2023', 'dd-mm-yyyy'), 'N', '354683638', '655711740', 71786, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (252195236, 'N', to_date('02-05-2023', 'dd-mm-yyyy'), 'N', '757024709', '781611704', 94167, 24372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (686433998, 'Y', to_date('22-02-2023', 'dd-mm-yyyy'), 'Y', '781611704', '905128014', 15814, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (864652289, 'Y', to_date('25-01-2023', 'dd-mm-yyyy'), 'N', '973262503', '987133432', 48376, 27482);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (157959578, 'Y', to_date('05-01-2024', 'dd-mm-yyyy'), 'N', '175321868', '307500304', 18131, 28589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (581359316, 'Y', to_date('08-09-2023', 'dd-mm-yyyy'), 'Y', '229266261', '439959523', 92154, 56543);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (329813584, 'N', to_date('04-03-2023', 'dd-mm-yyyy'), 'N', '194954711', '431602139', 46276, 73647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (221876873, 'N', to_date('01-03-2024', 'dd-mm-yyyy'), 'N', '942081370', '084607020', 56874, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778375565, 'N', to_date('05-08-2023', 'dd-mm-yyyy'), 'Y', '482424220', '108935075', 87316, 99752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (266523168, 'N', to_date('28-02-2024', 'dd-mm-yyyy'), 'Y', '423925364', '263170660', 54147, 54222);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (316927772, 'N', to_date('14-08-2023', 'dd-mm-yyyy'), 'N', '517900008', '684008443', 75561, 87569);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (567627811, 'N', to_date('04-01-2024', 'dd-mm-yyyy'), 'Y', '891313788', '883233226', 44546, 18377);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (656131317, 'N', to_date('05-08-2023', 'dd-mm-yyyy'), 'N', '684307055', '003904199', 46195, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (165259952, 'Y', to_date('02-06-2023', 'dd-mm-yyyy'), 'N', '368067148', '144241662', 97475, 95166);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (332517187, 'Y', to_date('27-03-2023', 'dd-mm-yyyy'), 'N', '273995455', '309146979', 58923, 86581);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (259856814, 'N', to_date('04-02-2024', 'dd-mm-yyyy'), 'Y', '909147578', '863266868', 52994, 48564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (816646675, 'N', to_date('05-04-2024', 'dd-mm-yyyy'), 'Y', '475834164', '358023527', 27573, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (813867689, 'Y', to_date('14-02-2023', 'dd-mm-yyyy'), 'N', '292509980', '187799087', 22514, 24372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (273328347, 'N', to_date('08-10-2023', 'dd-mm-yyyy'), 'Y', '291511425', '299901965', 58434, 27367);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (665897464, 'N', to_date('03-08-2023', 'dd-mm-yyyy'), 'Y', '320257722', '795966607', 62163, 14649);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (427383154, 'Y', to_date('08-07-2023', 'dd-mm-yyyy'), 'Y', '710020129', '773013219', 22145, 46818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (948375995, 'N', to_date('11-12-2023', 'dd-mm-yyyy'), 'N', '669496513', '773999246', 75561, 52551);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (462629124, 'Y', to_date('21-04-2023', 'dd-mm-yyyy'), 'N', '615121626', '850880715', 68932, 59677);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (715975648, 'Y', to_date('28-04-2023', 'dd-mm-yyyy'), 'N', '772399394', '693359794', 74717, 99192);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (651145877, 'N', to_date('08-08-2023', 'dd-mm-yyyy'), 'N', '654249625', '009934088', 33126, 67936);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (536615846, 'Y', to_date('17-03-2024', 'dd-mm-yyyy'), 'N', '182761224', '569879560', 96488, 66624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (348719897, 'N', to_date('01-04-2024', 'dd-mm-yyyy'), 'N', '487945649', '299901965', 22586, 16983);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (693149686, 'Y', to_date('15-02-2023', 'dd-mm-yyyy'), 'N', '133060414', '810902392', 25749, 66926);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (221839388, 'Y', to_date('07-02-2023', 'dd-mm-yyyy'), 'Y', '637020775', '162817820', 88349, 53443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749254882, 'N', to_date('03-12-2023', 'dd-mm-yyyy'), 'Y', '837205710', '358565731', 33657, 64678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (782422985, 'Y', to_date('12-01-2024', 'dd-mm-yyyy'), 'Y', '484771335', '472188320', 44222, 91114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (495181126, 'Y', to_date('01-03-2023', 'dd-mm-yyyy'), 'Y', '424650791', '652327528', 48995, 56543);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (955874754, 'N', to_date('07-08-2023', 'dd-mm-yyyy'), 'Y', '318657191', '555251729', 66743, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (825696545, 'Y', to_date('01-06-2023', 'dd-mm-yyyy'), 'Y', '881032236', '370632269', 25889, 63572);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (576513924, 'N', to_date('22-01-2023', 'dd-mm-yyyy'), 'Y', '353521370', '215143637', 17919, 66436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (771113423, 'N', to_date('08-12-2023', 'dd-mm-yyyy'), 'N', '057913650', '948688656', 34333, 53834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (921762184, 'Y', to_date('04-01-2023', 'dd-mm-yyyy'), 'Y', '680172578', '703928930', 39555, 63354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (674663759, 'Y', to_date('07-05-2023', 'dd-mm-yyyy'), 'Y', '731452579', '974550419', 68558, 14875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (154148954, 'N', to_date('30-05-2023', 'dd-mm-yyyy'), 'N', '200291980', '735103801', 33828, 97578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (548641963, 'N', to_date('12-08-2023', 'dd-mm-yyyy'), 'N', '624208805', '699304048', 69545, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (681266497, 'Y', to_date('30-07-2023', 'dd-mm-yyyy'), 'N', '799167503', '480284180', 99258, 51828);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (197486553, 'N', to_date('23-05-2023', 'dd-mm-yyyy'), 'Y', '213743877', '735976872', 83722, 64598);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (857729988, 'Y', to_date('05-07-2023', 'dd-mm-yyyy'), 'N', '259407722', '519174701', 14491, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (613553683, 'N', to_date('10-05-2023', 'dd-mm-yyyy'), 'Y', '945997798', '189173569', 93715, 23661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (679414951, 'Y', to_date('21-11-2023', 'dd-mm-yyyy'), 'Y', '169295786', '919897956', 13358, 91278);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (369352325, 'N', to_date('16-07-2023', 'dd-mm-yyyy'), 'N', '187579649', '591921979', 17632, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (542971422, 'Y', to_date('07-06-2023', 'dd-mm-yyyy'), 'N', '074081051', '184623309', 94167, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (551522214, 'N', to_date('30-04-2023', 'dd-mm-yyyy'), 'Y', '158592795', '921565805', 62641, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (622413399, 'Y', to_date('11-03-2024', 'dd-mm-yyyy'), 'N', '385432292', '299901965', 96488, 88172);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (688844777, 'N', to_date('15-02-2024', 'dd-mm-yyyy'), 'Y', '945997798', '627820755', 14757, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (125755182, 'Y', to_date('05-08-2023', 'dd-mm-yyyy'), 'N', '452597433', '728276285', 66591, 28588);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (628139221, 'Y', to_date('11-01-2024', 'dd-mm-yyyy'), 'N', '593607007', '614391180', 44222, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (168857352, 'Y', to_date('26-09-2023', 'dd-mm-yyyy'), 'Y', '421599017', '283302396', 68558, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (914976545, 'Y', to_date('24-02-2023', 'dd-mm-yyyy'), 'N', '955370738', '222632263', 66689, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (717122859, 'N', to_date('31-05-2023', 'dd-mm-yyyy'), 'N', '408874915', '305517179', 15693, 71372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (839443698, 'N', to_date('17-08-2023', 'dd-mm-yyyy'), 'Y', '833221223', '263170660', 37552, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (119619831, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'Y', '392142161', '641022334', 24563, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (198697965, 'N', to_date('11-04-2024', 'dd-mm-yyyy'), 'Y', '931607645', '014700822', 95833, 23638);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (252691817, 'Y', to_date('20-12-2023', 'dd-mm-yyyy'), 'Y', '264346014', '402373896', 51673, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (225519865, 'N', to_date('14-04-2023', 'dd-mm-yyyy'), 'Y', '759729703', '184623309', 65568, 28428);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (351515488, 'Y', to_date('16-03-2023', 'dd-mm-yyyy'), 'Y', '728485742', '363800111', 79172, 44939);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (245284336, 'Y', to_date('05-07-2023', 'dd-mm-yyyy'), 'Y', '837205710', '937580305', 51447, 67929);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (923894551, 'N', to_date('05-01-2024', 'dd-mm-yyyy'), 'N', '534346136', '684307055', 32589, 53131);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (923191252, 'N', to_date('03-03-2023', 'dd-mm-yyyy'), 'Y', '490388060', '850736037', 88349, 68949);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (627976473, 'Y', to_date('18-04-2023', 'dd-mm-yyyy'), 'Y', '128122177', '919897956', 24379, 28595);
commit;
prompt 800 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (743434242, 'Y', to_date('02-11-2023', 'dd-mm-yyyy'), 'Y', '942081370', '005988217', 71898, 79476);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (219678526, 'Y', to_date('17-12-2023', 'dd-mm-yyyy'), 'N', '987133432', '084607020', 22514, 57286);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (721529543, 'Y', to_date('11-10-2023', 'dd-mm-yyyy'), 'N', '318741729', '973262503', 85463, 82365);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (288582623, 'N', to_date('13-04-2024', 'dd-mm-yyyy'), 'N', '439668090', '723445327', 14434, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (451845435, 'N', to_date('08-04-2023', 'dd-mm-yyyy'), 'N', '684169296', '693085728', 65253, 92131);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (952312885, 'N', to_date('24-03-2023', 'dd-mm-yyyy'), 'N', '692936013', '776216289', 15638, 37478);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (318214722, 'N', to_date('12-04-2023', 'dd-mm-yyyy'), 'N', '909147578', '624208805', 56366, 67936);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (336716239, 'N', to_date('03-02-2023', 'dd-mm-yyyy'), 'Y', '867821231', '680478146', 61912, 34713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (149871145, 'N', to_date('16-02-2024', 'dd-mm-yyyy'), 'Y', '772399394', '609343955', 41644, 83517);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (862193521, 'N', to_date('21-03-2024', 'dd-mm-yyyy'), 'N', '942081370', '243227351', 35911, 84715);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (631739198, 'Y', to_date('01-03-2024', 'dd-mm-yyyy'), 'Y', '044352560', '980953702', 24563, 59672);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (744987456, 'Y', to_date('19-08-2023', 'dd-mm-yyyy'), 'N', '798435974', '835803033', 15254, 58624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (186695779, 'Y', to_date('02-10-2023', 'dd-mm-yyyy'), 'N', '259941739', '601914969', 35911, 44652);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (654655256, 'N', to_date('13-01-2023', 'dd-mm-yyyy'), 'N', '256967718', '151716759', 25749, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (223359124, 'Y', to_date('10-12-2023', 'dd-mm-yyyy'), 'N', '884465511', '637020775', 36629, 19523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (289223861, 'N', to_date('27-06-2023', 'dd-mm-yyyy'), 'Y', '938023231', '482138217', 15814, 46595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (596715712, 'Y', to_date('21-10-2023', 'dd-mm-yyyy'), 'N', '285751992', '781615940', 11131, 84351);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (388945391, 'N', to_date('28-01-2024', 'dd-mm-yyyy'), 'Y', '408874915', '438752269', 54855, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (474196461, 'Y', to_date('07-02-2023', 'dd-mm-yyyy'), 'N', '725345981', '243237202', 67426, 17231);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791216251, 'Y', to_date('28-03-2023', 'dd-mm-yyyy'), 'Y', '159478573', '193556691', 51268, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (431222285, 'Y', to_date('14-08-2023', 'dd-mm-yyyy'), 'N', '368067148', '614391180', 56381, 62619);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (985249825, 'N', to_date('04-02-2024', 'dd-mm-yyyy'), 'N', '485749616', '291811666', 25888, 62235);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274485196, 'N', to_date('26-10-2023', 'dd-mm-yyyy'), 'Y', '245843519', '909147578', 37552, 59614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (969529559, 'N', to_date('19-10-2023', 'dd-mm-yyyy'), 'Y', '650436166', '810470136', 32598, 69485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (541877967, 'Y', to_date('10-03-2024', 'dd-mm-yyyy'), 'Y', '254115667', '646508379', 86846, 45639);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (325749911, 'N', to_date('05-03-2024', 'dd-mm-yyyy'), 'N', '709634152', '189173569', 48995, 23651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (467176366, 'Y', to_date('01-04-2023', 'dd-mm-yyyy'), 'N', '222632263', '775083908', 51932, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (399361128, 'N', to_date('03-10-2023', 'dd-mm-yyyy'), 'N', '766363065', '358023527', 79968, 23489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (122244529, 'Y', to_date('08-03-2024', 'dd-mm-yyyy'), 'Y', '855872783', '757024709', 54149, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (935276283, 'Y', to_date('27-01-2023', 'dd-mm-yyyy'), 'N', '688241765', '771703424', 71786, 27554);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (689959684, 'N', to_date('23-03-2024', 'dd-mm-yyyy'), 'N', '759729703', '438752269', 69545, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (728898616, 'N', to_date('10-05-2023', 'dd-mm-yyyy'), 'Y', '267506309', '229837931', 72541, 27525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (589832552, 'N', to_date('10-12-2023', 'dd-mm-yyyy'), 'N', '449103116', '134423569', 96963, 23489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (842486261, 'N', to_date('08-11-2023', 'dd-mm-yyyy'), 'Y', '175321868', '003904199', 69958, 34713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (228439832, 'N', to_date('03-04-2023', 'dd-mm-yyyy'), 'Y', '267941315', '632140770', 71948, 66926);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (315663731, 'N', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '995091462', '912029990', 78159, 98589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (465549898, 'Y', to_date('12-02-2024', 'dd-mm-yyyy'), 'N', '502582320', '121008642', 37574, 69472);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (457668723, 'Y', to_date('12-04-2023', 'dd-mm-yyyy'), 'N', '213743877', '083033817', 41456, 27617);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (966821715, 'Y', to_date('30-10-2023', 'dd-mm-yyyy'), 'Y', '282967132', '289304877', 58434, 94783);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (339561594, 'N', to_date('20-02-2024', 'dd-mm-yyyy'), 'Y', '141337002', '222632263', 15643, 96796);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (831439498, 'N', to_date('17-01-2023', 'dd-mm-yyyy'), 'N', '699031142', '305517179', 55879, 59429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (923381143, 'Y', to_date('04-10-2023', 'dd-mm-yyyy'), 'N', '049091541', '416239499', 86683, 89568);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (955992614, 'N', to_date('11-02-2023', 'dd-mm-yyyy'), 'Y', '693359794', '751102104', 54147, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (517417369, 'N', to_date('28-06-2023', 'dd-mm-yyyy'), 'Y', '106758411', '249125666', 93651, 77727);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (879765749, 'Y', to_date('25-05-2023', 'dd-mm-yyyy'), 'N', '091115833', '664976546', 13517, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (314918736, 'N', to_date('16-01-2024', 'dd-mm-yyyy'), 'Y', '291511425', '735103801', 75118, 72144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (632735997, 'Y', to_date('10-12-2023', 'dd-mm-yyyy'), 'Y', '613689167', '512687180', 99531, 14875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754632694, 'Y', to_date('22-02-2024', 'dd-mm-yyyy'), 'N', '575116250', '307500304', 94895, 27799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (991235446, 'Y', to_date('28-02-2024', 'dd-mm-yyyy'), 'N', '837205710', '235438802', 57583, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (418655229, 'Y', to_date('20-03-2023', 'dd-mm-yyyy'), 'N', '688241765', '960125605', 65496, 17429);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (475342639, 'N', to_date('23-02-2024', 'dd-mm-yyyy'), 'Y', '318741729', '245217745', 92597, 31584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (149695317, 'Y', to_date('07-01-2024', 'dd-mm-yyyy'), 'N', '400917628', '993636785', 94696, 51218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (863668311, 'Y', to_date('07-05-2023', 'dd-mm-yyyy'), 'N', '452597433', '423925364', 86219, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (557418564, 'N', to_date('10-05-2023', 'dd-mm-yyyy'), 'N', '282967132', '274382117', 54514, 81863);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (184359595, 'Y', to_date('25-03-2023', 'dd-mm-yyyy'), 'N', '508158601', '046919723', 32254, 56389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (965492398, 'Y', to_date('11-01-2024', 'dd-mm-yyyy'), 'Y', '816100549', '086786677', 97516, 88457);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (428988411, 'Y', to_date('13-04-2023', 'dd-mm-yyyy'), 'N', '652371262', '883953054', 27382, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (283581772, 'Y', to_date('17-03-2024', 'dd-mm-yyyy'), 'N', '363254369', '141001787', 58325, 86818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (714327724, 'Y', to_date('06-09-2023', 'dd-mm-yyyy'), 'Y', '957767584', '121008642', 25536, 32339);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (894749944, 'Y', to_date('01-02-2024', 'dd-mm-yyyy'), 'N', '222632263', '654249625', 48995, 27123);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (852798226, 'N', to_date('17-12-2023', 'dd-mm-yyyy'), 'N', '370632269', '433660379', 86895, 68949);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (171983548, 'Y', to_date('15-03-2023', 'dd-mm-yyyy'), 'Y', '493961904', '235438802', 32298, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (761335947, 'N', to_date('02-01-2023', 'dd-mm-yyyy'), 'N', '772399394', '969250919', 36454, 95781);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (714175899, 'Y', to_date('10-02-2023', 'dd-mm-yyyy'), 'Y', '255902165', '987133432', 81361, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (589566349, 'N', to_date('20-01-2023', 'dd-mm-yyyy'), 'Y', '921955127', '256967718', 61993, 24263);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (318381392, 'N', to_date('28-05-2023', 'dd-mm-yyyy'), 'N', '408874915', '495290518', 35331, 44247);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (551486837, 'N', to_date('13-01-2023', 'dd-mm-yyyy'), 'Y', '360157179', '328315189', 37672, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734853753, 'Y', to_date('07-01-2023', 'dd-mm-yyyy'), 'N', '819059056', '705852145', 94895, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (253122415, 'N', to_date('22-11-2023', 'dd-mm-yyyy'), 'N', '692375929', '723445327', 27465, 81863);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (825943122, 'N', to_date('27-03-2024', 'dd-mm-yyyy'), 'Y', '200291980', '119591809', 61144, 18468);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (167326469, 'Y', to_date('07-04-2023', 'dd-mm-yyyy'), 'N', '282967132', '283302396', 36454, 95217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (265865757, 'N', to_date('21-05-2023', 'dd-mm-yyyy'), 'Y', '133060414', '609343955', 96595, 17736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (724497869, 'N', to_date('22-06-2023', 'dd-mm-yyyy'), 'Y', '475834164', '438752269', 83832, 42243);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (546169182, 'Y', to_date('12-02-2024', 'dd-mm-yyyy'), 'Y', '119591809', '543955576', 44955, 72144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (243695763, 'N', to_date('13-07-2023', 'dd-mm-yyyy'), 'Y', '384427644', '007507474', 51566, 64598);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (692238136, 'Y', to_date('17-02-2024', 'dd-mm-yyyy'), 'N', '574670543', '723216818', 27465, 11953);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (375187892, 'Y', to_date('18-02-2023', 'dd-mm-yyyy'), 'N', '187579649', '288926877', 91352, 78846);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (865573596, 'N', to_date('16-02-2023', 'dd-mm-yyyy'), 'Y', '702371190', '433660379', 22514, 52551);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (413383588, 'N', to_date('30-12-2023', 'dd-mm-yyyy'), 'N', '773999246', '037245771', 41673, 19523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (189973265, 'Y', to_date('02-03-2024', 'dd-mm-yyyy'), 'N', '758794404', '372210613', 24931, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (446558126, 'N', to_date('14-03-2023', 'dd-mm-yyyy'), 'N', '093460285', '423925364', 16675, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (869238493, 'N', to_date('04-01-2023', 'dd-mm-yyyy'), 'Y', '766797561', '773013219', 56469, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (177493489, 'N', to_date('29-10-2023', 'dd-mm-yyyy'), 'Y', '824648175', '120237174', 74717, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (578878255, 'Y', to_date('31-01-2024', 'dd-mm-yyyy'), 'Y', '688241765', '200246319', 73717, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (746652346, 'Y', to_date('02-01-2023', 'dd-mm-yyyy'), 'Y', '672905392', '190466061', 27486, 28428);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (861194452, 'N', to_date('09-03-2023', 'dd-mm-yyyy'), 'Y', '328635747', '736496191', 55959, 78754);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (225771352, 'N', to_date('09-11-2023', 'dd-mm-yyyy'), 'N', '118056743', '238348956', 64766, 93533);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (459612715, 'N', to_date('16-06-2023', 'dd-mm-yyyy'), 'Y', '489718006', '951406869', 93651, 31117);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (266497738, 'N', to_date('19-07-2023', 'dd-mm-yyyy'), 'N', '623731843', '238511855', 48197, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (311679736, 'N', to_date('26-05-2023', 'dd-mm-yyyy'), 'N', '699031142', '769552944', 38486, 18298);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (771766614, 'Y', to_date('30-11-2023', 'dd-mm-yyyy'), 'N', '489718006', '669496513', 35743, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (428396491, 'Y', to_date('15-07-2023', 'dd-mm-yyyy'), 'Y', '574670543', '681119933', 25388, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (872372663, 'N', to_date('30-06-2023', 'dd-mm-yyyy'), 'Y', '937684812', '424650791', 22145, 68731);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (986699862, 'Y', to_date('26-09-2023', 'dd-mm-yyyy'), 'N', '400917628', '569849442', 42587, 19523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (991459696, 'N', to_date('01-03-2024', 'dd-mm-yyyy'), 'Y', '035198344', '919897956', 27382, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (228174777, 'Y', to_date('27-03-2023', 'dd-mm-yyyy'), 'Y', '581195954', '729610652', 94696, 64634);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (399863741, 'N', to_date('06-03-2023', 'dd-mm-yyyy'), 'N', '817077179', '918897510', 94289, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (773827475, 'Y', to_date('12-04-2023', 'dd-mm-yyyy'), 'Y', '233658208', '014472246', 42587, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (552144273, 'Y', to_date('12-10-2023', 'dd-mm-yyyy'), 'N', '159478573', '699304048', 24938, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (112595355, 'Y', to_date('20-02-2023', 'dd-mm-yyyy'), 'Y', '439668090', '679634057', 24919, 27372);
commit;
prompt 900 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (179918898, 'Y', to_date('06-04-2023', 'dd-mm-yyyy'), 'Y', '771703424', '018933518', 82179, 78754);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (992512427, 'Y', to_date('08-02-2024', 'dd-mm-yyyy'), 'Y', '194954711', '358023527', 35331, 55964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (156166348, 'N', to_date('02-08-2023', 'dd-mm-yyyy'), 'Y', '384427644', '064148482', 27465, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (358473455, 'Y', to_date('28-02-2024', 'dd-mm-yyyy'), 'Y', '319449185', '291511425', 82736, 13641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (265631982, 'N', to_date('31-05-2023', 'dd-mm-yyyy'), 'Y', '555029781', '433660379', 83321, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (117963891, 'Y', to_date('21-04-2023', 'dd-mm-yyyy'), 'N', '617833949', '062801371', 36454, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (837274122, 'N', to_date('01-06-2023', 'dd-mm-yyyy'), 'Y', '652371262', '242316965', 58186, 32848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (483796211, 'N', to_date('21-07-2023', 'dd-mm-yyyy'), 'N', '671348563', '705284364', 37634, 86581);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (858216681, 'N', to_date('18-08-2023', 'dd-mm-yyyy'), 'N', '036492757', '005988217', 46796, 17736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (863824311, 'N', to_date('13-08-2023', 'dd-mm-yyyy'), 'Y', '002554127', '745115342', 85267, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (931468234, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'Y', '982871108', '735976872', 75118, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (532912218, 'N', to_date('22-03-2024', 'dd-mm-yyyy'), 'N', '080849238', '175781268', 24479, 56444);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (468341397, 'N', to_date('29-03-2024', 'dd-mm-yyyy'), 'N', '570331042', '897680025', 24919, 18298);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (377111495, 'N', to_date('16-02-2024', 'dd-mm-yyyy'), 'N', '182761224', '385327967', 71729, 38234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (125843268, 'Y', to_date('21-02-2024', 'dd-mm-yyyy'), 'Y', '740704902', '295968888', 57331, 44589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (634383348, 'N', to_date('04-02-2024', 'dd-mm-yyyy'), 'N', '522338180', '289304877', 28984, 27482);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (645834846, 'Y', to_date('03-04-2023', 'dd-mm-yyyy'), 'Y', '525011460', '392142161', 96672, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (659839913, 'N', to_date('02-04-2024', 'dd-mm-yyyy'), 'N', '162799501', '200246319', 75754, 13322);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (111123292, 'N', to_date('15-09-2023', 'dd-mm-yyyy'), 'N', '599521985', '968732165', 92677, 37825);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (991893442, 'N', to_date('30-01-2024', 'dd-mm-yyyy'), 'N', '113488805', '903441905', 59261, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (338749595, 'Y', to_date('27-04-2024', 'dd-mm-yyyy'), 'N', '679634057', '238511855', 12956, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (244572358, 'N', to_date('29-09-2023', 'dd-mm-yyyy'), 'Y', '242316965', '601914969', 28984, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (832778361, 'Y', to_date('15-04-2023', 'dd-mm-yyyy'), 'N', '309682546', '951860128', 32254, 87375);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (416478142, 'N', to_date('04-02-2024', 'dd-mm-yyyy'), 'N', '292509980', '980953702', 56381, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (746439522, 'N', to_date('15-06-2023', 'dd-mm-yyyy'), 'Y', '984430684', '240111208', 72949, 67654);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (925751817, 'N', to_date('05-01-2024', 'dd-mm-yyyy'), 'Y', '957767584', '240111208', 58923, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734879176, 'N', to_date('19-01-2023', 'dd-mm-yyyy'), 'Y', '021114490', '741343717', 89948, 61998);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (527338625, 'Y', to_date('21-01-2023', 'dd-mm-yyyy'), 'N', '716522491', '943811449', 68776, 23489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373514531, 'Y', to_date('24-08-2023', 'dd-mm-yyyy'), 'N', '688241765', '555251729', 64656, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (871549135, 'Y', to_date('21-02-2024', 'dd-mm-yyyy'), 'Y', '091115833', '121008642', 52339, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (476649333, 'Y', to_date('01-07-2023', 'dd-mm-yyyy'), 'Y', '104654240', '142225890', 78624, 36751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (683164881, 'N', to_date('16-03-2024', 'dd-mm-yyyy'), 'N', '319449185', '277620976', 83321, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (779772445, 'Y', to_date('22-03-2024', 'dd-mm-yyyy'), 'Y', '268303729', '543955576', 67864, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (242818284, 'N', to_date('19-07-2023', 'dd-mm-yyyy'), 'Y', '686870106', '365883743', 88768, 97229);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (588595896, 'Y', to_date('16-02-2024', 'dd-mm-yyyy'), 'Y', '118056743', '131166588', 79765, 21227);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (175631949, 'N', to_date('19-02-2023', 'dd-mm-yyyy'), 'Y', '259941739', '864233203', 17919, 44354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (898474322, 'N', to_date('12-07-2023', 'dd-mm-yyyy'), 'N', '432174519', '833298755', 96488, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (241247145, 'Y', to_date('23-04-2023', 'dd-mm-yyyy'), 'Y', '027847108', '539935524', 15468, 51435);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (384293115, 'N', to_date('09-06-2023', 'dd-mm-yyyy'), 'Y', '937684812', '957003822', 35785, 34459);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (517765157, 'Y', to_date('02-10-2023', 'dd-mm-yyyy'), 'Y', '922303690', '709634152', 78345, 78599);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (953696441, 'Y', to_date('20-03-2024', 'dd-mm-yyyy'), 'Y', '178510404', '288128062', 95566, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (863378425, 'Y', to_date('06-07-2023', 'dd-mm-yyyy'), 'Y', '683868829', '189173569', 47741, 31234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (821636398, 'N', to_date('04-04-2024', 'dd-mm-yyyy'), 'N', '652371262', '120237174', 71553, 47799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (626884889, 'N', to_date('24-08-2023', 'dd-mm-yyyy'), 'N', '982871108', '165537016', 51447, 18238);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (432126525, 'N', to_date('19-12-2023', 'dd-mm-yyyy'), 'Y', '693085728', '093051335', 35785, 41348);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (115867661, 'Y', to_date('28-03-2023', 'dd-mm-yyyy'), 'Y', '371775100', '309146979', 65568, 86285);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (864197431, 'N', to_date('04-02-2023', 'dd-mm-yyyy'), 'N', '617696093', '339222343', 83133, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (769572144, 'Y', to_date('23-05-2023', 'dd-mm-yyyy'), 'N', '333348436', '798850878', 93715, 51758);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (884662467, 'N', to_date('06-06-2023', 'dd-mm-yyyy'), 'Y', '511568325', '585972131', 77481, 32884);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (179272813, 'Y', to_date('26-03-2023', 'dd-mm-yyyy'), 'N', '229266261', '148142939', 69587, 18468);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (127932418, 'N', to_date('10-06-2023', 'dd-mm-yyyy'), 'N', '409938518', '728276285', 72949, 27194);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (132421834, 'Y', to_date('27-11-2023', 'dd-mm-yyyy'), 'N', '216860273', '397861085', 41828, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (472377246, 'Y', to_date('12-08-2023', 'dd-mm-yyyy'), 'Y', '282967132', '339222343', 62163, 56619);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (437622164, 'Y', to_date('31-03-2023', 'dd-mm-yyyy'), 'Y', '448322939', '076083621', 78249, 91868);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (524199438, 'N', to_date('16-10-2023', 'dd-mm-yyyy'), 'N', '939829538', '438752269', 61912, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (315627323, 'Y', to_date('09-10-2023', 'dd-mm-yyyy'), 'Y', '955370738', '071856120', 96595, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (999537232, 'N', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '048142005', '338800563', 23968, 24263);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734811829, 'Y', to_date('13-05-2023', 'dd-mm-yyyy'), 'Y', '624208805', '795966607', 41326, 66926);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (617369853, 'Y', to_date('25-04-2024', 'dd-mm-yyyy'), 'Y', '256967718', '004214981', 95566, 89536);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (355323177, 'Y', to_date('30-03-2023', 'dd-mm-yyyy'), 'Y', '254115667', '096150305', 48969, 22143);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (265727234, 'N', to_date('15-10-2023', 'dd-mm-yyyy'), 'N', '003904199', '692936013', 14491, 31919);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (278714837, 'Y', to_date('29-12-2023', 'dd-mm-yyyy'), 'Y', '530485585', '245843519', 18671, 77164);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (879857645, 'Y', to_date('07-03-2024', 'dd-mm-yyyy'), 'Y', '702371190', '187799087', 66591, 31584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (213276985, 'Y', to_date('23-03-2024', 'dd-mm-yyyy'), 'N', '999950098', '046919723', 54959, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (617958778, 'Y', to_date('14-06-2023', 'dd-mm-yyyy'), 'N', '652327528', '723216818', 31464, 37191);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (889589856, 'N', to_date('24-03-2023', 'dd-mm-yyyy'), 'N', '184623309', '658306554', 97516, 97834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (918277689, 'N', to_date('21-03-2024', 'dd-mm-yyyy'), 'Y', '942081370', '973262503', 63671, 29596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (369993978, 'Y', to_date('23-08-2023', 'dd-mm-yyyy'), 'N', '382880573', '735103801', 36833, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (289282214, 'Y', to_date('26-02-2023', 'dd-mm-yyyy'), 'Y', '679634057', '084607020', 79584, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (312547261, 'N', to_date('22-06-2023', 'dd-mm-yyyy'), 'N', '912029990', '402373896', 33828, 45713);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (158118296, 'N', to_date('05-04-2024', 'dd-mm-yyyy'), 'Y', '749011451', '641022334', 21117, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (338579412, 'Y', to_date('26-01-2024', 'dd-mm-yyyy'), 'Y', '822051253', '242952342', 19196, 31584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (215784837, 'N', to_date('27-03-2024', 'dd-mm-yyyy'), 'N', '057913650', '655711740', 24215, 45111);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (329499375, 'Y', to_date('25-06-2023', 'dd-mm-yyyy'), 'Y', '222632263', '240111208', 37574, 31327);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (536422626, 'Y', to_date('20-02-2023', 'dd-mm-yyyy'), 'Y', '281373620', '654060128', 73341, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (936465942, 'N', to_date('05-02-2023', 'dd-mm-yyyy'), 'N', '975087097', '888505515', 58177, 87589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (982359333, 'N', to_date('13-01-2023', 'dd-mm-yyyy'), 'Y', '048374256', '569849442', 89466, 57631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (719923637, 'N', to_date('01-09-2023', 'dd-mm-yyyy'), 'Y', '918868012', '071856120', 83321, 96779);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (859532731, 'Y', to_date('06-01-2024', 'dd-mm-yyyy'), 'N', '874173884', '772399394', 23725, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (532811286, 'N', to_date('19-12-2023', 'dd-mm-yyyy'), 'N', '710020129', '190466061', 48488, 69472);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (249681444, 'N', to_date('13-03-2024', 'dd-mm-yyyy'), 'N', '133060414', '165537016', 96976, 95166);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (884674387, 'N', to_date('13-06-2023', 'dd-mm-yyyy'), 'Y', '009934088', '093460285', 82538, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (799862617, 'N', to_date('22-09-2023', 'dd-mm-yyyy'), 'N', '108935075', '037245771', 48374, 95217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (218811448, 'Y', to_date('05-08-2023', 'dd-mm-yyyy'), 'N', '267941315', '014472246', 82364, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (859758327, 'N', to_date('30-05-2023', 'dd-mm-yyyy'), 'Y', '993636785', '134423569', 57991, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (325564538, 'Y', to_date('26-11-2023', 'dd-mm-yyyy'), 'N', '833298755', '735718988', 51932, 59677);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (499973363, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'Y', '850092806', '680172578', 81645, 18298);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (777482689, 'Y', to_date('26-03-2023', 'dd-mm-yyyy'), 'N', '998752021', '416239499', 15468, 56444);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (118118334, 'N', to_date('29-04-2023', 'dd-mm-yyyy'), 'N', '652031992', '299296442', 89911, 62216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (767496565, 'Y', to_date('14-10-2023', 'dd-mm-yyyy'), 'N', '913942557', '714371122', 28748, 68664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (995955561, 'Y', to_date('22-04-2023', 'dd-mm-yyyy'), 'Y', '213743877', '187799087', 83722, 57631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (967663578, 'Y', to_date('15-02-2023', 'dd-mm-yyyy'), 'N', '610341868', '708025907', 75118, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (212356995, 'Y', to_date('11-04-2024', 'dd-mm-yyyy'), 'Y', '274382117', '858439996', 78888, 95258);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129255126, 'Y', to_date('04-07-2023', 'dd-mm-yyyy'), 'Y', '999821449', '958133138', 77415, 32256);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (296992752, 'Y', to_date('02-11-2023', 'dd-mm-yyyy'), 'N', '519174701', '307500304', 35331, 27554);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (146316914, 'N', to_date('10-11-2023', 'dd-mm-yyyy'), 'Y', '962374483', '439959523', 67679, 86671);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (228113346, 'N', to_date('07-04-2024', 'dd-mm-yyyy'), 'Y', '384427644', '120237174', 98616, 87661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (691198171, 'N', to_date('24-10-2023', 'dd-mm-yyyy'), 'Y', '175321868', '655711740', 15468, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (872658243, 'Y', to_date('15-03-2023', 'dd-mm-yyyy'), 'Y', '354683638', '121008642', 17919, 16513);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (376914916, 'N', to_date('05-09-2023', 'dd-mm-yyyy'), 'N', '259407722', '460950567', 88711, 28595);
commit;
prompt 1000 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (683629323, 'N', to_date('30-01-2023', 'dd-mm-yyyy'), 'N', '027847108', '610341868', 39337, 68342);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (712613733, 'Y', to_date('14-01-2024', 'dd-mm-yyyy'), 'N', '570331042', '364367353', 57522, 54673);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (823275676, 'Y', to_date('01-05-2023', 'dd-mm-yyyy'), 'N', '160752957', '699304048', 86219, 61188);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (629963987, 'N', to_date('03-04-2024', 'dd-mm-yyyy'), 'N', '891313788', '200246319', 48376, 32777);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (495611264, 'Y', to_date('19-10-2023', 'dd-mm-yyyy'), 'N', '771995680', '680478146', 55395, 35471);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (535599249, 'N', to_date('01-09-2023', 'dd-mm-yyyy'), 'Y', '425467041', '392142161', 96762, 18854);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (452632483, 'Y', to_date('13-03-2024', 'dd-mm-yyyy'), 'N', '807196691', '901831943', 71898, 85499);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (832924589, 'Y', to_date('16-08-2023', 'dd-mm-yyyy'), 'N', '307081120', '439959523', 83828, 79181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (296636176, 'Y', to_date('22-12-2023', 'dd-mm-yyyy'), 'Y', '610422260', '039651469', 52994, 32339);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (977437318, 'Y', to_date('01-09-2023', 'dd-mm-yyyy'), 'Y', '644185876', '851082137', 91352, 11311);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (593349119, 'N', to_date('04-06-2023', 'dd-mm-yyyy'), 'N', '539935524', '969313022', 33126, 48564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (121963291, 'Y', to_date('09-03-2024', 'dd-mm-yyyy'), 'Y', '571220005', '184623309', 64656, 55964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (449443872, 'N', to_date('15-09-2023', 'dd-mm-yyyy'), 'Y', '999950098', '569849442', 82179, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (191494156, 'N', to_date('10-10-2023', 'dd-mm-yyyy'), 'N', '234039968', '151716759', 67669, 88614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (253972245, 'Y', to_date('29-02-2024', 'dd-mm-yyyy'), 'N', '455747246', '744075988', 45461, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (627966824, 'N', to_date('12-03-2023', 'dd-mm-yyyy'), 'N', '822051253', '517900008', 26145, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373519314, 'N', to_date('28-08-2023', 'dd-mm-yyyy'), 'N', '299685315', '627820755', 58177, 55239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (195751917, 'N', to_date('24-01-2024', 'dd-mm-yyyy'), 'N', '579208908', '062725544', 75715, 57957);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (739192624, 'Y', to_date('28-03-2023', 'dd-mm-yyyy'), 'N', '996383746', '243237202', 35724, 45639);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (687718953, 'N', to_date('15-07-2023', 'dd-mm-yyyy'), 'Y', '637020775', '731452579', 33126, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (296624365, 'N', to_date('23-06-2023', 'dd-mm-yyyy'), 'N', '002554127', '885461855', 89235, 24372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (268322356, 'N', to_date('10-08-2023', 'dd-mm-yyyy'), 'Y', '242316965', '539935524', 97938, 18377);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (464834479, 'Y', to_date('17-02-2023', 'dd-mm-yyyy'), 'Y', '807810311', '736496191', 33578, 42823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (675639331, 'N', to_date('16-02-2023', 'dd-mm-yyyy'), 'N', '652327528', '485394887', 75715, 64678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (699918953, 'N', to_date('25-02-2023', 'dd-mm-yyyy'), 'Y', '919897956', '237230933', 48969, 74489);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (356631179, 'N', to_date('21-02-2023', 'dd-mm-yyyy'), 'N', '091115833', '745115342', 57331, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (239918911, 'N', to_date('01-01-2024', 'dd-mm-yyyy'), 'Y', '805125593', '746465341', 96488, 79385);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (592963797, 'N', to_date('14-03-2024', 'dd-mm-yyyy'), 'N', '850092806', '590746015', 85941, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (691631125, 'Y', to_date('04-01-2023', 'dd-mm-yyyy'), 'Y', '031240584', '852575300', 84829, 15749);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (311135285, 'N', to_date('26-09-2023', 'dd-mm-yyyy'), 'Y', '220944241', '234623164', 65269, 49182);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (822416917, 'Y', to_date('04-09-2023', 'dd-mm-yyyy'), 'N', '147206940', '071856120', 41456, 13668);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (377772354, 'N', to_date('01-01-2024', 'dd-mm-yyyy'), 'Y', '484771335', '108935075', 15254, 33156);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274455134, 'N', to_date('13-09-2023', 'dd-mm-yyyy'), 'Y', '683533120', '119591809', 25888, 27366);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (233898958, 'N', to_date('17-02-2024', 'dd-mm-yyyy'), 'Y', '955370738', '654249625', 85267, 71249);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (748491192, 'N', to_date('19-04-2024', 'dd-mm-yyyy'), 'Y', '218095746', '699304048', 51931, 83712);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (345752684, 'N', to_date('05-02-2024', 'dd-mm-yyyy'), 'Y', '976460507', '372210613', 11131, 82647);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (599974253, 'N', to_date('19-07-2023', 'dd-mm-yyyy'), 'N', '321643516', '680478146', 69585, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (639652921, 'N', to_date('26-05-2023', 'dd-mm-yyyy'), 'N', '898034681', '974550419', 12846, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (352318529, 'Y', to_date('13-01-2023', 'dd-mm-yyyy'), 'N', '680478146', '948688656', 73717, 11311);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (994334241, 'Y', to_date('22-09-2023', 'dd-mm-yyyy'), 'Y', '064148482', '071509079', 73341, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (551328438, 'N', to_date('15-11-2023', 'dd-mm-yyyy'), 'Y', '813092669', '456099156', 85267, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (137321891, 'Y', to_date('12-08-2023', 'dd-mm-yyyy'), 'N', '897680025', '432174519', 34333, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (414768667, 'N', to_date('12-01-2024', 'dd-mm-yyyy'), 'Y', '424650791', '283952085', 76244, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (211859175, 'N', to_date('15-10-2023', 'dd-mm-yyyy'), 'N', '716522491', '943811449', 37574, 96596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (891843378, 'Y', to_date('01-09-2023', 'dd-mm-yyyy'), 'N', '159478573', '603911711', 51673, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (596854897, 'N', to_date('04-03-2023', 'dd-mm-yyyy'), 'Y', '012584652', '485749616', 82364, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (812621136, 'Y', to_date('13-10-2023', 'dd-mm-yyyy'), 'Y', '657771509', '563077478', 48995, 61899);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (928173357, 'Y', to_date('12-03-2024', 'dd-mm-yyyy'), 'N', '184623309', '096150305', 31471, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (778926656, 'N', to_date('31-07-2023', 'dd-mm-yyyy'), 'Y', '616117735', '484771335', 55124, 84419);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (211832263, 'N', to_date('27-06-2023', 'dd-mm-yyyy'), 'N', '657771509', '850880715', 37652, 19523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (953389638, 'N', to_date('09-02-2023', 'dd-mm-yyyy'), 'N', '705852145', '735103801', 88711, 99752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (679281391, 'Y', to_date('08-11-2023', 'dd-mm-yyyy'), 'Y', '879327263', '901831943', 28952, 37191);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (562748475, 'Y', to_date('09-04-2023', 'dd-mm-yyyy'), 'N', '699031142', '773013219', 32598, 22798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (584767462, 'N', to_date('17-08-2023', 'dd-mm-yyyy'), 'N', '327291998', '462497141', 56381, 25844);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (298162339, 'N', to_date('28-02-2023', 'dd-mm-yyyy'), 'Y', '311853595', '133060414', 57583, 98857);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (742233839, 'Y', to_date('30-04-2023', 'dd-mm-yyyy'), 'Y', '563077478', '905128014', 25889, 32725);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (663951621, 'Y', to_date('21-01-2024', 'dd-mm-yyyy'), 'Y', '264346014', '364681609', 26145, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (164586211, 'Y', to_date('30-04-2024', 'dd-mm-yyyy'), 'N', '974550419', '580000436', 58177, 28588);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (313686697, 'Y', to_date('05-02-2024', 'dd-mm-yyyy'), 'Y', '318447492', '243237202', 95717, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (123631724, 'Y', to_date('12-07-2023', 'dd-mm-yyyy'), 'N', '144998512', '958133138', 39963, 59961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (297978153, 'Y', to_date('07-08-2023', 'dd-mm-yyyy'), 'Y', '273995455', '482138217', 17435, 23661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (813256681, 'Y', to_date('01-01-2024', 'dd-mm-yyyy'), 'Y', '613689167', '627820755', 71729, 86285);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (279823132, 'N', to_date('27-09-2023', 'dd-mm-yyyy'), 'N', '919897956', '904803417', 17919, 59346);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (636357244, 'N', to_date('10-01-2023', 'dd-mm-yyyy'), 'N', '898034681', '160587152', 22277, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (142519322, 'Y', to_date('18-11-2023', 'dd-mm-yyyy'), 'N', '027847108', '397861085', 94184, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (181147162, 'N', to_date('18-01-2024', 'dd-mm-yyyy'), 'N', '608382546', '299901965', 57478, 94783);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (218945554, 'Y', to_date('28-03-2024', 'dd-mm-yyyy'), 'Y', '485749616', '048142005', 99258, 27563);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (734212593, 'Y', to_date('22-05-2023', 'dd-mm-yyyy'), 'Y', '267941315', '883233226', 31464, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (865243322, 'N', to_date('24-03-2023', 'dd-mm-yyyy'), 'N', '074081051', '883953054', 12956, 62786);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (925964119, 'N', to_date('17-07-2023', 'dd-mm-yyyy'), 'N', '539087374', '664976546', 87731, 62216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (861481222, 'Y', to_date('03-02-2024', 'dd-mm-yyyy'), 'N', '684744404', '009934088', 24379, 55445);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (983593536, 'N', to_date('10-11-2023', 'dd-mm-yyyy'), 'N', '984379035', '651790012', 63671, 43957);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (961193351, 'N', to_date('14-04-2024', 'dd-mm-yyyy'), 'Y', '175321868', '735718988', 85931, 44939);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (442542311, 'N', to_date('20-03-2023', 'dd-mm-yyyy'), 'N', '259941739', '841337498', 82939, 23499);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (798878211, 'N', to_date('12-06-2023', 'dd-mm-yyyy'), 'N', '423925364', '307500304', 18442, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (193682173, 'N', to_date('02-01-2024', 'dd-mm-yyyy'), 'Y', '998752021', '302017993', 49573, 97195);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (473533865, 'N', to_date('23-05-2023', 'dd-mm-yyyy'), 'Y', '338160998', '175781268', 25499, 83779);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (222148985, 'Y', to_date('22-02-2024', 'dd-mm-yyyy'), 'Y', '874173884', '288926877', 68776, 23651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (898277322, 'Y', to_date('15-02-2024', 'dd-mm-yyyy'), 'Y', '874173884', '745115342', 77481, 25485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (185523343, 'N', to_date('26-09-2023', 'dd-mm-yyyy'), 'Y', '570331042', '004214981', 25648, 62619);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (158121528, 'Y', to_date('07-11-2023', 'dd-mm-yyyy'), 'Y', '915523925', '609343955', 94895, 93413);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (638743284, 'Y', to_date('26-09-2023', 'dd-mm-yyyy'), 'Y', '699031142', '776216289', 96359, 52551);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (598664477, 'N', to_date('13-04-2024', 'dd-mm-yyyy'), 'N', '405534830', '299296442', 35724, 55445);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (493993629, 'Y', to_date('15-04-2023', 'dd-mm-yyyy'), 'N', '086595664', '039651469', 55879, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (676556513, 'N', to_date('30-12-2023', 'dd-mm-yyyy'), 'N', '339753654', '642604802', 56366, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (986341573, 'N', to_date('21-09-2023', 'dd-mm-yyyy'), 'N', '363254369', '245843519', 61912, 31169);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (329672423, 'Y', to_date('30-09-2023', 'dd-mm-yyyy'), 'Y', '702371190', '288128062', 96595, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (413452739, 'Y', to_date('26-03-2023', 'dd-mm-yyyy'), 'Y', '319137744', '987544346', 46424, 95839);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (449862846, 'Y', to_date('24-10-2023', 'dd-mm-yyyy'), 'N', '490388060', '175781268', 39243, 66455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (924676848, 'N', to_date('07-07-2023', 'dd-mm-yyyy'), 'N', '693085728', '937580305', 58325, 78686);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (646722846, 'Y', to_date('30-12-2023', 'dd-mm-yyyy'), 'Y', '684307055', '222632263', 59785, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (114111551, 'Y', to_date('20-02-2023', 'dd-mm-yyyy'), 'Y', '259941739', '725563629', 98616, 46818);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (492493147, 'N', to_date('15-08-2023', 'dd-mm-yyyy'), 'Y', '318657191', '397861085', 24169, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (511617219, 'Y', to_date('06-03-2024', 'dd-mm-yyyy'), 'Y', '766797561', '238348956', 27382, 68841);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (852984337, 'N', to_date('10-03-2024', 'dd-mm-yyyy'), 'Y', '477713746', '864233203', 86846, 55631);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (438854263, 'Y', to_date('30-03-2024', 'dd-mm-yyyy'), 'N', '080849238', '295968888', 82736, 32772);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (772837896, 'Y', to_date('28-01-2024', 'dd-mm-yyyy'), 'N', '160587152', '714371122', 96488, 78599);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (718915739, 'Y', to_date('16-02-2023', 'dd-mm-yyyy'), 'N', '971987270', '937748671', 16941, 82274);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (877542518, 'N', to_date('27-10-2023', 'dd-mm-yyyy'), 'N', '479117663', '238511855', 14656, 27455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (539869161, 'N', to_date('17-02-2024', 'dd-mm-yyyy'), 'N', '267506309', '108104963', 55395, 93396);
commit;
prompt 1100 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (767874377, 'N', to_date('02-07-2023', 'dd-mm-yyyy'), 'Y', '511568325', '736496191', 18442, 62216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (354183162, 'Y', to_date('04-06-2023', 'dd-mm-yyyy'), 'N', '822051253', '957003822', 12888, 32194);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (442723744, 'N', to_date('14-01-2024', 'dd-mm-yyyy'), 'Y', '328635747', '654060128', 54149, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (265165879, 'N', to_date('12-05-2023', 'dd-mm-yyyy'), 'N', '539935524', '669496513', 97938, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (962535598, 'N', to_date('20-03-2023', 'dd-mm-yyyy'), 'N', '155290755', '385327967', 97475, 59677);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (575775113, 'Y', to_date('23-02-2023', 'dd-mm-yyyy'), 'N', '242316965', '532015902', 23968, 39142);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129334294, 'Y', to_date('31-08-2023', 'dd-mm-yyyy'), 'Y', '009223928', '609343955', 79968, 59736);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (232114577, 'N', to_date('03-03-2024', 'dd-mm-yyyy'), 'Y', '840379495', '864233203', 57478, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (329177117, 'N', to_date('17-07-2023', 'dd-mm-yyyy'), 'N', '128122177', '852575300', 51447, 53436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (631331774, 'N', to_date('12-05-2023', 'dd-mm-yyyy'), 'Y', '267941315', '116730303', 71762, 72225);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (896257466, 'N', to_date('11-03-2023', 'dd-mm-yyyy'), 'N', '642604802', '884465511', 86846, 87375);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (463659234, 'Y', to_date('23-10-2023', 'dd-mm-yyyy'), 'N', '421599017', '746465341', 55879, 66436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (867156654, 'Y', to_date('20-10-2023', 'dd-mm-yyyy'), 'Y', '697207496', '472188320', 49942, 38714);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (695931327, 'N', to_date('21-02-2024', 'dd-mm-yyyy'), 'Y', '267941315', '398323674', 36454, 26629);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (119677585, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'N', '591978627', '508158601', 85267, 43867);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (291799365, 'N', to_date('02-11-2023', 'dd-mm-yyyy'), 'N', '725345981', '722968346', 66926, 54218);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (195493135, 'Y', to_date('27-08-2023', 'dd-mm-yyyy'), 'Y', '433660379', '933237910', 32298, 51477);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (992497315, 'Y', to_date('25-03-2023', 'dd-mm-yyyy'), 'N', '819059056', '398323674', 71948, 83712);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (282919314, 'Y', to_date('20-03-2024', 'dd-mm-yyyy'), 'N', '539087374', '736496191', 18439, 96528);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (224652485, 'Y', to_date('02-07-2023', 'dd-mm-yyyy'), 'Y', '529679514', '297681739', 86947, 36449);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (414219855, 'N', to_date('30-01-2023', 'dd-mm-yyyy'), 'N', '087806495', '108935075', 41456, 39142);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (361436535, 'N', to_date('09-01-2024', 'dd-mm-yyyy'), 'N', '780106789', '299296442', 12888, 12715);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (885882493, 'Y', to_date('13-01-2023', 'dd-mm-yyyy'), 'N', '368067148', '151254801', 33828, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (229869552, 'N', to_date('12-09-2023', 'dd-mm-yyyy'), 'N', '693359794', '364681609', 48163, 15749);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (829541364, 'N', to_date('27-09-2023', 'dd-mm-yyyy'), 'N', '685164958', '160205383', 56366, 82163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (569125218, 'N', to_date('08-08-2023', 'dd-mm-yyyy'), 'Y', '267506309', '608382546', 64766, 44589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (115276259, 'Y', to_date('13-01-2023', 'dd-mm-yyyy'), 'Y', '291511425', '489718006', 28466, 45678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (139916876, 'Y', to_date('02-01-2023', 'dd-mm-yyyy'), 'Y', '539935524', '039651469', 69545, 95781);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (518974213, 'N', to_date('14-08-2023', 'dd-mm-yyyy'), 'N', '532015902', '539935524', 78345, 86285);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (962836386, 'Y', to_date('13-05-2023', 'dd-mm-yyyy'), 'N', '581195954', '957003822', 96858, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271366628, 'N', to_date('15-09-2023', 'dd-mm-yyyy'), 'N', '683895199', '769552944', 15643, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (389188732, 'N', to_date('27-04-2024', 'dd-mm-yyyy'), 'Y', '477713746', '609343955', 44546, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (642511594, 'N', to_date('14-09-2023', 'dd-mm-yyyy'), 'N', '113488805', '823811487', 42587, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (884461532, 'Y', to_date('19-09-2023', 'dd-mm-yyyy'), 'Y', '307716898', '320079562', 96858, 26128);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (523558733, 'Y', to_date('16-07-2023', 'dd-mm-yyyy'), 'Y', '182761224', '285751992', 33265, 47582);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (363486855, 'Y', to_date('24-03-2024', 'dd-mm-yyyy'), 'Y', '230155515', '654249625', 51447, 46664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (928161436, 'N', to_date('27-12-2023', 'dd-mm-yyyy'), 'N', '255902165', '957003822', 78775, 26128);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (973555634, 'Y', to_date('25-01-2024', 'dd-mm-yyyy'), 'Y', '318447492', '998752021', 71729, 99752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (925582962, 'Y', to_date('08-01-2024', 'dd-mm-yyyy'), 'N', '693359794', '591456995', 42627, 94497);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (962582124, 'Y', to_date('17-08-2023', 'dd-mm-yyyy'), 'N', '756743030', '018933518', 17919, 66436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (276991447, 'Y', to_date('17-06-2023', 'dd-mm-yyyy'), 'N', '959837164', '071856120', 79584, 74157);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (269268722, 'N', to_date('25-02-2024', 'dd-mm-yyyy'), 'Y', '696511331', '363800111', 46424, 89641);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (352236925, 'N', to_date('22-04-2024', 'dd-mm-yyyy'), 'Y', '405534830', '363800111', 36833, 35593);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (316939687, 'N', to_date('01-10-2023', 'dd-mm-yyyy'), 'Y', '318447492', '851082137', 76448, 46664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (661788299, 'Y', to_date('06-02-2024', 'dd-mm-yyyy'), 'N', '529679514', '601914969', 48374, 55386);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (775968136, 'N', to_date('15-01-2024', 'dd-mm-yyyy'), 'N', '781611704', '215396573', 69958, 71249);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (944776426, 'N', to_date('20-11-2023', 'dd-mm-yyyy'), 'Y', '693992628', '751102104', 25134, 23314);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (649925872, 'Y', to_date('04-07-2023', 'dd-mm-yyyy'), 'Y', '339753654', '397861085', 22145, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (462223785, 'Y', to_date('27-03-2024', 'dd-mm-yyyy'), 'Y', '460950567', '137408341', 88414, 83779);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (985471233, 'Y', to_date('21-02-2024', 'dd-mm-yyyy'), 'Y', '216860273', '431602139', 44422, 49182);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (439638438, 'Y', to_date('30-11-2023', 'dd-mm-yyyy'), 'Y', '254115667', '974550419', 44546, 36946);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (548577521, 'N', to_date('21-06-2023', 'dd-mm-yyyy'), 'N', '599521985', '309661257', 23968, 76578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (382327432, 'Y', to_date('10-11-2023', 'dd-mm-yyyy'), 'N', '579667581', '652327528', 75754, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (658321838, 'Y', to_date('10-11-2023', 'dd-mm-yyyy'), 'N', '731452579', '262097637', 56874, 54673);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (384431512, 'N', to_date('18-03-2023', 'dd-mm-yyyy'), 'N', '934021441', '569879560', 58186, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (614341473, 'N', to_date('17-03-2023', 'dd-mm-yyyy'), 'N', '980638570', '450816060', 97938, 97195);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (145655558, 'N', to_date('15-04-2023', 'dd-mm-yyyy'), 'Y', '859643900', '238348956', 73442, 45358);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (625855132, 'Y', to_date('05-04-2024', 'dd-mm-yyyy'), 'N', '563077478', '184623309', 52573, 53743);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (583234264, 'Y', to_date('06-08-2023', 'dd-mm-yyyy'), 'N', '919897956', '262480569', 59785, 76181);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (264987818, 'Y', to_date('17-12-2023', 'dd-mm-yyyy'), 'N', '725569007', '852882111', 25536, 27367);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (918475825, 'Y', to_date('04-03-2023', 'dd-mm-yyyy'), 'N', '651790012', '306609285', 81874, 53743);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (996455376, 'N', to_date('03-02-2024', 'dd-mm-yyyy'), 'Y', '919897956', '912029990', 78624, 31117);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (573133229, 'Y', to_date('25-03-2023', 'dd-mm-yyyy'), 'N', '616117735', '152572605', 59261, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (356514142, 'N', to_date('21-04-2023', 'dd-mm-yyyy'), 'Y', '353521370', '874173884', 39243, 77777);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (242697427, 'Y', to_date('04-03-2023', 'dd-mm-yyyy'), 'N', '403751552', '589644176', 37634, 74389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (369544856, 'Y', to_date('02-10-2023', 'dd-mm-yyyy'), 'Y', '465075631', '328315189', 33828, 84352);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (767444832, 'N', to_date('06-04-2023', 'dd-mm-yyyy'), 'Y', '672905392', '485394887', 89243, 84859);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (744212899, 'Y', to_date('18-02-2023', 'dd-mm-yyyy'), 'Y', '573459851', '083033817', 46819, 53436);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (566354471, 'Y', to_date('11-04-2023', 'dd-mm-yyyy'), 'Y', '975627046', '881032236', 69587, 66455);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (271138547, 'Y', to_date('25-12-2023', 'dd-mm-yyyy'), 'N', '009934088', '781615940', 96488, 66624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (757895361, 'N', to_date('06-11-2023', 'dd-mm-yyyy'), 'N', '984430684', '771703424', 35331, 38234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (148551147, 'N', to_date('11-01-2023', 'dd-mm-yyyy'), 'Y', '268303729', '320079562', 64358, 34752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (698679324, 'Y', to_date('21-10-2023', 'dd-mm-yyyy'), 'N', '327770767', '325057906', 73382, 14752);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (591384551, 'Y', to_date('09-03-2023', 'dd-mm-yyyy'), 'Y', '692936013', '669496513', 36629, 33616);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791557324, 'N', to_date('23-02-2024', 'dd-mm-yyyy'), 'Y', '714371122', '833298755', 53299, 89568);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (571196958, 'N', to_date('22-03-2024', 'dd-mm-yyyy'), 'Y', '716522491', '741001511', 45156, 47799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (794353898, 'Y', to_date('29-01-2024', 'dd-mm-yyyy'), 'N', '810158730', '450816060', 46796, 95217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (693383156, 'N', to_date('06-02-2024', 'dd-mm-yyyy'), 'Y', '817077179', '683868829', 73341, 57115);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (744415536, 'Y', to_date('24-08-2023', 'dd-mm-yyyy'), 'Y', '307081120', '644185876', 71948, 31117);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373134834, 'Y', to_date('16-04-2024', 'dd-mm-yyyy'), 'N', '421599017', '639454824', 48488, 41348);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (144162929, 'Y', to_date('03-10-2023', 'dd-mm-yyyy'), 'N', '921955127', '798850878', 96976, 68523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791948791, 'N', to_date('18-02-2023', 'dd-mm-yyyy'), 'Y', '999821449', '810470136', 17919, 58584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (419174342, 'Y', to_date('01-07-2023', 'dd-mm-yyyy'), 'Y', '353521370', '495290518', 38486, 27992);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (824585412, 'Y', to_date('22-10-2023', 'dd-mm-yyyy'), 'Y', '036492757', '579628336', 68826, 81922);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (448969892, 'Y', to_date('25-02-2024', 'dd-mm-yyyy'), 'Y', '405534830', '291511425', 99338, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (524975271, 'Y', to_date('08-09-2023', 'dd-mm-yyyy'), 'N', '062725544', '258054874', 54959, 68342);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (489183838, 'Y', to_date('09-11-2023', 'dd-mm-yyyy'), 'N', '807810311', '939829538', 92496, 96796);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (222299558, 'N', to_date('02-09-2023', 'dd-mm-yyyy'), 'Y', '593607007', '372210613', 39145, 74446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (613372154, 'N', to_date('05-04-2024', 'dd-mm-yyyy'), 'N', '327770767', '127506315', 31426, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (142551625, 'Y', to_date('02-03-2024', 'dd-mm-yyyy'), 'Y', '119591809', '530485585', 33657, 52787);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (749313795, 'N', to_date('18-11-2023', 'dd-mm-yyyy'), 'N', '799167503', '709634152', 51932, 97592);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (287533535, 'N', to_date('14-10-2023', 'dd-mm-yyyy'), 'Y', '238418580', '237230933', 82179, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (614686469, 'Y', to_date('29-05-2023', 'dd-mm-yyyy'), 'Y', '998752021', '651790012', 64513, 24578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (446958266, 'Y', to_date('25-04-2023', 'dd-mm-yyyy'), 'N', '493961904', '254115667', 89655, 82365);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (619128876, 'N', to_date('21-01-2023', 'dd-mm-yyyy'), 'Y', '729784083', '901831943', 99258, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (376682566, 'Y', to_date('24-01-2023', 'dd-mm-yyyy'), 'N', '482424220', '364367353', 85466, 27372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (933712711, 'Y', to_date('26-11-2023', 'dd-mm-yyyy'), 'Y', '909147578', '530889775', 51231, 86285);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (144978488, 'N', to_date('12-03-2024', 'dd-mm-yyyy'), 'N', '766363065', '485394887', 38992, 79476);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (539834397, 'Y', to_date('15-11-2023', 'dd-mm-yyyy'), 'N', '292509980', '693359794', 96762, 59961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (953885566, 'N', to_date('28-05-2023', 'dd-mm-yyyy'), 'Y', '009934088', '480284180', 44996, 88457);
commit;
prompt 1200 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (161641214, 'N', to_date('29-01-2023', 'dd-mm-yyyy'), 'N', '816100549', '664976546', 28984, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (653257378, 'N', to_date('23-07-2023', 'dd-mm-yyyy'), 'N', '819059056', '353521370', 55959, 75269);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (263191544, 'N', to_date('25-10-2023', 'dd-mm-yyyy'), 'Y', '338160998', '693085728', 98457, 28589);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (927565214, 'N', to_date('18-01-2023', 'dd-mm-yyyy'), 'Y', '840379495', '289304877', 61993, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (941748489, 'Y', to_date('30-11-2023', 'dd-mm-yyyy'), 'N', '781611704', '215143637', 71786, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (151954646, 'N', to_date('18-10-2023', 'dd-mm-yyyy'), 'N', '714824861', '408874915', 83722, 33156);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (696867937, 'Y', to_date('18-05-2023', 'dd-mm-yyyy'), 'Y', '083033817', '658306554', 94395, 28428);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (391495779, 'N', to_date('27-03-2023', 'dd-mm-yyyy'), 'N', '169295786', '980638570', 89243, 27123);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (722493127, 'Y', to_date('26-01-2023', 'dd-mm-yyyy'), 'N', '126139999', '590746015', 87731, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (523547844, 'Y', to_date('26-08-2023', 'dd-mm-yyyy'), 'N', '824648175', '302017993', 84454, 28811);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (966339569, 'N', to_date('18-05-2023', 'dd-mm-yyyy'), 'Y', '879327263', '607883888', 94778, 28622);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (447574757, 'N', to_date('12-03-2024', 'dd-mm-yyyy'), 'N', '448322939', '858439996', 14656, 46595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (674714191, 'N', to_date('14-03-2024', 'dd-mm-yyyy'), 'N', '307081120', '381184710', 13517, 53564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (464543445, 'Y', to_date('14-07-2023', 'dd-mm-yyyy'), 'Y', '708511967', '048646646', 44222, 71558);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (884812497, 'Y', to_date('21-08-2023', 'dd-mm-yyyy'), 'Y', '382880573', '776216289', 47741, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (814228693, 'Y', to_date('05-11-2023', 'dd-mm-yyyy'), 'Y', '392142161', '495290518', 95566, 94448);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (417573828, 'N', to_date('18-04-2023', 'dd-mm-yyyy'), 'N', '144998512', '614391180', 71553, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (531863248, 'Y', to_date('04-03-2024', 'dd-mm-yyyy'), 'Y', '254115667', '810902392', 52277, 13322);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (845224827, 'Y', to_date('22-04-2024', 'dd-mm-yyyy'), 'Y', '571220005', '766797561', 91352, 27525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (218763444, 'N', to_date('30-01-2023', 'dd-mm-yyyy'), 'N', '002554127', '735976872', 83772, 76829);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (768176637, 'Y', to_date('04-05-2023', 'dd-mm-yyyy'), 'N', '659988335', '295968888', 58944, 64678);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (574678143, 'Y', to_date('25-12-2023', 'dd-mm-yyyy'), 'N', '493961904', '082557774', 51932, 84991);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (223247428, 'N', to_date('22-03-2023', 'dd-mm-yyyy'), 'Y', '490388060', '297681739', 46796, 73163);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (764989382, 'Y', to_date('23-02-2023', 'dd-mm-yyyy'), 'Y', '485749616', '693085728', 19196, 12146);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (973171391, 'Y', to_date('27-08-2023', 'dd-mm-yyyy'), 'Y', '120237174', '957003822', 68623, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (877269599, 'Y', to_date('11-01-2023', 'dd-mm-yyyy'), 'Y', '780987486', '569879560', 91773, 95217);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (846165125, 'N', to_date('09-11-2023', 'dd-mm-yyyy'), 'N', '624208805', '450816060', 94395, 44247);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (623986738, 'Y', to_date('10-04-2024', 'dd-mm-yyyy'), 'Y', '275365706', '684744404', 52994, 32884);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (241366791, 'Y', to_date('24-11-2023', 'dd-mm-yyyy'), 'N', '072622442', '151254801', 36279, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754127983, 'Y', to_date('20-01-2023', 'dd-mm-yyyy'), 'Y', '758794404', '218095746', 69587, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (456384873, 'Y', to_date('16-05-2023', 'dd-mm-yyyy'), 'N', '610341868', '439959523', 96595, 23592);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (443863212, 'Y', to_date('16-01-2023', 'dd-mm-yyyy'), 'N', '137669479', '292509980', 86846, 27194);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (254675254, 'Y', to_date('21-01-2024', 'dd-mm-yyyy'), 'Y', '292509980', '840379495', 86895, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (944289382, 'N', to_date('16-06-2023', 'dd-mm-yyyy'), 'N', '255902165', '249125666', 79129, 78686);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (597552267, 'Y', to_date('04-04-2023', 'dd-mm-yyyy'), 'N', '318447492', '850880715', 21117, 18468);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (952189777, 'Y', to_date('08-01-2023', 'dd-mm-yyyy'), 'Y', '999821449', '381184710', 56381, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (848662299, 'N', to_date('13-02-2023', 'dd-mm-yyyy'), 'N', '816100549', '129012870', 33578, 97578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (385723434, 'Y', to_date('24-12-2023', 'dd-mm-yyyy'), 'N', '312041206', '160205383', 61144, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (494521589, 'N', to_date('29-12-2023', 'dd-mm-yyyy'), 'N', '973262503', '365883743', 31426, 71249);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (342593698, 'Y', to_date('09-02-2024', 'dd-mm-yyyy'), 'Y', '113488805', '048646646', 83772, 25485);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (269695419, 'Y', to_date('28-01-2023', 'dd-mm-yyyy'), 'Y', '934021441', '439668090', 45156, 73483);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (292188752, 'N', to_date('13-05-2023', 'dd-mm-yyyy'), 'Y', '318657191', '654060128', 64121, 29596);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (145783863, 'N', to_date('29-09-2023', 'dd-mm-yyyy'), 'Y', '921955127', '144241662', 51455, 59961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (787917917, 'Y', to_date('19-11-2023', 'dd-mm-yyyy'), 'Y', '924624068', '609343955', 57478, 88614);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (598574847, 'N', to_date('30-07-2023', 'dd-mm-yyyy'), 'N', '144998512', '438752269', 58177, 77727);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (869619631, 'N', to_date('05-05-2023', 'dd-mm-yyyy'), 'Y', '867821231', '658306554', 71786, 39559);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (191466252, 'N', to_date('30-08-2023', 'dd-mm-yyyy'), 'N', '822051253', '336451229', 25499, 68523);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (744834721, 'Y', to_date('31-03-2024', 'dd-mm-yyyy'), 'N', '158592795', '641022334', 58177, 74389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (655422748, 'Y', to_date('13-04-2023', 'dd-mm-yyyy'), 'N', '249125666', '008470299', 32254, 69472);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (935422157, 'N', to_date('27-04-2023', 'dd-mm-yyyy'), 'Y', '766363065', '392142161', 89911, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (115379924, 'Y', to_date('25-11-2023', 'dd-mm-yyyy'), 'Y', '637020775', '602276868', 98579, 23499);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (221613615, 'N', to_date('12-06-2023', 'dd-mm-yyyy'), 'N', '757024709', '973262503', 15468, 59716);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (256493524, 'N', to_date('04-11-2023', 'dd-mm-yyyy'), 'N', '264346014', '302017993', 28748, 33156);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (468563139, 'N', to_date('15-01-2023', 'dd-mm-yyyy'), 'N', '162799501', '349136279', 64121, 22894);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (274293769, 'Y', to_date('13-08-2023', 'dd-mm-yyyy'), 'N', '448322939', '591456995', 86381, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (229911932, 'N', to_date('15-01-2024', 'dd-mm-yyyy'), 'Y', '993636785', '735103801', 58186, 69472);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (458364963, 'N', to_date('02-04-2023', 'dd-mm-yyyy'), 'Y', '489718006', '745537423', 53299, 57115);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (533433832, 'N', to_date('26-11-2023', 'dd-mm-yyyy'), 'Y', '327291998', '262480569', 37672, 27651);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (626419321, 'Y', to_date('17-08-2023', 'dd-mm-yyyy'), 'Y', '693085728', '336451229', 86219, 97195);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (824933115, 'Y', to_date('10-08-2023', 'dd-mm-yyyy'), 'Y', '291511425', '245217745', 69545, 55667);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (639736941, 'Y', to_date('27-10-2023', 'dd-mm-yyyy'), 'Y', '432174519', '971326374', 37618, 81863);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (664526897, 'N', to_date('25-08-2023', 'dd-mm-yyyy'), 'Y', '942081370', '053878653', 84829, 51828);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (782337834, 'Y', to_date('04-10-2023', 'dd-mm-yyyy'), 'N', '035198344', '235438802', 46195, 96266);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (761698569, 'Y', to_date('18-01-2024', 'dd-mm-yyyy'), 'N', '371775100', '120237174', 46796, 82144);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (485812883, 'N', to_date('20-03-2024', 'dd-mm-yyyy'), 'N', '912029990', '884465511', 25749, 58584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (489768133, 'N', to_date('06-01-2023', 'dd-mm-yyyy'), 'Y', '759729703', '951860128', 37652, 32777);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (434694675, 'N', to_date('29-02-2024', 'dd-mm-yyyy'), 'Y', '370632269', '693359794', 15638, 52551);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (878641464, 'N', to_date('10-08-2023', 'dd-mm-yyyy'), 'N', '249125666', '144241662', 89243, 54848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (766865119, 'Y', to_date('04-06-2023', 'dd-mm-yyyy'), 'Y', '913942557', '615121626', 86219, 62964);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (868226469, 'N', to_date('28-01-2023', 'dd-mm-yyyy'), 'N', '955370738', '365883743', 96595, 27367);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (649262456, 'N', to_date('31-12-2023', 'dd-mm-yyyy'), 'Y', '879327263', '559736783', 78828, 85959);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (169732889, 'Y', to_date('09-07-2023', 'dd-mm-yyyy'), 'N', '064148482', '439959523', 68558, 85175);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (592374391, 'Y', to_date('05-06-2023', 'dd-mm-yyyy'), 'Y', '714371122', '589644176', 45416, 97592);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (974461337, 'N', to_date('24-11-2023', 'dd-mm-yyyy'), 'Y', '780987486', '133060414', 52994, 16364);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (555332899, 'N', to_date('01-02-2024', 'dd-mm-yyyy'), 'Y', '924624068', '795966607', 67864, 82623);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (777869248, 'Y', to_date('09-01-2024', 'dd-mm-yyyy'), 'N', '327291998', '325057906', 41326, 36433);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (382128531, 'N', to_date('19-11-2023', 'dd-mm-yyyy'), 'N', '918868012', '416239499', 95955, 97834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (333725192, 'Y', to_date('24-03-2023', 'dd-mm-yyyy'), 'Y', '937684812', '120237174', 61319, 99234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (583393248, 'N', to_date('29-03-2024', 'dd-mm-yyyy'), 'N', '178510404', '725563629', 18131, 32256);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (387265257, 'N', to_date('09-01-2023', 'dd-mm-yyyy'), 'N', '769552944', '462617863', 87731, 62216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (626241116, 'Y', to_date('13-06-2023', 'dd-mm-yyyy'), 'Y', '229266261', '071509079', 24919, 25915);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (471295661, 'N', to_date('15-02-2023', 'dd-mm-yyyy'), 'Y', '175321868', '563077478', 44222, 44652);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (537813773, 'Y', to_date('19-04-2023', 'dd-mm-yyyy'), 'Y', '570331042', '883953054', 72949, 36751);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (791377675, 'Y', to_date('03-02-2024', 'dd-mm-yyyy'), 'N', '338160998', '614391180', 55124, 71446);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (342976286, 'N', to_date('11-10-2023', 'dd-mm-yyyy'), 'Y', '686870106', '655711740', 69545, 31584);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (358978152, 'N', to_date('04-05-2023', 'dd-mm-yyyy'), 'Y', '637020775', '933237910', 25388, 78686);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (552823181, 'N', to_date('24-01-2023', 'dd-mm-yyyy'), 'Y', '187579649', '984379035', 45416, 46664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (937952791, 'Y', to_date('18-02-2023', 'dd-mm-yyyy'), 'N', '273995455', '881032236', 65853, 83517);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (585822822, 'N', to_date('10-03-2024', 'dd-mm-yyyy'), 'Y', '615121626', '589644176', 58186, 34645);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (269216598, 'Y', to_date('08-12-2023', 'dd-mm-yyyy'), 'Y', '644185876', '924624068', 58186, 97874);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (696637117, 'N', to_date('14-01-2023', 'dd-mm-yyyy'), 'N', '519174701', '131166588', 34333, 31117);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (432196939, 'Y', to_date('20-01-2023', 'dd-mm-yyyy'), 'Y', '003904199', '603911711', 94696, 51115);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (646758997, 'Y', to_date('04-01-2023', 'dd-mm-yyyy'), 'Y', '493961904', '485749616', 98616, 61456);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (529621664, 'Y', to_date('27-12-2023', 'dd-mm-yyyy'), 'N', '760837533', '529679514', 38992, 27799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (371441895, 'N', to_date('14-01-2023', 'dd-mm-yyyy'), 'Y', '160587152', '559736783', 73382, 66624);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (461838995, 'N', to_date('02-02-2023', 'dd-mm-yyyy'), 'Y', '275365706', '335018902', 51268, 35443);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (225697748, 'Y', to_date('22-03-2024', 'dd-mm-yyyy'), 'Y', '133060414', '283952085', 64265, 68342);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754239267, 'Y', to_date('25-03-2024', 'dd-mm-yyyy'), 'Y', '919897956', '937684812', 58944, 71558);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (488193624, 'N', to_date('20-03-2023', 'dd-mm-yyyy'), 'Y', '032070336', '773013219', 44422, 84859);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (952891657, 'N', to_date('23-02-2024', 'dd-mm-yyyy'), 'Y', '048142005', '018933518', 35911, 38234);
commit;
prompt 1300 records committed...
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (948923564, 'N', to_date('26-02-2024', 'dd-mm-yyyy'), 'N', '571220005', '144241662', 14757, 37447);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (925817296, 'N', to_date('29-01-2023', 'dd-mm-yyyy'), 'N', '133060414', '627820755', 61565, 18344);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (886355273, 'N', to_date('22-01-2024', 'dd-mm-yyyy'), 'Y', '313406747', '615121626', 22277, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (987758186, 'N', to_date('19-06-2023', 'dd-mm-yyyy'), 'N', '570331042', '680172578', 86947, 81435);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (373185256, 'N', to_date('17-06-2023', 'dd-mm-yyyy'), 'N', '027847108', '439668090', 46195, 59961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (495938934, 'Y', to_date('06-04-2023', 'dd-mm-yyyy'), 'N', '749011451', '285751992', 94395, 29496);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (823592384, 'N', to_date('24-09-2023', 'dd-mm-yyyy'), 'N', '382880573', '039651469', 18439, 47799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (742617896, 'Y', to_date('12-12-2023', 'dd-mm-yyyy'), 'N', '237230933', '650436166', 95955, 23661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (478892788, 'N', to_date('13-02-2023', 'dd-mm-yyyy'), 'N', '118056743', '852575300', 85689, 74389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (328313114, 'Y', to_date('07-11-2023', 'dd-mm-yyyy'), 'N', '408874915', '943811449', 55511, 27799);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (927957924, 'Y', to_date('20-05-2023', 'dd-mm-yyyy'), 'N', '931607645', '339222343', 69585, 44354);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (982686421, 'Y', to_date('01-07-2023', 'dd-mm-yyyy'), 'N', '807196691', '519174701', 55124, 18238);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (966486387, 'Y', to_date('17-02-2023', 'dd-mm-yyyy'), 'Y', '581195954', '238511855', 94696, 34645);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (494657244, 'Y', to_date('03-04-2024', 'dd-mm-yyyy'), 'Y', '934021441', '735718988', 37672, 42525);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (854451739, 'N', to_date('02-03-2023', 'dd-mm-yyyy'), 'Y', '805125593', '128369427', 54855, 32339);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (395318821, 'Y', to_date('09-01-2023', 'dd-mm-yyyy'), 'Y', '273963341', '127506315', 66926, 62719);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (761983472, 'N', to_date('22-10-2023', 'dd-mm-yyyy'), 'N', '421599017', '773999246', 51932, 14875);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (711241543, 'Y', to_date('18-03-2024', 'dd-mm-yyyy'), 'N', '371775100', '175781268', 68558, 37191);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (518755141, 'Y', to_date('27-07-2023', 'dd-mm-yyyy'), 'Y', '218095746', '071509079', 49313, 48564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (724458365, 'Y', to_date('06-10-2023', 'dd-mm-yyyy'), 'Y', '816100549', '583755012', 85739, 92575);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (839289723, 'N', to_date('23-02-2023', 'dd-mm-yyyy'), 'Y', '975087097', '903441905', 44222, 16513);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (333153253, 'N', to_date('17-10-2023', 'dd-mm-yyyy'), 'N', '151716759', '971326374', 24479, 88585);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (219252959, 'Y', to_date('31-01-2024', 'dd-mm-yyyy'), 'N', '539935524', '235438802', 65269, 61615);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (893821167, 'N', to_date('15-04-2023', 'dd-mm-yyyy'), 'N', '938023231', '187799087', 83133, 57286);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (743676315, 'Y', to_date('18-06-2023', 'dd-mm-yyyy'), 'Y', '709634152', '184623309', 91966, 62216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (674176859, 'Y', to_date('27-05-2023', 'dd-mm-yyyy'), 'Y', '769552944', '080849238', 62641, 27992);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (487148333, 'Y', to_date('14-03-2023', 'dd-mm-yyyy'), 'Y', '409938518', '912855518', 51231, 64598);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (897826954, 'N', to_date('01-07-2023', 'dd-mm-yyyy'), 'Y', '312041206', '589644176', 55395, 25521);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (912685364, 'N', to_date('31-05-2023', 'dd-mm-yyyy'), 'N', '485749616', '607883888', 68558, 27563);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (374167228, 'N', to_date('11-10-2023', 'dd-mm-yyyy'), 'Y', '160752957', '693359794', 14132, 61456);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (826284547, 'Y', to_date('25-09-2023', 'dd-mm-yyyy'), 'N', '771995680', '591921979', 56469, 74357);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (726997884, 'Y', to_date('21-12-2023', 'dd-mm-yyyy'), 'N', '948688656', '569879560', 16941, 73425);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (342371228, 'Y', to_date('27-04-2023', 'dd-mm-yyyy'), 'Y', '259941739', '243237202', 39145, 63859);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (491154381, 'Y', to_date('29-04-2023', 'dd-mm-yyyy'), 'N', '327770767', '292509980', 85267, 64759);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (482438393, 'N', to_date('05-07-2023', 'dd-mm-yyyy'), 'Y', '773999246', '071856120', 76974, 32848);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (582927745, 'N', to_date('12-04-2023', 'dd-mm-yyyy'), 'Y', '031240584', '234623164', 96963, 51828);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129392731, 'N', to_date('01-11-2023', 'dd-mm-yyyy'), 'Y', '323308058', '589644176', 88768, 91868);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (938546496, 'N', to_date('13-06-2023', 'dd-mm-yyyy'), 'N', '696511331', '644185876', 59261, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (522866413, 'N', to_date('08-05-2023', 'dd-mm-yyyy'), 'Y', '833298755', '358023527', 35331, 89568);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (457894334, 'N', to_date('26-04-2024', 'dd-mm-yyyy'), 'N', '057913650', '940598817', 94184, 87375);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (414367985, 'N', to_date('15-04-2023', 'dd-mm-yyyy'), 'N', '262097637', '193556691', 69587, 45358);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (472928212, 'N', to_date('22-03-2023', 'dd-mm-yyyy'), 'Y', '816100549', '629219354', 96858, 45119);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (647993143, 'N', to_date('27-01-2023', 'dd-mm-yyyy'), 'Y', '593607007', '798318022', 48969, 61216);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (181625185, 'Y', to_date('03-09-2023', 'dd-mm-yyyy'), 'Y', '714371122', '243227351', 88291, 68664);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (128511116, 'N', to_date('27-04-2024', 'dd-mm-yyyy'), 'N', '773999246', '033712611', 24379, 59672);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (468345423, 'N', to_date('19-05-2023', 'dd-mm-yyyy'), 'N', '559736783', '485394887', 32254, 57416);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (341577468, 'N', to_date('02-03-2024', 'dd-mm-yyyy'), 'N', '924624068', '852882111', 87316, 49189);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (378154866, 'N', to_date('28-07-2023', 'dd-mm-yyyy'), 'N', '004437338', '014700822', 97475, 83517);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (877266424, 'Y', to_date('09-04-2023', 'dd-mm-yyyy'), 'N', '982871108', '238348956', 15638, 28595);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (168734958, 'N', to_date('31-08-2023', 'dd-mm-yyyy'), 'N', '955370738', '684744404', 61993, 32725);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (681362262, 'N', to_date('17-02-2023', 'dd-mm-yyyy'), 'Y', '004214981', '288128062', 56366, 87569);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (965864158, 'N', to_date('04-12-2023', 'dd-mm-yyyy'), 'Y', '141337002', '320079562', 75561, 57286);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (836721811, 'Y', to_date('13-06-2023', 'dd-mm-yyyy'), 'N', '087806495', '193556691', 51447, 43121);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (366597363, 'Y', to_date('22-02-2024', 'dd-mm-yyyy'), 'N', '375496232', '958905680', 65295, 42465);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (923639384, 'Y', to_date('10-06-2023', 'dd-mm-yyyy'), 'N', '268303729', '175321868', 51611, 59716);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (672743845, 'Y', to_date('20-08-2023', 'dd-mm-yyyy'), 'N', '574670543', '569849442', 78954, 36946);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (466164338, 'Y', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '664166389', '590746015', 57991, 37469);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (674346898, 'Y', to_date('22-11-2023', 'dd-mm-yyyy'), 'N', '478202044', '243034980', 25388, 95781);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (568816771, 'N', to_date('02-08-2023', 'dd-mm-yyyy'), 'Y', '323308058', '769552944', 16941, 47582);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (616398172, 'Y', to_date('10-04-2023', 'dd-mm-yyyy'), 'N', '993636785', '235438802', 18131, 85637);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (279331124, 'Y', to_date('12-10-2023', 'dd-mm-yyyy'), 'N', '460950567', '256967718', 85463, 62869);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (722887463, 'Y', to_date('25-08-2023', 'dd-mm-yyyy'), 'N', '003904199', '769552944', 36945, 48564);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (382631811, 'N', to_date('22-09-2023', 'dd-mm-yyyy'), 'Y', '137669479', '615121626', 99338, 61998);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (847784597, 'N', to_date('29-09-2023', 'dd-mm-yyyy'), 'Y', '409938518', '229837931', 85463, 23661);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (111664517, 'Y', to_date('29-03-2024', 'dd-mm-yyyy'), 'N', '539087374', '408874915', 24344, 99192);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (579488177, 'N', to_date('23-02-2023', 'dd-mm-yyyy'), 'Y', '126139999', '987544346', 37634, 38234);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (188844373, 'Y', to_date('06-01-2023', 'dd-mm-yyyy'), 'Y', '781611704', '435616074', 25499, 54114);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (397974412, 'N', to_date('16-08-2023', 'dd-mm-yyyy'), 'N', '036492757', '627820755', 55879, 43121);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (215641469, 'Y', to_date('23-11-2023', 'dd-mm-yyyy'), 'N', '155290755', '439959523', 48969, 59672);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (219331171, 'Y', to_date('18-10-2023', 'dd-mm-yyyy'), 'N', '144998512', '652327528', 78789, 56389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (277751811, 'N', to_date('09-08-2023', 'dd-mm-yyyy'), 'N', '731452579', '297681739', 66743, 78686);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (248954298, 'Y', to_date('23-02-2023', 'dd-mm-yyyy'), 'N', '327770767', '735718988', 77488, 14242);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (754163764, 'Y', to_date('19-09-2023', 'dd-mm-yyyy'), 'Y', '833298755', '986571242', 93651, 57957);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (147126949, 'Y', to_date('02-05-2023', 'dd-mm-yyyy'), 'Y', '664166389', '664976546', 57583, 22853);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (197775758, 'Y', to_date('26-12-2023', 'dd-mm-yyyy'), 'Y', '652371262', '529679514', 83772, 38961);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (338844514, 'Y', to_date('19-03-2024', 'dd-mm-yyyy'), 'Y', '032070336', '197068774', 58434, 87267);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (459151737, 'Y', to_date('12-09-2023', 'dd-mm-yyyy'), 'Y', '384427644', '966583525', 29371, 55239);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (129782652, 'Y', to_date('30-10-2023', 'dd-mm-yyyy'), 'N', '525011460', '258054874', 67426, 47823);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (534628395, 'Y', to_date('24-04-2024', 'dd-mm-yyyy'), 'Y', '359598513', '555029781', 44671, 43162);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (376286286, 'N', to_date('27-09-2023', 'dd-mm-yyyy'), 'N', '091115833', '840379495', 15638, 84123);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (236862898, 'Y', to_date('28-02-2024', 'dd-mm-yyyy'), 'Y', '833298755', '517900008', 96762, 28622);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (888294944, 'Y', to_date('10-09-2023', 'dd-mm-yyyy'), 'Y', '798435974', '943811449', 49573, 18172);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (542181939, 'Y', to_date('29-09-2023', 'dd-mm-yyyy'), 'N', '104654240', '184623309', 24169, 33156);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (284755525, 'Y', to_date('14-04-2024', 'dd-mm-yyyy'), 'Y', '699031142', '705852145', 77488, 24263);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (949161839, 'Y', to_date('04-02-2023', 'dd-mm-yyyy'), 'N', '455747246', '004214981', 36814, 73425);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (634125351, 'N', to_date('26-04-2024', 'dd-mm-yyyy'), 'N', '881032236', '336451229', 51931, 89372);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (369435774, 'Y', to_date('05-02-2023', 'dd-mm-yyyy'), 'N', '238418580', '483453321', 35785, 68949);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (323436725, 'Y', to_date('08-06-2023', 'dd-mm-yyyy'), 'N', '368067148', '184623309', 39269, 32777);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (262459613, 'Y', to_date('25-02-2024', 'dd-mm-yyyy'), 'N', '756743030', '151254801', 41326, 34187);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (964766255, 'N', to_date('17-06-2023', 'dd-mm-yyyy'), 'Y', '318308556', '549782997', 58186, 97834);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (348177695, 'Y', to_date('12-07-2023', 'dd-mm-yyyy'), 'N', '409938518', '684307055', 22689, 56389);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (243549712, 'Y', to_date('31-01-2023', 'dd-mm-yyyy'), 'N', '805125593', '852882111', 71948, 89689);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (613169555, 'N', to_date('30-04-2023', 'dd-mm-yyyy'), 'N', '577641871', '823811487', 69545, 49938);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (425155435, 'N', to_date('06-03-2023', 'dd-mm-yyyy'), 'Y', '982871108', '655711740', 77481, 74798);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (231768159, 'N', to_date('09-11-2023', 'dd-mm-yyyy'), 'Y', '585289028', '315420007', 44955, 95258);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (651537353, 'N', to_date('19-02-2024', 'dd-mm-yyyy'), 'N', '975087097', '549198520', 17435, 21394);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (898256996, 'Y', to_date('08-08-2023', 'dd-mm-yyyy'), 'Y', '855872783', '152572605', 12956, 97578);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (877467111, 'Y', to_date('19-03-2023', 'dd-mm-yyyy'), 'Y', '943811449', '165537016', 48969, 68342);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (134258658, 'N', to_date('29-03-2023', 'dd-mm-yyyy'), 'N', '833298755', '229837931', 86381, 45358);
insert into DONATION (donation_id, pass_tests, donation_date, valid, paramedic_id, donor_id, place_id, hospital_id)
values (688273638, 'Y', to_date('02-11-2023', 'dd-mm-yyyy'), 'Y', '064148482', '302017993', 89948, 98857);
commit;
prompt 1400 records loaded
prompt Loading PERSON_PHONE_NUMBER...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-004-3135', '189173569');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-007-9305', '612006367');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-014-2476', '605263411');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-045-5607', '636744011');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-051-1758', '072622442');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-084-4089', '566880805');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-084-6327', '242952342');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-087-7147', '234448967');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-092-1546', '692375929');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-097-1581', '938023231');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-119-7156', '594359980');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-130-0594', '681119933');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-143-4297', '541529973');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-162-2311', '492686052');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-178-0760', '323308058');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-196-9015', '683868829');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-201-9626', '385432292');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-202-9171', '173555218');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-207-1721', '943811449');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-207-2708', '093051335');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-211-1285', '790611373');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-224-3187', '957003822');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-237-7376', '053144728');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-249-0760', '904803417');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-277-2182', '206021383');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-293-3754', '591978627');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-334-5418', '413614582');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-336-4323', '311853595');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-344-4465', '278152544');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-353-5007', '312041206');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-355-5832', '266267564');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-362-1846', '233658208');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-365-0841', '007507474');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-393-8279', '408874915');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-393-9832', '511568325');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-399-2703', '423925364');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-408-4072', '558068638');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-423-2446', '206021383');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-436-2289', '215396573');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-440-8949', '826779473');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-477-9956', '339222343');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-534-0062', '477653417');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-541-0997', '915523925');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-570-0173', '122884225');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-591-3851', '680172578');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-602-6361', '850736037');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-604-2527', '759729703');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-624-1062', '339713112');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-636-4280', '289304877');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-644-0595', '426187630');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-663-0804', '746215683');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-672-6366', '408778591');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-673-2903', '650436166');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-673-5850', '915523925');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-677-1777', '799097031');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-680-6226', '245843519');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-700-9075', '858439996');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-705-5945', '773341434');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-711-4823', '242316965');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-726-2050', '402786140');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-736-8618', '609343955');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-743-4946', '160539133');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-755-5113', '563077478');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-758-6029', '591456995');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-783-4975', '823811487');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-796-9772', '541317968');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-808-6607', '912855518');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-822-1121', '433660379');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-830-5812', '959837164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-846-1666', '553866781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-856-8253', '555029781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-859-2638', '700886061');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-874-5994', '307081120');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-884-9009', '555029781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-890-5480', '338800563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-899-5123', '048646646');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-926-7665', '158592795');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-941-7996', '689521503');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-951-0739', '511568325');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-951-1454', '551911744');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-976-3551', '051082800');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('050-991-6195', '206021383');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-013-9815', '363800111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-017-8780', '527027619');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-025-1094', '214371905');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-026-5883', '277620976');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-039-4053', '154805861');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-055-4759', '328315189');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-069-3729', '100752928');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-075-0071', '385327967');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-080-0037', '781615940');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-083-9997', '103951857');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-085-1623', '127774563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-097-9346', '499419072');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-135-3147', '933237910');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-140-9574', '889872686');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-146-1616', '780987486');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-153-7351', '093051335');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-154-6336', '424854643');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-157-0598', '234623164');
commit;
prompt 100 records committed...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-159-0861', '087806495');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-167-9522', '243237202');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-175-4742', '735680597');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-177-1829', '686870106');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-181-9990', '338160998');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-185-7430', '810335751');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-187-8299', '652031992');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-189-0857', '243329904');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-201-0216', '841337498');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-223-9312', '230926425');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-234-6613', '320079562');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-239-7273', '137408341');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-247-8583', '564292169');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-259-8976', '047437879');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-260-5159', '754632393');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-266-9589', '955866429');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-278-9490', '928837486');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-289-5477', '315420007');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-300-0620', '009278966');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-315-4049', '651709121');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-317-2229', '852517928');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-325-9095', '470059781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-339-6353', '485749616');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-351-5247', '046919723');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-370-5984', '048142005');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-385-8180', '971155219');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-387-7954', '663516006');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-404-1254', '621900616');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-410-2920', '918868012');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-411-2514', '005988217');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-422-9066', '249125666');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-425-4372', '837205710');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-441-3391', '314936445');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-444-3361', '104654240');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-450-9025', '818785981');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-458-1751', '877800245');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-463-0568', '229837931');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-474-3341', '657771509');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-491-0392', '068567763');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-504-8633', '403751552');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-507-0989', '720298946');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-508-9404', '807343932');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-511-1831', '456099156');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-574-1022', '215396573');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-580-4145', '325174227');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-608-7355', '773013219');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-635-3272', '502582320');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-658-1551', '585289028');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-660-3671', '667896819');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-668-7534', '611719441');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-679-9007', '984430684');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-687-8307', '495883869');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-511-0213', '798850878');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-527-1037', '441166212');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-529-0547', '894820834');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-535-9801', '058207275');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-539-8568', '315420007');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-543-0718', '060862838');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-547-8302', '190954933');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-550-7962', '499419072');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-553-7955', '816100549');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-558-1914', '948688656');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-567-1382', '137727593');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-595-1617', '508924600');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-601-1889', '585289028');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-602-9940', '818785981');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-610-7247', '369093284');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-617-9482', '898554198');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-646-7975', '353521370');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-659-9382', '553172301');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-663-1855', '824629561');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-664-8631', '007507474');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-669-6815', '998752021');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-673-2769', '599521985');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-677-8696', '001389140');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-683-8164', '946938069');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-687-5126', '859643900');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-694-2232', '455747246');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-697-6002', '333348436');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-699-3289', '144241662');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-715-2344', '591921979');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-726-0964', '987133432');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-730-1640', '704300951');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-740-2740', '169349395');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-755-8330', '637020775');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-755-9508', '501142152');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-775-0195', '320079562');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-782-4015', '472188320');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-811-6934', '517920020');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-815-5138', '057913650');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-827-0377', '968732165');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-843-3668', '048335437');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-857-4293', '568104707');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-866-2866', '155686878');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-867-5281', '311853595');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-875-8426', '288128062');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-878-1253', '085605134');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-879-6193', '727983845');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-891-3766', '450416883');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-909-6751', '313406747');
commit;
prompt 200 records committed...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-941-2031', '025463211');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-945-8231', '714371122');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-951-1126', '395530762');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-977-8223', '060735713');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-979-9120', '541317968');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-982-3846', '254115667');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-989-7863', '918868012');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-995-6038', '957003822');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-001-7346', '049091541');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-009-5421', '312041206');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-011-6328', '044352560');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-012-8578', '299296442');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-029-7630', '151249354');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-030-7291', '741067991');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-037-6255', '961032191');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-038-2081', '307500304');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-045-3758', '805125593');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-046-8463', '014472246');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-068-4488', '230926425');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-071-2979', '358565731');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-076-3572', '998752021');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-078-9278', '072622442');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-119-1732', '219741983');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-132-6158', '736496191');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-145-1824', '936071589');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-156-9189', '971155219');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-188-3747', '671348563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-248-4656', '341181722');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-249-3092', '757024709');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-252-6136', '856916785');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-256-5889', '756743030');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-265-8325', '292203959');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-309-3545', '216860273');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-344-2566', '358023527');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-374-1234', '852575300');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-375-1815', '632140770');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-397-4617', '499419072');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-412-7990', '484654164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-430-1817', '117282105');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-430-4085', '115073052');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-448-5958', '127611024');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-470-3819', '632140770');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-484-9964', '552163784');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-489-4219', '374563910');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-490-1411', '729784083');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-499-2613', '650436166');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-520-4379', '915820055');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-524-3122', '951406869');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-540-5462', '804262485');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-563-8465', '132122147');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-586-1241', '566372714');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-589-1927', '318657191');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-589-3221', '313233834');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-610-3176', '755920284');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-625-4931', '431602139');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-630-3887', '370632269');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-640-4321', '529168900');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-655-1498', '439668090');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-660-6511', '472407924');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-667-6147', '725569007');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-679-6481', '814578172');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-700-9766', '085390024');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-727-5328', '356366312');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-732-8902', '688241765');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-738-7724', '154075422');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-743-4742', '108104963');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-772-2555', '105199084');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-776-6497', '678665314');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-795-0981', '046919723');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-808-3125', '571220005');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-826-3557', '975197627');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-827-5653', '999833209');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-840-0137', '852882111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-846-9245', '824399945');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-861-0080', '652371262');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-873-7060', '300360696');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-894-8926', '167068855');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-898-5129', '559736783');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-899-7955', '714738586');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-901-3156', '499419072');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-920-1521', '681119933');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-924-9403', '735454477');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-934-0608', '147206940');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-936-5938', '014472246');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-954-9863', '568320004');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-962-1343', '084607020');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-976-9929', '682887687');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('054-995-0558', '852517928');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-049-7393', '268303729');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-051-2359', '641022334');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-057-5060', '053440950');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-073-4673', '288392205');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-075-6088', '664257780');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-078-6417', '234623164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-098-9581', '844961356');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-107-9882', '553866781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-114-3283', '850092806');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-119-4436', '708511967');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-149-3001', '431602139');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-180-6220', '126139999');
commit;
prompt 300 records committed...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-203-0728', '064148482');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-212-2494', '058207275');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-222-0160', '100752928');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-231-3276', '062725544');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-236-8284', '435616074');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-244-7661', '499419072');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-246-7385', '210887015');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-248-0324', '307081120');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-250-7475', '246530018');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-254-2641', '529679514');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-263-1136', '871930292');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-268-0437', '650436166');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-271-5262', '364367353');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-274-6848', '395530762');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-276-4262', '062801371');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-293-4912', '318741729');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-303-5646', '889872686');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-314-6752', '553866781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-319-8610', '852882111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-320-7524', '119591809');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-324-6025', '664166389');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-343-4690', '408778591');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-344-6585', '151249354');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-354-9584', '940553428');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-360-2389', '002413679');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-369-4990', '085605134');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-380-6113', '409938518');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-390-0113', '779545472');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-390-0309', '596134137');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-396-5015', '798850878');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-399-9061', '744075988');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-403-9866', '843478897');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-406-7774', '579208908');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-456-1989', '203168013');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-462-2271', '358504098');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-480-2379', '320079562');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-504-5273', '801867813');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-505-3818', '566372714');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-515-3073', '315420007');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-519-8744', '766363065');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-546-7023', '894820834');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-563-6501', '850880715');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-578-0893', '318657191');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-578-7963', '359802512');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-615-1659', '048142005');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-616-4698', '102088648');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-623-8390', '905128014');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-634-0574', '901831943');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-652-8810', '687549039');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-741-9066', '799167503');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-742-4256', '971155219');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-749-4174', '722968346');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-765-3132', '775083908');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-815-9883', '976460507');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-818-2192', '735069057');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-824-3515', '629228565');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-828-2541', '909626210');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-829-4420', '205345717');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-830-7403', '790611373');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-840-8721', '937748671');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-860-2432', '485182489');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-870-3485', '291811666');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-883-7283', '605263411');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-891-1769', '470059781');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-899-0439', '555092086');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-899-9123', '262480569');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-906-5495', '671348563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-924-6119', '581195954');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-924-8852', '846145465');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-925-6067', '824648175');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-926-3255', '804262485');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-932-1173', '313233834');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-934-3242', '683868829');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-939-3415', '165821288');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-954-3179', '663516006');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-971-2090', '771703424');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-982-7325', '035198344');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-986-7059', '027326738');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-989-0738', '425467041');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-994-5296', '786181809');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('055-999-6222', '333348436');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-001-4402', '159478573');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-008-9654', '148634100');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-010-8931', '996383746');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-089-6804', '694103782');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-126-9979', '571220005');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-133-4194', '869446489');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-136-2436', '897793693');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-140-6466', '255902165');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-155-1680', '328635747');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-171-1251', '384427644');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-183-8492', '892697604');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-196-8735', '371881430');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-205-1538', '371775100');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-208-3495', '122410288');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-242-7435', '318308556');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-243-2301', '881618330');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-275-9335', '913942557');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-298-5048', '667896819');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-321-2186', '601914969');
commit;
prompt 400 records committed...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-326-4495', '160205383');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-336-1613', '025814164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-336-3082', '240100155');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-343-8372', '164927027');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-358-0735', '692936013');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-365-2152', '116730303');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-372-8322', '289479099');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-388-6629', '314936445');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-405-5740', '129012870');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-416-9653', '164633012');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-425-9448', '137727593');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-430-0906', '716522491');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-467-8731', '635348517');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-494-2741', '940553428');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-542-6149', '999821449');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-555-7830', '551911744');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-578-9180', '937580305');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-586-1439', '824399945');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-600-1669', '571485844');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-609-4216', '957767584');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-640-2744', '733752111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-641-9187', '033422444');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-655-8553', '373058261');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-670-1509', '984379035');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-672-2975', '987143521');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-678-8356', '522338180');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-692-3636', '160587152');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-697-0979', '335140071');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-721-4697', '662192261');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-760-0682', '448322939');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-764-8844', '321643516');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-765-3131', '060735713');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-773-7213', '758274846');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-777-2786', '781568676');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-783-1967', '014391481');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-784-3578', '883233226');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-792-0183', '814578172');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-795-5146', '122410288');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-801-0192', '571442972');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-803-1638', '914381355');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-811-9330', '452597433');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-818-1541', '165166680');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-821-1125', '135856510');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-851-0799', '851082137');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-862-2941', '693085728');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-862-5971', '843853299');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-884-2039', '696814618');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-898-8999', '692936013');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-904-4747', '238418580');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-911-5249', '306519991');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-914-1421', '379738455');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-945-2975', '693992628');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-979-3239', '165537016');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('058-985-7900', '175781268');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-700-5463', '286991816');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-719-3678', '817077179');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-726-5527', '577641871');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-736-2557', '825718771');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-759-5790', '416239499');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-763-3748', '919897956');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-770-4697', '194954711');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-771-0762', '656361203');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-771-8613', '570331042');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-772-8465', '752785736');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-778-0345', '847649340');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-783-3928', '720298946');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-787-8210', '909147578');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-789-3817', '971987270');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-790-0047', '408778591');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-802-0403', '693359794');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-826-9672', '843478897');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-844-3100', '285751992');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-845-1933', '542989613');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-852-6041', '703928930');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-904-3132', '049091541');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-940-9087', '064148482');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-952-4256', '766797561');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-963-5766', '739957966');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-966-9973', '197150109');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-982-4520', '841337498');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('051-990-5826', '671348563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-033-5296', '813092669');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-047-3738', '187799087');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-052-8871', '184623309');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-064-8600', '414116543');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-074-7854', '741343717');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-087-7099', '283302396');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-090-3199', '044901032');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-107-1837', '709634152');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-111-7142', '448322939');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-133-3798', '740704902');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-138-3675', '895770231');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-156-0690', '805079576');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-166-8090', '561743365');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-168-2063', '975197627');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-181-6630', '509099107');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-204-2192', '654249625');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-205-5670', '363303405');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-212-6648', '973262503');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-261-4387', '503465463');
commit;
prompt 500 records committed...
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-261-7881', '168999525');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-265-3989', '687549039');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-283-5431', '116730303');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-285-2149', '852882111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-295-3355', '381184710');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-298-2941', '335018902');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-314-7930', '853599144');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-322-2041', '863266868');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-358-8705', '215396573');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-377-8461', '441166212');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-396-1181', '363800111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-406-9533', '607145805');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-407-7401', '405976889');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-418-9730', '102771731');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-425-7799', '137727593');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-459-2280', '490885968');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-480-6310', '175781268');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-481-3057', '959837164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-511-7267', '645206623');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-517-9624', '238348956');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-521-0748', '313406747');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-524-0352', '760837533');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-528-8381', '233658208');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-555-0972', '408778591');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-557-3320', '371881430');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-614-1407', '580713986');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-625-4496', '813092669');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-639-7070', '363800111');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-653-1706', '993636785');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-709-0661', '541529973');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-711-1433', '799097031');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-720-8294', '692642433');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-723-9951', '955370738');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-728-6382', '128122177');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-733-9003', '313406747');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-771-0751', '671348563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-792-1597', '291811666');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-792-6350', '901831943');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-836-0647', '422090889');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-840-7250', '602276868');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-853-6973', '449103116');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-863-0689', '286100323');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-891-8778', '501142152');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-921-6102', '025800738');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-925-1550', '566372714');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-946-1363', '133060414');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-946-3371', '394672992');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-954-0835', '679634057');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-955-7925', '122410288');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-975-4267', '245843519');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-981-2931', '819059056');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-987-9012', '014391481');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('052-993-9617', '402786140');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-017-7117', '871894052');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-039-2934', '037723814');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-041-2645', '492686052');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-053-6768', '338800563');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-058-4784', '746215683');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-082-7101', '462570473');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-096-6962', '072622442');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-103-0343', '723445327');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-125-6257', '292509980');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-172-3111', '159478573');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-178-1054', '987143521');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-180-1052', '945997798');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-196-1609', '834188366');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-204-6556', '539682561');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-209-1930', '915523925');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-209-8007', '004214981');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-213-5158', '775083908');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-219-9158', '298645671');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-233-4721', '568104707');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-238-9077', '366643188');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-243-5146', '484654164');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-246-7976', '937684812');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-256-1596', '140218590');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-265-6770', '569879560');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-281-0468', '240100155');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-292-8406', '982871108');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-296-4777', '940598817');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-296-5325', '074081051');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-302-5433', '072168409');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-334-4194', '870604477');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-347-5334', '635348517');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-348-1954', '197068774');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-351-8603', '693992628');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-358-0222', '979142513');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-371-1850', '334670235');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-385-8364', '669496513');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-418-5395', '491908247');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-422-9382', '534952370');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-438-1894', '850092806');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-450-9159', '723421602');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-455-9739', '240100155');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-459-0932', '197150109');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-461-2016', '987544346');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-468-1860', '035198344');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-489-5250', '678488732');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-491-9046', '184623309');
insert into PERSON_PHONE_NUMBER (phone_number, pid)
values ('053-496-0691', '283952085');
commit;
prompt 600 records loaded
prompt Enabling foreign key constraints for DONOR...
alter table DONOR enable constraint SYS_C007179;
alter table DONOR enable constraint SYS_C007180;
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C007168;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C007187;
alter table DONATION enable constraint SYS_C007188;
alter table DONATION enable constraint SYS_C007189;
alter table DONATION enable constraint SYS_C007190;
prompt Enabling foreign key constraints for PERSON_PHONE_NUMBER...
alter table PERSON_PHONE_NUMBER enable constraint SYS_C007172;
prompt Enabling triggers for BLOOD...
alter table BLOOD enable all triggers;
prompt Enabling triggers for DONATION_PLACE...
alter table DONATION_PLACE enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for RECEIVER...
alter table RECEIVER enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for PERSON_PHONE_NUMBER...
alter table PERSON_PHONE_NUMBER enable all triggers;
set feedback on
set define on
prompt Done.
