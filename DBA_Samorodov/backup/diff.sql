BACKUP DATABASE solving_test
  TO DISK = 'Diff.bak'

BACKUP DATABASE solving_test
  TO DISK = 'Diff.bak' WITH DIFFERENTIAL

DROP DATABASE solving_test

RESTORE HEADERONLY FROM DISK = 'Diff.bak'

RESTORE DATABASE solving_test
  FROM DISK = 'Diff.bak'
  WITH FILE = 1, NORECOVERY

RESTORE DATABASE solving_test
  FROM DISK = 'Diff.bak'
  WITH FILE = 2, RECOVERY
