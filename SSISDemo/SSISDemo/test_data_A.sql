USE DemoSSIS_SourceA
GO

-- �������� �� ��������� A
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
(1,N'����',20),
(2,N'���������',NULL),
(3,N'�����',100),
(4,N'�������',80),
(5,N'�������',25)

SET IDENTITY_INSERT Products OFF
GO