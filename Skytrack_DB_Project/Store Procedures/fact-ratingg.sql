CREATE PROCEDURE [dwh].[fact-ratingg]
AS
	insert into fact(
      Id_passengers
      ,[ID_airline]
      ,[Id_airport]
      ,[Id_aircrafts]
      ,[Id_lounge]
      ,[airport_visit_date]
      ,[lounge_visit_date]
      ,[flight_date]
      ,[airline_review_date]
      ,[airport_review_date]
      ,[lounge_review_date]
      ,[seat_review_date]
      ,[airline_overall_rating]
      ,[airline_seat_comfort_rating]
      ,[airline_cabin_staff_rating]
      ,[airline_food_beverages_rating]
      ,[airline_inflight_entertainment_rating]
      ,[airline_ground_service_rating]
      ,[airline_wifi_connectivity_rating]
      ,[airline_value_money_rating]
      ,[airline_recommended]
      ,[airport_overall_rating]
      ,[airport_queuing_rating]
      ,[airport_terminal_cleanness_rating]
      ,[airport_terminal_seating_rating]
      ,[airport_terminal_signs_rating]
      ,[airport_food_beverages_rating]
      ,[airport_shopping_rating]
      ,[airport_wifi_connectivity_rating]
      ,[airport_staff_rating]
      ,[airport_recommended]
      ,[lounge_overall_rating]
      ,[lounge_comfort_rating]
      ,[lounge_cleanness_rating]
      ,[lounge_washrooms_rating]
      ,[lounge_wifi_connectivity_rating]
      ,[lounge_staff_service_rating]
      ,[lounge_recommended]
      ,[seat_overall_rating]
      ,[seat_legroom_rating]
      ,[seat_recline_rating]
      ,[seat_width_rating]
      ,[seat_aisle_space_rating]
      ,[seat_viewing_tv_rating]
      ,[seat_power_supply_rating]
      ,[seat_storage_rating]
      ,[seat_recommended]
      ,[overall_rating]
      ,[overall_recommendation]
	  )
	select 
			dp.Id_passengers,
			dal.ID_airline, 
            dap.Id_airport,    
			da.Id_aircrafts,
            dl.Id_lounge,
            sp.date_visit,
            sl.date_visit,
			ss.date_flown,
            sa.review_date,
            sp.review_date,
            sl.review_date,
            ss.review_date,
			sa.overall_rating,
            sa.seat_comfort_rating,
            sa.cabin_staff_rating,
            sa.food_beverages_rating,
            sa.inflight_entertainment_rating,
            sa.ground_service_rating,
            sa.wifi_connectivity_rating,
            sa.value_money_rating,
            sa.recommended,
            sp.overall_rating,
            sp.queuing_rating,
            sp.terminal_cleanness_rating,
            sp.terminal_seating_rating,
            sp.terminal_signs_rating,
            sp.food_beverages_rating,
            sp.airport_shopping_rating,
            sp.wifi_connectivity_rating,
            sp.airport_staff_rating,
            sp.recommended,
            sl.overall_rating,
            sl.comfort_rating,
            sl.cleanness_rating,
            sl.washrooms_rating,
            sl.wifi_connectivity_rating,
            sl.staff_service_rating,
            sl.recommended,
            ss.overall_rating,
            ss.seat_legroom_rating,
            ss.seat_recline_rating,
            ss.seat_width_rating,
            ss.aisle_space_rating,
            ss.viewing_tv_rating,
            ss.power_supply_rating,
            ss.seat_storage_rating,
            ss.recommended,
			CAST(ra.overall_rating as numeric(8,2)) as overall_rating,
		    CAST(re.overall_recommendation as numeric(8,2)) as overall_recommendation
	from stg.stg_airline as sa

	left join stg.stg_airport sp
				on COALESCE (sa.author, 'Unknown') = COALESCE (sp.author, 'Unknown')
				and COALESCE (sa.author_country, 'Unknown') = COALESCE (sp.author_country, 'Unknown')
				and COALESCE (sa.type_traveller, 'Unknown') = COALESCE (sp.type_traveller, 'Unknown')
	left join stg.stg_lounge as sl
				on COALESCE (sa.author, 'Unknown') = COALESCE (sl.author, 'Unknown')
				and COALESCE (sa.author_country, 'Unknown') = COALESCE (sl.author_country, 'Unknown')
				and COALESCE (sa.type_traveller, 'Unknown') = COALESCE (sl.type_traveller, 'Unknown')
	left join stg.stg_seat as ss
				on COALESCE (sa.author, 'Unknown') = COALESCE (ss.author, 'Unknown')
				and COALESCE (sa.author_country, 'Unknown') = COALESCE (ss.author_country, 'Unknown')
				and COALESCE (sa.type_traveller, 'Unknown') = COALESCE (ss.type_traveller, 'Unknown')			
	left join dwh.dim_passengers as dp
				on COALESCE (sa.author, 'Unknown') = COALESCE (dp.name, 'Unknown')
	left join dwh.dim_airline as dal
				on COALESCE (dal.name, 'Unknown') =  COALESCE (sa.airline_name, 'Unknown')
				and COALESCE (dal.link, 'Unknown') =  COALESCE (sa.link, 'Unknown')
				and COALESCE (dal.cabin, 'Unknown') =  COALESCE (sa.cabin_flown, 'Unknown')
				and COALESCE (dal.route, 'Unknown') =  COALESCE (sa.route, 'Unknown')
	left join dwh.dim_airport as dap
				on COALESCE (dap.experience, 'Unknown') =  COALESCE (sp.experience_airport, 'Unknown')
				and COALESCE (dap.name, 'Unknown') = COALESCE (sp.airport_name, 'Unknown')
				and COALESCE (dap.link, 'Unknown') =  COALESCE (sp.link, 'Unknown')
	left join dwh.dim_aircrafts as da
				on COALESCE (da.name, 'Unknown') =  COALESCE (ss.aircraft, 'Unknown')
				and COALESCE ( da.seat_layout, 'Unknown') = COALESCE ( ss.seat_layout, 'Unknown')	
				and COALESCE (da.ID_airline,'-1') = COALESCE (dal.ID_airline,'-1')
	left join dwh.dim_lounges as dl
				on COALESCE (dl.name,'Unknown') =  COALESCE (sl.lounge_name,'Unknown')
				and COALESCE(dl.type,'Unknown') =  COALESCE(sl.lounge_type,'Unknown')
				and COALESCE (dl.ID_airline,'-1') = COALESCE (dal.ID_airline,'-1')
				and COALESCE (dl.Id_airport,'-1') = COALESCE (dap.Id_airport,'-1')

		OUTER APPLY (SELECT AVG(Col) AS [overall_rating]
			FROM (VALUES
				(cast(sa.overall_rating as numeric(8,2))), 
				(cast(sp.overall_rating as numeric(8,2))), 
				(cast(sl.overall_rating as numeric(8,2))), 
				(cast(ss.overall_rating as numeric(8,2)))
				) v (Col)   
			) ra
			OUTER APPLY (
			SELECT AVG(Col) AS [overall_recommendation]
			FROM (VALUES
				(cast(sa.recommended as numeric(4,2))), 
				(cast(sp.recommended as numeric(4,2))), 
				(cast(sl.recommended as numeric(4,2))), 
				(cast(ss.recommended as numeric(4,2)))
			) v (Col)   
			) re  
RETURN 0
