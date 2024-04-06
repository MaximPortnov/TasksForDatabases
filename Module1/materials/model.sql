create table customer (
    id bigint primary key,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null,
    address varchar
);

alter table customer add constraint ch_gender check (gender in ('female','male'));

create table cafe (
    id bigint primary key,
    name varchar not null,
    rating numeric not null default 0
);

alter table cafe add constraint ch_rating check (rating between 0 and 5);

create table customer_visits (
    id bigint primary key,
    customer_id bigint not null,
    cafe_id bigint not null,
    visit_date date not null default current_date,
    constraint uk_customer_visits unique (customer_id, cafe_id, visit_date),
    constraint fk_customer_visits_customer_id foreign key  (customer_id) references customer(id),
    constraint fk_customer_visits_cafe_id foreign key  (cafe_id) references cafe(id)
);

create table menu_items (
    id bigint primary key,
    cafe_id bigint not null,
    item_name varchar not null,
    price numeric not null default 1,
    constraint fk_menu_items_cafe_id foreign key (cafe_id) references cafe(id)
);

create table customer_orders ( 
    id bigint primary key,
    customer_id  bigint not null,
    menu_id bigint not null,
    order_date date not null default current_date,
    constraint fk_order_customer_id foreign key (customer_id) references customer(id),
    constraint fk_order_menu_id foreign key (menu_id) references menu_items(id)
);


-- Заполнение таблицы клиентов (customer)
insert into customer values (1, 'Anna', 16, 'female', 'Moscow');
insert into customer values (2, 'Andrey', 21, 'male', 'Moscow');
insert into customer values (3, 'Kate', 33, 'female', 'Kazan');
insert into customer values (4, 'Denis', 13, 'male', 'Kazan');
insert into customer values (5, 'Elvira', 45, 'female', 'Kazan');
insert into customer values (6, 'Irina', 21, 'female', 'Saint-Petersburg');
insert into customer values (7, 'Peter', 24, 'male', 'Saint-Petersburg');
insert into customer values (8, 'Nataly', 30, 'female', 'Novosibirsk');
insert into customer values (9, 'Dmitriy', 18, 'male', 'Samara');

-- Заполнение таблицы кафе (cafe)
insert into cafe values (1, 'Coffee House', 4.6);
insert into cafe values (2, 'Starbucks', 4.3);
insert into cafe values (3, 'Costa Coffee', 3.2);
insert into cafe values (4, 'Cafe Nero', 4.9);
insert into cafe values (5, 'Local Brew', 2.3);
insert into cafe values (6, 'Bean There', 4.2);

-- Заполнение таблицы посещений клиентов (customer_visits)
insert into customer_visits values (1, 1, 1, '2022-01-01');
insert into customer_visits values (2, 2, 2, '2022-01-01');
insert into customer_visits values (3, 2, 1, '2022-01-02');
insert into customer_visits values (4, 3, 5, '2022-01-03');
insert into customer_visits values (5, 3, 6, '2022-01-04');
insert into customer_visits values (6, 4, 5, '2022-01-07');
insert into customer_visits values (7, 4, 6, '2022-01-08');
insert into customer_visits values (8, 5, 2, '2022-01-08');
insert into customer_visits values (9, 5, 6, '2022-01-09');
insert into customer_visits values (10, 6, 2, '2022-01-09');
insert into customer_visits values (11, 6, 4, '2022-01-01');
insert into customer_visits values (12, 7, 1, '2022-01-03');
insert into customer_visits values (13, 7, 2, '2022-01-05');
insert into customer_visits values (14, 8, 1, '2022-01-05');
insert into customer_visits values (15, 8, 2, '2022-01-06');
insert into customer_visits values (16, 8, 4, '2022-01-07');
insert into customer_visits values (17, 9, 4, '2022-01-08');
insert into customer_visits values (18, 9, 5, '2022-01-09');
insert into customer_visits values (19, 9, 6, '2022-01-10');

-- Заполнение таблицы пунктов меню (menu_items)
insert into menu_items values (1, 1, 'Latte', 300);
insert into menu_items values (2, 1, 'Cappuccino', 350);
insert into menu_items values (3, 1, 'Americano', 250);
insert into menu_items values (4, 1, 'Espresso', 200);

insert into menu_items values (5, 6, 'Flat White', 400);
insert into menu_items values (6, 6, 'Iced Coffee', 300);
insert into menu_items values (7, 6, 'Mocha', 350);

insert into menu_items values (8, 2, 'Latte', 320);
insert into menu_items values (9, 2, 'Frappuccino', 380);

insert into menu_items values (10, 3, 'Cortado', 280);
insert into menu_items values (11, 3, 'Macchiato', 310);

insert into menu_items values (12, 4, 'Irish Coffee', 500);
insert into menu_items values (13, 4, 'Frappuccino', 450);
insert into menu_items values (14, 4, 'Iced Latte', 350);
insert into menu_items values (15, 4, 'Caramel Macchiato', 400);

insert into menu_items values (16, 5, 'Black Coffee', 200);
insert into menu_items values (17, 5, 'Iced Coffee', 250);
insert into menu_items values (18, 5, 'Espresso', 220);

-- Заполнение таблицы заказов клиентов (customer_orders)
insert into customer_orders values (1, 1, 1, '2022-01-01');
insert into customer_orders values (2, 1, 2, '2022-01-01');

insert into customer_orders values (3, 2, 8, '2022-01-01');
insert into customer_orders values (4, 2, 9, '2022-01-01');

insert into customer_orders values (5, 3, 16, '2022-01-04');

insert into customer_orders values (6, 4, 16, '2022-01-07');
insert into customer_orders values (7, 4, 17, '2022-01-07');
insert into customer_orders values (8, 4, 18, '2022-01-07');
insert into customer_orders values (9, 4, 6, '2022-01-08');
insert into customer_orders values (10, 4, 7, '2022-01-08');

insert into customer_orders values (11, 5, 6, '2022-01-09');
insert into customer_orders values (12, 5, 7, '2022-01-09');

insert into customer_orders values (13, 6, 13, '2022-01-01');

insert into customer_orders values (14, 7, 3, '2022-01-03');
insert into customer_orders values (15, 7, 9, '2022-01-05');
insert into customer_orders values (16, 7, 4, '2022-01-05');

insert into customer_orders values (17, 8, 8, '2022-01-06');
insert into customer_orders values (18, 8, 14, '2022-01-07');

insert into customer_orders values (19, 9, 18, '2022-01-09');
insert into customer_orders values (20, 9, 6, '2022-01-10');
