CREATE TABLE contacts (
name TEXT NOT NULL,
age INTEGER NOT NULL,
email TEXT NOT NULL UNIQUE
);

-- 1. Rename a table
ALTER TABLE contacts RENAME TO new_contacts;
-- 2. Rename a column
ALTER TABLE new_contacts RENAME COLUMN name TO last_name;
-- 3. Add a new column to a table
ALTER TABLE new_contacts ADD COLUMN address TEXT NOT NULL DEFAULT 'no address';
-- 4. Delete a column
ALTER TABLE new_contacts DROP COLUMN address;
-- 유니크 column은 식별자의 역할을 할 수 있기 때문에 DROP할 수 없다.
ALTER TABLE new_contacts DROP COLUMN email;
-- 5. Delete a table
DROP TABLE new_contacts;
DROP TABLE zoo;