--1.Check: is this table in 1NF? Explain why.
  --Yes,the table is in 1NF because each cell contains a single value, there are no repeating groups, and each row has a primary key (isbn).--
  
--2.Check: is this table in 2NF? Explain why (single-column PK).
  --Yes, the table is in 2NF because the primary key is only one column(isbn) 2NF problems happen only when the primary key is composite (made of
     --multiple columns).since isbn is a single column PK,partial dependencies cannot exist in this table.--

--3.Identify all transitive dependencies in the table.--
--The table has the follםwing transitive dependencies:
  --A.isbn -> author_id -> author_name
  --B.isbn -> publisher_id -> publisher_name
  --C.isbn -> publisher_id -> publisher_city--

--5.Write CREATE TABLE statements for all three tables with proper PKs and FKs.--

CREATE TABLE authors (
   author_id TEXT PRIMARY KEY,
   author_name TEXT NOT NULL
);

CREATE TABLE publishers (
   publisher_id TEXT PRIMARY KEY,
   publisher_name TEXT NOT NULL,
   publisher_city TEXT NOT NULL
);

CREATE TABLE books (
    isbn TEXT PRIMARY KEY,
	title TEXT NOT NULL,
	author_id TEXT NOT NULL,
	publisher_id TEXT NOT NULL,
	FOREIGN KEY (author_id) REFERENCES authors(author_id),
	FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

--6.Insert the original data into the normalized tables.--

INSERT INTO authors (author_id, author_name) VALUES
('A1','Jane Doe'),
('A2', 'John Smith');

INSERT INTO publishers (publisher_id, publisher_name, publisher_city) VALUES
('P1', 'TechPress', 'New York'),
('P2', 'DataBook', 'Paris');

INSERT INTO books (isbn,title,author_id,publisher_id) VALUES
('978-1', 'SQL Mastery', 'A1', 'P1'),
('978-2', 'Python Pro', 'A2', 'P1'),
('978-3', 'Data Viz', 'A1', 'P1' );

--7.Write a query to reproduce all original columns using JOINs.--
SELECT
   b.isbn,
   b.title,
   b.author_id,
   a.author_name,
   b.publisher_id,
   p.publisher_name,
   p.publisher_city
FROM books b 
JOIN authors a ON b.author_id = a.author_id
JOIN publishers p ON b.publisher_id = p.publisher_id;

--8.Bonus: Change Jane Doe's name to "Jane Doe-Smith" — how many rows change in the 3NF vs original schema?--
  --a.original schema: 2 rows change due  to redundancy.--
  --b.3NF schema: 1 row changes because data is stored once in the authors table.--
