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
