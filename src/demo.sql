-- Sample data is "assets" table
select * from assets;







-- Fetch laptops with 16 gb ram using extraction operator, add multiple records
select * from assets where (specifications ->> 'ramSizeInGB')::Integer = 16;
-- Fetch assets with colour navy blue using extraction operator 
select * from assets where specifications ->> 'colour' = 'Navy Blue';







-- fetch assets with colour white using full text search (contains), add multiple records
select * from assets where specifications @> '{"colour":"White"}';







-- Formatting jsonb fields as columns
select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage
from assets;







-- Filtering out records which does not have ramSizeInGB field
select name,
       brand,
       specifications -> 'colour'        as color,
       specifications -> 'ramSizeInGB'   as "ram in GB",
       specifications -> 'hardDriveSize' as storage
from assets
where specifications ? 'ramSizeInGB';







-- Aggregation operations
select sum(cast(specifications ->> 'price' as decimal)) from assets;
select avg(cast(specifications ->> 'price' as decimal)) from assets where name='laptop';