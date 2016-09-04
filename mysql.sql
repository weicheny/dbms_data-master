--
-- 	Database Table Creation
--
--		This file will create the tables for use with the book
--  Database Management Systems by Raghu Ramakrishnan and Johannes Gehrke.
--  It is run automatically by the installation script.
--
--	Version 0.1.0.0 2002/04/05 by: David Warden.
--	Copyright (C) 2002 McGraw-Hill Companies Inc. All Rights Reserved.

--
--  First drop any existing tables. Any errors are ignored.
--
SET foreign_key_checks = 0;
drop table if exists student cascade;
drop table if exists faculty cascade;
drop table if exists class cascade;
drop table if exists enrolled cascade;
drop table if exists emp cascade;
drop table if exists works cascade;
drop table if exists dept cascade;
drop table if exists flights cascade;
drop table if exists aircraft cascade;
drop table if exists certified cascade;
drop table if exists employees cascade;
drop table if exists suppliers cascade;
drop table if exists parts cascade;
drop table if exists catalog cascade;
drop table if exists sailors cascade;
SET foreign_key_checks = 1;

--
-- Now, add each table.
--
create table student(
	snum numeric(9,0) primary key,
	sname varchar(30),
	major varchar(25),
	standing varchar(2),
	age numeric(3,0)
	);
create table faculty(
	fid numeric(9,0) primary key,
	fname varchar(30),
	deptid numeric(2,0)
	);
create table class(
	name varchar(40) primary key,
	meets_at varchar(20),
	room varchar(10),
	fid numeric(9,0),
	foreign key(fid) references faculty(fid)
	);
create table enrolled(
	snum numeric(9,0),
	cname varchar(40),
	primary key(snum,cname),
	foreign key(snum) references student(snum),
	foreign key(cname) references class(name)
	);
create table emp(
	eid numeric(9,0) primary key,
	ename varchar(30),
	age numeric(3,0),
	salary numeric(10,2)
	);
create table dept(
	did numeric(2,0) primary key,
	dname varchar(20),
	budget numeric(10,2),
	managerid numeric(9,0),
	foreign key(managerid) references emp(eid)
	);
create table works(
	eid numeric(9,0),
	did numeric(2,0),
	pct_time numeric(3,0),
	primary key(eid,did),
	foreign key(eid) references emp(eid),
	foreign key(did) references dept(did)
	);
create table flights(
	flno numeric(4,0) primary key,
	origin varchar(20),
	destination varchar(20),
	distance numeric(6,0),
	departs timestamp default current_timestamp,
	arrives timestamp default current_timestamp,
	price numeric(7,2)
	);
create table aircraft(
	aid numeric(9,0) primary key,
	aname varchar(30),
	crusingrange numeric(6,0)
	);
create table employees(
	eid numeric(9,0) primary key,
	ename varchar(30),
	salary numeric(10,2)
	);
create table certified(
	eid numeric(9,0),
	aid numeric(9,0),
	primary key(eid,aid),
	foreign key(eid) references employees(eid),
	foreign key(aid) references aircraft(aid)
	);
create table suppliers(
	sid numeric(9,0) primary key,
	sname varchar(30),
	address varchar(50)
	);
create table parts(
	pid numeric(9,0) primary key,
	pname varchar(40),
	color varchar(15)
	);
create table catalog(
	sid numeric(9,0),
	pid numeric(9,0),
	cost numeric(10,2),
	primary key(sid,pid),
	foreign key(sid) references suppliers(sid),
	foreign key(pid) references parts(pid)
	);
create table sailors(
	sid numeric(9,0) primary key,
	sname varchar(30),
	rating numeric(2,0),
	age numeric(4,1)
	);

--
-- Populate tables.
--
LOAD DATA LOCAL INFILE 'student.txt' INTO TABLE student
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'faculty.txt' INTO TABLE faculty
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'class.txt' INTO TABLE class
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'enrolled.txt' INTO TABLE enrolled
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'emp.txt' INTO TABLE emp
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'dept.txt' INTO TABLE dept
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'works.txt' INTO TABLE works
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'flights.txt' INTO TABLE flights
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'aircraft.txt' INTO TABLE aircraft
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'employees.txt' INTO TABLE employees
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'certified.txt' INTO TABLE certified
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'suppliers.txt' INTO TABLE suppliers
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'parts.txt' INTO TABLE parts
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'catalog.txt' INTO TABLE catalog
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
LOAD DATA LOCAL INFILE 'sailors.txt' INTO TABLE sailors
    FIELDS TERMINATED BY ',' ENCLOSED BY '"';
