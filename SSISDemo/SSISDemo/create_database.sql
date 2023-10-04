-- первая БД выступающая в роли источника данных
CREATE DATABASE DemoSSIS_SourceA
GO

ALTER DATABASE DemoSSIS_SourceA SET RECOVERY SIMPLE 
GO

-- вторая БД выступающая в роли источника данных
CREATE DATABASE DemoSSIS_SourceB
GO

ALTER DATABASE DemoSSIS_SourceB SET RECOVERY SIMPLE 
GO

-- БД выступающая в роли получателя данных
CREATE DATABASE DemoSSIS_Target
GO

ALTER DATABASE DemoSSIS_Target SET RECOVERY SIMPLE 
GO