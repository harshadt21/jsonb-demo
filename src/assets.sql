create table assets
(
    id            numeric,
    name          varchar,
    serial_number varchar,
    asset_info    jsonb,
    PRIMARY KEY (id)
);