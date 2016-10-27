/* show wishlist*/
select book.title
from book
Inner join wishlist
on book.book_id = wishlist.book_id
inner join user
on user.user_id = wishlist.user_id
group by user.user_id;

/* show rated*/
select A.title, B.rating as my_rating, avg(B.rating) as Average_Rating
from bookcamp.book as A
inner join bookcamp.rating as B
on A.book_id = B.book_id
inner join user as C
on B.user_id = C.user_id
group by C.user_id;

/* show authorlist*/
select A.title
from bookcamp.book as A
inner join author as B
on A.author_id = B.author_id
where B.author_id = 1;

/* show book*/
select A.title, D.surname, B.decription, avg(C.rating)
from book as A
inner join back_cover as B 
on A.book_id = B.book_id
inner join bookcamp.rating as C
on A.book_id = C.book_id
inner join author as D
on D.author_id = A.author_id;

/* show reviews by book*/
select A.title, B.review
from book as A
inner join rating as B
on A.book_id = B.book_id
group by A.title;

/* show reviews by user*/
select A.title, B.review
from book as A
inner join rating as B
on A.book_id = B.book_id
inner join user as C
on C.user_id = B.user_id
group by C.user_id;