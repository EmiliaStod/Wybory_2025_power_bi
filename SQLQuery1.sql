CREATE DATABASE Wybory2025;
GO
USE Wybory2025;

-- Tabela granic (dla wszystkich poziomów – woj/pow/gm)
CREATE TABLE DimGeo (
    GeoPK     int PRIMARY KEY,          -- np. 02 = mazowieckie
    GeoLevel  char(1) NOT NULL,         -- 'W', 'P', 'G'
    Name      nvarchar(128) NOT NULL,
    Shape     geometry NOT NULL
);

-- Indeks przestrzenny
CREATE SPATIAL INDEX IX_DimGeo_Shape ON DimGeo(Shape)
USING GEOMETRY_AUTO_GRID
WITH (BOUNDING_BOX = (-260000,-200000,850000,950000)); -- granice PL
