USE Test1;
WHILE 1=1
  INSERT INTO MyTable(NAME)
  VALUES ('Строка ANSI');

  select count(*) from MyTable

  truncate table mytable

DROP TABLE MyTable

create database db_new_fl
use db_new_fl
create table tableInDefaultGroup (field1 int)

while 1=1
  insert into tableInDefaultGroup(field1)
  values (32)

  select COUNT(*) from tableInDefaultGroup