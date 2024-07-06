-- Create super user.

CREATE ROLE testuser LOGIN SUPERUSER PASSWORD 'testpassword';

-- Create table after check.

DROP TABLE IF EXISTS jsonexample;

CREATE TABLE jsonexample (
  id INT,
  json_col JSON,
  json_array_col JSON,
  jsonb_col JSONB,
  jsonb_array_col JSONB
);

-- Insert values into table.

INSERT INTO jsonexample VALUES (1,
  '[1,2,3]'::json,
  '[{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}]'::json,
  '[1,2,3]'::jsonb,
  '[{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}]'::jsonb
);

-- queries

SELECT * FROM jsonexample;

-- insert via json

INSERT INTO jsonexample VALUES (2,
  '[1,2,3]'::json,
  '[{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}]'::json,
  '[1,2,3]'::jsonb,
  '[{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}]'::jsonb
);

INSERT INTO jsonexample
SELECT id, json_col, json_array_col, jsonb_col, jsonb_array_col
FROM json_populate_record (NULL::jsonexample,
    '{
      "id": 3,
      "json_col": {"name": "bob", "age": 111},
      "json_array_col": [{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}],
      "jsonb_col": {"name": "sarah", "age": 2222},
      "jsonb_array_col": [{"id": 0, "name": "a"},{"id": 1, "name": "a"},{"id": 2, "name": "c"}]
    }'
);

-- query into json array

SELECT arr -> 'id' AS json_id, arr -> 'name' AS json_name
FROM jsonexample e, json_array_elements(e.json_array_col) arr
WHERE (arr ->> 'id')::int > -1;

-- query json column

SELECT json_col::json ->> 2 FROM jsonexample;

SELECT json_col -> 'age' FROM jsonexample;

SELECT json_col -> 'age' AS json_age FROM jsonexample WHERE (json_col ->> 'age')::int = 111;

-- query into jsonb array

SELECT arr -> 'id' AS json_id, arr -> 'name' AS json_name
FROM jsonexample e, jsonb_array_elements(e.jsonb_array_col) arr
WHERE (arr ->> 'id')::int > -1;

-- query jsonb column

SELECT jsonb_col::json ->> 2 FROM jsonexample;

SELECT jsonb_col -> 'age' FROM jsonexample;

SELECT jsonb_col -> 'name' AS jsonb_name, jsonb_col -> 'age' AS jsonb_age
FROM jsonexample WHERE (jsonb_col ->> 'name') = 'sarah';