--------------------------------------------------------
--  파일이 생성됨 - 월요일-5월-29-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AUTHORITY
--------------------------------------------------------

  CREATE TABLE "BOARD"."AUTHORITY" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"AUTHORITY_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  DDL for Table BOARD_PRO
--------------------------------------------------------

  CREATE TABLE "BOARD"."BOARD_PRO" 
   (	"BNO" NUMBER(*,0), 
	"SUBJECT" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(1024 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE, 
	"HIT" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;

   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."BNO" IS '기본키';
   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."SUBJECT" IS '타이틀';
   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."CONTENT" IS '내용';
   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."WRITER" IS '작성자';
   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."REG_DATE" IS '게시일';
   COMMENT ON COLUMN "BOARD"."BOARD_PRO"."HIT" IS '읽은수';
--------------------------------------------------------
--  DDL for Table BOARDCONFIG
--------------------------------------------------------

  CREATE TABLE "BOARD"."BOARDCONFIG" 
   (	"BOARD_TABLE" VARCHAR2(50 BYTE), 
	"BOARD_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;

   COMMENT ON COLUMN "BOARD"."BOARDCONFIG"."BOARD_TABLE" IS '테이블명';
   COMMENT ON COLUMN "BOARD"."BOARDCONFIG"."BOARD_NAME" IS '게시판이름';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "BOARD"."MEMBER" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(500 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"IS_ACCOUNT_NON_EXPIRED" VARCHAR2(1 BYTE), 
	"IS_ACCOUNT_NON_LOCKED" VARCHAR2(1 BYTE), 
	"IS_CREDENTIALS_NON_EXPIRED" VARCHAR2(1 BYTE), 
	"IS_ENABLED" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  DDL for Table REPLY_PRO
--------------------------------------------------------

  CREATE TABLE "BOARD"."REPLY_PRO" 
   (	"CNO" NUMBER(*,0), 
	"BNO" NUMBER(*,0), 
	"USER_ID" VARCHAR2(50 BYTE), 
	"PARENT_ID" NUMBER(*,0), 
	"SUBJECT" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(1024 BYTE), 
	"REG_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;

   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."CNO" IS '기본값';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."BNO" IS '참조 글번호';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."USER_ID" IS '유저 아이디';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."PARENT_ID" IS '부모 댓글 번호';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."SUBJECT" IS '제목';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."CONTENT" IS '내용';
   COMMENT ON COLUMN "BOARD"."REPLY_PRO"."REG_DATE" IS '글쓴일';
--------------------------------------------------------
--  DDL for Sequence BOARD_PRO_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD"."BOARD_PRO_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPLY_PRO_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD"."REPLY_PRO_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into BOARD.AUTHORITY
SET DEFINE OFF;
Insert into BOARD.AUTHORITY (USERNAME,AUTHORITY_NAME) values ('test','ADMIN');
Insert into BOARD.AUTHORITY (USERNAME,AUTHORITY_NAME) values ('test','USER');
Insert into BOARD.AUTHORITY (USERNAME,AUTHORITY_NAME) values ('asd','USER');
REM INSERTING into BOARD.BOARD_PRO
SET DEFINE OFF;
Insert into BOARD.BOARD_PRO (BNO,SUBJECT,CONTENT,WRITER,REG_DATE,HIT) values (21,'ㅁㄴㅇ','난좀 천재인듯?a','ㅁㄴㅇ',to_date('17/05/21','RR/MM/DD'),13);
Insert into BOARD.BOARD_PRO (BNO,SUBJECT,CONTENT,WRITER,REG_DATE,HIT) values (1,'ㅁㄴㅇ','난 천재야 ㅋㅋ','ㅁㄴㅇ',to_date('17/05/19','RR/MM/DD'),18);
Insert into BOARD.BOARD_PRO (BNO,SUBJECT,CONTENT,WRITER,REG_DATE,HIT) values (4,'ㅁㄴㅇ','dasdasd','ㅁㄴㅇ',to_date('17/05/19','RR/MM/DD'),1);
Insert into BOARD.BOARD_PRO (BNO,SUBJECT,CONTENT,WRITER,REG_DATE,HIT) values (7,'ㅋㅋㅋㅋㅋ','난 역시 천재야','ㅁㄴㅇ',to_date('17/05/19','RR/MM/DD'),8);
Insert into BOARD.BOARD_PRO (BNO,SUBJECT,CONTENT,WRITER,REG_DATE,HIT) values (41,'난 천재야!','금방 하네 ㅋ','ㅋㅋㅋ',to_date('17/05/24','RR/MM/DD'),20);
REM INSERTING into BOARD.BOARDCONFIG
SET DEFINE OFF;
Insert into BOARD.BOARDCONFIG (BOARD_TABLE,BOARD_NAME) values ('pro','테스트');
REM INSERTING into BOARD.MEMBER
SET DEFINE OFF;
Insert into BOARD.MEMBER (USERNAME,PASSWORD,NAME,IS_ACCOUNT_NON_EXPIRED,IS_ACCOUNT_NON_LOCKED,IS_CREDENTIALS_NON_EXPIRED,IS_ENABLED) values ('test','$2a$10$30Uk9X86l8PBYNaRVD6ZJemdvPeyNuQ1jAb.nI3yn2coBtK36foEu','존나 천재','1','1','1','1');
Insert into BOARD.MEMBER (USERNAME,PASSWORD,NAME,IS_ACCOUNT_NON_EXPIRED,IS_ACCOUNT_NON_LOCKED,IS_CREDENTIALS_NON_EXPIRED,IS_ENABLED) values ('asd','$2a$10$OSgzu56yPJDuGYrup1neueUPjC/nLXbje6mRfb9vocAX4VFQoFD/y','asd','1','1','1','1');
Insert into BOARD.MEMBER (USERNAME,PASSWORD,NAME,IS_ACCOUNT_NON_EXPIRED,IS_ACCOUNT_NON_LOCKED,IS_CREDENTIALS_NON_EXPIRED,IS_ENABLED) values ('user1','$2a$10$xIKC9oc9QSpI5i0ZsePCPuc6RcrNkbxEDsNof/ly50xzDNQZfjZcW','USER1','1','1','1','1');
REM INSERTING into BOARD.REPLY_PRO
SET DEFINE OFF;
Insert into BOARD.REPLY_PRO (CNO,BNO,USER_ID,PARENT_ID,SUBJECT,CONTENT,REG_DATE) values (1,41,null,null,'asd','asdsadsa',to_date('17/05/29','RR/MM/DD'));
Insert into BOARD.REPLY_PRO (CNO,BNO,USER_ID,PARENT_ID,SUBJECT,CONTENT,REG_DATE) values (2,41,null,null,'sad','asdasd',to_date('17/05/29','RR/MM/DD'));
Insert into BOARD.REPLY_PRO (CNO,BNO,USER_ID,PARENT_ID,SUBJECT,CONTENT,REG_DATE) values (3,41,null,null,'asd','asdasdasd',to_date('17/05/29','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index BOARD_PRO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD"."BOARD_PRO_PK" ON "BOARD"."BOARD_PRO" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  DDL for Index BOARD_CONFIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD"."BOARD_CONFIG_PK" ON "BOARD"."BOARDCONFIG" ("BOARD_TABLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD"."MEMBER_PK" ON "BOARD"."MEMBER" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  DDL for Index REPLY_PRO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD"."REPLY_PRO_PK" ON "BOARD"."REPLY_PRO" ("CNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD" ;
--------------------------------------------------------
--  Constraints for Table AUTHORITY
--------------------------------------------------------

  ALTER TABLE "BOARD"."AUTHORITY" MODIFY ("AUTHORITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."AUTHORITY" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_PRO
--------------------------------------------------------

  ALTER TABLE "BOARD"."BOARD_PRO" ADD CONSTRAINT "BOARD_PRO_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD"  ENABLE;
  ALTER TABLE "BOARD"."BOARD_PRO" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."BOARD_PRO" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."BOARD_PRO" MODIFY ("SUBJECT" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."BOARD_PRO" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDCONFIG
--------------------------------------------------------

  ALTER TABLE "BOARD"."BOARDCONFIG" ADD CONSTRAINT "BOARD_CONFIG_PK" PRIMARY KEY ("BOARD_TABLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD"  ENABLE;
  ALTER TABLE "BOARD"."BOARDCONFIG" MODIFY ("BOARD_TABLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "BOARD"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD"  ENABLE;
  ALTER TABLE "BOARD"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."MEMBER" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPLY_PRO
--------------------------------------------------------

  ALTER TABLE "BOARD"."REPLY_PRO" ADD CONSTRAINT "REPLY_PRO_PK" PRIMARY KEY ("CNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOARD"  ENABLE;
  ALTER TABLE "BOARD"."REPLY_PRO" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "BOARD"."REPLY_PRO" MODIFY ("CNO" NOT NULL ENABLE);
