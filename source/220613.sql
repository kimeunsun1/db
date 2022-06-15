-- 계층질의명령을 활용해서 문제와 보기 조회
SELECT
    sqno, sqbody body, NVL(squpno, sqno) upno
FROM
    surveyQuest
WHERE
    sq_sino = 1001
START WITH
    squpno IS NULL
CONNECT BY
    PRIOR sqno = squpno
ORDER SIBLINGS BY
    sqno
;