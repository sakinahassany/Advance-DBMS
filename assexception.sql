--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


/* Based on the HR database this PL/SQL program will display
  the last name of employee who's first name is Alexander
since there are more than employees that have Alexander as their 
first name. So the program has error which by using EXCEPTION HANDLER
it can be run. */

SET SERVEROUTPUT ON
DECLARE
lname VARCHAR2(15);
BEGIN
SELECT last_name INTO lname 
FROM employees 
WHERE first_name='Alexander';

DBMS_OUTPUT.PUT_LINE ('Alexander''s last name is : ' ||lname);

EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE ('The select statement retrieved multiple rows.');
END;
/