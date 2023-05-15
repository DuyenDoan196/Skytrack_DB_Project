CREATE TABLE [stg].[stg_seat]
(
	airline_name		varchar(400),
	link				varchar(400),
	title				varchar(400),
	author				varchar(400),
	author_country		varchar(400),
	review_date			varchar(400),
	review_content		text,
	aircraft varchar(400),
	seat_layout varchar(400),
	date_flown varchar(400),
	cabin_flown varchar(400),
	type_traveller varchar(400),
	overall_rating int,
	seat_legroom_rating int,
	seat_recline_rating int,
	seat_width_rating int,
	aisle_space_rating int,
	viewing_tv_rating int,
	power_supply_rating int,
	seat_storage_rating int,
	recommended int
)
