CREATE PROCEDURE [dwh].[load_dim_airline]
AS
	insert into dwh.dim_airline(name, link, cabin, route)
	select distinct sal.airline_name, sal.link, cabin_flown, route
	from stg.stg_airline sal
	union 
	select ss.airline_name, ss.link, ss.cabin_flown, null as route
	from stg.stg_seat ss
	union 
	select sl.airline_name, sl.link, null as cabin_flown, null as route
	from stg.stg_lounge sl
RETURN 0

