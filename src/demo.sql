-- Definition of table "assets"
select column_name, data_type, character_maximum_length, column_default, is_nullable
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'assets';


-- Sample data is "assets" table
select *
from assets;
select count(*)
from assets;

-- fetch laptops with 16 gb ram
-- Fetch assets with color navy blue using extraction operator
select *
from assets
where specifications ->> 'color' = 'Navy Blue';

-- fetch assets with color white using full text search
select *
from assets
where specifications @> '{"colour":"White"}';

select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage,
       count(*)
from assets
where name != 'Software'
group by name, brand, specifications;

select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage,
       count(*)
from assets
where name != 'Software'
  and specifications ? 'ramSizeInGB'
group by name, brand, specifications;

-- Total amount invested in assets
select sum(cast(specifications ->> 'price' as decimal)) from assets;

-- Average price of a laptop in inventory
select avg(cast(specifications ->> 'price' as decimal)) from assets where name='laptop';

explain  analyse select * from assets where specifications @> '{"ramSizeInGB": "4" }'::jsonb;
-- select * from assets where (specifications ->> 'ramSizeInGB') =  '4';

explain analyze
select *
from assets
where specifications @> '{"colour":"White"}'::jsonb;

create index idx_specifications on assets using gin(specifications JSONB_OPS);

explain analyze
select *
from assets
where specifications @> '{"colour":"White"}'::jsonb;

drop index idx_specifications;

explain analyse select * from assets where specifications @> '{"colour":"White"}'::jsonb;
explain analyse select * from assets where specifications -> 'colour' ? 'White';
explain analyse select * from assets where specifications ? 'colour';

create index idx_ram on assets using gin((specifications -> 'colour'));
drop index idx_ram;



explain analyze
select *
from assets
where specifications @> '{"colour":"White"}'::jsonb;

create index idx_specifications_1 on assets using gin(specifications JSONB_PATH_OPS);

explain analyze
select *
from assets
where specifications @> '{"colour":"White"}'::jsonb;

drop index idx_specifications_1;
