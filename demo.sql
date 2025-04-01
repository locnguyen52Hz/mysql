create database crm;
use crm;
create table users(
	id int auto_increment,
    fullname varchar(100),
    age tinyint,
    username varchar(100),
    password varchar(100),
    primary key(id),
    created_date timestamp default now()
);

insert into users(fullname, age, username, password) values("nguyen van a", 26, "vana","456xyz");


select * from users;
select * from users_detail;
create table users_detail(
    address varchar(500),
    id_card varchar(20),
    user_id int,
    primary key(user_id),
    foreign key (user_id) references users(id)
);

create table project (
	id int auto_increment,
	project_name varchar(100),
    created_date timestamp default now(),
    start_date timestamp,
    end_date timestamp,
    primary key(id)
);

create table tasks(
	user_id int,
	project_id int,
    primary key(user_id, project_id),
    foreign key(user_id) references users(id),
	foreign key(project_id) references project(id)
);

insert into tasks(user_id, project_id) values(1,1);
insert into tasks(user_id, project_id) values(2,1);
insert into tasks(user_id, project_id) values(1,2);

select * from users 
join tasks on users.id = tasks.user_id
join project on project.id = tasks.project_id;

select * from tasks;
select * from users, users_detail where users.id = users_detail.user_id;
select * from project, users where project.user_id = users.id;