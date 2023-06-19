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