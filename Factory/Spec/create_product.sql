use solving_test;
if(object_id(N'fct.product', N'U') is null)
create table fct.product
(
	prd_id int identity not null,
	prd_name char(100) not null, --��� ������ ��� � ����������� �� � 100 ������ ���������
	prd_code char(5) not null,
	constraint pk_prd_prd_code primary key (prd_code),
	constraint uq_prd_prd_id unique (prd_id),
	constraint uq_prd_prd_name unique (prd_name),
)

if(object_id(N'fct.product_history_name', N'U') is null)
create table fct.product_history_name
(
	prd_id int identity not null,
	prd_name_lost_date datetime not null default(GETDATE()),
	prd_name char(100) not null, --��� ������ ��� � ����������� �� � 100 ������ ���������
)

drop table if exists #fct_product;
select *
into #fct_product
from
(
	values 
	('����� ���� ', '�����'),
	('�������', '����'),
	('�������', '����'),
	('���������� �����', '�����'),
	('�������� �����', '���'),
	('�����-1', '����1'),
	('������', '����')
)
as f(prd_name, prd_code)

merge
	fct.product as trg
using
	(
		select
			prd_name,
			prd_code
		from
			#fct_product
	) as src
on src.prd_name = trg.prd_name
when matched and src.prd_code <> trg.prd_code
	then delete;--���� ����� ����� ��� ������������� ��� ������� ������ �� ������� ������


merge
	fct.product as trg
using
	(
		select
			prd_name,
			prd_code
		from
			#fct_product
	) as src
on src.prd_code = trg.prd_code
when not matched
	then insert
	(
		prd_name,
		prd_code
	)
	values
	(
		src.prd_name,
		src.prd_code
	)
when matched
	then update set
		trg.prd_name = src.prd_name;