--ѕока что нету таблицы продуктов, но позже можно сослатьс€ на любой справочник.
CREATE TABLE fct.spec_product
(
	sppr_id int identity not null,
	sppr_spc_id int not null,
	sppr_product_id int not null,
	sppr_value varchar(1000) not null,
	constraint fk_sppr_spc_id foreign key(sppr_spc_id) references fct.spec(spc_id),
	constraint uq_sppr_spc_id_product_id unique (sppr_spc_id, sppr_product_id)
)
go

alter table fct.spec_product
	add sppr_prd_code char(100) not null;
alter table fct.spec_product
	drop column sppr_product_id
alter table fct.spec_product
	add constraint pk_sppr_sppr_id primary key (sppr_id)

alter table fct.spec_product drop constraint uq_sppr_spc_id_product_id

alter table fct.spec_product add constraint uq_sppr_spc_id_prd_code unique (sppr_spc_id, sppr_prd_code)
go

alter table fct.spec_product
	add sppr_value varchar(1000)
go