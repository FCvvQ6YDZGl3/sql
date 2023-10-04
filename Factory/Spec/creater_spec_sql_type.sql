if (object_id('fct.spec_sql_type') is null)
create table fct.spec_sql_type
(
	sst_id int identity not null,
	sst_name varchar(32),
	constraint pk_sst_sst_id primary key (sst_id),
	constraint uq_sst_sst_name unique(sst_name)
)
else
begin
	truncate table fct.spec_sql_type;
	insert into fct.spec_sql_type
	values
	('numeric(18,2)')
	,('varchar(MAX)')
	,('int')
end;

alter table fct.spec drop constraint fk_spc_sql_type_id
alter table fct.spec add constraint fk_spc_sql_type_id foreign key 