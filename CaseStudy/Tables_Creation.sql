create database assetmanagement;
use assetmanagement;

create table employees(
	employee_id int Primary Key,
	name varchar(20),
	department varchar(20),
	email varchar(20),
	password varchar(10)
);
desc employees;

create table assets(
	asset_id int Primary Key,
	name varchar(20),
	type varchar(20),
	serial_number int,
	purchase_date date,
	location varchar(20),
	status varchar(20),
	owner_id int,
    foreign key(owner_id ) references employees(employee_id)
);
desc assets;

create table maintenance_records(
	maintenance_id int primary key,
	asset_id int,
	maintenance_date date,
	description text,
	cost decimal(10,2),
    foreign key(asset_id) references assets(asset_id)
);
desc maintenance_records;

create table asset_allocations(
	 allocation_id int primary key,
     asset_id int,
     employee_id int,
     allocation_date date,
     return_date date,
     foreign key(asset_id) references assets(asset_id),
     foreign key(employee_id) references employees(employee_id)
);
desc asset_allocations;

create table reservations(
	reservation_id int primary key,
    asset_id int,
    employee_id int,
    reservation_date date,
    start_date date,
    end_date date,
    status varchar(20),
    foreign key(asset_id) references assets(asset_id),
    foreign key(employee_id) references employees(employee_id)
);
desc reservations;