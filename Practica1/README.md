# Practica 1 - Flight ETL and Dimensional Model

This practice implements an ETL console application for a flight passenger dataset. The application reads raw CSV data, transforms it into dimension and fact structures, loads it into SQL Server, and provides a menu of analytical queries.

## Scope

- Built a Python console application in `main.py`.
- Created a SQL Server database named `VuelosDB`.
- Designed a star schema for flight analytics.
- Parsed and normalized departure dates.
- Generated dimension datasets for passengers, airports, pilots, dates, and flight statuses.
- Generated a `Flights_Fact` table that relates all dimensions.
- Loaded transformed data into SQL Server using `pyodbc`.
- Added analytical queries for passenger demographics, flight counts, airport usage, countries, continents, and flight status.
- Included Docker Compose support for running SQL Server locally.

## Technology Used

- Python
- pandas
- pyodbc
- python-dotenv
- SQL Server
- T-SQL
- Docker Compose

## Data Model

The warehouse uses a star schema:

| Table | Type | Description |
| --- | --- | --- |
| `Passengers_Dim` | Dimension | Passenger identity, name, gender, age, and nationality. |
| `Airports_Dim` | Dimension | Arrival airport, country, and continent metadata. |
| `Pilots_Dim` | Dimension | Pilot names. |
| `Dates_Dim` | Dimension | Departure date broken into year, month, and day. |
| `FlightStatus_Dim` | Dimension | Flight status values such as delayed, cancelled, or on time. |
| `Flights_Fact` | Fact | Central fact table linking passenger, airport, pilot, date, and status. |

## Important Files

| Path | Description |
| --- | --- |
| `main.py` | Python ETL and query menu application. |
| `data/VuelosDataSet.csv` | Raw flight dataset used as the input source. |
| `sql-script/create_db.sql` | Creates the database. |
| `sql-script/create_schema.sql` | Creates the dimensional model. |
| `sql-script/delete_schema.sql` | Removes existing model tables. |
| `sql-script/validacion.sql` | Validation queries. |
| `Documentation/` | Supporting documentation and screenshots. |
| `docker-compose.yml` | Local SQL Server container setup. |

## How to Run

1. Start SQL Server locally or with Docker Compose:

   ```bash
   docker compose up -d
   ```

2. Create a `.env` file inside `Practica1/` with SQL Server connection values:

   ```env
   DB_DRIVER=ODBC Driver 17 for SQL Server
   DB_SERVER=localhost,1433
   DB_USER=sa
   DB_PASSWORD=StrongPass123!
   ```

3. Install the Python dependencies:

   ```bash
   pip install pandas pyodbc python-dotenv
   ```

4. Run the application:

   ```bash
   python main.py
   ```

5. Use the menu to create the model, transform the CSV, load SQL Server, and run analytical queries.

The main work is in the transformation logic, star-schema design, database loading flow, and analytical query layer.
