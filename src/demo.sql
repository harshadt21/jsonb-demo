-- Definition of table "assets"
select column_name, data_type, character_maximum_length, column_default, is_nullable from INFORMATION_SCHEMA.COLUMNS where table_name = 'assets';







-- Sample data is "assets" table, total records are 1 million
select * from assets limit 5;







-- Fetch laptops with 16 gb ram using extraction operator
select * from assets where (specifications ->> 'ramSizeInGB')::Integer = 16;







-- Fetch assets with colour navy blue using extraction operator // dont run the query
select * from assets where specifications ->> 'colour' = 'Navy Blue';







-- fetch assets with colour white using full text search (contains)
select * from assets where specifications @> '{"colour":"White"}';







-- Formatting jsonb fields as columns (talk about group by as well)
select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage,
       count(*)
from assets 
group by name, brand, specifications limit 5;







-- Filtering out records which does not have ramSizeInGB field
select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage,
       count(*)
from assets
where specifications ? 'ramSizeInGB'
group by name, brand, specifications limit 5;







-- Total amount invested in assets
select sum(cast(specifications ->> 'price' as decimal)) from assets;







-- Average price of a laptop in inventory
select avg(cast(specifications ->> 'price' as decimal)) from assets where name='laptop';







-- Gin index using jsonb_ops
explain analyze select * from assets where specifications @> '{"colour":"White"}'::jsonb;
explain analyse select * from assets where specifications @> '{"ramSizeInGB": "4" }'::jsonb;

create index idx_specifications_jsonops on assets using gin(specifications JSONB_OPS);

explain analyze select * from assets where specifications @> '{"colour":"White"}'::jsonb;
explain  analyse select * from assets where specifications @> '{"ramSizeInGB": "4" }'::jsonb;

drop index idx_specifications_jsonops;







-- GIN expression indexing
explain analyse select * from assets where specifications @> '{"colour":"White"}'::jsonb;
explain analyse select * from assets where specifications -> 'colour' ? 'White';
explain analyse select * from assets where specifications ? 'colour';

create index idx_expression on assets using gin((specifications -> 'colour'));
drop index idx_ram;







-- GIN indexing using jsonb_path_ops
explain analyze select * from assets where specifications @> '{"colour":"White"}'::jsonb;
select * from assets where specifications @> '{"colour":"White"}'::jsonb;

create index idx_specifications_1 on assets using gin(specifications JSONB_PATH_OPS);

explain analyze select * from assets where specifications @> '{"colour":"White"}'::jsonb;
select * from assets where specifications @> '{"colour":"White"}'::jsonb;

drop index idx_specifications_1;
