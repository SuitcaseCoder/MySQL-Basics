USE codeup_test_db;
GRANT ALL ON codeup_test_db.* TO 'codeup_test_user'@'localhost';
DROP TABLE IF EXISTS albums;

CREATE TABLE albums(
    id INT UNSIGNED AUTO_INCREMENT,
    artist VARCHAR(50),
    name VARCHAR(50),
    release_date CHAR(4),
    sales FLOAT,
    genre VARCHAR(50),
    PRIMARY KEY(id)
);




