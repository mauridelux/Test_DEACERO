USE [POC_DEACEROS] 
GO
CREATE SCHEMA [Fuentes]
CREATE SCHEMA [staging_bank_marketing]
CREATE SCHEMA [kpi_bank_marketing]
GO

----------------
DROP TABLE staging_bank_marketing.STG_BALANCE;
DROP TABLE staging_bank_marketing.STG_CONTACT;
DROP TABLE staging_bank_marketing.STG_DEFAULT;
DROP TABLE staging_bank_marketing.STG_EDUCATION;
DROP TABLE staging_bank_marketing.STG_HOUSING;
DROP TABLE staging_bank_marketing.STG_JOB;
DROP TABLE staging_bank_marketing.STG_LOAN;
DROP TABLE staging_bank_marketing.STG_MARITAL;
DROP TABLE staging_bank_marketing.STG_POUTCOME;
DROP TABLE staging_bank_marketing.STG_EMPLOYED;
DROP TABLE staging_bank_marketing.STG_AGE;
DROP TABLE staging_bank_marketing.STG_FACT;
DROP TABLE staging_bank_marketing.STG_CAMPAIGN
DROP TABLE staging_bank_marketing.STG_Y
----crear tablas
CREATE TABLE staging_bank_marketing.STG_BALANCE		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_CONTACT		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_DEFAULT		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_EDUCATION	(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_HOUSING		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_JOB			(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_LOAN		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_MARITAL		(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_POUTCOME	(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_EMPLOYED	(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_AGE			(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_CAMPAIGN	(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );
CREATE TABLE staging_bank_marketing.STG_Y			(ID_DESC INT NOT NULL, DESCRIPCION [NVARCHAR] (100) NOT NULL );

CREATE TABLE [staging_bank_marketing].[STG_FACT](
	[age] [int] NULL,
	[job] [int] NULL,
	[marital] [int] NULL,
	[education] [int] NULL,
	[default] [int] NULL,
	[housing] [int] NULL,
	[loan] [int] NULL,
	[contact] [int] NULL,
	[month] [NVARCHAR] (10) NULL,
	[day_of_week] [NVARCHAR] (10) NULL,
	[duration] [int] NOT NULL,
	[campaign] [int] NOT NULL,
	[pdays] [int] NOT NULL,
	[previous] [int] NOT NULL,
	[poutcome] [int] NULL,
	[emp_var_rate] [float] NULL,
	[cons_price_idx] [float] NULL,
	[cons_conf_idx] [float] NULL,
	[euribor3m] [float] NULL,
	[nr_employed] [float] NULL,
	[y] [int] NULL
)

------- insert STG
--INSERT INTO staging_bank_marketing.STG_BALANCE (ID_DESC, DESCRIPCION) 
--SELECT 
--DISTINCT 
--DENSE_RANK() OVER (ORDER BY balance ASC) AS dense_rank
--,balance 
--from 
--Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_CONTACT (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY contact ASC) AS dense_rank
,contact 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_DEFAULT (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY [default] ASC) AS dense_rank
,[default] 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_EDUCATION (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY education ASC) AS dense_rank
,education 
from 
Fuentes.[bank-additional-full] ORDER BY 1  ;

INSERT INTO staging_bank_marketing.STG_HOUSING (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY housing ASC) AS dense_rank
,housing 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_JOB (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY job ASC) AS dense_rank
,job 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_LOAN (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY loan ASC) AS dense_rank
,loan 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_MARITAL (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY marital ASC) AS dense_rank
,marital 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_POUTCOME (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY poutcome ASC) AS dense_rank
,poutcome 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;

INSERT INTO staging_bank_marketing.STG_EMPLOYED (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY [nr_employed] ASC) AS dense_rank
,[nr_employed] 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;


INSERT INTO staging_bank_marketing.STG_AGE (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY AGE ASC) AS dense_rank
,AGE 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;


INSERT INTO staging_bank_marketing.STG_CAMPAIGN (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY [campaign] ASC) AS dense_rank
,[campaign] 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;


INSERT INTO staging_bank_marketing.STG_Y (ID_DESC, DESCRIPCION) 
SELECT 
DISTINCT 
DENSE_RANK() OVER (ORDER BY [y] ASC) AS dense_rank
,[y] 
from 
Fuentes.[bank-additional-full] ORDER BY 1 ;


INSERT INTO [staging_bank_marketing].[STG_FACT]
([age]
,[job]
,[marital]
,[education]
,[default]
,[housing]
,[loan]
,[contact]
,[month]
,[day_of_week]
,[duration]
,[campaign]
,[pdays]
,[previous]
,[poutcome]
,[emp_var_rate]
,[cons_price_idx]
,[cons_conf_idx]
,[euribor3m]
,[nr_employed]
,[y])

SELECT 
 A.ID_DESC [age]
,I.ID_DESC [job]
,K.ID_DESC [marital]
,E.ID_DESC [education]
,D.ID_DESC [default]
,H.ID_DESC [housing]
,J.ID_DESC [loan]
,C.ID_DESC [contact]
,X.[month]
,X.[day_of_week]
,X.[duration]
,M.ID_DESC [campaign]
,X.[pdays]
,X.[previous]
,L.ID_DESC [poutcome]
,X.[emp_var_rate]
,X.[cons_price_idx]
,X.[cons_conf_idx]
,X.[euribor3m]
,f.ID_DESC [nr_employed]
,N.ID_DESC [y]
FROM [POC_DEACEROS].[Fuentes].[bank-additional-full] X
left JOIN [staging_bank_marketing].[STG_AGE]		A ON X.[age]		=  A.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_JOB]		I ON X.[job]		=  I.DESCRIPCION
left JOIN [staging_bank_marketing].[STG_MARITAL]	K ON X.[marital]    =  K.DESCRIPCION
left JOIN [staging_bank_marketing].[STG_EDUCATION]	E ON X.[education]  =  E.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_DEFAULT]	D ON X.[default]	=  D.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_HOUSING]	H ON X.[housing]	=  H.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_LOAN]		J ON X.[loan]		=  J.DESCRIPCION
left JOIN [staging_bank_marketing].[STG_CONTACT]	C ON X.[contact]	=  C.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_POUTCOME]	L ON X.[poutcome]   =  L.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_EMPLOYED]	F ON X.[nr_employed]=  F.DESCRIPCION 
left JOIN [staging_bank_marketing].[STG_CAMPAIGN]	M ON X.[campaign]	=  M.DESCRIPCION
left JOIN [staging_bank_marketing].[STG_Y]			N ON X.[y]			=  N.DESCRIPCION
--INNER JOIN [staging_bank_marketing].[STG_BALANCE]	B ON X.		=  A.DESCRIPCION 

------------------------------------------------------------------