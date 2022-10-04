```sql
CREATE TABLE contacts (
name TEXT NOT NULL,
age INTEGER NOT NULL,
email TEXT NOT NULL UNIQUE
);
```

Data Types의 종류

1. NULL
   
   - 정보가 없거나 알 수 없음 

2. INTEGER
   
   - 정수
   
   - 크기에 따라 가변 크기를 가짐

3. REAL
   
   - 실수
   
   - 8바이트 부동 소수점을 사용하는 10진수 값이 있는 실수

4. TEXT
   
   - 문자 데이터

5. BLOL(Binary Large Object)
   
   - 입력된 그대로 저장된 데이터 덩어리
   
   - 바이너리 등 멀티미디어 파일
   
   - ex. 이미지 데이터   

타입 선호도의 존재 이유 

- 다른 데이터베이스 엔진 간의 호환성을 최대화

- 정적이고 엄격한 타입을 사용하는 DB의 SQL문을 SQLite에서도 작동하도록 하기 위함

# DDL

- 기존 테이블의 구조를 수정(변경)

```sql
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
```

![](C:\Users\wogns\AppData\Roaming\marktext\images\2022-10-04-17-39-09-image.png)

# DML

CRUD  = INSERT, SELECT, UPDATE, DELETE

#### SELECT

```sql
SELECT first_name, age FROM users;
SELECT * FROM users;
SELECT rowid, first_name FROM users;
```

ORDER BY

```sql
SELECT first_name,last_name,age FROM users
ORDER BY age ASC;
-- 내림정렬 DESC
SELECT first_name,last_name,age,balance FROM users
ORDER BY age ASC, balance DESC;

-- age-> balance순으로 정렬
```

- NULL은 다른 값보다 작은 것으로 간주

Filtering

```sql
-- 중복제거하고 조회
SELECT DISTINCT country FROM users;
SELECT DISTINCT country FROM users ORDER BY country;
SELECT DISTINCT first_name,country FROM users;
SELECT DISTINCT first_name,country FROM users ORDER BY country DESC;
```

- NULL값을 중복으로 간주 

- NULL값이 잇는 컬럼에 DISCTINCT절을 사용하면 SQLIte는 Null값의 한 행을 유지

```sql
-- where 실습
SELECT first_name, age, balance FROM users WHERE age>=30;
SELECT first_name, age, balance FROM users WHERE age>=30 AND balance>500000;
```

LIKE operator(Query data based on pattern matching)

- 패턴 일치를 기반으로 데이터를 조회

- SELECT, DELETE, UPDATE문의 WHERE절에서 사용

```sql
-- LIKE 실습
SELECT first_name,last_name FROM users WHERE first_name LIKE '%호%';
SELECT first_name FROM users WHERE first_name LIKE '%준';
SELECT first_name,phone FROM users WHERE phone LIKE '02-%';
SELECT first_name,age FROM users WHERE age LIKE '2_';
SELECT first_name,phone FROM users WHERE phone LIKE '%-51__-%';
```

```sql
-- IN 실습 
SELECT first_name,country FROM users WHERE country IN ('경기도','강원도');
SELECT first_name,country FROM users WHERE country = '경기도' or country = '강원도';
SELECT first_name,country FROM users WHERE country NOT IN ('경기도','강원도');
SELECT first_name,country FROM users WHERE country != '경기도' or country != '강원도';
```

```sql
-- BETWEEN 실습
SELECT first_name,age FROM users WHERE age BETWEEN 20 AND 30;
SELECT first_name,age FROM users WHERE age >= 20 AND age<=30;
SELECT first_name,age FROM users WHERE age NOT BETWEEN 20 AND 30;
SELECT first_name,age FROM users WHERE age < 20 OR age>30;
```

논리연산자 SQLite logical operators

- ALL, AND, ANY, BETWEEN, IN, LIKE, NOT, OR 등

- SQLite는 Boolean 데이터 타입을 제공하지않기때문에 1 == TRUE, 0 == FALSE



LIMIT 

```sql
-- LIMIT 실습
SELECT rowid, first_name FROM users LIMIT 10;
SELECT first_name,balance FROM users ORDER BY balance DESC LIMIT 10;
SELECT first_name,age FROM users ORDER BY age LIMIT 5;

-- OFFSET 실습
SELECT rowid, first_name FROM users LIMIT 10 OFFSET 10:
```

- OFFSET keyword

LIMIT 절을 사용하면 첫 번째 데이터부터 지정한 수만큼의 데이터를 받아올 수 있지만 OFFSET절과 함께 사용하면 특정 지정된 위치에서부터 데이터를 조회할 수 있음



### GROUP

```sql
-- GROUPSELECT country,COUNT(*) FROM users GROUP BY country;
SELECT COUNT(*) FROM users;
SELECT AVG(age) FROM users WHERE age>=30;
SELECT last_name,COUNT(*) AS number_of_name FROM users GROUP BY last_name;;
```

#### Aggregate function

- 집계함수 AVG(), COUNT(), MAX(), MIN(), SUM()

- 값 집합에 대한 계산을 수행하고 단일 값 반환 





## INSERT INTO

```sql
-- INSERT
INSERT INTO classmate (name,age,address) 
VALUES ('홍길동',23,'서울');
INSERT INTO classmate
VALUES ('홍길동',23,'서울'),
('이영미',31,'강원'),
('박진성',26,'전라'),
('최지수',12,'충청'),
('정요한',28,'경상');
```



#### UPDATE

```sql
--UPDATE
UPDATE classmate
SET name = '김철수한무두루미',address='제주도'
WHERE rowid = 2;
```



#### DELETE

```sql
-- DELETE
DELETE FROM classmate WHERE rowid = 5;
SELECT rowid, * FROM classmate;

DELETE FROM classmate where name LIKE '%영%';
DELETE FROM classmate;
```
