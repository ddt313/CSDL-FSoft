select Movie.mov_id, Screening.scr_date, Screening.scr_time, Screening.scr_price, Auditorium.audi_name, Movie.mov_duration
from Screening
inner join Movie
    on Screening.mov_id = Movie.mov_id
inner join Auditorium
    on Screening.audi_id = Auditorium.audi_id
-- where Movie.mov_id = 1
where Screening.scr_date = '2020-08-12'

use CinemaProjectFSoft

select distinct Auditorium.audi_name
from Auditorium
inner join Screening
    on Auditorium.audi_id = Screening.audi_id
where mov_id = 1 and scr_date = '2020-08-12'

select distinct Screening.scr_time
from Screening
inner join Auditorium
    on Screening.audi_id = Auditorium.audi_id
where mov_id = 1 and scr_date = '2020-08-12' and audi_name = 'audi01'


select Screening.scr_price, Screening.scr_discount
from Screening
inner join Auditorium
    on Screening.audi_id = Auditorium.audi_id
where scr_date = '2020-08-12' and audi_name = 'audi01' and scr_time = '20:30:00'

alter table Screening
    add scr_discount int check(scr_discount > 0)

select seat_id, seat_number
from Seat
where seat_id = (
select seat_id
from Reservation
where scr_id = (
    select Screening.scr_id
    from Screening
    inner join Auditorium
        on Screening.audi_id = Auditorium.audi_id
    where scr_date = '2020-08-12' and Screening.audi_id = 1 and scr_time = '18:00:00'
)
)

select seat_id, seat_number
from Seat
where audi_id = (
    select Screening.audi_id
    from Screening
    inner join Auditorium
        on Screening.audi_id = Auditorium.audi_id
    where scr_date = '2020-08-12' and audi_name = 'audi01' and scr_time = '20:30:00'
)

select *
from Foody

select mov_id, mov_title, mov_thumb, mov_imdb, mov_duration, mov_trailer
from Movie
where mov_id = 1;

insert into Reservation values('ddthanh', 3, 4, 'online')

select *
from ReservationFoody
where acc_username = 'ddthanh' and scr_id = 1 and foo_id = 1

insert into ReservationFoody values(1, 'ddthanh', 1, 3)

drop trigger Trg_ReservationFoody_Insert

update ReservationFoody
set quantity = quantity + 3
where acc_username = 'ddthanh' and scr_id = 1 and foo_id = 1

select *
from Screening
where mov_id = 1 and scr_date = '2020-08-12'