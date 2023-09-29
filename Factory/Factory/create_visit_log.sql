if(object_id(N'fct.visit_log') is null)
create table fct.visit_log
(
  employee_id int not null,
  visit_date date not null,
  constraint uq_vt_lg primary key(employee_id, visit_date)
)

declare
  @count int = 1000 * 100,
  @offset bit = 1;

declare 
  @max_day int,
  @log_year int = 2023,
  @log_month int,
  @log_date date;

--Данный метод работает не корректно при ограничении первичного ключа
--по натуральным полям.
while (@count > 0)
begin
  set @log_month = floor(rand() * 12 + @offset);
  set @log_date = DATEFROMPARTS(@log_year, @log_month, @offset);
  set @max_day = DATEPART(DAY, EOMONTH(@log_date));

  set @log_date = DATEFROMPARTS(@log_year, @log_month, floor(rand() * @max_day + @offset));
  
  insert into fct.visit_log_isc
  values ((floor(rand() * 10 + @offset)), @log_date);

  set @count = @count - @offset;
end;