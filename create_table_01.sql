use CinemaProjectFSoft

create table Movie(
    mov_id int identity(1, 1) not null primary key,
    mov_title nvarchar(100) not null,
    mov_direction nvarchar(100),
    mov_description nvarchar(1000),
    mov_duration int check(mov_duration > 0) not null,
    mov_trailer nvarchar(500),
    mov_thumb nvarchar(500),
    mov_banner nvarchar(500),
    mov_lang nvarchar(50)
)
alter table Movie
    add mov_imdb nvarchar(10)
go
create table Auditorium(
    audi_id int identity(1, 1) not null primary key,    
    audi_name nvarchar(20),
    seats_no int check(seats_no > 0)
)
go
create table Screening(
    scr_id int identity(1, 1) not null unique,
    mov_id int foreign key(mov_id) references Movie(mov_id) on delete cascade,
    scr_date date not null,
    scr_time time not null,
    audi_id int foreign key(audi_id) references Auditorium(audi_id) on delete cascade,
    scr_price money not null,
    constraint pk_scr primary key(scr_date, scr_time, audi_id)
)
go
-- drop table Seat
create table Seat(
    seat_id int identity(1, 1) not null unique, --primary key,
    seat_number nvarchar(3) not null,
    audi_id int foreign key(audi_id) references Auditorium(audi_id) on delete cascade,
    constraint pk_seat primary key(seat_number, audi_id)
)
go
create table Account(
    acc_username nvarchar(50) not null primary key,
    acc_password nvarchar(50) not null,
    acc_fname nvarchar(20),
    acc_lname nvarchar(20),
    acc_email nvarchar(50),
    acc_phone nvarchar(12),
    acc_street nvarchar(50),
    acc_ward nvarchar(50),
    acc_district nvarchar(50),
    acc_city nvarchar(50),
    acc_zipCode nvarchar(20)
)
go
-- drop table Reservation
create table Reservation(

    -- res_id int identity(1, 1) not null primary key,
    acc_username nvarchar(50) foreign key(acc_username) references Account(acc_username) on delete cascade,
    seat_id int foreign key(seat_id) references Seat(seat_id),
    scr_id int foreign key(scr_id) references Screening(scr_id),
    res_id int identity(1, 1) not null unique,
    -- res_type_id int foreign key(res_type_id) references ReservationType(res_type_id),
    constraint pk_res primary key(scr_id, seat_id)
)
alter table Reservation
    add type nvarchar(10)
go
create table Foody(
    foo_id int identity(1, 1) not null primary key,
    foo_title nvarchar(200) not null,
    foo_price int check(foo_price > 0) not null,
    foo_img_url nvarchar(500),
    foo_img_alt nvarchar(100)
)
go
-- drop table ReservationFoody
create table ReservationFoody(
    scr_id int foreign key(scr_id) references Screening(scr_id),
    acc_username nvarchar(50) foreign key(acc_username) references Account(acc_username) on delete cascade,
    foo_id int foreign key(foo_id) references Foody(foo_id) on delete cascade,
    quantity int check(quantity > 0) not null
    constraint pk_res_foo primary key(scr_id, acc_username, foo_id)
)