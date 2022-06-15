/*
    자바주석처리부분
    
    sqldeveloper 에서만 가능한 주석
    
    -----------------------------------------------
    질의명령
        질의 : 물어본다. 의미
        
        데이터베이스 관리시스템한테 해당 데이터가 어디있는지
        문의를 한다고 해서 질의명령이라 한다.
----------------------------------------------------

SQL : Structured Qurey Language 의 약자
        구조화된 쿼리 언어
        
        이미 구조화되어 있는 명령을 사용해서 데이터를 조작하는 언어
        프로그램이 불가능한다는 점이 특징이다.
        
    명령종류 ]
        1. DML 명령
            - Data Manipulation Language (데이터 조작 언어)
            ==> 데이터를 추가, 수정, 삭제, 조회하는 작업을 하는 명령
            
            데이터를 조작하는 방법
                C   - CREATE    - INSET
                R   - READ      - SELECT
                U   - UPDATE    - UPDATE
                D   - DELETE    - DELETE
                
        2. DDL 명령
            - Date Definition Language (데이터 정의 언어)
            ==> 개체를 만들고 수정하는 언어
            
                CREATE  - 개체(테이블, 사용자, 함수, 인덱스, ...)를 만들때 사용하는 명령
                ALTER   - 개체를 수정하는 명령
                DROP    - 개체를 삭제하는 명령
                TRUNCATE- 테이블을 잘라내는 명령
                
        3. DCL 명령
            - Data Control Language (데이터 제어 언어)
            ==> 작업을 적용시킨다던지 (TCL 명령 : Transactoin Control Language)
                권한을 준다던지..
                
                COMMIT
                ROLLBACK
                
                GRANT
                REVOKE
                
---------------------------------------------------------------------------------------
*/

-- 이것은 오라클 주석

select * from emp;

select
    empno, ename, job, mgr, hiredate, sal, comm, dname, loc --select 절이라고 한다.
from
    emp e, dept d -- from 절이라고 한다.
where
    d.deptno = e.deptno; -- 조건절 또는 where절이라고 한다.
    
-- select * from emp e, dept d where d.deptno = e.deptno;

/*
    따라서 질의명령을 작성하는데 ;(세미콘론)을 적지 않으면
    명령이 끝나지 않은 것으로 간주한다.
    
    하나의 명령이 종료되면 반드시 세미콜론(;)을 적어줘야 한다.
*/

select * from emp;

select * from dept;

-----------------------------------------------------------------------------------
/*
    테이블 구조를 조회해보는 명령
    형식 ]
        describe    테이블이름;
        desc    테이블이름;
*/

-- emp 테이블의 구조를 조회해보자.
describe emp;

desc emp;
/*
    오라클의 데이터 타입
        
        숫자
            NUMBER, NUMBER(숫자) --> 숫자는 사용자릿수
            NUMBER(유효자릿수, 소수이하자릿수)
        문자
            CHAR
            ==> 고정 문자수 문자열데이터타입
            
                형식 ]
                    CHAR(숫자) --> 바이트수만큼의 문자 기억
                    CHAR(숫자 CHAR) --> 숫자갯수만큼의 문자 기억
            VARCHAR2
            ==> 가변 문자수 문자열데이터타입
                    VARCHAR2(숫자) --> 숫자수만큼의 바이트만큼 문자 기억
                    VARCHAR2(숫자 CHAR) --> 숫자갯수만큼의 문자를 기억할 수 있다.
                    
            예 ]
            
                CHAR(10)
                ==> 'A' ==> 이 문자를 기억할 때 10바이트를 모두 사용한다.
                VARCHAR2(10)
                ==> 'A' ==> 1바이트로 문자를 기억
                
        날짜
            Date
                형식 ]
                    Date
            
*/

/*
    SELECT
        컬럼이름들... 콤마로 구분해서 나열
    FROM
        테이블이름들... 콤마로 구분해서 나열
    [WHERE
                    ]
    [GROUP BY
                    ]
    [HAVING
                    ]
    [ORDER BY
                    ]
    ;
*/



-- 부서정보 테이블의 정보를 조회하세요.
SELECT    
    deptno, dname, loc
FROM
    dept
;

-- 1 + 4 의 결과를 조회하세요.

select 1 + 4 from emp;

select '양동수' from emp;

/*
    문자열 데이터 표현 : ''에 데이터를 표현한다.
    오라클에서는 문자와 문자열을 구분하지 않는다.
    
    
    참고 ]
        오라클에서 테이블이름, 컬럼이름, 연산자, 명령어,함수이름 들은 
        대소문자를 구분하지 않는다.
        
        하지만 주의사항으로
        데이터 자체는 반드시 대소문자를 구분해줘야 한다.
                
*/

-- 조건검색
/*
    SELECT
        컬럼이름
    FROM
        테이블이름
    WHERE
        조건
        
    조건 ]
    비교연산자
    =   : 같다
    >   : 작다
    <   : 크다
    <=
    >=
    !=  : 다르다
    <>  : 다르다
    
    역시 오라클에서도 동시에 두개를 비교하는 것은 안된다.
        예 ]
        
            700 < SAL < 1200 ==> X
            
        참고 ]
            오라클은 데이터의 형태를 매우 중요시한다.
            원칙적으로 문자는 문자끼리만 비교할 수 있고
            숫자는 숫자끼리만 비교할 수 있다.
            단, 
                날짜는 문자처럼 비교할 수 있다.
                이때 날짜 데이터와 문자데이터를 비교하는 것이 아니고
                문자데이터를 날짜데이터로 변환한 후 비교하게 된다.
                
        참고 ]
            오라클은 문자도 크리비교가 가능하다.
            아스키코드값으로 비교를 하기 때문에...
            
        참고 ]
            오라클은 문자와 문자열의 구분이 없다.
            대신 문자열데이터의 대소문자는 반드시 구분해서 처리해야 한다.
            
        참고 ]
            조건을 비교하는 방법은 오라클이 한줄을 출력할 때마다
            그 행이 조건에 맞는지를 확인한 후
            조건이 맞으면 출력하게 된다.
            
        참고 ]
            조건절에 조건을 여러개 나열하는 경우는
            AND 또는 OR 연산자를 이용해서 나열한다.
            
            이때 조회시간은 처음 조건이 많이 걸러내는 조건일수록
*/

-- 사원이름이 'smith' 인 사원의 급여를 조회하세요.
SELECT
    sal
FROM
    emp
WHERE
    eneme = 'smith' -- 데이터 자체는 대소문자를 구분해줘야한다.
;

-- 사원중 직급이 MANAGER이고 부서번호가 10번인 사원의 이름을 조회하세요.
SELECT
    ename
FROM
    emp
WHERE
    job = 'MANAGER'
    AND deptno = 10
;

---------------------------------------------------------------------------
/*
    1.
    사원 이름이 SMITH 인 사원의
        이름, 직급, 입사일을 조회하세요.
*/
SELECT
    ename, job, hiredate
FROM
    emp
WHERE
    ename = 'SMITH'
;

/*
    2.
    직급이 MANAGER 인 사원의
        이름, 직급, 급여
    를 조회하세요.
*/
SELECT
    ename, job, sal
FROM
    emp
WHERE
    job = 'MANAGER'
;

/*
    3.
    급여가 1500을 넘는 사원들의
        사원이름, 직급, 급여를
    조회하세요.
*/
SELECT
    ename, job, sal
FROM
    emp
WHERE
    sal > 1500
;

/*
    4.
    이름이 'S' 이후의 문자로 시작하는 사원들의(S 포함)
        사원이름, 직급, 급여
    를 조회하세요.
*/
SELECT
    ename, job, sal
FROM
    emp
WHERE
    ename = 'S*'
    -- VARCHAR2(1) = 'S'
;