CREATE DATABASE adoptionCenter;
SHOW DATABASES;

USE adoptionCenter;

GRANT ALL ON adoptionCenter.* TO 'root'@'localhost';

DROP TABLE IF EXISTS adoptionCenter.animals;

CREATE TABLE IF NOT EXISTS animals (
    animal_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    type  VARCHAR(100) NOT NULL,
    age INT,
    size TEXT,
    is_adoptable TINYINT(1), #where 0 is false and 1 is true
    is_cute TINYINT(1),
    day_created DATE,
    PRIMARY KEY (animal_id)
);
DESCRIBE animals;


INSERT INTO animals(name, type, age, size, is_adoptable, is_cute, day_created)
VALUES
    ('Fritz', 'dog', 16, 'medium', 0, 1, '2021-07-29'),
    ('Shiner', 'dog', 10, 'big', 0, 1,'1990-10-18'),
    ('Fidgety', 'parrot', 3, 'big', 0,1, CURDATE()),
    ('Fritz', 'dog', 16, 'small', 0, 1, CURDATE());

SELECT * FROM adoptionCenter.animals;

# WHERE Clause
SELECT name, type FROM animals WHERE type = 'dog';

#WHERE - BETWEEN
SELECT name, age FROM animals WHERE age > 5 OR age <10;
SELECT name, age FROM animals WHERE age BETWEEN 5 AND 10;
SELECT name, type FROM animals WHERE type BETWEEN 'dog' AND 'parrot';


#WHERE - LIKE: will compare character by character, allows us to output
SELECT name FROM animals WHERE name LIKE '%e%'; #animals ending with y
SELECT name FROM animals Where type Like '%r%';# animals whose type of
# animal
# has an r in it

#WHERE - DISCTINCT : allow us to avoid duplicates
SELECT DISTINCT name FROM animals WHERE type = 'dog'; #this will pull
# all distinct names as long as the animal is dog
SELECT DISTINCT name, type FROM animals WHERE type = 'dog';
SELECT DISTINCT type FROM animals;

#WHERE - IN
SELECT * FROM animals;
SELECT type FROM animals WHERE type IN ('cat', 'dog', 'gerbil');


#CHAINING WHERE && COMPARISON OPERATORS
SELECT name FROM animals WHERE age > 6 AND type = 'dog';
SELECT name, type FROM animals
WHERE is_adoptable = 1
AND age < 5
AND type = 'cat';


#ORDER BY
#SELECT column FROM table ORDER BY column_name DESC

# output all animal names in descending age order
SELECT name, age FROM animals ORDER BY age DESC;

#ouput all animal names in descending age order, if the ages are between
# 2 and 7
SELECT name, age FROM animals WHERE age BETWEEN 2 AND 7 ORDER BY age DESC;

#output all animal names and types in ascending order by animal type;
SELECT name, type, age FROM animals ORDER BY name ASC;


#LIMIT Clause - limits what we're getting back instead of getting too
# much data

SELECT * FROM animals;
SELECT name, type FROM animals WHERE type = 'dog' LIMIT 3 OFFSET 2;
SELECT type FROM animals;



# CONCAT
SELECT name, type, CONCAT(name, 'the', type, ' is up for
adoption') FROM animals;



#NOT LIKE
SELECT DISTINCT type, name from animals WHERE name NOT LIKE '%e%';
SELECT name from animals WHERE name NOT LIKE '%y';

#DATE
SELECT DAY('2002-06-09');
SELECT DAYOFMONTH('2002-06-09');
SELECT NOW();
SELECT CURTIME();
SELECT CURDATE();

SELECT name, CONCAT(name , ' was adopted on ' , CURDATE()) FROM animals;

#MONTH

#YEAR

#NOW

#UNIX TIMESTAMP - number of seconds since jan 1st 1970 - returns integer
SELECT CONCAT(
               'Teaching people to code for ',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           );


## GROUP BY
SELECT DISTINCT type from animals;

SELECT type FROM animals GROUP BY type;

# SELECT name  FROM animals GROUP BY type;

#Select all animals but display only the types of animals without
# repeating using Group By
SELECT type FROM animals GROUP BY type;
SELECT * FROM animals;
SELECT name, type FROM animals GROUP BY name, type;

#AGGREGATE - aggregate -

#COUNT - count the number of the column chosen -- aggregates every
# column value
SELECT * FROM animals;
SELECT name,
       COUNT(name) as 'number of times name appears'
        FROM animals
        WHERE name NOT LIKE '%s%'
GROUP BY name;

SELECT type as petsThatIWant FROM animals;

SELECT DISTINCT name
FROM animals;



