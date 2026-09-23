SELECT * FROM STUDENT;

--학번_이름 , EX) 20153075_옥한빛
--CONCAT (문자열 이어붙이기)
SELECT CONCAT(CONCAT(STU_NO, '_'), STU_NAME)
FROM STUDENT

SELECT STU_NO || '_' || STU_NAME
FROM STUDENT

----2) LENGTH
SELECT ID, LENGTH(ID)
FROM PROFESSOR;

SELECT * FROM STU

 --SUBSTR
 SELECT NAME, SUBSTR(JUMIN,7)
 FROM STU;
 
 --DECODE -> 자바의 IF문
 --DECODE(컬럼값, 1, 컬럼값이 1일때 출력, 아닐때 출력)
 SELECT NAME, DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자')
 FROM STU
 
 -- UPPER, LOWER
 SELECT 
    UPPER('HELLO OrAcLE'),
    LOWER('HELLO OrAcLE')
FROM DUAL

--INSTR(특정 문자열이 몇번쨰에 위치에 처음 나오는지)
SELECT 
    EMAIL,
    INSTR(EMAIL, '@')
FROM PROFESSOR

SELECT SUBSTR(EMAIL,INSTR(EMAIL, '@')+1)
FROM PROFESSOR

--TRIM, LTRIM, RTRIM
SELECT
TRIM('   Hello Oracle   '),
LTRIM('   Hello Oracle   '),
RTRIM('   Hello Oracle   ')
from dual

--LPAD, RPAD (지정한 길이 만큼 특정 문자열 채우기)
select
    ID,
    RPAD(ID, 10, '*'),
    LPAD(ID, 10, '*')
from professor

-- 아이디에 첫 3글자만 출력하고 나머지 공간을 * 채우기
-- 아이디가 6글자면 *이 4개, 아이디가 8글자면 *는 5개

SELECT 
    ID,
    RPAD(SUBSTR(ID, 1, 3),LENGTH(ID), '*')
    FROM PROFESSOR
    
 --아이디의 마지막 3글자만 *로 출력 
 
 SELECT 
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH(ID), '*')
FROM PROFESSOR

-- EMAIL에서 아이디 뒷부분을 다 *로 출력
--captain@abc.net -> captain@*******
select * from professor

select
    INSTR(EMAIL, '@'),
    substr(EMAIL, 1 , INSTR(EMAIL, '@')),
    RPAD(SUBSTR(EMAIL, 1 , INSTR(EMAIL,'@')), LENGTH(EMAIL), '*')
from professor

