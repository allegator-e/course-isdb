INSERT INTO team(character_1)
SELECT (select ARRAY(
            select name from character)
        )[floor(random() *
                 (select count(*) from character)
        + 1)]
FROM generate_series(1,20) AS k;

SELECT *, COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0)
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
where art.type = 'Кубок' ORDER BY case when (regexp_split_to_array(char_1.type, '\s+'))[1] = (select element::text from character where name = 'Дилюк') then 1
                                        when char_1.type = 'Сила атаки, %' then 2
                                        when char_1.type = 'Мастерство стихий' then 3
                                        when char_1.type = 'HP, %' then 4
                                        when char_1.type = 'Защита, %' then 5
                                    end,
                                   COALESCE(char_2.value, 0) + COALESCE(char_3.value, 0) + COALESCE(char_4.value, 0) + COALESCE(char_5.value, 0) DESC LIMIT 1;


DELETE FROM team;


