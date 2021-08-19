
-- Gin index using jsonb_ops
explain analyze select * from assets_indexing_demo where specifications @> '{"colour":"White"}'::jsonb;
explain analyse select * from assets_indexing_demo where specifications @> '{"ramSizeInGB": "4" }'::jsonb;

create index idx_specifications_jsonops on assets_indexing_demo using gin(specifications JSONB_OPS);

drop index idx_specifications_jsonops;






-- GIN expression indexing 
explain analyse select * from assets_indexing_demo where (specifications -> 'ramSizeInGB') ? '4';

create index idx_expression on assets_indexing_demo using gin((specifications -> 'ramSizeInGB'));

drop index idx_expression;






-- GIN indexing using jsonb_path_ops
explain analyze select * from assets_indexing_demo where specifications @> '{"ramSizeInGB":"4"}'::jsonb;

create index idx_specifications_jsonbpathops on assets_indexing_demo using gin(specifications JSONB_PATH_OPS);

-- drop index idx_specifications_jsonbpathops;