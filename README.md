# Database Management Systems Supporting Material #
[Database Management Systems][dbms_book] by Raghu Ramakrishnan and Johannes
Gehrke comes with [online supporting material][dbms_material] which includes
the set of tables used for the SQL exercises in chapter 5 and a SQL script to
install the tables. The script was written for a couple of databases like
Oracle and Microsoft SQL Server but not for a couple popular databases like
Postgres or MySQL. This repository contains an updated version of the tables
and installation script for Postgres and MySQL. Simply install the two
databases and then execute the following.

```bash
psql -f postgres.sql
mysql <db_name> < mysql.sql
```

[dbms_book]:     http://pages.cs.wisc.edu/~dbbook/
[dbms_material]: http://pages.cs.wisc.edu/~dbbook/openAccess/thirdEdition/supporting_material.htm
