-- ������ �� ����������� � ���� ��������� ������
CREATE DATABASE DemoSSIS_SourceA
GO

ALTER DATABASE DemoSSIS_SourceA SET RECOVERY SIMPLE 
GO

-- ������ �� ����������� � ���� ��������� ������
CREATE DATABASE DemoSSIS_SourceB
GO

ALTER DATABASE DemoSSIS_SourceB SET RECOVERY SIMPLE 
GO

-- �� ����������� � ���� ���������� ������
CREATE DATABASE DemoSSIS_Target
GO

ALTER DATABASE DemoSSIS_Target SET RECOVERY SIMPLE 
GO