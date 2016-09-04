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
	foreign key(fid) references faculty
	);
create table enrolled(
	snum numeric(9,0),
	cname varchar(40),
	primary key(snum,cname),
	foreign key(snum) references student,
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
	foreign key(eid) references emp,
	foreign key(did) references dept
	);
create table flights(
	flno numeric(4,0) primary key,
	origin varchar(20),
	destination varchar(20),
	distance numeric(6,0),
	departs timestamp,
	arrives timestamp,
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
	foreign key(eid) references employees,
	foreign key(aid) references aircraft
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
	foreign key(sid) references suppliers,
	foreign key(pid) references parts
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
\COPY student FROM 'student.txt' CSV;
\COPY faculty FROM 'faculty.txt' CSV;
\COPY class FROM 'class.txt' CSV;
\COPY enrolled FROM 'enrolled.txt' CSV;
\COPY emp FROM 'emp.txt' CSV;
\COPY dept FROM 'dept.txt' CSV;
\COPY works FROM 'works.txt' CSV;
\COPY flights FROM 'flights.txt' CSV;
\COPY aircraft FROM 'aircraft.txt' CSV;
\COPY employees FROM 'employees.txt' CSV;
\COPY certified FROM 'certified.txt' CSV;
\COPY suppliers FROM 'suppliers.txt' CSV;
\COPY parts FROM 'parts.txt' CSV;
\COPY catalog FROM 'catalog.txt' CSV;
\COPY sailors FROM 'sailors.txt' CSV;
