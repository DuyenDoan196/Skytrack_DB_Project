CREATE VIEW [dbo].[view_airline]
	AS select dal.name, avg(f.overall_rating) as rating , YEAR(CONVERT(date, f.airline_review_date, 103)) AS year
from dwh.fact f
	left join dwh.dim_airport dap	on f.Id_airport = dap.Id_airport 
	left join dwh.dim_aircrafts da 	on da.Id_aircrafts = f.Id_aircrafts
	left join dwh.dim_airline dal	on dal.ID_airline = f.ID_airline 
	left join dwh.dim_lounges dl	on dl.Id_lounge=f.Id_lounge
	left join dwh.dim_passengers dp on dp.Id_passengers = f.Id_passengers
group by dal.name, YEAR(CONVERT(date, f.airline_review_date, 103))
