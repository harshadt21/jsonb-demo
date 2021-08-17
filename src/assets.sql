create table assets
(
    id            serial,
    name          varchar,
    brand          varchar,
    serial_number varchar,
    specifications    jsonb,
    PRIMARY KEY (id)
);

create table assets_indexing_demo
(
    id            serial,
    name          varchar,
    brand          varchar,
    serial_number varchar,
    specifications    jsonb,
    PRIMARY KEY (id)
);