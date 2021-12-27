CREATE OR REPLACE FUNCTION set_artifacts() RETURNS trigger AS $$
    DECLARE art_1 INT;
    DECLARE art_2 INT;
    DECLARE art_3 INT;
    DECLARE art_4 INT;
    DECLARE art_5 INT;
    DECLARE art_set INT;
    DECLARE crit_chance INT;
    DECLARE harac INT[4];

    BEGIN
        crit_chance = 0;
        IF new.role = 'Main_DPS' or new.role = 'Sub_DPS' THEN
            art_1 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Цветок' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_1);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_1);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_1);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_1);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_2 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Перо' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_2);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_2);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_2);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_2);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_3 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Часы' ORDER BY case when char_1.type = 'Сила атаки, %' then 1
                                        when char_1.type = 'Восст. энергии, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_3);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_3);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_3);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_3);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;

            art_4 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Кубок' ORDER BY case when (regexp_split_to_array(char_1.type, '\s+'))[1] = (select element::text from character where name = new.name) then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_4);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_4);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_4);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_4);

            for i in 1..4 LOOP
                IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                    crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
                end if;
            end loop;

            IF crit_chance > 70 THEN
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Крит урон, %' then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                        when char_1.type = 'Бонус лечения, %' then 6
                                        when char_1.type = 'Шанс крит. попадания, %' then 7
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);
            ELSE
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %'
                                or char_2.type = 'Сила атаки, %' or char_2.type = 'Сила атаки, %' or char_2.type = 'Восст. энергии, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %'
                                or char_3.type = 'Сила атаки, %' or char_3.type = 'Сила атаки, %' or char_3.type = 'Восст. энергии, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %'
                                or char_4.type = 'Сила атаки, %' or char_4.type = 'Сила атаки, %' or char_4.type = 'Восст. энергии, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %'
                                or char_5.type = 'Сила атаки, %' or char_5.type = 'Сила атаки, %' or char_5.type ='Восст. энергии, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Шанс крит. попадания, %' then 1
                                        when char_1.type = 'Крит урон, %' then 2
                                        when char_1.type = 'Сила атаки, %' then 3
                                        when char_1.type = 'Мастерство стихий' then 4
                                        when char_1.type = 'HP, %' then 5
                                        when char_1.type = 'Защита, %' then 6
                                        when char_1.type = 'Бонус лечения, %' then 7
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

                end if;


        end if;

        IF new.role = 'Shieldman' THEN
            art_1 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                     left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Цветок' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_1);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_1);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_1);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_1);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_2 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Перо' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_2);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_2);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_2);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_2);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_3 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                     left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Часы' ORDER BY case when char_1.type = 'HP, %' then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Восст. энергии, %' then 3
                                        when char_1.type = 'Мастерство стихий' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_3);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_3);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_3);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_3);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;

            art_4 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Кубок' ORDER BY case when (regexp_split_to_array(char_1.type, '\s+'))[1] = (select element::text from character where name = new.name) then 1
                                        when char_1.type = 'HP, %' then 2
                                        when char_1.type = 'Сила атаки, %' then 3
                                        when char_1.type = 'Мастерство стихий' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_4);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_4);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_4);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_4);

            for i in 1..4 LOOP
                IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                    crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
                end if;
            end loop;

            IF crit_chance > 70 THEN
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Крит урон, %' then 1
                                        when char_1.type = 'HP, %' then 2
                                        when char_1.type = 'Сила атаки, %' then 3
                                        when char_1.type = 'Восст. энергии, %' then 4
                                        when char_1.type = 'Мастерство стихий' then 5
                                        when char_1.type = 'Защита, %' then 6
                                        when char_1.type = 'Бонус лечения, %' then 7
                                        when char_1.type = 'Шанс крит. попадания, %' then 8
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);
            ELSE
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'HP, %' or char_2.type = 'Сила атаки, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'HP, %' or char_3.type = 'Сила атаки, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'HP, %' or char_4.type = 'Сила атаки, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'HP, %' or char_5.type = 'Сила атаки, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Шанс крит. попадания, %' then 1
                                        when char_1.type = 'Крит урон, %' then 2
                                        when char_1.type = 'HP, %' then 3
                                        when char_1.type = 'Сила атаки, %' then 4
                                        when char_1.type = 'Восст. энергии, %' then 5
                                        when char_1.type = 'Мастерство стихий' then 6
                                        when char_1.type = 'Защита, %' then 7
                                        when char_1.type = 'Бонус лечения, %' then 8
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

                end if;


        end if;


        IF new.role = 'Healer' THEN
            art_1 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                     left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Цветок' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_1);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_1);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_1);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_1);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_2 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                   left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Перо' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_2);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_2);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_2);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_2);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_3 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Часы' ORDER BY case when char_1.type = 'Сила атаки, %' then 1
                                        when char_1.type = 'Восст. энергии, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_3);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_3);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_3);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_3);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;

            art_4 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                   left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Кубок' ORDER BY case  when char_1.type = 'Сила атаки, %' then 1
                                        when (regexp_split_to_array(char_1.type, '\s+'))[1] = (select element::text from character where name = new.name) then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_4);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_4);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_4);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_4);

            for i in 1..4 LOOP
                IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                    crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
                end if;
            end loop;

            IF crit_chance > 70 THEN
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Бонус лечения, %' then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Крит урон, %' then 3
                                        when char_1.type = 'Мастерство стихий' then 4
                                        when char_1.type = 'HP, %' then 5
                                        when char_1.type = 'Защита, %' then 6
                                        when char_1.type = 'Шанс крит. попадания, %' then 7
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);
            ELSE
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                   left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'HP, %'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'HP, %'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'HP, %'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'HP, %'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Бонус лечения, %' then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Шанс крит. попадания, %' then 3
                                        when char_1.type = 'Крит урон, %' then 4
                                        when char_1.type = 'Мастерство стихий' then 5
                                        when char_1.type = 'HP, %' then 6
                                        when char_1.type = 'Защита, %' then 7
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

                end if;


        end if;


        IF new.role = 'Support' THEN
            art_1 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                     left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Цветок' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_1);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_1);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_1);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_1);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_2 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                 left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Перо' ORDER BY COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_2);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_2);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_2);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_2);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;


            art_3 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Часы' ORDER BY case when char_1.type = 'Сила атаки, %' then 1
                                        when char_1.type = 'Восст. энергии, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_3);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_3);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_3);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_3);

            for i in 1..4 LOOP
            IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
            end if;
            end loop;

            art_4 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                  left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Кубок' ORDER BY case  when (regexp_split_to_array(char_1.type, '\s+'))[1] = (select element::text from character where name = new.name) then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

            harac[1] = (select side_characteristic_1 from artifact where artifact_id = art_4);
            harac[2] = (select side_characteristic_2 from artifact where artifact_id = art_4);
            harac[3] = (select side_characteristic_3 from artifact where artifact_id = art_4);
            harac[4] = (select side_characteristic_4 from artifact where artifact_id = art_4);

            for i in 1..4 LOOP
                IF (select type from characteristic where characteristic.characteristic_id = harac[i]) = 'Шанс крит. попадания, %' THEN
                    crit_chance = crit_chance + (select value from characteristic where characteristic.characteristic_id = harac[i]);
                end if;
            end loop;

            IF crit_chance > 70 THEN
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                    left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Крит урон, %' then 1
                                        when char_1.type = 'Мастерство стихий' then 2
                                        when char_1.type = 'Сила атаки, %' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Бонус лечения, %' then 5
                                        when char_1.type = 'Защита, %' then 6
                                        when char_1.type = 'Шанс крит. попадания, %' then 7
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);
            ELSE
                art_5 = (SELECT artifact_id
from artifact as art left join characteristic as char_1 on main_characteristic = char_1.characteristic_id

                   left join characteristic as char_2 on side_characteristic_1 = char_2.characteristic_id
                            and (char_2.type = 'Сила атаки, %' or char_2.type = 'Мастерство стихий'
                                or char_2.type = 'Восст. энергии, %' or char_2.type = 'Крит урон, %' or char_2.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_3 on side_characteristic_2 = char_3.characteristic_id
                            and (char_3.type = 'Сила атаки, %' or char_3.type = 'Мастерство стихий'
                                or char_3.type = 'Восст. энергии, %' or char_3.type = 'Крит урон, %' or char_3.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_4 on side_characteristic_3 = char_4.characteristic_id
                            and (char_4.type = 'Сила атаки, %' or char_4.type = 'Мастерство стихий'
                                or char_4.type = 'Восст. энергии, %' or char_4.type = 'Крит урон, %' or char_4.type = 'Шанс крит. попадания, %')
                    left join characteristic as char_5 on side_characteristic_4 = char_5.characteristic_id
                            and (char_5.type = 'Сила атаки, %' or char_5.type = 'Мастерство стихий'
                                or char_5.type = 'Восст. энергии, %' or char_5.type = 'Крит урон, %' or char_5.type = 'Шанс крит. попадания, %')
where art.type = 'Корона' ORDER BY case when char_1.type = 'Шанс крит. попадания, %' then 1
                                        when char_1.type = 'Крит урон, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'Сила атаки, %' then 4
                                        when char_1.type = 'HP, %' then 5
                                        when char_1.type = 'Бонус лечения, %' then 6
                                        when char_1.type = 'Защита, %' then 7

                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1);

                end if;


        end if;


        INSERT INTO artifact_set(artifact_1, artifact_2, artifact_3, artifact_4, artifact_5)
            VALUES (art_1, art_2, art_3, art_4, art_5);

        art_set = (SELECT artifact_set_id from artifact_set where artifact_1 = art_1 AND artifact_2 = art_2 AND
                                                                  artifact_3 = art_3 AND artifact_4 = art_4 AND
                                                                  artifact_5 = art_5);

        UPDATE character SET artifact_set = art_set where name = new.name;

        RETURN new;
    END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER set_artifact_set AFTER INSERT ON character
    FOR EACH ROW EXECUTE PROCEDURE set_artifacts();

CREATE INDEX choose_characteristic ON characteristic USING btree(type);


CREATE OR REPLACE FUNCTION set_team() RETURNS trigger AS $$
        DECLARE char_1 TEXT;
        DECLARE char_2 TEXT;
        DECLARE char_3 TEXT;
        DECLARE char_4 TEXT;
        DECLARE role_1 TEXT;
        DECLARE role_2 TEXT;
        DECLARE role_3 TEXT;
        DECLARE change_role bool;
        DECLARE position_bonus INT;
        DECLARE elements element[5];
    BEGIN
        change_role = false;
        elements[1] = 'Пиро';
        char_1 = (select character_1 from team where team_id = new.team_id);

        role_1 = (select role::TEXT from character where name = char_1);
        elements[2] = (select element from character where name = char_1);
        char_2 = (select character_2 from team where team_id = new.team_id);
        IF char_2 IS NULL THEN
                char_2 = (SELECT name from character where
                                role::TEXT != role_1 AND
                                (element = elements[1] OR element = elements[2])
                ORDER BY role LIMIT 1);
                    IF char_2 IS NULL THEN
                        char_2 = (SELECT name from character where
                                role::TEXT != role_1
                ORDER BY role LIMIT 1);
                    end if;
        end if;


        role_2 = (select role::TEXT from character where name = char_2);
        elements[3] = (select element from character where name = char_2);
        IF elements[2] = elements[3] THEN
            change_role = true;
        end if;

        char_3 = (select character_3 from team where team_id = new.team_id);
        IF char_3 IS NULL THEN
                IF change_role = false THEN
                    char_3 = (SELECT name from character where
                                role::TEXT != role_1 AND role::TEXT != role_2 AND
                                (element = elements[1] OR element = elements[2] OR element = elements[3])
                    ORDER BY role LIMIT 1);
                end if;
                    IF char_3 IS NULL THEN
                        char_3 = (SELECT name from character where
                                role::TEXT != role_1 AND role::TEXT != role_2
                ORDER BY role LIMIT 1);
                    end if;
        end if;

        role_3 = (select role::TEXT from character where name = char_3);
        elements[4] = (select element from character where name = char_3);
        IF elements[2] = elements[3] or elements[2] = elements[4] or elements[4] = elements[3]  THEN
            change_role = true;
        end if;
        char_4 = (select character_3 from team where team_id = new.team_id);
        IF char_4 IS NULL THEN
                IF change_role = false THEN
                    char_4 = (SELECT name from character where
                                role::TEXT != role_1 AND role::TEXT != role_2 AND role::TEXT != role_3 AND
                                (element = elements[1] OR element = elements[2] OR element = elements[3] OR element = elements[4])
                    ORDER BY role LIMIT 1);
                end if;
                    IF char_4 IS NULL THEN
                        char_4 = (SELECT name from character where
                                role::TEXT != role_1 AND role::TEXT != role_2 AND role::TEXT != role_3
                ORDER BY role LIMIT 1);
                    end if;
        end if;

        IF (SELECT count(*) FROM (SELECT * from character where name = any(array[char_1, char_2, char_3, char_4])) as "c" GROUP BY element ORDER BY count(*) DESC LIMIT 1) > 1 THEN
            elements[5] = (SELECT element FROM (SELECT * from character where name = any(array[char_1, char_2, char_3, char_4])) as "c" GROUP BY element ORDER BY count(*) DESC LIMIT 1);

            position_bonus = (select bonus_id from bonus where value::int = 2 LIMIT 1) +
                         (select array_position( array['Пиро', 'Крио', 'Анемо', 'Гео', 'Гидро', 'Электро', 'Физ'], elements[5]::TEXT) - 1);
            ELSE
                position_bonus = (select bonus_id from bonus where value::int = 2 LIMIT 1) +
                         (select array_position( array['Пиро', 'Крио', 'Анемо', 'Гео', 'Гидро', 'Электро', 'Физ'], 'Физ') - 1);
            end if;

        UPDATE team SET character_2 = (char_2), character_3 = char_3, character_4 = char_4, bonus = position_bonus where team_id = new.team_id;



        RETURN new;
    END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER create_team AFTER INSERT ON team
    FOR EACH ROW EXECUTE PROCEDURE set_team();



CREATE OR REPLACE FUNCTION set_bonus_set_artifact() RETURNS trigger AS $$
    DECLARE a INT;
    DECLARE b INT;
    DECLARE c INT;
    DECLARE d INT;
    DECLARE e INT;
    DECLARE arr integer[25];
        DECLARE position_bonus_1 INT;
        DECLARE position_bonus_2 INT;
        DECLARE boo bool;
    BEGIN
        position_bonus_1 = (select bonus_id from bonus where value::int > 0 LIMIT 1) - 1;
        position_bonus_2 = (select bonus_id from bonus where value::int = 0 LIMIT 1);
        a = (select array_position(
            array['Цветок искателя приключений'     ,
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
'Позолоченная брошь'              ],
            (select name from artifact where artifact.artifact_id = new.artifact_1)) );

        b = (select array_position(
            array['Перо искателя приключений'           ,
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
'Порыв ностальгии'                    ],
            (select name from artifact where artifact.artifact_id = new.artifact_2)) );


        c = (select array_position(
            array['Часы искателя приключений'     ,
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
'Медный компас'                 ],
            (select name from artifact where artifact.artifact_id = new.artifact_3)) );

        d = (select array_position(
            array['Кубок искателя приключений'   ,
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
'Кубок оглушающих глубин'      ],
            (select name from artifact where artifact.artifact_id = new.artifact_4)) );

        e = (select array_position(
            array['Повязка искателя приключений' ,
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
'Треуголка в пятнах вина'       ],
            (select name from artifact where artifact.artifact_id = new.artifact_5)) );

        for i in 1..25 LOOP
            arr[i] = 0;
        end loop;

        arr[a] =  arr[a] + 1;
        arr[b] =  arr[b] + 1;
        arr[c] =  arr[c] + 1;
        arr[d] =  arr[d] + 1;
        arr[e] =  arr[e] + 1;

        boo = true;

        for i in 1..25 LOOP
            IF arr[i] >= 2 THEN
                IF boo THEN
                    UPDATE artifact_set SET bonus_1 = (position_bonus_1 + i) where artifact_set_id = new.artifact_set_id;
                    boo = false;
                ELSE UPDATE artifact_set SET bonus_2 = (position_bonus_1 + i) where artifact_set_id = new.artifact_set_id;
                end if;
            end if;
            IF arr[i] >= 4 THEN
                UPDATE artifact_set SET bonus_2 = (position_bonus_2 + i) where artifact_set_id = new.artifact_set_id;
            end if;
        end loop;
        RETURN new;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_bonus_for_set_artifact AFTER INSERT ON artifact_set
    FOR EACH ROW EXECUTE PROCEDURE set_bonus_set_artifact();

DROP TRIGGER update_bonus_for_set_artifact ON artifact_set;