USE DemoSSIS_SourceB
GO

-- �������� �� ��������� B
CREATE TABLE Products(
  ID int NOT NULL IDENTITY,
  Title nvarchar(50) NOT NULL,
  Price money,
CONSTRAINT PK_Products PRIMARY KEY(ID)
)
GO

-- ��������� ������� ��������� �������
SET IDENTITY_INSERT Products ON

INSERT Products(ID,Title,Price)VALUES
(1,N'�������',200),
(2,N'��� ������������',70),
(3,N'�������',220),
(4,N'�������',150),
(5,N'��������� �����',15)

SET IDENTITY_INSERT Products OFF
GO