--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence NEWS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MAX"."NEWS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ROLE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MAX"."ROLE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MAX"."USER_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table AUTHORITIES
--------------------------------------------------------

  CREATE TABLE "MAX"."AUTHORITIES" 
   (	"USERNAME" VARCHAR2(50 BYTE), 
	"AUTHORITY" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table NEWS
--------------------------------------------------------

  CREATE TABLE "MAX"."NEWS" 
   (	"ID" NUMBER(10,0), 
	"TITLE" VARCHAR2(128 BYTE), 
	"BRIEF" VARCHAR2(256 BYTE), 
	"CONTENT" VARCHAR2(2048 BYTE), 
	"NEWS_DATE" DATE, 
	"LANG" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ROLE_NEWS
--------------------------------------------------------

  CREATE TABLE "MAX"."ROLE_NEWS" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "MAX"."USERS" 
   (	"USERNAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"ENABLED" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_NEWS
--------------------------------------------------------

  CREATE TABLE "MAX"."USER_NEWS" 
   (	"ID" NUMBER(10,0), 
	"LOGIN" VARCHAR2(64 BYTE), 
	"PASSWORD" VARCHAR2(64 BYTE), 
	"ROLE_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into max.AUTHORITIES
SET DEFINE OFF;
Insert into max.AUTHORITIES (USERNAME,AUTHORITY) values ('john','ROLE_EMPLOYEE');
Insert into max.AUTHORITIES (USERNAME,AUTHORITY) values ('mary','ROLE_EMPLOYEE');
Insert into max.AUTHORITIES (USERNAME,AUTHORITY) values ('mary','ROLE_MANAGER');
Insert into max.AUTHORITIES (USERNAME,AUTHORITY) values ('susan','ROLE_ADMIN');
Insert into max.AUTHORITIES (USERNAME,AUTHORITY) values ('susan','ROLE_EMPLOYEE');
REM INSERTING into max.NEWS
SET DEFINE OFF;
Insert into max.NEWS (ID,TITLE,BRIEF,CONTENT,NEWS_DATE,LANG) values (205,'???????? ????: ????? Java ??????????? 25 ???','???? ?? ????? ?????????? ?????? ???????????????? Java ????????? ?????????????????? ??????. ','???? ??????? Java ????? ? 1991 ????. ?????? ????? ?????? ????????????? ???????? Sun Microsystems (???????????? ??????????? ??????????? Oracle) ??? ???????????? ??????? ???????? (James Gosling) ?????????? ? ???????? ????? Oak ??? ????????????? ? ???????? ??????? ???????????. ?????? ??? ????????? ??????? ??????????? ?????? ????????, ??????????????? ??????????? ?????? ????????????-???????????? ????? ????????????????, ???????? ???? ? ??????????? ???????? ???????? ??????? ????????-??????????.

? 1995 ???? ???? Oak ??? ???????????? ? Java ? ???????? ??????? ??????????? ????????? ????????? ??????????? ?????? Java Virtual Machine (JVM) ? ??????? Netscape. ? ????? ??????? ???????????? Java, ??????? ??? ???????? ?????????? ????????? ?? ?????? ?????????? ?????????? ??? ??????????? ?? ???????????? ? ??? ???????? ???????????, ????? ????? ????????? ???????, ? ??? ???? ????? ?????????? ??????????? ?? ???? ???????? IT-?????????. Java ???????? ? ? ?????????? NASA, ? ? ??????? ???????? ??????????. ? ? ???????????? ????? ??? ???????? ??????????, ????????? ??????????, ??????????? ? ???? ?????-?????, ????? ?????????? ?? Java.
',to_date('26-MAY-20','DD-MON-RR'),'ru');
Insert into max.NEWS (ID,TITLE,BRIEF,CONTENT,NEWS_DATE,LANG) values (204,'
YouTube, Twitter and Facebook remove Steve Bannon video calling for violence against Fauci','Twitter, YouTube and Facebook took action against the account of Steve Bannon''s podcast on Thursday evening, after the former White House chief strategist called for the beheading of Dr. Anthony Fauci, the nation''s top infectious disease expert. 
','Twitter said it "permanently suspended" the account, @WarRoomPandemic, for violating its policy against glorifying violence. 

YouTube said it took down the video for breaking rules against inciting violence, and issued a strike against the account. Under the Google-owned video platform''s three-strikes policy, the offender cannot upload videos for at least a week after the violation. 

Facebook, which Bannon used to livestream the podcast, said it removed two videos from his official page for breaking rules around inciting violence.

Read more: Complete election coverage

Bannon didn''t immediately respond to a request for comment.

The takedowns come as the US anxiously awaits the results of Tuesday''s presidential election. As vote count continues, tech giants have sought to police their platforms against misinformation and toxic content. Twitter and Facebook have flagged posts by President Donald Trump, who has baselessly claimed the election was marred by voter fraud. YouTube has been criticized for refusing to take down two videos by One America News, a far-right news organization that falsely declared victory for Trump. 

In response to the Bannon video on Thursday, YouTube spokesman Alex Joseph said, "We will continue to be vigilant as we enforce our policies in the post-election period."',to_date('05-NOV-20','DD-MON-RR'),'en');
Insert into max.NEWS (ID,TITLE,BRIEF,CONTENT,NEWS_DATE,LANG) values (3,'Trump trashes Fauci','Trump trashes Fauci and makes baseless coronavirus claims in campaign call','A frustrated and at times foul-mouthed President Donald Trump claimed on a campaign call that people are tired of hearing about the deadly pandemic which has killed more than 215,000 Americans and trashed Dr. Anthony Fauci as a "disaster" who has been around for "500 years."

Referring to Fauci and other health officials as "idiots," Trump declared the country ready to move on from the health disaster, even as cases are again spiking and medical experts warn the worst may be yet to come.
Baselessly claiming that if Fauci was in charge more than half a million people would be dead in the United States, Trump portrayed the recommendations offered by his own administration to mitigate spread of the disease as a burdensome annoyance.
"People are tired of Covid. I have these huge rallies," Trump said, phoning into a call with campaign staff from his namesake hotel in Las Vegas, where he spent two nights amid a western campaign swing. "People are saying whatever. Just leave us alone. They''re tired of it. People are tired of hearing Fauci and all these idiots."
"Fauci is a nice guy," Trump went on. "He''s been here for 500 years."
Fauci has been the director of the National Institute of Allergy and Infectious Diseases since 1984 and is a member of the White House Coronavirus Task Force. At almost the same time Trump was fuming on the phone, Fauci was being awarded the National Academy of Medicine''s first-ever Presidential Citation for Exemplary Leadership during a virtual ceremony. Fauci said that he was "speechless" while receiving the recognition.',to_date('08-OCT-20','DD-MON-RR'),'en');
REM INSERTING into max.ROLE_NEWS
SET DEFINE OFF;
Insert into max.ROLE_NEWS (ID,NAME) values (1,'admin');
Insert into max.ROLE_NEWS (ID,NAME) values (2,'user');
Insert into max.ROLE_NEWS (ID,NAME) values (3,'TEST');
REM INSERTING into max.USERS
SET DEFINE OFF;
Insert into max.USERS (USERNAME,PASSWORD,ENABLED) values ('john','{noop}test123',1);
Insert into max.USERS (USERNAME,PASSWORD,ENABLED) values ('mary','{noop}test123',1);
Insert into max.USERS (USERNAME,PASSWORD,ENABLED) values ('susan','{noop}test123',1);
REM INSERTING into max.USER_NEWS
SET DEFINE OFF;
Insert into max.USER_NEWS (ID,LOGIN,PASSWORD,ROLE_ID) values (1,'admin','admin',1);
Insert into max.USER_NEWS (ID,LOGIN,PASSWORD,ROLE_ID) values (2,'user','user',2);
Insert into max.USER_NEWS (ID,LOGIN,PASSWORD,ROLE_ID) values (3,'test','test',4);
--------------------------------------------------------
--  DDL for Index AUTHORITIES_IDX_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAX"."AUTHORITIES_IDX_1" ON "MAX"."AUTHORITIES" ("USERNAME", "AUTHORITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index NEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAX"."NEWS_PK" ON "MAX"."NEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ROLE_NEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAX"."ROLE_NEWS_PK" ON "MAX"."ROLE_NEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAX"."TABLE1_PK" ON "MAX"."USER_NEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MAX"."USERS_PK" ON "MAX"."USERS" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "MAX"."USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "MAX"."AUTHORITIES" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "MAX"."AUTHORITIES" MODIFY ("AUTHORITY" NOT NULL ENABLE);
  ALTER TABLE "MAX"."AUTHORITIES" ADD CONSTRAINT "AUTHORITIES_IDX_1" UNIQUE ("USERNAME", "AUTHORITY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ROLE_NEWS
--------------------------------------------------------

  ALTER TABLE "MAX"."ROLE_NEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAX"."ROLE_NEWS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "MAX"."ROLE_NEWS" ADD CONSTRAINT "ROLE_NEWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table NEWS
--------------------------------------------------------

  ALTER TABLE "MAX"."NEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAX"."NEWS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "MAX"."NEWS" MODIFY ("BRIEF" NOT NULL ENABLE);
  ALTER TABLE "MAX"."NEWS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "MAX"."NEWS" ADD CONSTRAINT "NEWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MAX"."NEWS" MODIFY ("NEWS_DATE" NOT NULL ENABLE);
  ALTER TABLE "MAX"."NEWS" MODIFY ("LANG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USER_NEWS
--------------------------------------------------------

  ALTER TABLE "MAX"."USER_NEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USER_NEWS" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USER_NEWS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USER_NEWS" MODIFY ("ROLE_ID" NOT NULL ENABLE);
  ALTER TABLE "MAX"."USER_NEWS" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "MAX"."AUTHORITIES" ADD CONSTRAINT "AUTHORITIES_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "MAX"."USERS" ("USERNAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_NEWS
--------------------------------------------------------

  ALTER TABLE "MAX"."USER_NEWS" ADD CONSTRAINT "USER_ROLE_FK" FOREIGN KEY ("ID")
	  REFERENCES "MAX"."ROLE_NEWS" ("ID") ENABLE;
