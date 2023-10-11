drop table if exists fct.log_error;
create table fct.log_error
(
	lgrr_id bigint not null identity,
	lgrr_message varchar(MAX),
	constraint pk_lgrr_lgrr_id primary key (lgrr_id)
)