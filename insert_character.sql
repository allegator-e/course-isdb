INSERT INTO character(name, level, hp, basic_attack, crit_damage, cd_chance, position_type, element, role, artifact_set, talent_1, talent_2, talent_3, weapon)
SELECT (array['Дилюк', 'Кейа', 'Эмбэр', 'Сяо', 'Аяка', 'Баал',
    'Кокоми', 'Чжун Ли', 'Вeнти', 'Тарталья', 'Беннет', 'Цици', 'Барбара',
    'Джинн', 'Сян Лин', 'Син Цю', 'Ху Тао'])[k],
        floor(random() * 90 + 1),
       floor(random() * 20000 + 1000),
       floor(random() * 400 + 10),
       floor(random() * 120 + 50),
       floor(random() * 35 + 5),
       ((array['Spearman', 'Two_handed', 'Catalyst', 'One_handed', 'Archer'])[floor(random() * 5 + 1)])::position_type,
       ((array['Крио', 'Пиро', 'Анемо', 'Гео', 'Гидро', 'Электро'])[floor(random() * 5 + 1)])::element,
       ((array['Main_DPS', 'Sub_DPS', 'Healer', 'Support', 'Shieldman'])[floor(random() * 5 + 1)])::role,
       (select ARRAY(
            select artifact_set_id from artifact_set)
        )[floor(random() *
                 (select count(*) from artifact_set)
        + 1)],
       1,
       2,
       3,
       (select ARRAY(
            select weapon_id from weapon)
        )[floor(random() *
                 (select count(*) from weapon)
        + 1)]
FROM generate_series(1, 17) AS k;


