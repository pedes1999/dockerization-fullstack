-- Check if the database exists and create it if not
CREATE DATABASE snm;
-- Connect to the 'snm' database
\connect snm;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    friends INT,
    home_page VARCHAR(255)
);
-- Insert data into the 'users' table
INSERT INTO users (name, surname, friends, home_page) VALUES
    ('user-685', 'surname-1fb8', 93, 'http://www.home1fb8.d77'),
    ('user-370', 'surname-08c5', 84, 'http://www.home08c5.d85'),
    ('user-22', 'surname-2078', 56, 'http://www.home2078.dde'),
    ('user-772', 'surname-7bcd', 65, 'http://www.home7bcd.db0'),
    ('user-13', 'surname-7a18', 42, 'http://www.home7a18.da9'),
    ('user-290', 'surname-550d', 69, 'http://www.home550d.dde'),
    ('user-643', 'surname-3cea', 91, 'http://www.home3cea.d16'),
    ('user-50', 'surname-a1d5', 58, 'http://www.homea1d5.de2'),
    ('user-114', 'surname-a1fd', 62, 'http://www.homea1fd.d31'),
    ('user-430', 'surname-5a2e', 72, 'http://www.home5a2e.d65'),
    ('user-226', 'surname-568d', 81, 'http://www.home568d.de8'),
    ('user-52', 'surname-8531', 58, 'http://www.home8531.d09'),
    ('user-632', 'surname-b5ad', 87, 'http://www.homeb5ad.d7f'),
    ('user-68', 'surname-1147', 26, 'http://www.home1147.d4c'),
    ('user-337', 'surname-8315', 23, 'http://www.home8315.d96'),
    ('user-201', 'surname-7a0d', 64, 'http://www.home7a0d.d0d'),
    ('user-767', 'surname-0267', 60, 'http://www.home0267.dcc');
