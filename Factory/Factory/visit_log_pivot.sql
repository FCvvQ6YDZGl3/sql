--select * from fct.visit_log vl
--���� � ����������� ���� ������� ������ � ���������� ��� � ��������� �������
--����� ����� ������� ������� ���� ��������� ������� � ������ �� �������
select
*
from
(select vl.employee_id, datepart(MONTH, vl.visit_date) month_of_visit from fct.visit_log vl) as d
  pivot (COUNT(month_of_visit) for month_of_visit IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as p