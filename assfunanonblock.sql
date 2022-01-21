--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


/* Based on the HR database this PL/SQL code is the function
that updates the salary of the employee and
the function is called from anonymous block by allowing 
the user to enter employee id.*/

CREATE OR REPLACE FUNCTION update_EMP
(emid employees.employee_id%TYPE)
RETURN number
IS 
v_pro number;
BEGIN
IF emid < 120 THEN v_pro :=  0.2;
ELSIF emid > 120 AND emid < 130 THEN v_pro := 0.15;
ELSE v_pro := 0.1;
END IF;

RETURN (v_pro);
END update_EMP;
/

SET SERVEROUTPUT ON
SET VERIFY OFF

Accept emid PROMPT 'Enter the employee id: '
DECLARE
v_fname 	employees.first_name%TYPE;
v_lname 	employees.last_name%TYPE;
v_salary 	employees.salary%TYPE;
v_id		departments.department_id%TYPE;
v_name		departments.department_name%TYPE;
v_pro	 	employees.salary%TYPE;

BEGIN

Select first_name, last_name, salary, department_id, department_name
Into v_fname, v_lname, v_salary, v_id, v_name
From employees JOIN departments USING(department_id)
WHERE employee_id = &emid;

DBMS_OUTPUT.put_line('
');
DBMS_OUTPUT.put_line('THE DETAILS OF EMPLOYEE THAT YOU ENTERED THE ID	');
DBMS_OUTPUT.put_line('======================================================');
DBMS_OUTPUT.put_line('The Employee Full Name is 	'  || v_fname ||' '|| v_lname);
DBMS_OUTPUT.put_line('The Employee is working IN 	' || v_name ||' Department.');
DBMS_OUTPUT.put_line('His Original Salary is		' || v_salary);

v_pro := update_EMP(&emid);
v_pro := v_salary + (v_salary * v_pro);

DBMS_OUTPUT.put_line('His Salary After Promotion is	'||v_pro);
END;
/
