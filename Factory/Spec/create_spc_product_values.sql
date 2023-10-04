--ѕока что нету таблицы продутов, но позже можно сослатьс€ на любой справочник.
CREATE TABLE fct.spec_product
(
	sppr_id int identity not null,
	sppr_spc_id int not null,
	sppr_product_id int not null,
	sppr_value varchar not null,
	constraint fk_sppr_spc_id foreign key(sppr_spc_id) references fct.spec(spc_id),
	constraint uq_sppr_spc_id_product_id unique (sppr_spc_id, sppr_product_id)
)
select * from fct.spec