INSERT INTO artifact(name, type, main_characteristic, side_characteristic_1, side_characteristic_2, side_characteristic_3, side_characteristic_4)
SELECT (array['Цветок искателя приключений'     ,
'Клевер везунчика'                ,
'Серебряный лотос целителя'       ,
'Сердце товарищества'             ,
'Роза берсерка'                   ,
'Брошь инструктора'               ,
'Цветок изгнанника'               ,
'Цветок защитника'                ,
'Брошь храбреца'                  ,
'Алый цветок воина'               ,
'Закладка учёного'                ,
'Цветок почестей'                 ,
'Занесённая снегом память'        ,
'Далёкая душа юной девы'          ,
'Ностальгия гладиатора'           ,
'Воспоминания об изумрудных лугах',
'Рассвет ансамбля'                ,
'Милосердие буревестника'         ,
'Ведьмин огненный цветок'         ,
'Королевский цветок'              ,
'Незапятнанный цветок'            ,
'Железное сердце рыцаря крови'    ,
'Цветок скальных трещин'          ,
'Цветок равноденствия'            ,
'Позолоченная брошь'              ])[floor(random() * 25 + 1)],
       'Цветок',
       (select ARRAY(
            select characteristic_id from characteristic
            where type = 'HP, %'
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = 'HP, %')
                      + 1)],
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1))
FROM generate_series(0, 30) AS k;

INSERT INTO artifact(name, type, main_characteristic, side_characteristic_1, side_characteristic_2, side_characteristic_3, side_characteristic_4)
SELECT (array['Перо искателя приключений'           ,
'Орлиное перо везунчика'              ,
'Совиное перо целителя'               ,
'Перо возвращения домой'              ,
'Перо берсерка'                       ,
'Перо инструктора'                    ,
'Перо изгнанника'                     ,
'Перо защитника'                      ,
'Надежды храбреца'                    ,
'Перо воина'                          ,
'Перо учёного'                        ,
'Боевое перо командира'               ,
'Решимость крушителя льда'            ,
'Тоска юной девы'                     ,
'Судьба гладиатора'                   ,
'Оперение стрелы изумрудного охотника',
'Оперение стрелы барда'               ,
'Переживший катастрофу'               ,
'Пылающее ведьмино перо'              ,
'Королевское перо'                    ,
'Перо мудрого лекаря'                 ,
'Перо рыцаря крови'                   ,
'Перо зубчатых пиков'                 ,
'Конец равноденствия'                 ,
'Порыв ностальгии'                    ])[floor(random() * 25 + 1)],
       'Перо',
       (select ARRAY(
            select characteristic_id from characteristic
            where type = 'Сила атаки, %'
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = 'Сила атаки, %')
                      + 1)],
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1))
FROM generate_series(0, 30) AS k;

INSERT INTO artifact(name, type, main_characteristic, side_characteristic_1, side_characteristic_2, side_characteristic_3, side_characteristic_4)
SELECT (array['Часы искателя приключений'     ,
'Песочные часы везунчика'       ,
'Карманные часы целителя'       ,
'Солнечные часы временщика'     ,
'Часы берсерка'                 ,
'Карманные часы инструктора'    ,
'Карманные часы изгнанника'     ,
'Часы защитника'                ,
'Стойкость храбреца'            ,
'Водяные часы воина'            ,
'Часы учёного'                  ,
'Золотые часы'                  ,
'Гибель замёрзшей родины'       ,
'Уходящая молодость юной девы'  ,
'Стремление гладиатора'         ,
'Решимость изумрудного охотника',
'Окончание концерта'            ,
'Песочные часы грома'           ,
'Ведьмин последний час'         ,
'Королевские карманные часы'    ,
'Замершее мгновение'            ,
'Час долга рыцаря крови'        ,
'Часы из прочного нефрита'      ,
'Час равноденствия'             ,
'Медный компас'                 ])[floor(random() * 25 + 1)],
       'Часы',
       (select ARRAY(
            select characteristic_id from characteristic
            where type = any(array['Сила атаки, %', 'Защита, %', 'Восст. энергии, %', 'HP, %', 'Мастерство стихий'])
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = any(array['Сила атаки, %', 'Защита, %', 'Восст. энергии, %', 'HP, %', 'Мастерство стихий']))
                      + 1)],
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1))
FROM generate_series(0, 50) AS k;

INSERT INTO artifact(name, type, main_characteristic, side_characteristic_1, side_characteristic_2, side_characteristic_3, side_characteristic_4)
SELECT (array['Кубок искателя приключений'   ,
'Кубок везунчика'              ,
'Чайничек целителя'            ,
'Кубок временщика'             ,
'Костяной кубок берсерка'      ,
'Чайная кружка инструктора'    ,
'Кубок изгнанника'             ,
'Фляжка защитника'             ,
'Проводы храбреца'             ,
'Винный бокал воина'           ,
'Чернильница учёного'          ,
'Золотой кубок клятвы'         ,
'Морозная гордость'            ,
'Досуг юной девы'              ,
'Пьянство гладиатора'          ,
'Сосуд изумрудного охотника'   ,
'Фляжка странника'             ,
'Предвестник бури'             ,
'Пламя ведьминого сердца'      ,
'Королевская серебряная фляжка',
'Превосходящая чаша'           ,
'Кубок рыцаря крови'           ,
'Кубок из резного камня'       ,
'Шар равноденствия'            ,
'Кубок оглушающих глубин'      ])[floor(random() * 25 + 1)],
       'Кубок',
       (select ARRAY(
            select characteristic_id from characteristic
            where type = any(array['Сила атаки, %', 'HP, %', 'Защита, %', 'Мастерство стихий',
            'Пиро урон, %', 'Гидро урон, %', 'Гео урон, %', 'Электро урон, %', 'Анемо урон, %', 'Крио урон, %', 'Физ урон, %'])
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = any(array['Сила атаки, %', 'HP, %', 'Защита, %', 'Мастерство стихий',
            'Пиро урон, %', 'Гидро урон, %', 'Гео урон, %', 'Электро урон, %', 'Анемо урон, %', 'Крио урон, %', 'Физ урон, %']))
                      + 1)],
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1))
FROM generate_series(0, 50) AS k;

INSERT INTO artifact(name, type, main_characteristic, side_characteristic_1, side_characteristic_2, side_characteristic_3, side_characteristic_4)
SELECT (array['Повязка искателя приключений' ,
'Серебряная корона везунчика'  ,
'Платок целителя'              ,
'Венок расставания'            ,
'Боевая маска берсерка'        ,
'Кепка инструктора'            ,
'Корона изгнанника'            ,
'Повязка защитника'            ,
'Венок храбреца'               ,
'Повязка воина'                ,
'Очки учёного'                 ,
'Древний шлем генерала'        ,
'Эхо осколков инея'            ,
'Увядающая красота юной девы'  ,
'Триумф гладиатора'            ,
'Венок изумрудного охотника'   ,
'Цилиндр дирижёра'             ,
'Корона призывателя грома'     ,
'Тлеющая ведьмина шляпа'       ,
'Королевская маска'            ,
'Смеющаяся маска'              ,
'Железная маска рыцаря крови'  ,
'Маска из одинокого базальта'  ,
'Маска равноденствия'          ,
'Треуголка в пятнах вина'       ])[floor(random() * 25 + 1)],
       'Корона',
       (select ARRAY(
            select characteristic_id from characteristic
            where type = any(array['Сила атаки, %', 'HP, %', 'Защита, %', 'Шанс крит. попадания, %', 'Крит. попадания, %', 'Мастерство стихий',
                'Бонус лечения, %'])
        ))[floor(random() *
                 (select count(*) from characteristic
            where type = any(array['Сила атаки, %', 'HP, %', 'Защита, %', 'Шанс крит. попадания, %', 'Крит. попадания, %', 'Мастерство стихий',
                'Бонус лечения, %']))
                      + 1)],
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1)),
        floor((random() * (select count(*) from characteristic)+1))
FROM generate_series(0, 60) AS k;


