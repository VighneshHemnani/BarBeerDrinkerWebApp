# BarBeerDrinkerWebApp

Bar Beer Drinker is a web application project that uses HTML, CSS and Javascript in the front-end and MySQL and Java in the back-end to handle queries, output queries, as well as make insightful graphs to visualizes trends for better data analysis. This was a part of a class project for Principles of Information and Data Management (CS 336) at Rutgers with Professor Imieliński. 

## What does the WebApp do?

Write what it does. How many pages. What each page does.

## About the database

For the project, we were provided a database with multiple tables about bars, beers and drinkers in an imaginary country. This initial database did not contain any established relations such as primary keys or foreign keys, and only contained data of 12 tables (can be found *here*), which are:

1. Bar table
    - Names of all bars and their respective state in which they are located
2. Barfood table
    - All names of dishes/foods that all bars serve
3. Beer table
    - Names of all beers and their respective manufacturers 
4. Bills table
    - Table that contains all bills. Every tuple in this table/every bill contain a bill_id, bar, date, drinker, items_price, tax_price, tip, total_price, time, bartender, day.
5. Day table
    - All days of the week listed in a table.
6. Drinker table
    - Names of all drinkers and their respective states in which they live and their phone numbers.
7. Frequents table
    - Names of all drinkers and which bar the respective drinker frequents.
8. Likes table
    - Names of all drinkers and which beer the respective drinker likes.
9. Operates table
    - Names of all bars and the respective days, open_time and closing_time that bar has.
10. Sellsbeer table
    - Names of all bars and which beers they sell.
11. Sellsfood table
    - Names of all bars and which food/dishes they sell.
12. Transactions table
    - Table that contains all transaction, and a transaction/tuple contains the bill_id, item bought, its quantity, its type (beer or food), and its price. 

Since this initial database only contained the data and respective tables, the first item in the agenda was to create another database schema that had the neccessary structure in place. First, I identified what the primary and foriegn keys were in this project and then created an empty database schema in MySQL Workbench. Then I created all the tables again, except this time, include the primary keys and the foriegn key constraints so when the web app requests an addition or a modification to the database, we can provide a dynamic error user page.

## Tools and languages used in this project

In this project, multiple languages were used to do markup, styling the information and web app as well as handle and processing the queries in the back end. Explain more here
