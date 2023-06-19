CREATE PROCEDURE [dwh].[load_dim_airport]
AS
BEGIN
	insert into dwh.dim_airport (experience, name, link)
	select distinct experience_airport, airport_name, sap.link
	from stg.stg_airport sap
	union 
	select null as experience_airport,  sl.airport, sl.link
	from stg.stg_lounge sl
END
