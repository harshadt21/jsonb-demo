create table assets
(
    id            serial,
    name          varchar,
    brand          varchar,
    serial_number varchar,
    specifications    jsonb,
    PRIMARY KEY (id)
);