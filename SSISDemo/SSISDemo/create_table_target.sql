USE DemoSSIS_Target
GO

-- принимающая таблица
CREATE TABLE Products(
  ID int NOT NULL IDENTITY,
  Title nvarchar(50) NOT NULL,
  Price money,
  SourceID char(1) NOT NULL, -- используется для идентификации источника
  SourceProductID int NOT NULL, -- ID в источнике
CONSTRAINT PK_Products PRIMARY KEY(ID),
CONSTRAINT UK_Products UNIQUE(SourceID,SourceProductID),
CONSTRAINT CK_Products_SourceID CHECK(SourceID IN('A','B'))
)
GO