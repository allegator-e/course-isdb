INSERT INTO bonus(type, value) values ('HP', 1000);
INSERT INTO bonus(type, value) values ('Защита', 100);
INSERT INTO bonus(type, value) values ('Лечение, %', 20);
INSERT INTO bonus(type, value) values ('Сила атаки, %', 18);
INSERT INTO bonus(type, value) values ('Шанс крит. попадания, %', 12);
INSERT INTO bonus(type, value) values ('Мастерство стихий', 80);
INSERT INTO bonus(type, value) values ('Восстановление энергии, %', 20);
INSERT INTO bonus(type, value) values ('Защита, %', 30);
INSERT INTO bonus(type, value) values ('Сила атаки, %', 15);
INSERT INTO bonus(type, value) values ('HP, %', 20);
INSERT INTO bonus(type, value) values ('Крио урон, %', 15);
INSERT INTO bonus(type, value) values ('Анемо урон, %', 15);
INSERT INTO bonus(type, value) values ('Пиро урон, %', 15);
INSERT INTO bonus(type, value) values ('Физ. урон, %', 25);
INSERT INTO bonus(type, value) values ('Электро урон, %', 15);
INSERT INTO bonus(type, value) values ('Физ. урон, %', 25);
INSERT INTO bonus(type, value) values ('Электро урон, %', 15);
INSERT INTO bonus(type, value) values ('Гео урон, %', 15);
INSERT INTO bonus(type, value) values ('Гео урон, %', 15);
INSERT INTO bonus(type, value) values ('Гидро урон, %', 15);
INSERT INTO bonus(type, value) values ('Лечение, %', 15);
INSERT INTO bonus(type, value) values ('Гео урон, %', 15);
INSERT INTO bonus(type, value) values ('Гидро урон, %', 15);
INSERT INTO bonus(type, value) values ('Лечение, %', 15);
INSERT INTO bonus(type, value) values ('Взрыв стихий, %', 20);
INSERT INTO bonus(type, value) values ('Взрыв стихий, %', 20);
INSERT INTO bonus(type, value) values ('Прочность щита, %', 35);

INSERT INTO bonus(type, value)
SELECT (array[
    'В течение 5 сек. после открытия любого сундука восстанавливает 30% HP'
   ,'Поднятие монет восстанавливает 300 HP.'
   ,'Использование взрыва стихии восстанавливает 20% HP.'
   ,'Увеличивает шанс крит. попадания заряженной атаки на 30%.'
   ,'Увеличивает шанс крит. попадания на 24% при HP ниже 70%.'
   ,'Вызов элементальной реакции увеличивает мастерство стихий всех членов отряда на 120 ед. в течение 8 сек.'
   ,'Использование взрыва стихии восстанавливает 2 ед. энергии остальным членам отряда (но не выбранному персонажу) каждые 2 сек. в течение 6 сек. Эффект не может складываться.'
   ,'За каждого члена вашего отряда с неповторяющимся элементом повышает сопротивление к соответствующему элементу на 30%.'
   ,'Увеличивает на 30% урон против врагов с HP выше 50%.'
   ,'Увеличивает урон обычной и заряженной атаки на 25% в течение 8 сек. после использования элементального навыка.'
   ,'Получение элементальных сфер или частиц восстанавливает 3 ед. энергии членам отряда, экипированным стрелковым оружием или катализатором. Может возникнуть раз в 3 сек.'
   ,'Когда элементальный навык попадает по врагам, атака всех находящихся поблизости персонажей в отряде, увеличивается на 20%, а прочность их щита увеличивается на 30%. Эффект длится 3 сек. и может возникнуть 1 раз в 0,5 сек. Этот эффект может быть активирован, даже если персонаж, экипированный этим набором артефактов, не находится на поле боя.'
   ,'Атаки по противникам с эффектом Крио увеличивают шанс крит. попадания на 20%. Если противник имеет статус Заморозка, то дополнительно увеличивает шанс крит. попадания на 20%.'
   ,'Увеличивает получаемое лечение всех членов отряда на 20% в течение 10 сек. после использования элементального навыка или взрыва стихии.'
   ,'Увеличивает урон обычной атаки на 35%, если персонаж использует одноручное, двуручное или древковое оружие.'
   ,'Увеличивает урон Рассеивания на 60%. При взаимодействии Рассеивания с другим элементом, также понижает сопротивление противника к соответствующему элементу на 40% в течение 10 сек.'
   ,'Увеличивает урон заряженной атаки на 35%, если персонаж использует катализатор или стрелковое оружие.'
   ,'Увеличивает урон статусов Перегрузка, Заряжен и Сверхпроводник на 40%. Наложение этих статусов уменьшает время отката элементального навыка на 1 сек. Может возникнуть раз в 0,8 сек.'
   ,'Увеличивает урон статусов Перегрузка и Горение на 40%, а урон статусов Пар и Таяние — на 15%. Использование элементального навыка увеличивает эффекты набора из двух вещей на 50% в течение 10 сек. Может складываться до 3 раз.'
   ,'Активация взрыва стихии увеличивает силу атаки всех членов отряда на 20% в течение 12 сек. Эффект не сладывается.'
   ,'Когда элементальный навык попадает по врагам, атака увеличивается на 9% в течение 7 сек. Эффект может складываться до 2 раз и возникнуть не чаще 1 раза за 0,3 сек. На 2 уровне эффект набора из 2 вещей увеличивается на 100%.'
   ,'После победы над противником увеличивает урон заряженной атаки на 50% и обнуляет стоимость выносливости заряженной атаки на 10 сек.'
   ,'Подобранные осколки, образованные реакцией Кристалл, увеличивают бонус элементального урона всех членов отряда на 35% в течение 10 сек. Одновременно можно иметь бонус урона только одного элемента.'
   ,'Под защитой щита увеличивает урон обычной и заряженной атаки на 40%.'
   ,'Увеличивает урон обычной и заряженной атаки на 30% в течение 15 сек. после использования элементального навыка.'
    ])[k], 0
FROM generate_series(1, 25) AS k;

INSERT INTO bonus(type, value) values ('HP', 1000);

INSERT INTO bonus(type, value)
SELECT (array[
    'Увеличивает урон взрыва стихии 16%~32%, а его шанс крит. попадания - на 6%~12%.',
    'величивает урон взрыва стихии на 12%~24%. При попадании взрывом стихии по противнику с вероятностью 100% призывается Титанический тунец, который совершает атаку и наносит урон по площади, равный 100%~200% от силы атаки. Может возникнуть раз в 15 сек.',
    'Увеличивает на 20%~36% урон против врагов, находящихся под действием Гидро или Пиро элементов.',
    'Увеличивает HP на 20%~40%. Также даёт бонус атаки, равный 1,2%~2,4% от макс. HP экипированного этим оружием персонажа.',
    'Увеличивает на 20%~36% урон против врагов, находящихся под действием Пиро или Электро элементов.',
    'Попадания обычной атакой увеличивают урон заряженной атаки на 16%~32% в течение 6 сек., а попадания заряженной атакой увеличивают силу атаки на 8%~16% в течение 6 сек.',
    'При получении урона генерируется щит, который в течение 10 сек. поглощает урон, равный 20%~32% от макс. HP. Может возникнуть раз в 45 сек. Под защитой щита увеличивает урон персонажа на 12%~24%.',
    'Попадания обычной или заряженной атакой дают музыкальную ноту. При накоплении 5 нот активируется сила музыки, которая наносит 100%~200% урона окружающим врагам.',
    'В течение 10 сек. после вызова Элементальной реакции увеличивает бонус Элементального урона на 8%~16%. Может складываться до 2 раз.',
    'Увеличивает крит. урон на 20%~40%. При попадании есть 60%~100% шанс нанести 125% физ. урона в небольшом радиусе. Может возникнуть раз в 4~2 сек.',
    'При переключении на персонажа в течение 10 сек. играет случайная музыкальная тема. Может возникнуть раз в 30 сек. Речитатив: увеличивает силу атаки на 60%~120%; Ария: увеличивает элементальный урон на 48%~96%; Интерлюдия: увеличивает мастерство стихий на 240~480.',
    'Подобранные элементарные сферы и частицы увеличивают урон обычной и заряженной атаки на 20%~40% в течение 5 сек.',
    'Попадание обычной или заряженной атакой увеличивают силу атаки на 4%~8% в течении 6 сек. Эффект может складываться до 4 раз и возникает раз в 0.3 сек.',
    'Попадания Элементальным навыком могут с 40%~80% вероятностью восстановить собственный откат. Может возникнуть раз в 30~16 сек.',
    'Побеждённые противники увеличивают силу атаки на 12%~24%. Длится 30 сек. Эффект может складываться до 3 раз. Длительность добавочных эффектов друг от друга не зависит.',
    'При переключении персонажа увеличивает силу атаки вошедшего на поле боя персонажа на 24%~48% в течение 10 сек. этот эффект может возникнуть раз в 20 сек.'
    ])[k], 1
FROM generate_series(1, 16) AS k;


INSERT INTO bonus(type, value) values ('Сила атаки, 25%', 2);
INSERT INTO bonus(type, value) values ('Шанс крит. попадания, 15%', 2);
INSERT INTO bonus(type, value) values ('Лечение, 30%', 2);
INSERT INTO bonus(type, value) values ('Частица электро', 2);
INSERT INTO bonus(type, value) values ('Прочность щита, 15%', 2);
INSERT INTO bonus(type, value) values ('Скорость передвижения, 10%', 2);
INSERT INTO bonus(type, value) values ('Физ. сопротивление, 15%', 2);