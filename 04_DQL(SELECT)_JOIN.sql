SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;

-- 전체사원들의 사번, 사원명, 부서코드, 부서명을 한꺼번에 조회하고 싶다.
SELECT 
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
  FROM
       EMPLOYEE;

SELECT
       DEPT_ID
     , DEPT_TITLE
  FROM
       DEPARTMENT;

-- 전체사원들의 사번, 사원명, 직급코드, 직급명을 한 번에 조회
SELECT
       EMP_ID
     , EMP_NAME  
     , JOB_CODE
  FROM
       EMPLOYEE;

SELECT 
       JOB_CODE
     , JOB_NAME
  FROM 
       JOB;
----------------------------------------------------------------------------------------------

--> JOIN을 통해 연결고리에 해당하는 컬럼만 매칭시킨다면 마치 하나의 조회 결과물처럼 조회 가능

-- KH
-- 어떤 강의장에 어떤 강사가 수업을 하고 있는가?
CREATE TABLE CLASS_ROOM(
    CLASS_ID CHAR(1),
    LECTURE_NAME VARCHAR2(20)
 );
SELECT * FROM CLASS_ROOM;

INSERT INTO CLASS_ROOM VALUES('A', '이승철');		-- 테이블에 정보 추가 하고 싶을 때
INSERT INTO CLASS_ROOM VALUES('B', '홍길동');
INSERT INTO CLASS_ROOM VALUES('C', '고길동');

CREATE TABLE STUDENT(
    CLASS_ID CHAR(1),
    STUDENT_NAME VARCHAR2(20) 
);
INSERT INTO STUDENT VALUES('A', '이승욱');
INSERT INTO STUDENT VALUES('A', '채정민');
INSERT INTO STUDENT VALUES('B', '김윤기');
INSERT INTO STUDENT VALUES('C', '김태호');
COMMIT;		-- INSERT 추가가 끝나면 COMMIT을 해줘야한다.

SELECT 
       CLASS_ID
     , LECTURE_NAME
  FROM
       CLASS_ROOM;

SELECT 
       CLASS_ID
     , STUDENT_NAME
  FROM 
       STUDENT;

SELECT
       LECTURE_NAME
     , CLASS_ROOM.CLASS_ID
     , STUDENT.CLASS_ID
     , STUDENT_NAME
  FROM 
       CLASS_ROOM, STUDENT		-- 1절 끝
 WHERE
       CLASS_ROOM.CLASS_ID = STUDENT.CLASS_ID;

/*
 * < JOIN >
 * 
 * 두 개 이상의 테이블에서 데이터를 한 번에 조회하기 위해 사용하는 구문
 * 조회 결과는 하나의 ResultSet으로 나옴
 * 
 * 관계형 데이터베이스에서는 최소한의 데이터로 각각의 테이블에 데이터를 보관하고 있음(중복방지)
 * -> JOIN구문을 사용해서 여러 개의 테이블 간 "관계"를 맺어서 같이 조회 해야함
 * -> 무작정 JOIN을 하는 것이 아니고 테이블 간 매칭을 할 수 있는 컬럼이 존재해야함
 * 
 * JOIN은 크게 "오라클 전용구문"과 "ANSI(미국국립표준협회)구문"으로 나뉜다.
 * 
 * ===========================================================================
 * 			오라클 전용 구문			|		  ANSI(오라클 + 타 DBMS)구문
 * ===========================================================================
 * 				등가조인				|				내부조인
 * 			 (EQUAL JOIN)			|			 (INNER JOIN)
 * ---------------------------------------------------------------------------
 * 				포괄조인				|		왼쪽 외부조인(LEFT OUTER JOIN)
 * 	         (LEFT OUTER)			|	   오른쪽 외부조인(RIGHT OUTER JOIN)
 * 			 (RIGHR OUTER)			|    전체 외부조인(FULL OUTER JOIN) -> 오라클에선 X
 * ----------------------------------------------------------------------------
 * 			   카테시안 곱				|				교차조인
 *  	  (CARTESIAN PRODUCT)		|			 (CROSS JOIN)
 * ----------------------------------------------------------------------------
 * 	자체조인(SELF JOIN)
 *  비등가조인(NON EQUAL JOIN)
 *  자연조인(NATURAL JOIN)
 * 
 */

/*
 * 1. 등가조인(EQUAL JOIN) / 내부조인(INNER JOIN)
 * 
 * JOIN 시 연결시키는 컬럼의 값이 일치하는 행들만 조인되서 조회
 * ( == 일치하지 않는 값들을 조회에서 제외 )
 */

--> 오라클 전용 구문
--> SELECT 절에는 조회하고 싶은 컬럼명을 각각 기술
-->   FROM 절에는 조회하고자 하는 테이블을  , 를 이용해서 전부 다 나열
-->  WHERE 절에는 매칭을 시키고자 하는 컬럼명에 대한 조건을 제시함( = )

-- 전체 사원들의 사원명, 부서코드, 부서명을 한꺼번에 조회
SELECT * FROM EMPLOYEE;		-- EMP_NAME, DEPT_CODE
SELECT * FROM DEPARTMENT;	-- DEPT_ID, DEPT_TITLE

-- CASE 1. 연결할 두 컬럼의 컬럼명이 다른경우(DEPT_CODE - DEPT_ID)

SELECT
       EMP_NAME
     , DEPT_CODE
     , DEPT_ID
     , DEPT_TITLE
  FROM
       EMPLOYEE
     , DEPARTMENT
 WHERE 
       DEPT_CODE = DEPT_ID;		
-- 207개 행중에서 21개행만 일치하더라
-- 일치하지 않는 값들은 조회에서 제외(일치하는것만 조회됨)
-- DEPT_CODE가 NULL인 사원 2명은 데이터가 조회되지 않는다.
-- DEPT_ID가 D3, D4, D7인 부서데이터가 조회되지 않는다.

-- 전체 사원들의 사원명, 직급코드, 직급명
SELECT * FROM JOB;			-- JOB_CODE, JOB_NAME
SELECT * FROM EMPLOYEE;		-- EMP_NAME, JOB_CODE

-- CASE 2. 연결할 두 컬럼의 이름이 같은 경우(JOB_CODE)



  

       

























