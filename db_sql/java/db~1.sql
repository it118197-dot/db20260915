-- FRUIT 테이블 기준
-- 오렌지, 1500원, 15개 데이터를 삽입 커밋
-- 가격이 1000원 이상인 과일 조회
-- 오렌지 과일의 개수를 기존 개수 +3개 커밋
-- 오렌지 과일을 삭제 커밋 X

COMMIT
 
INSERT INTO FRUIT
VALUES('오렌지', 1500, 15);

SELECT * FROM FRUIT WHERE PRICE >= 500

UPDATE FRUIT SET CNT = CNT +3 
WHERE FRUIT_NAME = '오렌지'

DELETE FROM FRUIT WHERE FRUIT_NAME = '오렌지';

ROLLBACK


INSERT INTO FRUIT VALUES('딸기', 30000, 10)

UPDATE FRUIT SET PRICE = 5000 WHERE FRUIT_NAME = '사과'