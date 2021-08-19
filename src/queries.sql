-- View all records
select * from assets;

-- View specific column of all records
select name, serial_number, brand, specifications -> 'countryOfOrigin' as origin from assets;

-- View specific record using where clause
select * from assets where specifications @> '{"countryOfOrigin":"China"}';
select * from assets where specifications ->> 'countryOfOrigin' = 'India';
select * from assets where specifications ->> 'modelYear' <= '2018';

-- view record if given column is present
-- select * from assets where specifications ? 'processorType';
-- select * from assets where specifications ?| array['processorType', 'operatingSystem'];


-- List all keyboards which has type @>
select * from assets where name='keyboard' and specifications @> '{"connectorType": "Wired"}';

-- List all laptops which has ram greater than 8gb ->
select * from assets where name='laptop' and (specifications ->> 'ramSizeInGB')::INTEGER > 8;
