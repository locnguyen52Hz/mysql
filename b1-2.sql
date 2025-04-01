create database MySql;
use MySql;

create table students(
	id int auto_increment primary key,
    full_name varchar(100) not null,
    gender char(3),
    age int,
    city varchar(300),
    weight decimal(6,4)
);

insert into students(full_name, gender, age, city, weight) values ("Nguyen Thanh Nhan","Nam",19,"Can Tho", 56.5674);
insert into students(full_name, gender, age, city, weight) values ("Pham Thu Huong","Nu",20,"Vinh Long", 72.456);
insert into students(full_name, gender, age, city, weight) values ("Nguyen Nhu Ngoc","Nu",20,"Soc Trang", 85.387);
insert into students(full_name, gender, age, city, weight) values ("Bui Thanh Bao","Nam",19,"Soc Trang", 49.3);
insert into students(full_name, gender, age, city, weight) values ("Le My Nhan", "Nu" ,22 ,"Can Tho", 62.963);
insert into students(full_name, gender, age, city, weight) values ("Tan Thuc Bao", "Nam", 35, "An Giang", 55.5678);
insert into students(full_name, gender, age, city, weight) values ("Trinh Giao Kim", "Nam", 44, "Bac Lieu", 67.34);

select * from students where gender = "Nam" order by age desc;
select * from students where gender = "Nu" limit 2;
select full_name, age from students where city = "Can Tho" or city ="Soc Trang";