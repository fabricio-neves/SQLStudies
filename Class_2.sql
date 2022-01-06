-- Exercises - (CASE "CLAUSE") CAUSE WHEN

-- 1)
SELECT deb_id, deb_name
	,[profession] = case when deb_id in (7,8,9) then 'actress' else 'others' end
	from debtor;

-- 2)
SELECT deb_id, deb_name, deb_gender
	,[gender_2] = case when deb_gender like 'M' then 'Male' else 'Female' end
	from debtor;

SELECT acc_id, acc_value_debt, [10% of interest] = case when acc_value_debt < 600 then acc_value_debt * 1.1 end
	from account;

SELECT acc_client_name, acc_current_balance
	,[Incremental] = case when acc_client_name like 'T%' then acc_current_balance + 1000 else 0 end
	from account;

SELECT Getdate() as 'Get Date'
	,[Day] = Day(deb_dt_birth)
	,[Month] = Month(deb_dt_birth)
	,Year(deb_dt_birth) 'Year'
	,dateadd(hh,5,getdate()) 'hours+5'
	,datediff(yy,deb_dt_birth,getdate()) years
	,SUBSTRING(deb_name,2,8) Subname -- SUBSTRING(String, starting for numberfrom left,8)
from debtor;

/*=========================================*

				 CLASS 2

*=========================================*/

/* UPDATE */

-- 1. Change the email of Lionel Messi to 'messi@man_city.co.uk' */
	select * from account where acc_client_name like '%HMRC%'
		
	update debtor	set deb_email = 'messi@man_city.co.uk' where deb_id = 1
	update debtor	set deb_email = 'neymar@psg.com' where deb_id in (1,2,3,4)
	

/* TRANSACTION */
	begin tran
		update account	set acc_current_balance = acc_current_balance * 1.1 where acc_client_name like '%HMRC%'
		-- rollback
		-- commit
	
	begin tran
		update account set acc_current_balance = acc_current_balance * 1.1 where acc_client_name like '%HMRC'
		commit
		SELECT acc_client_name from account;
	select * from account where acc_client_name like '%Capital%'

	select @@TRANCOUNT -- To check how many transactions are open

	/************/	
	begin tran
		update account	set acc_value_debt = (acc_value_debt * 1.5) - acc_value_debt where acc_client_name like '%Capital%'
	-- rollback
	-- commit


/* DELETE */

	select * from debtor where deb_id = 10
	select * from account where deb_id = 10

	begin tran -- rollback commit
		delete from debtor where deb_id = 11
		delete from debtor where deb_id = 11
	
/* FOREIGN KEY */
	delete from debtor where deb_id = 10 -- It will cause an error, you cant delete the debtor without deleting the account
	
	delete from account where deb_id = 10
	delete from debtor where deb_id = 10

/*
	We have learned the DDL (Data Definition Language) commands:
	o	Create
	o	Drop
	o	Truncate
	o	Alter
	
	The DML (Data Manipulation Language) commands:
	o	Select
	o	Insert
	o	Update
	o	Delete
*/


/* CASE CLAUSE */
	select deb_name
		, deb_place_birth
		,[Case]		= case when deb_name like 'M%'			then '### ==> Name Changed <== ###' else deb_name end 
		,[Case 2]	= case when deb_place_birth like 'L%'	then 'Starts with Letter L'			else 'xxx' end
		-- select *
	from debtor

	
	select deb_id
		,deb_name
		,[Case] = case when deb_id in (1,2,3,4,5,6) then deb_name + ' - FOOTBALL PLAYER' else deb_name + ' ==> Not football players' end 
	from debtor


	select deb_id
		,deb_name
		,case when deb_id in (1,2,3,4,5,6)	then deb_name + ' - FOOTBALL PLAYER' 
			  when deb_id in (11,12,13)		then deb_name + ' - SINGER' 
			  when deb_name like '%oli%'	then deb_name + ' - Actor' 
			  else deb_name 
		 end as 'Case'
	from debtor


/*=========================================*

		   EXERCISES - WORKBOOK
			  
			  CASE CLAUSE

*=========================================*/

/* 1 – For the debtors with the Deb_ID 7, 8 and 9 display the word “Actress” and “Others” for the rest of the debtors
in a new column named “Profession” */
select deb_name
	,[Profession] = case when deb_id in (7,8,9) then 'Actress' else 'Others' end
from Debtor

/*2 – In a new column called (gender_2), display the word “Male” for the debtors with the Gender “M” and “Female”
for the rest of the debtors. */
select deb_id, deb_name, deb_gender
	,[Gender_2] = case when deb_gender like 'M' then 'Male' else 'Female' end
from debtor

/*3 – In the table “Account”, if the column “acc_value_debt” column is lesser than £600 then apply 10% of interest
over the own column acc_value_debt and display the results in a new column called “10% of interest”. Tip: Check
the topic “Update” to see how to multiple and apply the 10%. */
select acc_value_debt
	,[10% of interest] = case when acc_value_debt < 600 then (acc_value_debt * 1.1) end
from account

/*4 – If the first letter of the client’s name starts with the letter “T” then increment £1,000 in the current balance
and display the results in a new column called “Incremental” as shown below: */
select acc_client_name, acc_current_balance
	,[Incremental] = case when acc_client_name like 'T%' then (acc_current_balance + 1000) else 0 end
from account

/********************/
/* SYSTEM FUNCTIONS */
/********************/

/* GETDATE */
	select Getdate() as 'Get date'

/* DAY, MONHT AND YEAR */
	select deb_dt_birth
		,[day]	 = day(deb_dt_birth)
		,[month] = month(deb_dt_birth)
		,[year]	 = year(deb_dt_birth)
	from debtor
	where month(deb_dt_birth) = 7

/* DATEADD */
	select deb_dt_birth
		,[next_day]		  = DateAdd(dd,1,deb_dt_birth)
		,[previous_month] = DateAdd(mm,-1,deb_dt_birth)
		,[previous_year]  = DateAdd(yy,1,deb_dt_birth)
	from debtor
	
/* DATEDIFF */
	select datediff(dd,'2016-01-01','2018-01-01') days
	select datediff(mm,'2016-01-01',getdate()) months
	select datediff(yy,'1986-05-25',getdate()) years
	
/* SUBSTRING */ 
	select deb_name
		, deb_email
		, [example] = Substring(deb_name,2,4) -- + ' - '  + Substring(deb_email,2,5) 'Concatenate'
	from debtor

/* ISNULL */
	select deb_email 
		, isnull(deb_email,'doesnt have email') 'Replace NULL'
	from debtor

/* CAST / CONVERT */
	 select cast(deb_id as decimal) 'cast'    from debtor
	 select cast(deb_name as char)  'cast'    from debtor
	 select convert(decimal,deb_id) 'convert' from debtor
	 select convert(datetime,deb_dt_birth)		 'Formating Date' from debtor
	 select deb_dt_birth,convert(varchar,deb_dt_birth,126)	 'Formating Date' from debtor
	 select deb_dt_birth,convert(varchar,deb_dt_birth,103)	 'Formating Date' from debtor
	 select deb_dt_birth,convert(varchar,deb_dt_birth,112)	 'Formating Date' from debtor
	 select deb_dt_birth,convert(varchar(4),deb_dt_birth,126) 'Formating Date' from debtor
	 select deb_dt_birth,convert(varchar(7),deb_dt_birth,126) 'Formating Date' from debtor

-- 17. EXERCISES (System Functions)
	-- 1)
	SELECT deb_name, deb_dt_birth from debtor where month(deb_dt_birth) = 6
	-- 2)
	select *, datediff(dd,20,deb_dt_birth) deb_dt_birth_2 from debtor where deb_place_birth like '%England%';
	-- 3)
	select *, dateadd(yy,1,deb_dt_birth) deb_dt_birth_2 from debtor where deb_place_birth not like '%England%';
	-- 4)
	select *, datediff(yy,deb_dt_birth,getdate()) Age from debtor;
	-- 5)
	select *, [Age] = datediff(yy,deb_dt_birth,getdate()) from debtor where datediff(yy,deb_dt_birth,getdate()) > 40;
	-- 6)
	select deb_name, deb_email, substring(deb_name,1,1) + substring(deb_email,1,1) 'Concatenate' from debtor;



/******************/
/* CLASS THREE    */
/******************/

/*** JOINING TABLES ***/


/* INNER JOIN */
	select d.*,a.*
	from debtor d
	inner join account a on a.deb_id = d.deb_id

	select d.*,a.*
	from debtor d
	inner join account a on a.deb_id = d.deb_id;


/* LEFT JOIN */
	insert into debtor values (14,'Michael Jeffrey Jordan','1963-02-17','Brooklyn/US','M','jordan@chicago_bulls.com')
	insert into debtor values (15,'Ayrton Senna da Silva','1960-03-21','SaoPaulo/Brazil','M','senna@mclaren.com')
	


	
	select d.*,a.*
	from debtor d
	left join account a on a.deb_id = d.deb_id



	select d.*,isnull(a.acc_value_debt,0) as acc_value_debt
	from debtor d
	left join account a on a.deb_id = d.deb_id
	
	
	
	select p.prod_id,p.prod_desc,p.prod_price,cat_desc,bra_desc,siz_desc,gen_desc,col_desc
	from products p
	inner join Categories ca on p.cat_id = ca.cat_id
	inner join Brands b		 on p.bra_id = b.bra_id
	inner join Sizes s		 on p.siz_id = s.siz_id
	inner join Genders g	 on p.gen_id = g.gen_id
	inner join Colors c		 on p.col_id = c.col_id
	order by 1 desc
	
-- Exercises - (JOINS)

-- 1)
	select d.deb_name, a.acc_value_debt, a.acc_current_balance, a.acc_client_name
		from debtor d
		inner join account a on d.deb_id = a.deb_id
-- 2)
	select d.deb_name, d.deb_dt_birth, a.acc_create_date
	, datediff(yy,d.deb_dt_birth,a.acc_create_date) 'Diff of years'
	from debtor d right join account a on d.deb_id = a.deb_id

-- 3)
	select d.deb_name, a.acc_value_debt, a.acc_current_balance
	,a.acc_current_balance/a.acc_value_debt Division
	from debtor d
	join account a on d.deb_id = a.deb_id
	where d.deb_gender like 'M'
	
	select * from debtor

-- 4)
	select d.deb_name, a.acc_current_balance, acc_client_name
	from debtor d
	join account a on a.deb_id = d.deb_id
	where a.acc_current_balance = 0


-- 24
-- 1)
	select top 5 Cust

	select * from costumers
	show databases