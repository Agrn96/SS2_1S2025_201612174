# SS2_1S2025_201612174

Repository for Seminario de Sistemas 2. The work focuses on data engineering and business intelligence: ETL pipelines, dimensional modeling, SQL Server data warehouses, PostgreSQL staging, SSIS packages, SSAS multidimensional modeling, and a Python-based NLP/data analysis notebook.

## General Overview

The repository is organized as a set of practices and project phases. Each folder keeps the files needed for a specific deliverable, including source data, database scripts, transformation logic, documentation, and project files for the tools used.

The main theme is moving data from raw formats into structures that are easier to analyze. Some parts use Python for transformation and exploration, while the larger project uses the Microsoft BI stack with SQL Server, SSIS, and SSAS.

## Repository Overview

| Folder | Deliverable | Main Technologies | Summary |
| --- | --- | --- | --- |
| `Practica1/` | Flight data ETL practice | Python, pandas, SQL Server, pyodbc, Docker, T-SQL | Converts a raw flight passenger dataset into a star-schema warehouse and provides analytical queries over the loaded model. |
| `practica2/` | Coursera data and comments analysis | Python, Jupyter Notebook, pandas, NLTK, matplotlib | Explores Coursera course metadata and user comments using cleaning, tokenization, lemmatization, named-entity extraction, and sentiment analysis. |
| `proyecto_fase1/` | SG Food ETL and data warehouse | SSIS, SQL Server, PostgreSQL, Docker, T-SQL | Implements a sales and purchases ETL process from flat files through staging layers into a SQL Server star-schema warehouse. |
| `proyecto_fase2/` | SG Food analytical model | SSAS Multidimensional, Visual Studio | Contains the Analysis Services project structure and data source definition for building the multidimensional layer over the SG Food warehouse. |

## What to Expect

The repository covers a complete BI workflow across several assignments:

- Source data ingestion from CSV, text, and flat files.
- Staging database setup in SQL Server and PostgreSQL.
- Data transformation and quality handling with Python, SQL, and SSIS.
- Dimensional modeling using star schemas.
- Fact and dimension table loading for analytical workloads.
- Query validation and reporting-oriented analysis.
- Multidimensional model scaffolding in SQL Server Analysis Services.
- Natural language processing over course reviews and free-text comments.

Most folders include a local README with more specific setup notes. The root README gives the overall structure and how the pieces fit together.

## Project Details

### Practica1 - Flight ETL

`Practica1/` contains a Python console application that works with a flight passenger dataset. The application creates the SQL Server database model, transforms the raw CSV into dimensions and facts, loads the transformed data, and exposes a small menu for running analytical queries.

The data model follows a star schema. Passenger, airport, pilot, date, and flight status data are separated into dimension tables, while the flight records are stored in a central fact table. The practice also includes SQL scripts for creating, deleting, and validating the schema.

Main files to look for:

- `main.py`: ETL menu, transformation logic, database loading, and query execution.
- `data/VuelosDataSet.csv`: raw input dataset.
- `sql-script/`: SQL Server scripts for database setup and validation.
- `docker-compose.yml`: local SQL Server container configuration.
- `Documentation/`: supporting documentation and screenshots.

### Practica2 - Coursera Data and Text Analysis

`practica2/` contains a Jupyter Notebook focused on structured and unstructured data analysis. It uses Coursera course metadata from a CSV file and user comments from a text file.

The notebook includes data loading, cleaning, exploration, text preprocessing, tokenization, stopword removal, stemming, lemmatization, part-of-speech tagging, and sentiment analysis with VADER. It is more exploratory than the ETL projects and is meant to show how raw text can be processed into more useful information.

Main files to look for:

- `main.ipynb`: full notebook workflow.
- `Datos.csv`: Coursera course metadata.
- `Coursera Comments.txt`: raw comments used for text processing.
- Assignment PDF: original practice statement.

### proyecto_fase1 - SG Food ETL and Data Warehouse

`proyecto_fase1/` is the largest data warehouse deliverable in the repository. It focuses on SG Food sales and purchases data stored in `.vent` and `.comp` flat files.

The project builds a SQL Server data warehouse named `DW_SGFood` and uses SSIS to load data through different ETL strategies. One flow loads flat files into SQL Server staging tables before transforming them. Another flow uses PostgreSQL as a staging layer and connects to SSIS through ODBC. A third flow loads directly from flat files into the warehouse without an intermediate staging database.

The warehouse separates descriptive data into dimensions for clients, sellers, products, branches, and suppliers. Sales and purchases are loaded into separate fact tables with calculated totals.

Main files to look for:

- `fase1/fase1.sln`: Visual Studio solution for the SSIS project.
- `fase1/Package.dtsx`: main SSIS package.
- `init-db.sql`: SQL Server staging and warehouse setup.
- `pg-init.sql`: PostgreSQL staging setup.
- `Data_conversion.md`: SSIS conversion and default-value rules.
- `SGFood*.vent` and `SGFood*.comp`: sales and purchase source files.
- `docker-compose.yml`: local SQL Server and PostgreSQL services.

### proyecto_fase2 - SG Food SSAS Model

`proyecto_fase2/` contains the Analysis Services portion of the SG Food project. It builds on the warehouse created in `proyecto_fase1` and prepares the structure for multidimensional analysis.

This phase is centered around a Visual Studio SSAS multidimensional project. The goal of this phase is to take the cleaned and modeled warehouse from phase 1 and expose it through an analytical layer that can support cube-style analysis, reporting, and exploration from BI tools.

The SSAS project includes the project definition, the Analysis Services database definition, and a data source file named `DW SG Food.ds`. That data source points the model toward the SQL Server warehouse produced by `proyecto_fase1`, so phase 2 depends on the warehouse being created and populated first.

In practical terms, this folder represents the modeling layer after ETL:

- Phase 1 prepares and loads the relational warehouse.
- Phase 2 connects Analysis Services to that warehouse.
- The SSAS project is opened in Visual Studio, configured against the local SQL Server instance, deployed, and processed from there.

The checked-in files are the source project files for the SSAS model. The actual processed analytical database is generated by deploying and processing the project in an Analysis Services environment.

Main files to look for:

- `ssas/MultidimensionalProject1/MultidimensionalProject1.sln`: SSAS Visual Studio solution.
- `ssas/MultidimensionalProject1/MultidimensionalProject1.dwproj`: SSAS project file.
- `ssas/MultidimensionalProject1/MultidimensionalProject1.database`: Analysis Services database definition.
- `ssas/MultidimensionalProject1/DW SG Food.ds`: data source definition for the warehouse.

Expected workflow:

1. Run the ETL from `proyecto_fase1` and confirm that `DW_SGFood` exists in SQL Server.
2. Open `MultidimensionalProject1.sln` in Visual Studio with Analysis Services project support installed.
3. Update the `DW SG Food.ds` connection if the local SQL Server name or authentication differs.
4. Deploy the project to an SSAS instance.
5. Process the model so Analysis Services reads the warehouse data.

## Technical Themes

- **ETL design:** extraction from files, staging, transformation, deduplication, lookups, and fact/dimension loading.
- **Data warehousing:** surrogate keys, dimensions, fact tables, calculated totals, and analytical query patterns.
- **Microsoft BI stack:** SQL Server, SSIS projects, and SSAS multidimensional projects.
- **Python analytics:** pandas transformations, notebook exploration, and NLTK-based text processing.
- **Containerized databases:** Docker Compose files for local SQL Server and PostgreSQL environments.

## Typical Setup

The setup depends on the folder being used:

- Python projects require a local Python environment with packages such as `pandas`, `pyodbc`, `python-dotenv`, `notebook`, and `nltk`.
- SQL Server is used by `Practica1/` and `proyecto_fase1/`.
- PostgreSQL is used by one of the SG Food staging flows.
- Visual Studio with SSIS support is needed for the ETL package in `proyecto_fase1/`.
- Visual Studio with Analysis Services support is needed for `proyecto_fase2/`.
- Docker Compose files are included for local database services where applicable.

Each subfolder README includes more specific commands and notes.

Some files contain Spanish names or academic assignment material because the original deliverables were submitted in Spanish.
