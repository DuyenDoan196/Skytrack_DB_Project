CREATE PROCEDURE [dwh].[load_dim_aircrafts]
AS
	insert into dwh.dim_aircrafts(ID_airline, name,seat_layout)
	select distinct b.ID_airline,a.aircraft, a.seat_layout
	from stg.stg_seat a
	join dwh.dim_airline b ON b.name= a.airline_name
RETURN 0
