--����� � ����� ����������� ����. �����, ���������� �������
--������� ���������� ��, �� �.�. ������ ������������ �������� rand()
--������ ������� ������� �������� �������������� � ���������� ��� � �������
drop view dbo.rand_view
go
create view dbo.rand_view
as
	select rand() as rand_num
go
create function dbo.getRandIntUp(@up int)
returns int
begin
	return (select floor(rand_num * @up + 1.0) from dbo.rand_view)
end
go

select * from fct.spec

select * from 
fct.spec_product

--������ ������� ������������ �������������� ��� �������.
--�.�. �������������� ����� (���� � ���) �� ������� ��� �������������� ��� ������� ������
insert into fct.spec_product
select
	s.spc_id,
	p.prd_code,
	case
		when spc_sql_type_id = 1 then cast((r.rand_int) as varchar)
		when spc_sql_type_id = 2 then '������'
	end spec_values
from
	fct.product p
cross join fct.spec s
outer apply (VALUES(dbo.getRandIntUp(120))) as r(rand_int)
go
--����� ������� � ������� �������� �������� � ��������
--������������� ��������� � �������� �������� � ������� ������.