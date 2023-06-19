
CREATE TABLE [dwh].[dim_passengers]
(
	Id_passengers INT IDENTITY NOT NULL PRIMARY KEY,
	name varchar(400),
	country varchar(400),
	type varchar(400)
)
