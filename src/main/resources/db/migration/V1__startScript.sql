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