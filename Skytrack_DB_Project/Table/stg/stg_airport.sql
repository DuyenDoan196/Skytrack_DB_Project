CREATE TABLE [stg].[stg_airport]
(
	airport_name 	varchar(400),
	link			varchar(400),
	title			varchar(400),
	author			varchar(400),
	author_country	varchar(400),
	review_date		varchar(400),
	review_content	text,
	experience_airport varchar(400),
	date_visit		varchar(400),
	type_traveller	varchar(400),
	overall_rating	int,
	queuing_rating	int,
	terminal_cleanness_rating	int,
	terminal_seating_rating		int,
	terminal_signs_rating		int,
	food_beverages_rating		int,
	airport_shopping_rating		int,
	wifi_connectivity_rating	int,
	airport_staff_rating		int,
	recommended					int
)
