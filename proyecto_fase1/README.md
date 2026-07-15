# SG Food - ETL and Data Warehouse

Project phase 1 implements an ETL process for SG Food sales and purchases data. The project loads flat files into staging environments, applies transformations in SSIS, and stores the results in a SQL Server data warehouse.

## Scope

- Built an SSIS project for sales and purchase ingestion.
- Created SQL Server staging tables for file-based loading.
- Created PostgreSQL staging tables for a hybrid ETL flow.
- Designed the `DW_SGFood` star-schema warehouse in SQL Server.
- Loaded customer, seller, product, branch, and supplier dimensions.
- Loaded sales and purchase fact tables.
- Documented SSIS data conversion rules for null handling, default values, type casting, and Boolean conversion.
- Added Docker Compose support for local SQL Server and PostgreSQL services.

## Technology Used

- SQL Server
- SQL Server Integration Services (SSIS)
- PostgreSQL
- ODBC PostgreSQL driver
- Docker Compose
- T-SQL
- Visual Studio 2022

## ETL Flows

### Flow 1: SQL Server Staging to Data Warehouse

- Source files: `SGFood01.vent` and `SGFood01.comp`.
- Landing area: SQL Server staging tables.
- Processing: SSIS validation, data conversion, sorting, deduplication, and lookup operations.
- Destination: SQL Server warehouse tables in `DW_SGFood`.

### Flow 2: PostgreSQL Staging to SQL Server Data Warehouse

- Source files: `SGFood02.vent` and `SGFood02.comp`.
- Landing area: PostgreSQL staging tables.
- Connectivity: SSIS ODBC connection manager using the PostgreSQL driver.
- Destination: same SQL Server warehouse model used by the first flow.

### Flow 3: Direct Flat File to Data Warehouse

- Source files: `SGFood03.vent` and `SGFood03.comp`.
- Landing area: no staging database.
- Processing: direct SSIS extraction from flat files, multicast flows, cleanup, sorting, duplicate removal, dimension lookups, and fact table loads.

## Data Warehouse Model

The warehouse uses a star schema in `DW_SGFood`.

### Dimensions

- `dim_cliente`
- `dim_vendedor`
- `dim_producto`
- `dim_sucursal`
- `dim_proveedor`

### Facts

- `fact_ventas`: sales transactions with units, unit price, and calculated `total_venta`.
- `fact_compras`: purchase transactions with units, unit cost, and calculated `total_compra`.

The model uses surrogate keys for warehouse relationships and keeps facts separated by business process: sales and purchases.

## Important Files

| Path | Description |
| --- | --- |
| `fase1/fase1.sln` | Visual Studio SSIS solution. |
| `fase1/Package.dtsx` | Main SSIS package. |
| `init-db.sql` | Creates SQL Server staging and data warehouse structures. |
| `pg-init.sql` | Creates PostgreSQL staging tables. |
| `Data_conversion.md` | Field-level SSIS conversion and cleansing rules. |
| `docker-compose.yml` | Local SQL Server and PostgreSQL environment. |
| `*.vent`, `*.comp` | Sales and purchase input files for each ETL flow. |

## How to Run

1. Start the local database services:

   ```bash
   docker compose up -d
   ```

2. Open `fase1/fase1.sln` in Visual Studio 2022 with the SSIS extension installed.

3. Update connection managers for:

   - SQL Server OLE DB connection.
   - PostgreSQL ODBC connection.
   - Flat file paths for `.vent` and `.comp` files.

4. Run the packages in the appropriate order for the selected flow:

   - SQL Server staging flow.
   - PostgreSQL staging flow.
   - Direct flat file flow.

5. Validate results by querying `DW_SGFood` dimensions and facts.

This phase covers warehouse design, multiple ETL loading strategies, SQL Server and PostgreSQL integration, and SSIS transformation logic.
