CREATE TABLE [dwh].[dim_lounges]
(
	Id_lounge INT  IDENTITY NOT NULL PRIMARY KEY,
	name			varchar(400),
	type			varchar(400),
	Id_airport int,
	ID_airline int
)
