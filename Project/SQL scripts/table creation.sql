/* create book */
CREATE TABLE bookcamp.book 
(book_id int not null auto_increment,
isbn bigint(13) not null,
image varchar (255),
title varchar (255),
author_id int,
category varchar (255),
publisher varchar (255),
publication_year int,
primary key (book_id),
unique (isbn));

/* create user */
CREATE TABLE bookcamp.user 
(user_id int not null auto_increment,
username varchar (255) not null,
name varchar (255),
surname varchar (255),
age int,
sex char(1) check (sex in ('m', 'f')),
primary key (user_id),
unique (username));

/* create author */
CREATE TABLE bookcamp.author 
(author_id int not null auto_increment,
name varchar (255),
surname varchar (255),
image varchar (255),
bio text,
primary key (author_id));

/* create rating */
CREATE TABLE bookcamp.rating 
(user_id int,
book_id int,
rating int check (rating > 0 and rating < 6),
review text,
foreign key (user_id) references user(user_id),
foreign key (book_id) references book(book_id));

/* create wishlist */
CREATE TABLE bookcamp.wishlist 
(user_id int,
book_id int,
foreign key (user_id) references user(user_id),
foreign key (book_id) references book(book_id));

create table bookcamp.back_cover
(book_id int,
decription text,
foreign key (book_id) references book(book_id));

alter table bookcamp.book
add foreign key (author_id)
references author(author_id);
