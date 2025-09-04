SELECT * FROM EMPLOYEE; -- EMP_ID , EMP_NAME, SALARY, DEPT_CODE, JOB_CODE			
SELECT * FROM JOB;                                            -- JOB_CODE, JOB_NAME
SELECT * FROM DEPARTMENT;                          -- DEPT_ID,                       DEPT_TITLE

SELECT	-- 2번 부서가 동일한 사원조회
       EMP_NAME
	 , DEPT_TITLE
  FROM
       EMPLOYEE E
     , DEPARTMENT D
     , JOB J
 WHERE
       E.DEPT_CODE = D.DEPT_ID    
   AND
       E.JOB_CODE = J.JOB_CODE 
   AND 
	   D.DEPT_TITLE = '총무부';


SELECT	-- 3. 직급이 동일한 사원 조회
       EMP_NAME
     , JOB_NAME
  FROM
       EMPLOYEE E
  LEFT
  JOIN
       JOB J USING(JOB_CODE)
  LEFT
  JOIN
       DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
 WHERE
       JOB_NAME = '과장';
      
       
       