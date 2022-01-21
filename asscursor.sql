--Done by: Sakina Hassany 1210850
--Submitted to: Dr. Lili Marziana Abdullah


/* According to HR database this PL/SQL statement is to update 
Maximum salary in jobs table by asking user to enter the job ID.*/

SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT jobid Prompt 'Enter the job ID: '

DECLARE  
   CURSOR jobupdate IS
   Select max_salary
   From jobs
   Where job_id = &jobid;
   job_rec jobupdate%ROWTYPE;
   
BEGIN 
OPEN jobupdate;
LOOP
FETCH jobupdate
INTO job_rec;
   UPDATE jobs 
   SET max_salary = max_salary + 50;
   EXIT WHEN jobupdate%NOTFOUND;
END LOOP;
DBMS_output.put_line('The Maximum Salary is Updated.');
CLOSE jobupdate;  
END; 
/ 