
```
RESTORE FILELISTONLY
FROM DISK = N'/var/opt/mssql/backup/your-file.bak';

```

```
RESTORE DATABASE finpulse
FROM DISK = N'/var/opt/mssql/backup/your-file.bak'
WITH MOVE 'finpulse' TO '/var/opt/mssql/data/finpulse.mdf',
     MOVE 'finpulse_log' TO '/var/opt/mssql/data/finpulse_log.ldf';

```

