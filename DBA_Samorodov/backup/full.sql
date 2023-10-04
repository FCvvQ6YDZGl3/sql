

BACKUP DATABASE solving_test
  TO DISK = 'moveto2022.bak' WITH INIT
go
BACKUP DATABASE physicon
  TO DISK = 'moveto2022.bak'
go
BACKUP DATABASE Northwind
  TO DISK = 'moveto2022.bak'
go
BACKUP DATABASE DemoSSIS_SourceA
  TO DISK = 'moveto2022.bak'
go

BACKUP DATABASE DemoSSIS_SourceB
  TO DISK = 'moveto2022.bak'
go

BACKUP DATABASE DemoSSIS_Target
  TO DISK = 'moveto2022.bak'
go

select name from sys.sysdatabases

RESTORE HEADERONLY
  FROM DISK = 'moveto2022.bak' 

  use tempdb
DROP DATABASE Northwind

RESTORE HEADERONLY
  FROM DISK = 'Full.bak'
RESTORE DATABASE Northwind FROM DISK = 'Full.bak'
  WITH FILE = 1