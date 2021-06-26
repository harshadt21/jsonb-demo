create table assets
(
    id            serial,
    name          varchar,
    serial_number varchar,
    specifications    jsonb,
    PRIMARY KEY (id)
);