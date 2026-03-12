# aviaco-database-system
Relational database and data warehouse system for an aircraft charter company built with MySQL, including ER modeling, SQL queries, and analytics.

# AviaCo Database System

This project presents the design and implementation of a relational database and data warehouse system for an aircraft charter company using MySQL.

The system manages aircraft operations, employees, pilots, charter flights, and customers while enabling analytical reporting through a star schema data warehouse.

## Technologies Used

- MySQL
- SQL
- Relational Database Design
- ER Modeling
- Data Warehousing (Star Schema)
- Excel (Data Analysis)

## Database Structure

The relational database includes the following main entities:

- Aircraft
- Aircraft Model
- Employees
- Pilots
- Customers
- Charter Flights
- Crew Assignments

Primary and foreign key constraints enforce data integrity between tables.

## Data Warehouse

A star schema was created to support business intelligence queries:

- **Fact Table**
  - `charter_fact`

- **Dimension Tables**
  - `time_dim`
  - `model`
  - `employee`

This structure enables analytical queries such as:

- Revenue by aircraft model
- Revenue by month and year
- Flight hours per pilot

## ER Diagrams

The `erd-diagrams` folder contains ER diagrams showing the database relationships and schema structure.

## Project Structure
aviaco-database-system
│
├── data
├── erd-diagrams
├── aviacoFull.sql
├── AviaCo_MySQL.txt
└── README.md


## Example Analytical Questions

The database allows analysis such as:

- Which aircraft model generates the most revenue?
- Which pilots fly the most hours?
- How does charter revenue vary by month?

## Author

A M  
MSc Data Science & Business Analytics
