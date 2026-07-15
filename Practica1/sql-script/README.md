# Practica 1 - SQL Scripts

This folder contains the T-SQL scripts used by `Practica1/main.py` to prepare and validate the SQL Server data warehouse for the flight ETL practice.

## Scripts

| File | Purpose |
| --- | --- |
| `create_db.sql` | Creates the `VuelosDB` database if it does not already exist. |
| `create_schema.sql` | Recreates the star-schema model with passenger, airport, pilot, date, flight status, and flight fact tables. |
| `delete_schema.sql` | Drops the warehouse tables so the model can be rebuilt from a clean state. |
| `validacion.sql` | Contains validation queries used to inspect counts and loaded data quality. |

## Model Summary

The model follows a star schema:

- Dimensions: `Passengers_Dim`, `Airports_Dim`, `Pilots_Dim`, `Dates_Dim`, `FlightStatus_Dim`.
- Fact table: `Flights_Fact`.

The Python application executes these scripts through `pyodbc`, then loads transformed CSV data into SQL Server.
