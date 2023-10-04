USE DemoSSIS_SourceB
GO

-- продукты из источника B
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
(1,N'Ножницы',200),
(2,N'Нож канцелярский',70),
(3,N'Дырокол',220),
(4,N'Степлер',150),
(5,N'Шариковая ручка',15)

SET IDENTITY_INSERT Products OFF
GO