-- 설문 문제의 보기 정보를 조회하는 질의명령
SELECT
    sqno, sqbody body, NVL(squpno, sqno) upno, ROUND(cnt / total * 100, 2) per
FROM
    surveyQuest,
    (
        SELECT
            sqno qno, COUNT(sv_sqno) cnt
        FROM
            surveyQuest, survey
        WHERE
            sqno = sv_sqno(+)
            AND squpno IS NOT NULL
            AND sq_sino = 1001
        GROUP BY
            sqno
        ORDER BY
            qno
    ),
    (
        SELECT
            count(DISTINCT smno) total
        FROM
            survey, surveyQuest
        WHERE
            sv_sqno(+) = sqno
            AND sq_sino = 1001
    )
WHERE
    sqno = qno(+)
ORDER BY
    upno, sqno
;

SELECT
    sqno, sqbody body, NVL(squpno, sqno) upno, ROUND(cnt / total * 100, 2) per
FROM
    surveyQuest,
    (
        SELECT
            sqno qno, COUNT(sv_sqno) cnt
        FROM
            surveyQuest, survey
        WHERE
            sv_sqno(+) = sqno
            AND sq_sino = 1001
        GROUP BY
            sqno
        ORDER BY
            qno
    ),
    (
        SELECT
            count(DISTINCT smno) total
        FROM
            survey, surveyQuest
        WHERE
            sv_sqno(+) = sqno
            AND sq_sino = 1001
    )
WHERE
    sqno = qno(+)
ORDER BY
    upno, sqno
;