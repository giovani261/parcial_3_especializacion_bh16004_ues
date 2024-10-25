insert into DimTiempo select date_key as dateid, year,day_name,month_name,quarter,month,day_of_week,day_num_in_month from Date_Dimension
create table DimTiempo
(
dateKey int identity(1,1) primary key,
dateid int not null, 
year smallint not null,
day_name varchar(10) not null,
month_name varchar(10) not null,
quarter tinyint not null,
month tinyint not null,
day_of_week tinyint not null,
day_num_in_month tinyint not null
)

create table DimAerolinea
(
	AerolineaKey int identity(1,1) primary key,
	code varchar(50) not null,
	description varchar(150) not null
)

create table FactVuelo
(
	TiempoKey int not null foreign key references DimTiempo(dateKey),
	AerolineaKey int not null foreign key references DimAerolinea(AerolineaKey),
	Cancelled int not null default(0),
	Diverted float not null default(0),
	ArrTime int not null default(0),
	DepTime int not null default(0),
	ArrDelayMinutes int not null default(0),
	DepDelayMinutes int not null default(0),
	CarrierDelay int not null default(0),
	WeatherDelay int not null default(0),
	NASDelay int not null default(0),
	SecurityDelay int not null default(0),
	LateAircraftDelay int not null default(0)
)