select * from ( stud inner join marks on stud.StID =marks.StID )
inner join courses on marks.CID=courses.CID

where CName='SQL'