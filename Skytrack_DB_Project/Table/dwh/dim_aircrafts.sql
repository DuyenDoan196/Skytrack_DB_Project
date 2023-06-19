CREATE TABLE [dwh].[dim_aircrafts]
(
	Id_aircrafts INT IDENTITY PRIMARY KEY,
	name varchar(400),
	seat_layout varchar(400),
	ID_airline int
)
