CREATE TABLE [dwh].[dim_airline]
(
	ID_airline			INT IDENTITY PRIMARY KEY,
	name				varchar(400),
	link				varchar(400),
	cabin				varchar(400),
	route				varchar(400)
)
