create database CinemaProjectFSoft

use CinemaProjectFSoft

create table Genre(
    gen_id int identity(1, 1) not null primary key,
    gen_title nvarchar(100) not null
)
go
create table Movie(
    mov_id int identity(1, 1) not null primary key,
    mov_title nvarchar(100) not null,
    mov_direction nvarchar(100),
    mov_description nvarchar(1000),
    mov_duration int check(mov_duration > 0) not null,
    mov_trailer nvarchar(500),
    mov_thumb nvarchar(500),
    mov_banner nvarchar(500),
    mov_lang nvarchar(50),
    -- gen_id int foreign key(gen_id) references Genre(gen_id)
)
go
create table Movie_Genre(
    mov_id int foreign key(mov_id) references Movie(mov_id),
    gen_id int foreign key(gen_id) references Genre(gen_id),
    constraint pk_mov_genre primary key(mov_id, gen_id)
)
go
create table Actor(
    act_id int identity(1, 1) not null primary key,
    act_fname nvarchar(20),
    act_lname nvarchar(20),
    act_dob date,
    act_gender nvarchar(5),
    act_img nvarchar(200)
)
go
create table Movie_Cast(
    mov_id int foreign key(mov_id) references Movie(mov_id),
    act_id int foreign key(act_id) references Actor(act_id),
    mc_role nvarchar(100)
)
go
create table Cinema(
    cine_id int identity(1, 1) not null primary key,
    cine_name nvarchar(100) not null,
    cine_street nvarchar(50),
    cine_ward nvarchar(50),
    cine_district nvarchar(50),
    cine_city nvarchar(50),
    cine_zipCode nvarchar(20)
)
go
create table ScreeningRoom(
    sr_id int identity(1, 1) not null primary key,
    cine_id int foreign key(cine_id) references Cinema(cine_id),
    sr_name nvarchar(20),
)
go
create table [User](
    user_id int identity(1, 1) not null primary key,
    user_fname nvarchar(20),
    user_lname nvarchar(20),
    user_email nvarchar(50) not null,
    user_phone nvarchar(12),
    user_password nvarchar(50),
    user_street nvarchar(50),
    user_ward nvarchar(50),
    user_district nvarchar(50),
    user_city nvarchar(50),
    user_zipCode nvarchar(20)
)
go
create table Screening(
    scr_id int identity(1, 1) not null primary key,
    mov_id int foreign key(mov_id) references Movie(mov_id),
    scr_time time,
    scr_date date,
)