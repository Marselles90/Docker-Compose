-- Создание пользователя 
create USER marsel with password '123456';

-- Создание базы данных и предоставление прав на нее
create database marsel_db owner marsel;
grant all privileges on database marsel_db to marsel;