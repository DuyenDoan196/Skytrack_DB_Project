CREATE PROCEDURE [dwh].[load_dim_passengers]
AS
	insert into dwh.dim_passengers (name, country, type)
	select distinct author, author_country, type_traveller
	from stg.stg_airline
	UNION
	select distinct author, author_country, type_traveller
	from stg.stg_airport
	UNION
	select distinct author, author_country, type_traveller
	from stg.stg_lounge
	UNION
	select distinct author, author_country, type_traveller
	from stg.stg_seat
RETURN 0
