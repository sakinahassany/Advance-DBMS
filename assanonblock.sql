--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


/* Based on the HR database this PL/SQL code will display 
the First name, Last name, phone number of employee and 
the name of departmant he is working also name of  city 
and province that department is located in by allow 
the user to enter the employee ID.*/

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT emid PROMPT 'Enter Employee ID: '

DECLARE

v_efname 	employees.first_name%TYPE;
v_elname 	employees.last_name%TYPE;
v_phone 	employees.phone_number%TYPE;
v_dpid  	employees.department_id%TYPE;
v_dpname 	departments.department_name%TYPE;
v_loc		departments.location_id%TYPE;
v_city		locations.city%TYPE;
v_st		locations.state_province%TYPE;

BEGIN

Select first_name,last_name,phone_number,employees.department_id,department_name,
departments.location_id, city,state_province
INTO v_efname,v_elname,v_phone,v_dpid,v_dpname,v_loc, v_city, v_st
From  employees, departments, locations
Where employee_id = &emid
AND employees.department_id = departments.department_id
AND departments.location_id = locations.location_id;

DBMS_OUTPUT.PUT_LINE('
');
DBMS_OUTPUT.PUT_LINE(' INFORMATION OF EMPLOYEE THAT YOU ENTERED THE ID ');
DBMS_OUTPUT.PUT_LINE('================================================');

DBMS_OUTPUT.PUT_LINE('The Employee Full Name is ' || v_efname || ' '||v_elname);
DBMS_OUTPUT.PUT_LINE(' With The Phone Number Of '||v_phone );
DBMS_OUTPUT.PUT_LINE('And He is working in the ' || v_dpname || ' Department');
DBMS_OUTPUT.PUT_LINE(' which is located in '||v_city||' Of '|| v_st);
END;
/
SET SERVEROUTPUT OFF
SET VERIFY ON