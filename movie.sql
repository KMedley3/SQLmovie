--- MOVIE Project ---

-- create movie table
create table movie(
	film_id SERIAL primary key,
	rating VARCHAR(100),
	title VARCHAR(150)
);


-- create ticket table
create table ticket(
	ticket_id SERIAL primary key,
	sub_total NUMERIC(5,2),
	total_cost NUMERIC(5,2),
	ticket_date DATE default current_date,
	film_id INTEGER not null,
	foreign key(film_id) references movie(film_id)
	
);

-- create customer table
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	ticket_id INTEGER not null,
	foreign key(ticket_id) references ticket(ticket_id)
);

-- create order_info 
-- changing some column names just for practice
create table order_info(
	payment_id SERIAL primary key,
	num_of_tickets INTEGER,
	customer_id INTEGER not null,
	ticket_info INTEGER not null,
	film_info INTEGER not null,
	foreign key(customer_id) references customer(customer_id),
	foreign key(ticket_info) references ticket(ticket_id),
	foreign key(film_info) references movie(film_id)
);

-- create inventory table
create table inventory(
	item_upc SERIAL primary key,
	product_amount NUMERIC(5,2)
);

--create concessions table
create table concessions(
	item_upc INTEGER not null,
	item_amount NUMERIC(5,2),
	payment_info INTEGER not null,
	foreign key(item_upc) references inventory(item_upc),
	foreign key(payment_info) references order_info(payment_id)
);

-- Inserting data into tables

insert into movie(
	film_id,
	rating,
	title
) VALUES(
		
	1,
	'R',
	'Rush Hour 4: Last Ride'
);

-- adding data into ticket table
insert into ticket(
	ticket_id,
	sub_total,
	total_cost,
	film_id
) Values(
	
	111,
	48.24,
	56.60,
	1
);

-- insert data into customer 
insert into customer(
	customer_id,
	first_name,
	last_name,
	ticket_id
) values (
	77177,
	'Lori',
	'Medley',
	111
	
);

-- insert data into order info
insert into order_info(
	payment_id,
	num_of_tickets,
	customer_id,
	ticket_info,
	film_info
) values (

	1234,
	3,
	77177,
	111,
	1
);


-- insert data into inventory 
insert into inventory(
	item_upc,
	product_amount
) values (

	537,
	12.72
)

-- insert data into concessions
insert into concessions(
	item_upc,
	item_amount,
	payment_info
) values(

	537,
	7.00,
	1234
);

select * from concessions
