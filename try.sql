--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


set serveroutput on
set verify off
create or replace trigger cal_update_aircraft
Before insert or update ON charter
  FOR EACH ROW
DECLARE 
  LENGTH_HOURS EXCEPTION;

BEGIN
UPDATE aircraft
set ac_hours_flown = ac_hours_flown + 10
Where ac_number ='4278Y';
DBMS_OUTPUT.PUT_LINE('
');
RAISE LENGTH_HOURS;
EXCEPTION

  WHEN LENGTH_HOURS THEN

DBMS_OUTPUT.PUT_LINE('Charter trip added and aircraft hours flown updated.');
end;
/
