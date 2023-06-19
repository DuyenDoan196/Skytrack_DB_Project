bulk insert stg.stg_seat from 'D:\DE\Week2\Data\seat.csv'
with 
(
	format ='csv',
	datafiletype = 'char',
	firstrow = 2,
	fieldterminator =';',
	rowterminator ='\n'
);