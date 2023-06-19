CREATE TABLE [dwh].[dim calendar]
(
	Calendar_key int,
	Full_date date,
	year int,
	Name_of_week varchar(10),
	Short_name_of_week varchar(3),
	month int,
	Name_of_month varchar(10)
)
