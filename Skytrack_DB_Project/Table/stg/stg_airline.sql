CREATE TABLE [stg].[stg_airline]
(
	airline_name	varchar(400),
	link			varchar(400),
	title			varchar(400),
	author			varchar(400),
	author_country	varchar(400),
	review_date		varchar(400),
	review_content	text,
	aircraft		varchar(400),
	type_traveller	varchar(400),
	cabin_flown		varchar(400),
	route			 varchar(400),
	overall_rating	int,
	seat_comfort_rating			int,
	cabin_staff_rating			int,
	food_beverages_rating		int,
	inflight_entertainment_rating	int,
	ground_service_rating			int,
	wifi_connectivity_rating		int,
	value_money_rating				int,
	recommended						int
)
