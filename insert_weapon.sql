INSERT INTO weapon(name, weapon_type, main_characteristic, side_characteristic, bonus)
SELECT (array['Улов', 'Благодатный владыка вод', 'Гроза драконов', 'Драгоценный омут', 'Истории Додоко', 'Копьё Фовония',
    'Меч-колокол', 'Меч-флейта', 'Морской атлас', 'Небесное крыло', 'Песнь странника', 'Пика полумесяца', 'Прототип: Злоба',
    'Церемониальный меч', 'Черногорская пика', 'Эпос о драконоборцах'])[k],
        ((array['Spear', 'Two_handed', 'Catalyst', 'One_handed', 'Bow'])[floor(random() * 5 + 1)])::weapon_type,
       (select ARRAY(
            select characteristic_id from characteristic
            where type = 'Базовая атака')
        )[floor(random() *
                 (select count(*) from characteristic
            where type = 'Базовая атака')
        + 1)],
       (select ARRAY(
            select characteristic_id from characteristic
            where type = any(array['Сила атаки, %', 'Восст. энергии, %', 'Защита, %', 'Шанс крит. попадания, %', 'Крит. попадания, %', 'Мастерство стихий',
                'Физ урон, %', 'HP, %'])
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = any(array['Сила атаки, %', 'Восст. энергии, %', 'Защита, %', 'Шанс крит. попадания, %', 'Крит. попадания, %', 'Мастерство стихий',
                'Физ урон, %', 'HP, %']))
                      + 1)],
       (select ARRAY(
            select bonus_id from bonus
            where value = 1)
        )[floor(random() *
                 (select count(*) from bonus
            where value = 1)
        + 1)]
FROM generate_series(1, 16) AS k;


