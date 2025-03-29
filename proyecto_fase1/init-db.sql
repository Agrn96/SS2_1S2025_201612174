-- Create Staging Database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SGFood_Staging')
BEGIN
    CREATE DATABASE SGFood_Staging;
END
GO

-- Switch to the staging DB
USE SGFood_Staging;
GO

-- Create Staging Tables for Set 1
CREATE TABLE stg_ventas (
    Fecha NVARCHAR(255),
    CodigoCliente NVARCHAR(255),
    NombreCliente NVARCHAR(255),
    TipoCliente NVARCHAR(255),
    DireccionCliente NVARCHAR(255),
    NumeroCliente NVARCHAR(255),
    CodVendedor NVARCHAR(255),
    NombreVendedor NVARCHAR(255),
    Vacacionista NVARCHAR(255),
    CodProducto NVARCHAR(255),
    NombreProducto NVARCHAR(255),
    MarcaProducto NVARCHAR(255),
    Categoria NVARCHAR(255),
    SodSuSursal NVARCHAR(255),
    NombreSucursal NVARCHAR(255),
    DireccionSucursal NVARCHAR(255),
    Region NVARCHAR(255),
    Departamento NVARCHAR(255),
    Unidades NVARCHAR(255),
    PrecioUnitario NVARCHAR(255)
);
GO

CREATE TABLE stg_compras (
    Fecha NVARCHAR(255),
    CodProveedor NVARCHAR(255),
    NombreProveedor NVARCHAR(255),
    DireccionProveedor NVARCHAR(255),
    NumeroProveedor NVARCHAR(255),
    WebProveedor NVARCHAR(255),
    CodProducto NVARCHAR(255),
    NombreProducto NVARCHAR(255),
    MarcaProducto NVARCHAR(255),
    Categoria NVARCHAR(255),
    SodSuSursal NVARCHAR(255),
    NombreSucursal NVARCHAR(255),
    DireccionSucursal NVARCHAR(255),
    Region NVARCHAR(255),
    Departamento NVARCHAR(255),
    Unidades NVARCHAR(255),
    CostoU NVARCHAR(255)
);
GO

-- Create DW database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DW_SGFood')
BEGIN
    CREATE DATABASE DW_SGFood;
END
GO

USE DW_SGFood;
GO

-- ========================
-- DIMENSIONS
-- ========================

-- Cliente
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dim_cliente') AND type = 'U')
BEGIN
    CREATE TABLE dim_cliente (
        id_cliente INT IDENTITY PRIMARY KEY,
        codigo_cliente NVARCHAR(50),
        nombre_cliente NVARCHAR(255),
        tipo_cliente NVARCHAR(50),
        direccion_cliente NVARCHAR(255),
        numero_cliente NVARCHAR(50)
    );
END
GO

-- Vendedor
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dim_vendedor') AND type = 'U')
BEGIN
    CREATE TABLE dim_vendedor (
        id_vendedor INT IDENTITY PRIMARY KEY,
        cod_vendedor NVARCHAR(50),
        nombre_vendedor NVARCHAR(255),
        vacacionista BIT
    );
END
GO

-- Producto
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dim_producto') AND type = 'U')
BEGIN
    CREATE TABLE dim_producto (
        id_producto INT IDENTITY PRIMARY KEY,
        cod_producto NVARCHAR(50),
        nombre_producto NVARCHAR(255),
        marca_producto NVARCHAR(100),
        categoria NVARCHAR(100)
    );
END
GO

-- Sucursal
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dim_sucursal') AND type = 'U')
BEGIN
    CREATE TABLE dim_sucursal (
        id_sucursal INT IDENTITY PRIMARY KEY,
        sodsucursal NVARCHAR(50),
        nombre_sucursal NVARCHAR(255),
        direccion_sucursal NVARCHAR(255),
        region NVARCHAR(100),
        departamento NVARCHAR(100)
    );
END
GO

-- Proveedor
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dim_proveedor') AND type = 'U')
BEGIN
    CREATE TABLE dim_proveedor (
        id_proveedor INT IDENTITY PRIMARY KEY,
        cod_proveedor NVARCHAR(50),
        nombre_proveedor NVARCHAR(255),
        direccion_proveedor NVARCHAR(255),
        numero_proveedor NVARCHAR(50),
        web_proveedor NVARCHAR(255)
    );
END
GO

-- ========================
-- FACTS
-- ========================
SET QUOTED_IDENTIFIER ON;
GO
-- Fact Ventas
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'fact_ventas') AND type = 'U')
BEGIN
    CREATE TABLE fact_ventas (
        id_fact_venta INT IDENTITY PRIMARY KEY,
        fecha DATE,
        id_cliente INT,
        id_vendedor INT,
        id_producto INT,
        id_sucursal INT,
        unidades INT,
        precio_unitario DECIMAL(10,2),
        total_venta AS (unidades * precio_unitario) PERSISTED
    );
END
GO

-- Fact Compras
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'fact_compras') AND type = 'U')
BEGIN
    CREATE TABLE fact_compras (
        id_fact_compra INT IDENTITY PRIMARY KEY,
        fecha DATE,
        id_proveedor INT,
        id_producto INT,
        id_sucursal INT,
        unidades INT,
        costo_unitario DECIMAL(10,2),
        total_compra AS (unidades * costo_unitario) PERSISTED
    );
END
GO