CREATE PROCEDURE [dwh].[load_dim_lounge]
AS
BEGIN
	insert into dwh.dim_lounges(ID_airline,Id_airport, name,type)
	select distinct b.ID_airline,c.Id_airport, a.lounge_name, a.lounge_type
	from stg.stg_lounge a
	JOIN dim_airline b ON b.name = a.airline_name
	JOIN dim_airport c ON c.name = a.airport
END