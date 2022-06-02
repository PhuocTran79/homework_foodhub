create database homework_foodhub ;

use homework_foodhub ;

create table users (

	id int auto_increment ,
    username varchar (255),
    user_password varchar (255),
    style_login varchar(255),
    email varchar (255),
    primary key (id)

);

create table category (

	id int auto_increment,
    category_name varchar (255) ,
    url_image varchar (255),
    primary key (id)

);

create table restaurant (

	id int auto_increment,
    restaurant_name varchar (255),
    url_image varchar (255),
    primary key (id)

);

create table menu (

	id int auto_increment,
    url_image varchar (255),
    menu_name varchar(255),
    rating varchar (20),
    price varchar (255),
    menu_desc varchar (255),
    id_restaurant int ,
    id_category int,
    primary key (id),
    foreign key (id_restaurant) references restaurant(id),
    foreign key (id_category) references category(id)

);

create table sub_menu (

	id int auto_increment,
    sub_menu_name varchar (255),
    price varchar (255),
    id_restaurant int,
    primary key (id),
    foreign key (id_restaurant) references restaurant(id)

);

create table menu_detail (

	id int auto_increment,
    id_menu int,
    id_subMenu int,
    primary key (id),
    foreign key (id_menu) references menu(id),
    foreign key (id_subMenu) references sub_menu(id)

);

create table profile_user (

	fullname varchar (255),
    phone_number varchar (25),
    address varchar (255),
    id_user int ,
    foreign key (id_user) references users(id)

);

create table review (

	id int auto_increment,
    review_commnet varchar (255),
    rating varchar (255),
    id_restaurant int,
    primary key (id),
    foreign key (id_restaurant) references restaurant(id)

);

create table promo (

	id int auto_increment,
    promo_name varchar (255),
    discount varchar (255),
    expired_date date,
    primary key (id)

);

create table menu_promo (

	id_menu int,
    id_promo int ,
    foreign key (id_menu) references menu(id),
    foreign key (id_promo) references promo(id)

);

create table foodhub_status (

	id int auto_increment,
    status_name varchar (255),
    primary key (id)

);

create table orders (

	id int auto_increment,
    start_date date,
    end_date date,
    id_status int,
    id_user int,
    primary key (id),
    foreign key (id_status) references foodhub_status(id),
    foreign key (id_user) references users(id)

);

create table order_detail (

	id_order int,
    id_menu int,
    price varchar (255),
    id_status int ,
    foreign key (id_order)references orders(id),
    foreign key (id_menu) references menu (id),
    foreign key (id_status) references foodhub_status(id)

);

create table state (

	id int auto_increment,
    state_name varchar (255),
    primary key (id)

);

create table city (

	id int auto_increment,
    city_name varchar (255),
    id_state int,
    primary key (id),
    foreign key (id_state) references state(id)

);

