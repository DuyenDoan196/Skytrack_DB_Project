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



