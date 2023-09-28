create table fct.employee
(
  employee_id int identity(1,1)
)
alter table fct.employee add emp_name varchar(100)
alter table fct.employee drop column emp_name

insert into fct.employee  values
('Петр'),
('Евгений'),
('Артем'),
('Алексей'),
('Александр'),
('Олег'),
('Татьяна'),
('Елизавета'),
('Валерия'),
('Николай');

create table fct.employee_no_ix
(
  employee_id int identity(1,1),
  emp_name varchar(100)
)

insert into fct.employee_no_ix  values
('Петр'),
('Евгений'),
('Артем'),
('Алексей'),
('Александр'),
('Олег'),
('Татьяна'),
('Елизавета'),
('Валерия'),
('Николай');

create clustered index ix_empl on fct.employee (employee_id)

select e.* from fct.employee e
select e.* from fct.employee_no_ix e