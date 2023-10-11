use solving_test;
go

create or alter trigger fct.trig_product_name_in_hist on fct.product after delete
as
begin try
	set nocount on;
	insert into fct.product_history_name(prd_name)
	select d.prd_name from deleted d
end try
begin catch
	insert into fct.log_error values ('Что-то пошло не так!' + ERROR_MESSAGE())
end catch
go

create or alter trigger fct.trig_product_save_del on fct.product after delete
as
begin try
	set nocount on;
	update p
	set
		
      p.[prd_name] = d.[prd_name]
      ,p.[prd_code] = d.[prd_code]
      ,p.[prd_deleted] = 1
	from fct.product p
	inner join deleted d on d.prd_code = p.prd_code
end try
begin catch
	insert into fct.log_error values ('Что-то пошло не так!' + ERROR_MESSAGE())
end catch
go

create or alter trigger fct.trig_sppr_bdeleted on fct.spec_product after delete
as
insert into fct.product(
      [prd_name]
      ,[prd_code]
	  ,[prd_deleted]
) values('Вставлено из тригера требует обновления', (select max(sppr_prd_code) from deleted d group by d.sppr_prd_code), 1);

set identity_insert fct.spec_product on;

insert into fct.spec_product
([sppr_id]
      ,[sppr_spc_id]
      ,[sppr_prd_code]
      ,[sppr_value]
	  ,[sppr_deleted]
	  )
select d.[sppr_id]
      ,d.[sppr_spc_id]
      ,[sppr_prd_code]
      ,d.[sppr_value]
	  ,1 [sppr_deleted]
      from deleted d

set identity_insert fct.spec_product off;
go

create or alter trigger fct.trig_sppr_bdeleted on fct.spec_product after delete
as
print 'Сработал триггер по каскадному удалению характеристик';

select * from fct.product;
go

create or alter trigger fct.trig_product_save_del on fct.product after delete
as
print 'Сработал триггер удаления продукта' + (select cast(count(*) as varchar(max)) from fct.product);
go

select * from fct.product

begin tran
delete fct.product where prd_code = 'кзвдп' rollback

update fct.product set prd_name = 'кптр' where prd_code = 'кптр'

select * from fct.log_error
select * from fct.spec_product