drop table fct.spec
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
IF (OBJECT_ID(N'fct.spec') IS NOT NULL)
BEGIN
	truncate table fct.spec;
	insert into fct.spec
	values
	('Длина', 1)
	,('Ширина', 1)
	,('Высота', 1)
	,('Вес',1)
END;