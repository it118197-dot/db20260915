-- 조건 함수
SELECT * FROM STUDENT

SELECT * FROM PROFESSOR

SELECT * FROM PROFESSOR
WHERE PAY+BONUS >= 300   -- NULL값을 더하면 결과도 NULL

SELECT NAME, PAY, BONUS, PAY+BONUS
FROM PROFESSOR

--NVL, NVL2 : NULL을 처리하는 함수
--NVL(컬럼명, 대체값) -> 컬럼 값이 NULL이면 대체값으로 출력


SELECT   NAME,
          PAY,
NVL(BONUS, 0), 
     PAY+NVL(BONUS, 0)
FROM PROFESSOR

SELECT * FROM PROFESSOR
WHERE PAY+NVL(BONUS, 0) >= 300

SELECT 
    NAME, BONUS, NVL2(BONUS, '있다', '없다')
FROM PROFESSOR

--DECODE : 자바의 IF문
SELECT 
    STU_NAME,
    DECODE(STU_GENDER, 'M', '남자'), -- IF까지
    DECODE(STU_GENDER, 'M', '남자','여자')  -- IF ~ELSE까지
FROM STUDENT

SELECT 
    DECODE(STU_GRADE, 1, '저학년', 2,STU_GRADE || '학년', '고학년')
    FROM STUDENT

-- 학생 이름, 성별 (남자 OR 여자) 출력
-- 성별을 구하는 방법은 JUMIN의 7번째 숫자가 1(남자) OR 2(여자)

SELECT NAME, 
    SUBSTR(JUMIN, 7 , 1),
     DECODE(SUBSTR(JUMIN, 7 , 1), 1 , '남자', '여자')
 FROM STU

--CASE WHEN (범위에 대한 조건 줄때 좋다)
SELECT 
      STU_NO,
       CASE
            WHEN ENR_GRADE >= 80 THEN '통과'
            WHEN ENR_GRADE >= 70 THEN '보류'
            ELSE '재시험'
       END AS 시험결과
FROM ENROL;

--PAY + BONUS가 500이상이면 '높다'
--300이상 500미만이면 '중간'
--그 외는 '낮다' 출력

SELECT 
      NAME, 
      CASE 
        WHEN PAY + NVL(BONUS,0) >= 500 THEN '높다'
        WHEN PAY + NVL(BONUS,0) >= 300 THEN '중간'
        ELSE '낮다'
      END AS 급여등급    
FROM PROFESSOR

-- 1. (EMP) 81년도에 입사한 사람의 숫자를 출력하세요.
SELECT
    COUNT(*)
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YY') = '81'

-- 1. (EMP) 81년도에 입사한 사람의 숫자를 출력하세요.
SELECT 
    COUNT(*) 
  FROM EMP 
WHERE HIREDATE BETWEEN '81/01/01' AND '81/12/31' 

-- 2. (EMP) SAL+COMM의 값이 2500 이상인 사람의 숫자를 출력하세요.
SELECT COUNT(*)
FROM EMP
WHERE SAL +  NVL(COMM, 0) >= 2500

-- 3. (EMP) 직급(JOB)별 가장 높은 급여를 출력하세요. (직급, 가장 높은급여 출력)
SELECT
    JOB,
    MAX(SAL)
FROM EMP
GROUP BY JOB

-- 4. (EMP) 부서(DEPTNO)별 평균급여를 구하세요. 단, 출력은 평균급여가 1800이상인 부서명, 평균급여를 출력하세요.
SELECT
     DEPTNO,
     AVG(SAL)
FROM EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 1800

-- 5. (EMP) 입사년도별 사원수를 출력하세요. (결과화면 하단 이미지 참고)
SELECT 
    TO_CHAR(HIREDATE, 'YY') AS 입사년도,
    COUNT(*) AS 사원수
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY');

-- 6. (STU) 태어난 월(JUMIN 컬럼 3,4번째 숫자)별 학생 수를 구하시오. (결과화면 하단 이미지 참고)
SELECT  
    SUBSTR(JUMIN, 3, 2) || '월' 월,
    COUNT(*) 학생수
FROM STU 
GROUP BY SUBSTR(JUMIN, 3, 2)
ORDER BY 월;

-- 7. (STU) 각 성별별로 학생 수를 아래 이미지와 같이 구하시오.(하단 이미지 참고)
SELECT 
    SUM(DECODE(SUBSTR(JUMIN, 7 ,1), 1 ,1, 0)) 남학생수,
    SUM(DECODE(SUBSTR(JUMIN, 7 ,1), 2 ,1, 0)) 여학생수
FROM STU
    