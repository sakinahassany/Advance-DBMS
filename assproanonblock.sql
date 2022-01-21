--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


/* Based on the HR database this PL/SQL code is the procedure 
that retrieve location of the department and
the procedure is called from anonymous block by allowing 
the user to enter department ID.*/

create or replace procedure dep_call
(dpid IN 		departments.department_id%TYPE,
v_dpname OUT 		departments.department_name%TYPE,
v_dplid OUT 		locations.location_id%TYPE,
v_str OUT 		locations.street_address%TYPE,
v_pos OUT 		locations.postal_code%TYPE,
v_city OUT 		locations.city%TYPE,
v_st OUT 		locations.state_province%TYPE,
v_dpcnid OUT 		countries.country_id%TYPE,
v_dpcnN OUT 		countries.country_name%TYPE)
AS
BEGIN
Select department_name, location_id,street_address,postal_code, city,
state_province,country_id,country_name
INTO v_dpname, v_dplid,v_str,v_pos, v_city,v_st, v_dpcnid, v_dpcnN

FROM departments Natural JOIN locations Natural JOIN countries
WHERE department_id = dpid ;
END dep_call;
/
SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT dpid PROMPT 'Enter the department ID: '
DECLARE

v_dpname  		departments.department_name%TYPE;
v_dplid  		locations.location_id%TYPE;
v_str   		locations.street_address%TYPE;
v_pos   		locations.postal_code%TYPE;
v_city  		locations.city%TYPE;
v_st    		locations.state_province%TYPE;
v_dpcnid  		countries.country_id%TYPE;
v_dpcnN  		countries.country_name%TYPE;

BEGIN

dep_call(&dpid, v_dpname, v_dplid, v_str, v_pos, v_city,v_st,v_dpcnid,v_dpcnN);
DBMS_OUTPUT.PUT_LINE('
');
DBMS_OUTPUT.PUT_LINE('LOCATION OF DEPARTMENT THAT YOU ENTERED THE ID ');
DBMS_OUTPUT.PUT_LINE('================================================');
DBMS_OUTPUT.put_line('Department Name is	' || v_dpname);
DBMS_OUTPUT.put_line('Street Address is 	' || v_str);
DBMS_OUTPUT.put_line('The Postal Code is	' || v_pos);
DBMS_OUTPUT.put_line('The City Name is	' || v_city);
DBMS_OUTPUT.put_line('THE Province is		' || v_st);
DBMS_OUTPUT.put_line('The Country is 		' || v_dpcnN);
END;
/
