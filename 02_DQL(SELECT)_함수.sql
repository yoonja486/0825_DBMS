/*
	함수< FUNCTION >
	
	자바로 따지면 메소드
	전달된 값을 가지고 계산된 결과를 반환해준다
	
	- 단일행 함수
	- 그룹 함수
*/

-------------------- < 단일행 함수 > -----------------------
/*
 * < 문자열과 관련된 함수 >
 * LENGTH / LENGTHB
 * 
 * STR : '문자열' / 문자열이 들어가있는 컬럼
 * 
 * "equals".length(); <-- 얘랑 똑같음
 * - LENGTH(STR)  : 전달된 문자열의 글자 수 반환
 * - LENGTHB(STR) : 전달된 문자열의 바이트 수 반환
 * 
 * 결과는 NUMBER타입
 * 
 * 한글 : 'ㄱ', 'ㅏ', '강' => 한 글자당 3Byte
 * 숫자, 영어, 특수문자 => 한 글자당 1Byte
 */
SELECT
	   LENGTH('오라클!')
	 , LENGTHB('오라클!')
  FROM
  	   DUAL;	-- 가상테이블(DUMMY TABLE)
  	   
SELECT
	   EMAIL
	 , LENGTH(EMAIL)
  FROM
       EMPLOYEE;

------------------------------------------------------------------------------
/*
 * INSTR
 * 
 * - INSTR(STR) : 문자열로부터 특정 문자의 위치값 반환
 * 
 * INSTR(STR, '특정 문자', 찾을 위치의 시작값, 순번)
 * 
 * 결과값은 NUMBER타입으로 반환
 * 찾을 위치의 시작값과 순번은 생략이 가능
 * 
 * 찾을 위치의 시작값
 * 1  : 앞에서부터 찾겠다.(기본값)
 * -1 : 뒤에서부터 찾겠다.
 */

SELECT
	   INSTR('AABAACAABBAA', 'B')
  FROM
  	   DUAL;

SELECT
	   INSTR('AABAACAABBAA', 'B', -1)
  FROM
  	   DUAL;	-- 뒤에서부터 첫 번째 'B'가 앞에서부터 몇 번째인지
  	   
SELECT
	   INSTR('AABAACAABBAA', 'B', 1, 3)
  FROM
  	   DUAL;	-- 앞에서 부터 'B'가 세 번째 나올때 몇 번째인지

SELECT
	   INSTR(EMAIL, '@') "@의 위치"
  FROM
       EMPLOYEE;

-----------------------------------------------------------------------------
/*
 * SUBSTR
 * 
 * - SUBSTR(STR, POSITION, LENGTH) : 문자열로부터 특전 문자열을 추출해서 반환
 * 
 * - STR 		: '문자열' 또는 문자타입 컬럼 값
 * - POSITION 	: 문자열 추출 시작위치값(POSITION번째 문자부터 추출) -> 음수도 가능
 * - LENGTH 	: 추출할 문자 개수(생략 시 끝까지 라는 의미)
 */

SELECT
	   SUBSTR('KH정보교육원', 3)
  FROM
       DUAL;

SELECT
       SUBSTR('KH정보교육원', 3, 2)
  FROM
       DUAL;

SELECT
	   SUBSTR('KH정보교육원', -3, 2)
  FROM
       DUAL;	-- POSITION이 음수일 경우 뒤에서 N번째 부터 추출하겠다 라는 의미

-- EMPLOYEE 테이블로부터 사원명과 이메일컬럼과 EMAIL컬럼에서의 아이디값만 추출해서 조회
SELECT
	   EMP_NAME 
	 , EMAIL
	 , SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) "아이디"
  FROM
       EMPLOYEE;

SELECT
	   EMP_NAME
	 , SUBSTR(EMP_NO, 8, 1) 
  FROM
  	   EMPLOYEE;

-- 남성 사원들만 이름을 조회
SELECT
	   EMP_NAME
  FROM
  	   EMPLOYEE
 WHERE
 	   SUBSTR(EMP_NO, 8, 1) = 1;
------------------------------------------------------------------------------------------
/*
 * LPAD / RPAD
 * 
 * -LPAD / RPAD(STR, 최종적으로 반환할 문자의 길이(바이트), 패딩할문자)
 * : 인자로 전달한 문자열에 임의의 문자를 왼쪽 또는 오른쪽에 덧붙여서 N길이만큼의 문자열 반환
 * 
 * 결과값은 CHARACTER타입으로 반환
 * 덧붙이고자 하는 문자는 생략 가능
 * 
 */

SELECT
	   EMAIL
  FROM
       EMPLOYEE;

SELECT
	   LPAD(EMAIL, 25)
  FROM
   	   EMPLOYEE;

SELECT
	   LPAD(EMAIL, 25, '!')
  FROM
  	   EMPLOYEE;

SELECT
	   EMP_NAME
	 , EMP_NO
  FROM
  	   EMPLOYEE;

-- EMPLOYEE 테이블에서 모든 직원의 사원명과 주민등록번호 뒤 6자리를 마스킹 처리해서 조회
-- 예시 => 이** 621345 - 1******

SELECT
	   SUBSTR(EMP_NAME, 1, 1)
	 , SUBSTR(EMP_NO, 1, 8)
  FROM
       EMPLOYEE;

SELECT
	   RPAD(SUBSTR(EMP_NAME, 1, 1), 4, '*')
	 , RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
  FROM
  	   EMPLOYEE;

	 



















  	   
