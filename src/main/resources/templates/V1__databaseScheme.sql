
create table cooks
(
    restaurant_id bigint    not null auto_increment,
    name          varchar(255),
    salary        float(53) not null,
    work_state    tinyint check (work_state between 0 and 1),
    user_id       bigint,
    primary key (restaurant_id)
);
create table cooks_abilities
(
    cook_id bigint not null,
    step_id bigint not null
);
create table pizza_list
(
    pizza_id      bigint  not null auto_increment,
    creation_time bigint,
    pizza_name    varchar(255),
    price         integer not null,
    primary key (pizza_id)
);
create table pizza_list_need_steps
(
    pizza_id bigint not null,
    step_id  bigint not null
);
create table steps
(
    step_id bigint not null auto_increment,
    name    varchar(255),
    primary key (step_id)
);
create table users
(
    id       bigint  not null auto_increment,
    age      integer not null,
    password varchar(255),
    role     tinyint check (role between 0 and 2),
    username varchar(255),
    primary key (id)
);
alter table cooks
drop index UK_o1kkwxmcfratlsvfgawl8wxx6;
alter table cooks
    add constraint UK_o1kkwxmcfratlsvfgawl8wxx6 unique (user_id);
alter table cooks
    add constraint FKkenhd511lpf09f46521ey9ae
        foreign key (user_id)
            references users (id);
alter table cooks_abilities
    add constraint FK8y8in04ewy5bd7urms7foi4ue
        foreign key (step_id)
            references steps (step_id);
alter table cooks_abilities
    add constraint FKcr5ey3r2gjs3d8dgbtimmqum
        foreign key (cook_id)
            references cooks (restaurant_id);
alter table pizza_list_need_steps
    add constraint FK8ya3rncb9ik1hsphb8v6rew9p
        foreign key (step_id)
            references steps (step_id);
alter table pizza_list_need_steps
    add constraint FKh3qnaw0nd31od256igpngc721
        foreign key (pizza_id)
            references pizza_list (pizza_id);



insert into users (age, password, role, username) values (44, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook1');
insert into users (age, password, role, username) values (41, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook2');
insert into users (age, password, role, username) values (28, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook3');
insert into users (age, password, role, username) values (21, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook4');
insert into users (age, password, role, username) values (19, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook5');
insert into users (age, password, role, username) values (43, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook6');
insert into users (age, password, role, username) values (48, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook7');
insert into users (age, password, role, username) values (35, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook8');
insert into users (age, password, role, username) values (25, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook9');
insert into users (age, password, role, username) values (50, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 1, 'Cook10');
insert into users (age, password, role, username) values (31, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 2, 'Admin1');
insert into users (age, password, role, username) values (49, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 2, 'Admin2');
insert into users (age, password, role, username) values (24, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 2, 'Admin3');
insert into users (age, password, role, username) values (37, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 2, 'Admin4');
insert into users (age, password, role, username) values (34, '\$2a\$10\$\.hlvHt\.5AklMcSd\/pDdii\.7OYIy\.ZY4UgMgiTHpHMJVT7vdYyiIzy', 2, 'Admin5');

insert into cooks (name, salary, work_state, user_id) values ('Chrissy Frigot', 8974, 1, 1);
insert into cooks (name, salary, work_state, user_id) values ('Ashbey Maneylaws', 1447, 1, 2);
insert into cooks (name, salary, work_state, user_id) values ('Darrin Goldstein', 6018, 1, 3);
insert into cooks (name, salary, work_state, user_id) values ('Lindsy Battrick', 3839, 0, 4);
insert into cooks (name, salary, work_state, user_id) values ('Charita Matysiak', 4110, 0, 5);
insert into cooks (name, salary, work_state, user_id) values ('Paten Degenhardt', 7797, 0, 6);
insert into cooks (name, salary, work_state, user_id) values ('Craggie Stollenberg', 2907, 0, 7);
insert into cooks (name, salary, work_state, user_id) values ('Jaimie Benediktsson', 5327, 0, 8);
insert into cooks (name, salary, work_state, user_id) values ('Hobart Klaus', 9466, 1, 9);
insert into cooks (name, salary, work_state, user_id) values ('Vittorio Float', 8912, 1, 10);

insert into steps (name) values ('Make the dough');
insert into steps (name) values ('Add tomato sauce');
insert into steps (name) values ('Add cream sauce');
insert into steps (name) values ('Add bbq sauce');
insert into steps (name) values ('Add pepperoni');
insert into steps (name) values ('Add ham');
insert into steps (name) values ('Add cheese');
insert into steps (name) values ('Add tomatoes');
insert into steps (name) values ('Add onions');
insert into steps (name) values ('Add mushrooms');
insert into steps (name) values ('Bake in the oven');
insert into steps (name) values ('Add fresh ingredients');

insert into pizza_list (creation_time, pizza_name, price) values (63500, 'Margherita', 280);
insert into pizza_list (creation_time, pizza_name, price) values (94741, 'Pepperoni', 193);
insert into pizza_list (creation_time, pizza_name, price) values (78953, 'Hawaiian', 293);
insert into pizza_list (creation_time, pizza_name, price) values (69685, 'Mushroom', 184);
insert into pizza_list (creation_time, pizza_name, price) values (78410, 'BBQ Chicken', 158);
insert into pizza_list (creation_time, pizza_name, price) values (92366, 'Supreme', 286);
insert into pizza_list (creation_time, pizza_name, price) values (76797, 'Vegetarian', 152);
insert into pizza_list (creation_time, pizza_name, price) values (82891, 'Meat Lovers', 234);
insert into pizza_list (creation_time, pizza_name, price) values (91698, 'Four Cheese', 232);
insert into pizza_list (creation_time, pizza_name, price) values (81732, 'Caesar', 234);

insert into cooks_abilities VALUES(1, 1);
insert into cooks_abilities VALUES(1, 11);
insert into cooks_abilities VALUES(2, 2);
insert into cooks_abilities VALUES(2, 3);
insert into cooks_abilities VALUES(2, 4);
insert into cooks_abilities VALUES(3, 5);
insert into cooks_abilities VALUES(3, 6);
insert into cooks_abilities VALUES(3, 7);
insert into cooks_abilities VALUES(3, 8);
insert into cooks_abilities VALUES(3, 9);
insert into cooks_abilities VALUES(3, 10);
insert into cooks_abilities VALUES(3, 12);
insert into cooks_abilities VALUES(4, 2);
insert into cooks_abilities VALUES(4, 3);
insert into cooks_abilities VALUES(4, 4);
insert into cooks_abilities VALUES(4, 12);
insert into cooks_abilities VALUES(5, 6);
insert into cooks_abilities VALUES(5, 7);
insert into cooks_abilities VALUES(5, 8);
insert into cooks_abilities VALUES(6, 1);
insert into cooks_abilities VALUES(6, 11);
insert into cooks_abilities VALUES(6, 12);
insert into cooks_abilities VALUES(7, 1);
insert into cooks_abilities VALUES(7, 2);
insert into cooks_abilities VALUES(7, 3);
insert into cooks_abilities VALUES(7, 4);
insert into cooks_abilities VALUES(7, 5);
insert into cooks_abilities VALUES(7, 6);
insert into cooks_abilities VALUES(7, 7);
insert into cooks_abilities VALUES(7, 8);
insert into cooks_abilities VALUES(7, 9);
insert into cooks_abilities VALUES(7, 10);
insert into cooks_abilities VALUES(7, 11);
insert into cooks_abilities VALUES(7, 12);
insert into cooks_abilities VALUES(8, 1);
insert into cooks_abilities VALUES(8, 5);
insert into cooks_abilities VALUES(8, 8);
insert into cooks_abilities VALUES(8, 11);
insert into cooks_abilities VALUES(8, 12);
insert into cooks_abilities VALUES(9, 1);
insert into cooks_abilities VALUES(9, 11);
insert into cooks_abilities VALUES(10, 2);
insert into cooks_abilities VALUES(10, 3);
insert into cooks_abilities VALUES(10, 4);
insert into cooks_abilities VALUES(10, 5);
insert into cooks_abilities VALUES(10, 6);
insert into cooks_abilities VALUES(10, 7);
insert into cooks_abilities VALUES(10, 8);
insert into cooks_abilities VALUES(10, 9);
insert into cooks_abilities VALUES(10, 10);
insert into cooks_abilities VALUES(10, 12);

insert into pizza_list_need_steps (pizza_id, step_id) values (1, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (1, 2);
insert into pizza_list_need_steps (pizza_id, step_id) values (1, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (1, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (2, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (2, 2);
insert into pizza_list_need_steps (pizza_id, step_id) values (2, 5);
insert into pizza_list_need_steps (pizza_id, step_id) values (2, 9);
insert into pizza_list_need_steps (pizza_id, step_id) values (2, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 3);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 8);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 10);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (3, 12);
insert into pizza_list_need_steps (pizza_id, step_id) values (4, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (4, 3);
insert into pizza_list_need_steps (pizza_id, step_id) values (4, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (4, 10);
insert into pizza_list_need_steps (pizza_id, step_id) values (4, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (5, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (5, 4);
insert into pizza_list_need_steps (pizza_id, step_id) values (5, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (5, 9);
insert into pizza_list_need_steps (pizza_id, step_id) values (5, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 2);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 8);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 10);
insert into pizza_list_need_steps (pizza_id, step_id) values (6, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 2);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 8);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 10);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (7, 12);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 4);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 5);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 9);
insert into pizza_list_need_steps (pizza_id, step_id) values (8, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 3);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 7);
insert into pizza_list_need_steps (pizza_id, step_id) values (9, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 1);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 3);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 6);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 8);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 11);
insert into pizza_list_need_steps (pizza_id, step_id) values (10, 12);

