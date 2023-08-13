INSERT INTO public.reader(reader_id, num_id, last_name, first_name)
VALUES (1, 1, 'Smith', 'John'),
        (2, 2, 'Watson', 'John'),
        (3, 3, 'Marco', 'John'),
        (4, 4, 'Jackson', 'Samuel'),
        (5, 5, 'Winchester', 'Dean'),
        (6, 6, 'Black', 'John'),
        (7, 7,'White', 'John');

INSERT INTO public.publisher(publish_id, publish_name, publish_city)
VALUES (1, 'How to do anything', 'New York'),
        (2,'Magic', 'Ljubljana'),
        (3, 'Association of poets', 'London'),
        (4, 'SPb', 'St. Petersburg'),
        (5, 'ProgLib', 'New York');

INSERT INTO public.book(book_id, book_name, publish_id, volume)
VALUES (1, 'How to fix anything', 1, 1500),
        (2, 'Story tales', 2, 150),
        (3, 'Wizards', 2, 470),
        (4, 'Write code together', 5, 600),
        (5, 'The best american poems', 3, 120),
        (6, 'Shakespeare', 3, 800),
        (7, 'Mayakovsky', 4, 350),
        (8, 'C++', 5, 1240);

INSERT INTO public.author(author_id, author_last_name, author_first_name, author_middle_name)
VALUES (1, 'Leonard', 'D.', ''),
        (2, 'Grimm', 'Jacob', ''),
        (3, 'Grimm', 'Wilhelm', ''),
        (4, 'Andersen', 'Hans', 'Christian'),
        (5, 'Mayakovsky', 'Vladimir', 'Vladimirovich'),
        (6, 'Dickinson', 'Emily', ''),
        (7, 'Frost', 'Robert', ''),
        (8, 'Whitman', 'Wholt', ''),
        (9, 'Shakespeare', 'William', ''),
        (10, 'Scott', 'Michael', '');

INSERT INTO public.authorship(author_id, book_id) 
VALUES (1, 1),
        (2, 2),
        (3, 2),
        (4, 2),
        (5, 7),
        (6, 5),
        (7, 5),
        (8, 5),
        (9, 6),
        (10, 4),
        (10, 8);

INSERT INTO public.rent(book_id, reader_id, rent_date, return_date) 
VALUES (1, 1, '2023-01-15', NULL),
        (2, 2, '2022-10-15', '2022-10-20'),
        (4, 3, '2022-09-12', '2022-09-21'),
        (3, 4, '2023-04-15', '2023-04-25'),
        (4, 4, '2023-05-15', '2023-05-26'),
        (4, 7, '2023-04-10', '2023-04-20'),
        (5, 4, '2023-06-12', '2023-06-22'),
        (6, 5, '2023-06-05', '2023-06-15'),
        (2, 1, '2023-05-15', NULL);




