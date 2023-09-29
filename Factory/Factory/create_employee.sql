if(object_id(N'fct.employee', N'U') is null)
create table fct.employee
(
  emp_name varchar(100),
  employee_id int identity(1,1),
  constraint pk_employee_id primary key (employee_id),
)
go

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
go