--drop table fct.spec
IF (OBJECT_ID(N'fct.spec') IS NULL)
CREATE TABLE fct.spec
(
	spc_id int identity,
	spc_name varchar(1000) not null,
	spc_sql_type_id int not null default(1),
	constraint pk_spc_spc_id primary key (spc_id),
	constraint uq_spc_soc_name unique (spc_name),
	constraint fk_spc_sql_type_id foreign key (spc_sql_type_id) references fct.spec_sql_type(sst_id)
);
select * from fct.spec_sql_type
select * from fct.spec

drop table if exists #fct_spec;
select *
into #fct_spec
from
(values
('Длина', 1)
,('Ширина', 1)
,('Высота', 1)
,('Вес', 1)
,('Цвет', 2)) as s(spc_name, spc_sql_type_id)

merge
	fct.spec as trg
using
	#fct_spec as src
on src.spc_name = trg.spc_name
when not matched
	then insert
	(
		spc_name,
		spc_sql_type_id
	)
	values
	(
		src.spc_name,
		src.spc_sql_type_id
	)
when matched
	then update set
		trg.spc_sql_type_id = src.spc_sql_type_id;