

declare
  @first_date date = '2023-01-01',
  @end_date date = '2023-12-31';
declare
  @days_a_year int = datediff(day, @first_date, @end_date) + 1;

if (OBJECT_ID(N'tempdb..#potential_emp', N'U') is null)
select vl.employee_id, ROW_NUMBER() over(order by vl.employee_id) emp_num
into #potential_emp
from fct.visit_log vl
where vl.visit_date between @first_date and @end_date
group by vl.employee_id
having COUNT(vl.visit_date) > 0

declare @emp_id int = (select pe.employee_id from #potential_emp pe where pe.emp_num = floor(rand()*(select MAX(emp_num) from #potential_emp) + 1));

--Выберем свободный день более изящным способом

drop table if exists #dates_by_day;
if(object_id('tempdb..#dates_by_day') is null)
create table #dates_by_day (visit_date date unique)
else
truncate table #dates_by_day;

declare
  @count int = 0;

while(@count < @days_a_year)
begin
  insert into #dates_by_day values (dateadd(day, @count + 1, @first_date))
  set @count = @count + 1;
end;


drop table if exists #potential_dates
select
  visit_date,
  row_number() over(order by visit_date) date_num
into #potential_dates
from
(
select dbd.visit_date 
from #dates_by_day dbd
except
select visit_date
from fct.visit_log vl
where vl.employee_id = @emp_id
) potential_dates (visit_date);

declare @log_date date = (select pd.visit_date from #potential_dates pd where pd.date_num = floor((select COUNT(*) from #potential_dates) * rand() + 1));
select @emp_id, @log_date;

insert into fct.visit_log values (@emp_id, @log_date);