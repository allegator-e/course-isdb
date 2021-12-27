INSERT INTO characteristic(type, value)
SELECT (array['Сила атаки', 'Защита'])[floor(random() * 2 + 1)], floor(random() * (311 - 17) + 17)
FROM generate_series(0, 60) AS k;

INSERT INTO characteristic(type, value)
SELECT 'Крит урон, %', floor( (random() * (62.2 - 5.4) + 5.4) * 10 ) /10
FROM generate_series(0, 40) AS k;

INSERT INTO characteristic(type, value)
SELECT 'Базовая атака', floor( (random() * (674 - 39) + 39))
FROM generate_series(0, 60) AS k;

INSERT INTO characteristic(type, value)
SELECT 'HP', floor(random() * (4780 - 269) + 269 )
FROM generate_series(0, 40) AS k;

INSERT INTO characteristic(type, value)
SELECT 'Мастерство стихий', floor(random() * (187 - 16) + 16 )
FROM generate_series(0, 40) AS k;

INSERT INTO characteristic(type, value)
SELECT 'Шанс крит. попадания, %', floor( (random() * (46.1 - 2.7) + 2.7) * 10 ) /10
FROM generate_series(0, 40) AS k;

INSERT INTO characteristic(type, value)
SELECT 'Восст. энергии, %', floor( (random() * (51.8 - 4.5) + 4.5) * 10 ) /10
FROM generate_series(0, 40) AS k;

INSERT INTO characteristic(type, value)
SELECT (array['Сила атаки, %', 'Защита, %', 'HP, %', 'Бонус лечения, %'])[floor(random() * 4 + 1)], floor( (random() * (46.6 - 4.1) + 4.1) * 10 ) /10
FROM generate_series(0, 100) AS k;

INSERT INTO characteristic(type, value)
SELECT (array['Пиро урон, %', 'Гидро урон, %', 'Гео урон, %', 'Электро урон, %', 'Анемо урон, %', 'Крио урон, %', 'Физ урон, %'])[floor(random() * 7 + 1)],
       floor( (random() * (46.6 - 7) + 46.6) * 10 ) /10
FROM generate_series(0, 200) AS k;


