INSERT INTO artifact_set(artifact_1, artifact_2, artifact_3, artifact_4, artifact_5)
SELECT (select ARRAY(
            select artifact_id from artifact
            where type = 'Цветок')
        )[floor(random() *
                 (select count(*) from artifact
            where type = 'Цветок')
        + 1)],
        (select ARRAY(
            select artifact_id from artifact
            where type = 'Перо')
        )[floor(random() *
                 (select count(*) from artifact
            where type = 'Перо')
        + 1)],
       (select ARRAY(
            select artifact_id from artifact
            where type = 'Часы')
        )[floor(random() *
                 (select count(*) from artifact
            where type = 'Часы')
        + 1)],
       (select ARRAY(
            select artifact_id from artifact
            where type = 'Кубок')
        )[floor(random() *
                 (select count(*) from artifact
            where type = 'Кубок')
        + 1)],
       (select ARRAY(
            select artifact_id from artifact
            where type = 'Корона')
        )[floor(random() *
                 (select count(*) from artifact
            where type = 'Корона')
        + 1)]
FROM generate_series(0, 300) AS k;


