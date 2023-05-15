--bulk insert the data from csv file
bulk insert stg.stg_airport	from 'D:\DE\Week2\Data\airport.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);

--bulk insert the data from csv file
bulk insert stg.stg_lounge	from 'D:\DE\Week2\Data\lounge.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);

bulk insert stg.stg_airline	from 'D:\DE\Week2\Data\airline.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);

bulk insert stg.stg_seat from 'D:\DE\Week2\Data\seat.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);