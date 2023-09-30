if(object_id(N'fct.visit_log_isc') is null)
create table fct.visit_log_isc
(
  employee_id int not null,
  visit_date date not null,
  constraint pk_vt_lg_isc primary key(visit_date, employee_id)
)
else
truncate table fct.visi_log_isc

create clustered index pk_vtlg on fct.visit_log_isc(visit_date, employee_id)

insert into fct.visit_log
select * from fct.visit_log_isc
--Смотреть план запроса
select * from fct.visit_log vl where vl.visit_date = '2023-02-03'
select * from fct.visit_log_isc vl where vl.visit_date = '2023-02-03'