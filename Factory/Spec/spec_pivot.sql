--Посмотрим что получилось
select
*
from
(
	select
		p.prd_name
		,s.spc_name
		,sp.sppr_value 
	from
		fct.product p
	join fct.spec_product sp on sp.sppr_prd_code = p.prd_code
	join fct.spec s on s.spc_id = sp.sppr_spc_id
) d
pivot ( MIN(sppr_value) FOR spc_name in ([Длина], [Ширина], [Высота], [Вес], [Цвет])) p

--Дополню вариантом разворота без pivot, если верить плану выполнения то он да же быстрее
select
	p.prd_name,
	min(case when sp.sppr_spc_id = 1 then sp.sppr_value end) [Длина],
	min(case when sp.sppr_spc_id = 2 then sp.sppr_value end) [Ширина],
	min(case when sp.sppr_spc_id = 3 then sp.sppr_value end) [Высота],
	min(case when sp.sppr_spc_id = 4 then sp.sppr_value end) [Вес],
	min(case when sp.sppr_spc_id = 5 then sp.sppr_value end) [Цвет]
from
	fct.product p
	left outer join fct.spec_product sp on sp.sppr_prd_code = p.prd_code
group by
	p.prd_name
order by 1