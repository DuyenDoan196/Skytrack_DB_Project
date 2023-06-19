bulk insert stg.stg_airline	from 'D:\DE\Week2\Data\airline.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);