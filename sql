Create procedure abap4."procedure_sales_report"(
            in discount integer)
Language sqlscript sql security invoker as
/*********begin procedure script ************/
Begi
Var1 = select t1.region_name, t1.sub_region_name, t2.product_id, t2.sales_amount
            from abap4.region as t1
            inner join
            abap4.sales as t2
            on t1.region_id = t2.region_id;
end;



CREATE PROCEDURE SAP123.PALYER1(
        IN id INT,
        IN name VARCHAR(20),
        IN loc VARCHAR(20))
    LANGUAGE SQLSCRIPT
    SQL SECURITY INVOKER
    AS

BEGIN
    DECLARE found INT := 1;
    SELECT count(*) INTO found FROM SAP123.PLAYER 
        WHERE PID = :id;
   
    IF :found = 0
    THEN
        INSERT INTO SAP123.PLAYER VALUES 
        (:id, :name, :loc);
    ELSE
        UPDATE SAP123.PLAYER
            SET PID = :id, CATEGORY = :loc
            WHERE PID =:id;
    END IF;
    SELECT PID, PNAME, CATEGORY FROM SAP123.PLAYER ;
END;

----------------------------------Functions--------------------------------------
CREATE FUNCTION "schemaname"."Add_number"( X integer, Y integer)
Returns Z Integer
Language sqlscript
As 
Begin
Z = :X*:Y;
End;
----Select "schemaname"."Add_number"(10,20) from dumm;

Sequence in SAP HANA
  A sequence is a database object that generates an automatically incremented list of numeric values according to the rules defined in the sequence specification.
 
 create sequence "SCHEMANAME"."SEQUENCE_EX" start with 1;
 SELECT "SCHEMANAME"."SEQUENCE_EX".NEXTVAL FROM DUMMY;
 
 Whenever I execute the above query it returns NEXT value. Such as when I execute it again it through the output like,
 drop sequence "SCHEMANAME"."SEQUENCE_EX";
 
 create sequence "SCHEMANAME"."SEQ_INC" start with 1 increment by 2;
    SELECT "SCHEMANAME"."SEQ_INC".NEXTVAL FROM DUMMY;
    
    create sequence "SCHEMANAME"."SEQ_MAXVAL" start with 1 increment by 2 MAXVALUE 5;
    SELECT "SCHEMANAME"."SEQ_MAXVAL".NEXTVAL FROM DUMMY;
    
    create sequence "SCHEMANAME"."SEQ_CYCLE" start with 1 increment by 1 MAXVALUE 3 cycle;

    Then Execute this code until it reaches it MAXVALUE:
    SELECT "SCHEMANAME"."SEQ_CYCLE".NEXTVAL FROM DUMMY;

 Example for Inserting a created sequence in an Existing table:

CODE:

1.  Create a table.

create column table "SCHEMANAME"."EMP_NAME_SEQ"("EMP_NAME" VARCHAR(10)); 
 2. Insert a records into the table.

INSERT INTO "SCHEMANAME"."EMP_NAME_SEQ" VALUES('KABIL');
INSERT INTO "SCHEMANAME"."EMP_NAME_SEQ" VALUES('DHANUSH');
INSERT INTO "SCHEMANAME"."EMP_NAME_SEQ" VALUES('ANUPRIYA');
INSERT INTO "SCHEMANAME"."EMP_NAME_SEQ" VALUES('PRIYANKA');

INSERT INTO "SCHEMANAME"."EMP_NAME_SEQ" VALUES('ARAVIND');
create sequence "SCHEMANAME"."INSERT_SEQ" start with 101;

update "SCHEMANAME"."EMP_NAME_SEQ" set "EMP_ID" = "SCHEMANAME"."INSERT_SEQ".NEXTVAL;

-----------------------------------Triggers--------------------------------------
Create column table Trigger_one (USER NVARCHAR(100), ENTRYTime TIMESTAMP);

create trigger Example_Trigger
After insert into "SCHEMANAME"."PRODCUT" for eaach row 
Begin 
Insert into Trigger_one values("curret_timestamp,Current_user);
end;

------------------------Need to see trace--------------------
Sys_bic schem

