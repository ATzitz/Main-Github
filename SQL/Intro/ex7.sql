SELECT Fname,Lname,AVG (Grade) from (stud inner join marks on stud.StID =marks.StID) group by Fname
having AVG(Grade) >5; 