-------------------------------
----CREATE VIEW
-------------------------------

CREATE VIEW gold.insurance
AS
SELECT * FROM OPENROWSET(
    BULK 'https://datalakeank01.dfs.core.windows.net/silver/Insurance Data/',
    FORMAT = 'PARQUET'
) as QUERY1