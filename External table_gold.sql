
------CREDENTIAL-------
CREATE DATABASE SCOPED CREDENTIAL cred_ank
WITH 
IDENTITY = 'Managed Identity'

------EXTERNAL DATA SOURCE------
CREATE EXTERNAL DATA SOURCE sourc_silver
WITH(
    LOCATION ='https://datalakeank01.dfs.core.windows.net/silver',
    CREDENTIAL=cred_ank
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH(
    LOCATION ='https://datalakeank01.dfs.core.windows.net/gold',
    CREDENTIAL=cred_ank
)

--------EXTERNAL FILE FORMAT------

CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
         FORMAT_TYPE = PARQUET, 
         DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
      )

-------------CREATE EXTERNAL TABLE

CREATE EXTERNAL TABLE gold.extinsurance
WITH
(
    LOCATION='extinsurance',
    DATA_SOURCE= source_gold,
    FILE_FORMAT=format_parquet

)AS
SELECT * FROM gold.insurance
SELECT * FROM gold.insurance







