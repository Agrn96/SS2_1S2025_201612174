# stg_ventas

| Column              | Target Use         | SSIS Expression                                                                 | SSIS Data Type       |
|---------------------|--------------------|----------------------------------------------------------------------------------|----------------------|
| Fecha               | Fact Table         | ISNULL([Fecha]) || TRIM([Fecha]) == "" ? (DT_DATE)"2000-01-01" : (DT_DATE)[Fecha] | DT_DATE              |
| CodigoCliente       | dim_cliente        | ISNULL([CodigoCliente]) || TRIM([CodigoCliente]) == "" ? "UNKNOWN" : [CodigoCliente] | DT_WSTR              |
| NombreCliente       | dim_cliente        | ISNULL([NombreCliente]) || TRIM([NombreCliente]) == "" ? "NO_NAME" : [NombreCliente] | DT_WSTR              |
| TipoCliente         | dim_cliente        | ISNULL([TipoCliente]) || TRIM([TipoCliente]) == "" ? "OTRO" : [TipoCliente]     | DT_WSTR              |
| DireccionCliente    | dim_cliente        | ISNULL([DireccionCliente]) || TRIM([DireccionCliente]) == "" ? "NO_DIR" : [DireccionCliente] | DT_WSTR              |
| NumeroCliente       | dim_cliente        | ISNULL([NumeroCliente]) || TRIM([NumeroCliente]) == "" ? "0000" : [NumeroCliente] | DT_WSTR              |
| CodVendedor         | dim_vendedor       | ISNULL([CodVendedor]) || TRIM([CodVendedor]) == "" ? "DESCONOCIDO" : [CodVendedor] | DT_WSTR              |
| NombreVendedor      | dim_vendedor       | ISNULL([NombreVendedor]) || TRIM([NombreVendedor]) == "" ? "NO_VENDEDOR" : [NombreVendedor] | DT_WSTR              |
| Vacacionista        | dim_vendedor       | [Vacacionista] == "SI" ? TRUE : FALSE                                           | DT_BOOL              |
| CodProducto         | dim_producto       | ISNULL([CodProducto]) || TRIM([CodProducto]) == "" ? "NOPROD" : [CodProducto]   | DT_WSTR              |
| NombreProducto      | dim_producto       | ISNULL([NombreProducto]) || TRIM([NombreProducto]) == "" ? "GENÉRICO" : [NombreProducto] | DT_WSTR              |
| MarcaProducto       | dim_producto       | ISNULL([MarcaProducto]) || TRIM([MarcaProducto]) == "" ? "SIN_MARCA" : [MarcaProducto] | DT_WSTR              |
| Categoria           | dim_producto       | ISNULL([Categoria]) || TRIM([Categoria]) == "" ? "OTROS" : [Categoria]          | DT_WSTR              |
| SodSuSursal         | dim_sucursal       | ISNULL([SodSuSursal]) || TRIM([SodSuSursal]) == "" ? "XXX" : [SodSuSursal]      | DT_WSTR              |
| NombreSucursal      | dim_sucursal       | ISNULL([NombreSucursal]) || TRIM([NombreSucursal]) == "" ? "NO_SUCURSAL" : [NombreSucursal] | DT_WSTR              |
| DireccionSucursal   | dim_sucursal       | ISNULL([DireccionSucursal]) || TRIM([DireccionSucursal]) == "" ? "NO_DIR" : [DireccionSucursal] | DT_WSTR              |
| Region              | dim_sucursal       | ISNULL([Region]) || TRIM([Region]) == "" ? "SIN_REGION" : [Region]              | DT_WSTR              |
| Departamento        | dim_sucursal       | ISNULL([Departamento]) || TRIM([Departamento]) == "" ? "SIN_DEPTO" : [Departamento] | DT_WSTR              |
| Unidades            | Fact Table         | ISNULL([Unidades]) || TRIM([Unidades]) == "" ? 0 : (DT_I4)[Unidades]            | DT_I4                |
| PrecioUnitario      | Fact Table         | ISNULL([PrecioUnitario]) || TRIM([PrecioUnitario]) == "" ? (DT_NUMERIC,10,2)0.00 : (DT_NUMERIC,10,2)[PrecioUnitario] | DT_NUMERIC(10,2)     |




# stg_compras


| Column              | Target Use         | SSIS Expression                                                                 | SSIS Data Type       |
|---------------------|--------------------|----------------------------------------------------------------------------------|----------------------|
| Fecha               | Fact Table         | ISNULL([Fecha]) || TRIM([Fecha]) == "" ? (DT_DATE)"2000-01-01" : (DT_DATE)[Fecha] | DT_DATE              |
| CodProveedor        | dim_proveedor      | ISNULL([CodProveedor]) || TRIM([CodProveedor]) == "" ? "UNKNOWN" : [CodProveedor] | DT_WSTR              |
| NombreProveedor     | dim_proveedor      | ISNULL([NombreProveedor]) || TRIM([NombreProveedor]) == "" ? "NO_NAME" : [NombreProveedor] | DT_WSTR              |
| DireccionProveedor  | dim_proveedor      | ISNULL([DireccionProveedor]) || TRIM([DireccionProveedor]) == "" ? "NO_DIR" : [DireccionProveedor] | DT_WSTR              |
| NumeroProveedor     | dim_proveedor      | ISNULL([NumeroProveedor]) || TRIM([NumeroProveedor]) == "" ? "0000" : [NumeroProveedor] | DT_WSTR              |
| WebProveedor        | dim_proveedor      | ISNULL([WebProveedor]) || TRIM([WebProveedor]) == "" ? "NO_WEB" : [WebProveedor] | DT_WSTR              |
| CodProducto         | dim_producto       | ISNULL([CodProducto]) || TRIM([CodProducto]) == "" ? "NOPROD" : [CodProducto]   | DT_WSTR              |
| NombreProducto      | dim_producto       | ISNULL([NombreProducto]) || TRIM([NombreProducto]) == "" ? "GENÉRICO" : [NombreProducto] | DT_WSTR              |
| MarcaProducto       | dim_producto       | ISNULL([MarcaProducto]) || TRIM([MarcaProducto]) == "" ? "SIN_MARCA" : [MarcaProducto] | DT_WSTR              |
| Categoria           | dim_producto       | ISNULL([Categoria]) || TRIM([Categoria]) == "" ? "OTROS" : [Categoria]          | DT_WSTR              |
| SodSuSursal         | dim_sucursal       | ISNULL([SodSuSursal]) || TRIM([SodSuSursal]) == "" ? "XXX" : [SodSuSursal]      | DT_WSTR              |
| NombreSucursal      | dim_sucursal       | ISNULL([NombreSucursal]) || TRIM([NombreSucursal]) == "" ? "NO_SUCURSAL" : [NombreSucursal] | DT_WSTR              |
| DireccionSucursal   | dim_sucursal       | ISNULL([DireccionSucursal]) || TRIM([DireccionSucursal]) == "" ? "NO_DIR" : [DireccionSucursal] | DT_WSTR              |
| Region              | dim_sucursal       | ISNULL([Region]) || TRIM([Region]) == "" ? "SIN_REGION" : [Region]              | DT_WSTR              |
| Departamento        | dim_sucursal       | ISNULL([Departamento]) || TRIM([Departamento]) == "" ? "SIN_DEPTO" : [Departamento] | DT_WSTR              |
| Unidades            | Fact Table         | ISNULL([Unidades]) || TRIM([Unidades]) == "" ? 0 : (DT_I4)[Unidades]            | DT_I4                |
| CostoU              | Fact Table         | ISNULL([CostoU]) || TRIM([CostoU]) == "" ? (DT_NUMERIC,10,2)0.00 : (DT_NUMERIC,10,2)[CostoU] | DT_NUMERIC(10,2)     |
