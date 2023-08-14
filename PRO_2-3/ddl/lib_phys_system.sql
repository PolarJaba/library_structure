CREATE TABLE IF NOT EXISTS public.reader (
    reader_id serial PRIMARY KEY,
    num_id BIGINT NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50),
    adress VARCHAR(250),
    phone_num VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS public.publisher(
    publish_id serial PRIMARY KEY,
    publish_name VARCHAR(50) NOT NULL,
    publish_city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.book (
    book_id serial PRIMARY KEY,
    book_name VARCHAR(250) NOT NULL,
    year_of_pub INTEGER,
    publish_id BIGINT,
    FOREIGN KEY (publish_id) REFERENCES publisher (publish_id), 
    volume INTEGER,
    price INTEGER,
    num_of_copies INTEGER
);

CREATE TABLE IF NOT EXISTS public.rent (
    rent_id serial PRIMARY KEY,
    book_id BIGINT,
    reader_id BIGINT,
    FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE,
    FOREIGN KEY (reader_id) REFERENCES reader (reader_id) ON DELETE CASCADE,
    rent_date DATE,
    return_date DATE,
    -- added column "returned" 
    returned BOOLEAN 
);

CREATE TABLE IF NOT EXISTS public.author (
    author_id serial PRIMARY KEY,
    author_last_name VARCHAR(50) NOT NULL,
    author_first_name VARCHAR(50) NOT NULL,
    author_middle_name VARCHAR(50),
    author_country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.authorship (
    unique_author_work_id serial PRIMARY KEY,
    author_id BIGINT,
    book_id BIGINT,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE
);

COPY publisher
FROM '/docker-entrypoint-initdb.d/dml/publishers.csv'
DELIMITER ';'
CSV HEADER;

COPY reader
FROM '/docker-entrypoint-initdb.d/dml/readers.csv'
DELIMITER ';'
CSV HEADER;

COPY book
FROM '/docker-entrypoint-initdb.d/dml/books.csv'
DELIMITER ';'
CSV HEADER;

COPY author
FROM '/docker-entrypoint-initdb.d/dml/author.csv'
DELIMITER ';'
CSV HEADER;

COPY authorship
FROM '/docker-entrypoint-initdb.d/dml/authorship.csv'
DELIMITER ';'
CSV HEADER;

COPY rent
FROM '/docker-entrypoint-initdb.d/dml/rent.csv'
DELIMITER ';'
CSV HEADER;



