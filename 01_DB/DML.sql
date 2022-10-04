CREATE TABLE users(
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
age INTEGER NOT NULL,
country TEXT NOT NULL,
phone TEXT NOT NULL,
balance INTEGER NOT NULL
);


SELECT first_name, age FROM users;
SELECT * FROM users;
SELECT rowid, first_name FROM users;

SELECT first_name,last_name,age FROM users
ORDER BY age ASC;
-- 내림정렬 DESC
SELECT first_name,last_name,age,balance FROM users
ORDER BY age ASC, balance DESC;

SELECT country FROM users;
-- 중복제거하고 조회
SELECT DISTINCT country FROM users;
SELECT DISTINCT country FROM users ORDER BY country;
SELECT DISTINCT first_name,country FROM users;
SELECT DISTINCT first_name,country FROM users ORDER BY country DESC;

-- where 실습
SELECT first_name, age, balance FROM users WHERE age>=30;
SELECT first_name, age, balance FROM users WHERE age>=30 AND balance>500000;

-- LIKE 실습
SELECT first_name,last_name FROM users WHERE first_name LIKE '%호%';
SELECT first_name FROM users WHERE first_name LIKE '%준';
SELECT first_name,phone FROM users WHERE phone LIKE '02-%';
SELECT first_name,age FROM users WHERE age LIKE '2_';
SELECT first_name,phone FROM users WHERE phone LIKE '%-51__-%';

-- IN 실습 
SELECT first_name,country FROM users WHERE country IN ('경기도','강원도');
SELECT first_name,country FROM users WHERE country = '경기도' or country = '강원도';
SELECT first_name,country FROM users WHERE country NOT IN ('경기도','강원도');
SELECT first_name,country FROM users WHERE country != '경기도' or country != '강원도';

-- BETWEEN 실습
SELECT first_name,age FROM users WHERE age BETWEEN 20 AND 30;
SELECT first_name,age FROM users WHERE age >= 20 AND age<=30;
SELECT first_name,age FROM users WHERE age NOT BETWEEN 20 AND 30;
SELECT first_name,age FROM users WHERE age < 20 OR age>30;

-- LIMIT 실습
SELECT rowid, first_name FROM users LIMIT 10;
SELECT first_name,balance FROM users ORDER BY balance DESC LIMIT 10;
SELECT first_name,age FROM users ORDER BY age LIMIT 5;

-- OFFSET 실습
SELECT rowid, first_name FROM users LIMIT 10 OFFSET 10;

-- GROUP
SELECT country,COUNT(*) FROM users GROUP BY country;
SELECT COUNT(*) FROM users;
SELECT AVG(age) FROM users WHERE age>=30;
SELECT last_name,COUNT(*) AS number_of_name FROM users GROUP BY last_name;

CREATE TABLE classmate(
name TEXT NOT NULL,
age INTEGER NOT NULL,
address TEXT NOT NULL
);

-- INSERT
-- INSERT INTO classmate (name,age,address) 
-- VALUES ('홍길동',23,'서울');
INSERT INTO classmate
VALUES ('홍길동',23,'서울'),
('이영미',31,'강원'),
('박진성',26,'전라'),
('최지수',12,'충청'),
('정요한',28,'경상');

--UPDATE
UPDATE classmate
SET name = '김철수한무두루미',address='제주도'
WHERE rowid = 2;

-- DELETE
DELETE FROM classmate WHERE rowid = 5;
SELECT rowid, * FROM classmate;

DELETE FROM classmate where name LIKE '%영%';
DELETE FROM classmate;


