CREATE VIEW [dbo].[view_airport]
	AS SELECT distinct  dap.name, avg(f.overall_rating) as rating ,YEAR(CONVERT(date, f.airport_review_date, 103)) AS year
	FROM dwh.fact f
	left join dwh.dim_airport dap	on f.Id_airport = dap.Id_airport 
	left join dwh.dim_aircrafts da 	on da.Id_aircrafts = f.Id_aircrafts
	left join dwh.dim_airline dal	on dal.ID_airline = f.ID_airline 
	left join dwh.dim_lounges dl	on dl.Id_lounge=f.Id_lounge
	left join dwh.dim_passengers dp on dp.Id_passengers = f.Id_passengers
	group by dap.name, YEAR(CONVERT(date, f.airport_review_date, 103))
