-- use CinemaProjectFSoft
alter trigger Trg_ReservationFoody_Insert
on ReservationFoody
for insert
as
begin
    declare @scr_id int
    declare @foo_id int
    declare @acc_username nvarchar(50)
    declare @quantity int

    print 'vo trigger'

    select @scr_id = scr_id, @foo_id = foo_id, @acc_username = acc_username, @quantity = quantity
    from inserted

    update ReservationFoody
    set ReservationFoody.quantity = ReservationFoody.quantity + @quantity
    where ReservationFoody.scr_id = @scr_id
        and ReservationFoody.foo_id = @foo_id
        and ReservationFoody.acc_username = @acc_username
    
    rollback transaction
end