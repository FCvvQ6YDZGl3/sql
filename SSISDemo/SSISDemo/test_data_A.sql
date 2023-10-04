USE DemoSSIS_SourceA
GO

-- продукты из источника A
CREATE TABLE Products(
  ID int NOT NULL IDENTITY,
  Title nvarchar(50) NOT NULL,
  Price money,
CONSTRAINT PK_Products PRIMARY KEY(ID)
)
GO

-- наполняем таблицу тестовыми данными
SET IDENTITY_INSERT Products ON

INSERT Products(ID,Title,Price)VALUES
(1,N'Клей',20),
(2,N'Корректор',NULL),
(3,N'Скотч',100),
(4,N'Стикеры',80),
(5,N'Скрепки',25)

SET IDENTITY_INSERT Products OFF
GO