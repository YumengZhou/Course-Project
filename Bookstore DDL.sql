create table Book
	(ISBN	varchar(20),
	name	varchar(20),
	author	varchar(20),
	genre	varchar(20),
	number_of_page	numeric(4,0),
	price	numeric(5,2),
	number_of_sales	numeric(4,0),
	primary key (ISBN)
	);
	
create table MakeOrder
	(order_id	varchar(10),
	customer_id	varchar(10),
	shipping_address	varchar(50),
	billing_address		varchar(50),
	price	numeric(5,2),
	shipping_status		varchar(15),
	primary key (order_id)
	);
	
create table Add_cart
	(ISBN	varchar(20),
	order_id	varchar(10),
	primary key (ISBN, order_id),
	foreign key (ISBN) references Book,
	foreign key (order_id) references MakeOrder
	);
	
create table Customer
	(customer_id	varchar(10),
	password	varchar(10),
	primary key (customer_id)
	);
	
create table Place_order
	(order_id	varchar(10),
	customer_id		varchar(10),
	primary key (order_id),
	foreign key (order_id) references MakeOrder,
	foreign key (customer_id) references Customer
	);
	
create table Warehouse
	(w_id	varchar(10),
	primary key (w_id)
	);
	
create table Stock
	(ISBN	varchar(20),
	w_id	varchar(10),
	number_of_book	numeric(4,0),
	primary key (ISBN, w_id),
	foreign key (ISBN) references Book,
	foreign key (w_id) references Warehouse
	);

create table Owner
	(owner_id	varchar(10),
	password	varchar(10),
	primary key (owner_id)
	);

create table AddRecord
	(w_id	varchar(10),
	owner_id	varchar(10),
	primary key (w_id, owner_id),
	foreign key (w_id) references Warehouse,
	foreign key (owner_id) references Owner
	);

create table Publisher
	(publisher_id	varchar(10),
	name	varchar(20),
	email	varchar(30),
	address	varchar(50),
	account_balance	numeric(7,2),
	primary key (publisher_id)
	);

create table Establish
	(ISBN	varchar(20),
	publisher_id	varchar(10),
	primary key (ISBN),
	foreign key (ISBN) references Book,
	foreign key (publisher_id) references Publisher
	);
