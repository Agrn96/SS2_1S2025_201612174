# SG Food - SSAS Multidimensional Project

Project phase 2 contains the SQL Server Analysis Services work for the SG Food BI solution. It is intended to sit on top of the `DW_SGFood` warehouse created in `proyecto_fase1`.

## Scope

- Created a Visual Studio SSAS multidimensional project.
- Added the project solution under `ssas/MultidimensionalProject1/`.
- Configured the Analysis Services database definition for the model.
- Included a data source file named `DW SG Food.ds`, indicating the model is based on the SG Food warehouse.

## Technology Used

- SQL Server Analysis Services (SSAS) Multidimensional
- Visual Studio
- SQL Server data warehouse source

## Important Files

| Path | Description |
| --- | --- |
| `ssas/MultidimensionalProject1/MultidimensionalProject1.sln` | Visual Studio solution for the SSAS project. |
| `ssas/MultidimensionalProject1/MultidimensionalProject1.dwproj` | SSAS project file. |
| `ssas/MultidimensionalProject1/MultidimensionalProject1.database` | Analysis Services database definition. |
| `ssas/MultidimensionalProject1/DW SG Food.ds` | Data source definition for the SG Food warehouse. |

## How to Run

1. Build and load the warehouse from `proyecto_fase1`.
2. Open the SSAS solution in Visual Studio with Analysis Services project support installed.
3. Check the data source configuration and point it to the local `DW_SGFood` database if needed.
4. Deploy and process the model from Visual Studio.
