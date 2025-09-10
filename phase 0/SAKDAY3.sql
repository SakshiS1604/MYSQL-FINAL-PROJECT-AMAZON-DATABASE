-- single line comment
/* 
multi
line 
coment
*/
-- database related queries --
create database Travelagent;
 use Travelagent;
 drop database Travelagent;
 -- ---------------------------- topics of the day --------------------
 -- data,typin,constraints,clauses,&commands
 /*
 refrence-
 1. daily session,google classrooom 
 2. discuss your doubts/ideas/daily with ypur batchmates ----------->ask your mentor
 3.github, w3 school
 4. chatgpt, blackbox.ai
 5. canva, 15 mins revision in morning & 15 mins in evening
 */
-- data types
/*
the data type of a column in MySQL database tells us what kind of values that column can hold,
such as:
-- integar(whole number)
-- character(text)
-- date and time (time and date)
-- binary(raw data)
-- enum(a list of allowed values)
-- set (a list of allowed values)
--time (time of the day)
-- timestamp(date and time)
-- year(year)
-- float(decimal valuue)
-- double (decimal value)
-- decimal(decimal)
 every column in a database table must have a name and a data type
 when creating a table, an sql devloper needs to choose the right data type for each column
 this helps mysql know what kind of data to expect and how to work with it
 
 datatypes defines the type & size of data to be stored in an attribute as id int (1,2,3......)
 in mysql, there are three main categories of data types:
 
 string:for text values (E.g,birthdays,timestamp)
 numeric:for numbers (e.g,ages,prices)
 data and time : for data and times (birthday,timestamp)
   
   note- choosing the correct data type is important for ensuring data accuracy and efficient storage.
    */
    -- Constraints
    /*
    In MYSQL, constraints are rules applied to columns in a database table to enforce data integrity and ensure the accuracy and reliablity of the data stored in the
    the database.Constraints help maintain the quality of the data by restricting the type of data that can be entered into a table
    and by defining relationships between them
      
      Types of constraints
       1.NOT NULL 
       
       ENSURES that a column cannot have a NULL values
       example:
         create table ORDERS(
       ORDERid int NOT NULL
          PRODUCTNAME VARCHAR(40) 
       ); 
       customers
        2.UNIQUE
        create table EMPLOYEE(
       EMAIL VARCHAR(40) UNIQUE
       );
       
       3.PRIMARY KEY
       UNIQUELY indentifies each record in table.
       combines NOT NULL and UNIQUE CONSTRAINTS.
        EXAMPLE:
        create table ORDERS(
       ORDERid int NOT NULL
          PRODUCTNAME VARCHAR(40) 
       ); 
         
       4.FOREIGN KEY
       ENSURES refrential integrity between two tables.
       a columns in one table refers to the primary key of another table
       
       example:
       create table customers(
       customers id int NOT NULL
       );
       create table ORDERS(
       ORDERid int NOT NULL,
       customer id int,
       foriegn key (customer id) REFRENCES CUSTOMERS (customer id)
       );
       
       5.check table
       ENSURE that all values in a column satisfies conditon
       EXAMPLE:
       CREATE TABLE Products(
          productid int primary key,
          price decimal(10,2) check(price>0)
       );
       
       6.DECIMAL
       ASSIGNS A default value to a column if no value is specified.
       EXAMPLE:
       CREATE TABLE users(
          userid int primary key,
          status VARCHAR(50) DEFAULT'ACTIVE'
       );
        
        7.auto_incremnet
        automatically generates a unique value for a columns whenever a new record is inserted.alter
        EXAMPLE:
       CREATE TABLE orders(
          orderid int auto_increment primary key,
          product name VARCHAR(40)
       );
        
      8. INDEX  
      IMProves the performance of queries by creating an index on specified columns
      while not direct constraints it enforces rule like uniqueness when combines with unique.
      
      EXAMPLE:
      CREATE UNIQUE INDEX idx_email ON Employees(email);
      benifits of using constraints
      data integriy:ensure valid and consistent data.
      error prevention : avoid accidental insertion of invalids or duplicate data
      relational consistency: maintains proper relationships between tables
      constraints are essential tools for maintaining a well structured and reliable database system
      */
      /*
      In MYSQL, commands are instructions that you use to interact with database.
      THey allow you to perform various operations such as cearting database and table,
      inserting and updating data,querying data,and managing user permission.
      mysql commands can be categorized into sevral types based on thier functionality
      
      DDL(data definitiuon language) define database structure(CREATE,ALTER ,DROP, TRUNCATE)
      DML(data  manilation languagee)structure(INSERT,UPDATE,DELETE)
      DQL  (dATA query language)query data(SELECT)
      DCL(DATA CONTROL LANGUAGE)CONTROLS ACESS(GRANT,REVOKE_)
      TCL(transcriptive control language)manage transaction(COMMITS,ROLLBACK,SAVEPOINT)
      */
      /*
      CLAUSES are components of a sql statement that specify the actions to be performed on
      the data in a database . each clause serves a specific purpose and helps to define the structure
      and behaviour of the sql query . caluses can be combined to create complex queries that retrives ,
      manipulate, or manage data.
      SELECT:Retrives data from a database table.
      FROM:SPECIFIES the tables to retrive data from.
      WHERE:filter data by conditions
      GROUP BY:group database on one or more column.
      HAVING:filter grouped data based on condition
      ORDER BY:sorts data in ascending order
      LIMIT: LIMIT NO.OF ROWS RETURNED
      */
      
        
       
       ); 