-- �������Ǹ���� Ȱ���ؼ� ������ ���� ��ȸ
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