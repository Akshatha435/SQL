create database clinictrial;
use clinictrial;
# 1. Add index name fast on Name
create index fast on clinictrial(name(10));

#2. Describe the schema of table
desc clinictrial;

#3. Find average of Age
select avg(age)as average_age from clinictrial;

#4. Find minimum of Age
select min(age) as min_age from clinictrial;

#5. Find maximum of Age
select max(age) as max_age from clinictrial;

#6. Find average age of those were pregnant and not pregnant
select* from clinictrial;
select pregnant, avg(age) as average_age from clinictrial where pregnant ="yes" and "no"  group by pregnant;

#7. Find average blood pressure of those had drug reaction and did not had drug
#reaction
select* from clinictrial;
select drug_reaction,avg(bp) as average_bp from clinictrial group by drug_reaction;

#8. Add new column name as ‘Age_group’ and those having age between 16 & 21
#should be categorized as Low, more than 21 and less than 35 should be
#categorized as Middle and above 35 should be categorized as High.
alter table clinictrial add column age_group varchar (40) after age;
update clinictrial set age_group = case when age between 16 and 21 then "low" 
when age >21 and age <35 then "middle" else "high" end;

#9. Change ‘Age’ of Reetika to 32
update clinictrial set age = 32 where name = "reetika";
select* from clinictrial;

#10. Change name of Reena as Shara’
update clinictrial set name ="reena" where name ="shara";

# 11. Remove Chlstrl column
alter table clinictrial drop column chlstrl;

#12. Select only Name, Age and BP
select name,age,bp from clinictrial;

# 13. Select ladies whose first name starts with ‘E’
select * from clinictrial where name like"e%";

#14. Select ladies whose Age_group were Low
select* from clinictrial;
select name, age_group from clinictrial where age_group ="low";

#15. Select ladies whose Age_group were High
select name,age_group from clinictrial where age_group ="high";

# 16. Select ladies whose name starts with ‘A’ and those were pregnant 
select * from clinictrial where name like "a%" and pregnant ="yes";

#17. Identify ladies whose BP was more than 120
select * from clinictrial where bp>=120;

# 18. Identify ladies whose BP was between 100 and 120
select* from clinictrial where bp between 100 and 120;

# 19. Identify ladies who had low anxiety aged less than 30
select * from clinictrial;
select* from clinictrial where Anxty_lh ="low" and age <30;

# 20.Select ladies whose name ends with ‘i’
select* from clinictrial where name like  "%i";

#21. Select ladies whose name ends with ‘a’
select* from clinictrial where name like "%a";

#22.Select ladies whose name starts with ‘K’
select* from clinictrial where name like "k%";

#23.Select ladies whose name have ‘a’ anywhere
select* from clinictrial where name like "%a%";

#24. Order ladies in ascending way based on ‘BP’
select* from clinictrial order by bp asc;

#25. Order ladies in descending way based on ‘Age’
select* from clinictrial order by age desc;




