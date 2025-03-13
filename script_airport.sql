CREATE DATABASE IF NOT EXISTS airport_db;
USE airport_db;

-- Tabla de Tipos de Documentos
CREATE TABLE IF NOT EXISTS airport_documenttypes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL
);

-- Tabla de Fabricantes
CREATE TABLE IF NOT EXISTS airport_manufacturers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL
);

-- Tabla de Estados de Aviones
CREATE TABLE IF NOT EXISTS airport_statuses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL
);

-- Tabla de Países
CREATE TABLE IF NOT EXISTS airport_countries (
    id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

-- Tabla de Vuelos
CREATE TABLE IF NOT EXISTS airport_trips (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trip_date DATE NOT NULL,
    price_tripe DOUBLE NOT NULL
);

-- Tabla de Aerolíneas
CREATE TABLE IF NOT EXISTS airport_airlines (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL
);

-- Tabla de Roles de Tripulación
CREATE TABLE IF NOT EXISTS airport_tripulationroles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL
);

-- Tabla de Modelos de Aviones
CREATE TABLE IF NOT EXISTS airport_models (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    manufacturerid INT NOT NULL,
    FOREIGN KEY (manufacturerid) REFERENCES airport_manufacturers(id)
);

-- Tabla de Aviones
CREATE TABLE IF NOT EXISTS airport_planes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plates VARCHAR(30) NOT NULL,
    capacity INT NOT NULL,
    fabrication_date DATE NOT NULL,
    id_status INT NOT NULL,
    id_model INT NOT NULL,
    FOREIGN KEY (id_status) REFERENCES airport_statuses(id),
    FOREIGN KEY (id_model) REFERENCES airport_models(id)
);

-- Tabla de Ciudades
CREATE TABLE IF NOT EXISTS airport_cities (
    id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    idcountry VARCHAR(5) NOT NULL,
    FOREIGN KEY (idcountry) REFERENCES airport_countries(id)
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS airport_customers (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    iddocument INT,
    FOREIGN KEY (iddocument) REFERENCES airport_documenttypes(id)
);

-- Tabla de Aeropuertos
CREATE TABLE IF NOT EXISTS airport_airports (
    id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    idcity VARCHAR(5) NOT NULL,
    FOREIGN KEY (idcity) REFERENCES airport_cities(id)
);

-- Tabla de Empleados
CREATE TABLE IF NOT EXISTS airport_employees (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    idrol INT NOT NULL,
    ingressedate DATE NOT NULL,
    idairline INT,
    idairport VARCHAR(5),
    FOREIGN KEY (idairline) REFERENCES airport_airlines(id),
    FOREIGN KEY (idairport) REFERENCES airport_airports(id)
);

-- Tabla de Revisiones
CREATE TABLE IF NOT EXISTS airport_revisions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    revision_date DATE NOT NULL,
    id_plane INT NOT NULL,
    FOREIGN KEY (id_plane) REFERENCES airport_planes(id)
);

-- Tabla de Detalles de Revisión
CREATE TABLE IF NOT EXISTS airport_revision_details (
    id VARCHAR(20) PRIMARY KEY,
    description TEXT NOT NULL,
    id_employee VARCHAR(20) NOT NULL,
    id_revision INT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES airport_employees(id),
    FOREIGN KEY (id_revision) REFERENCES airport_revisions(id)
);

-- Tabla de Conexiones de Vuelo
CREATE TABLE IF NOT EXISTS airport_flight_connections (
    id INT PRIMARY KEY AUTO_INCREMENT,
    connection_number VARCHAR(20) NOT NULL,
    id_trip INT NOT NULL,
    id_plane INT NOT NULL,
    id_airport VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_trip) REFERENCES airport_trips(id),
    FOREIGN KEY (id_plane) REFERENCES airport_planes(id),
    FOREIGN KEY (id_airport) REFERENCES airport_airports(id)
);

-- Tabla de Puertas de Embarque
CREATE TABLE IF NOT EXISTS airport_gates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gatenumber VARCHAR(10) NOT NULL,
    idairport VARCHAR(5) NOT NULL,
    FOREIGN KEY (idairport) REFERENCES airport_airports(id)
);

-- Tabla de Reservaciones de Viaje
CREATE TABLE IF NOT EXISTS airport_tripbooking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    idtrips INT NOT NULL,
    FOREIGN KEY (idtrips) REFERENCES airport_trips(id)
);

-- Tabla de Tarifas de Vuelo
CREATE TABLE IF NOT EXISTS airport_flightfares (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(200) NOT NULL,
    details TEXT NOT NULL,
    value DOUBLE(7,3) NOT NULL
);

-- Tabla de Detalles de Reservación
CREATE TABLE IF NOT EXISTS airport_tripbookingdetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idtripbooking INT NOT NULL,
    idcustomers VARCHAR(20) NOT NULL,
    idfares INT NOT NULL,
    FOREIGN KEY (idtripbooking) REFERENCES airport_tripbooking(id),
    FOREIGN KEY (idcustomers) REFERENCES airport_customers(id),
    FOREIGN KEY (idfares) REFERENCES airport_flightfares(id)
);

-- Tabla de Empleados en Revisiones
CREATE TABLE IF NOT EXISTS airport_revemployee (
    idemployee VARCHAR(20) NOT NULL,
    idrevision INT NOT NULL,
    PRIMARY KEY (idemployee, idrevision),
    FOREIGN KEY (idemployee) REFERENCES airport_employees(id),
    FOREIGN KEY (idrevision) REFERENCES airport_revisions(id)
);

-- Tabla de Tripulación de Vuelo
CREATE TABLE IF NOT EXISTS airport_tripcrews (
    idemployees VARCHAR(20) NOT NULL,
    idconection INT NOT NULL,
    PRIMARY KEY (idemployees, idconection),
    FOREIGN KEY (idemployees) REFERENCES airport_employees(id),
    FOREIGN KEY (idconection) REFERENCES airport_flight_connections(id)
);

/*Reporte de Estado de Aviones:
Obtener información que relacione los datos de la tabla de aviones con sus modelos, fabricantes y estados, para conocer el estado actual y características de cada aeronave.*/

select p.id, p.plates, models.name, manu.name, status.name
from airport_planes as p
inner join airport_models as models on p.id_model = models.id
inner join airport_manufacturers as manu on models.manufacturerid = manu.id
inner join airport_statuses as status on p.id_status = status.id;

select p.id, p.plates, models.name, manu.name, status.name
from airport_planes as p, airport_models as models, airport_manufacturers as manu, airport_statuses as status
where p.id_model = models.id
and models.manufacturerid = manu.id
and p.id_status = status.id;

/*Historial de Revisiones de Mantenimiento:
Consultar las revisiones realizadas a un avión específico, mostrando la fecha, descripción de la revisión y el empleado responsable, lo que permite hacer seguimiento al mantenimiento.*/

select rev.id, rev.id_plane, plane.plates, rev.revision_date, rev_det.description, emplo.id as id_employee, emplo.name as name_employee
from airport_revisions as rev
inner join airport_planes as plane on rev.id_plane = plane.id
inner join airport_revision_details as rev_det on rev.id = rev_det.id_revision
inner join airport_employees as emplo on rev_det.id_employee = emplo.id
where plane.id = 1
order by rev.revision_date desc;

select rev.id, rev.id_plane, plane.plates, rev.revision_date, rev_det.description, emplo.id as id_employee, emplo.name as name_employee
from airport_revisions as rev, airport_planes as plane, airport_revision_details as rev_det, airport_employees as emplo
where rev.id_plane = plane.id and rev.id = rev_det.id_revision and rev_det.id_employee = emplo.id and plane.id = 1
order by rev.revision_date desc;

/*Asignación de Tripulación a Trayectos:
Consultar qué empleados han sido asignados a cada trayecto (o conexión de vuelo), relacionando la tabla de asignación de tripulación con los detalles de empleados y vuelos, de forma que se pueda validar y optimizar la gestión de la tripulación.*/

select emplo.id as id_employee, emplo.name as name_employee, fcon.connection_number as number_connection, trip.trip_date as date_flight, airp.name as name_airport
from airport_tripcrews as tcrew
inner join airport_employees as emplo on tcrew.idemployees = emplo.id
inner join airport_flight_connections as fcon on tcrew.idconection = fcon.id
inner join airport_trips as trip on fcon.id_trip = trip.id
inner join airport_airports as airp on fcon.id_airport = airp.id
order by trip.trip_date;

select emplo.id as id_employee, emplo.name as name_employee, fcon.connection_number as number_connection, trip.trip_date as date_flight, airp.name as name_airport
from airport_tripcrews as tcrew, airport_employees as emplo, airport_flight_connections as fcon, airport_trips as trip, airport_airports as airp
where tcrew.idemployees = emplo.id and tcrew.idconection = fcon.id and fcon.id_trip = trip.id and fcon.id_airport = airp.id
order by trip.trip_date;

/*Detalles de Reservas de Vuelo:
Obtener información detallada de las reservas, incluyendo datos del cliente, trayecto, tarifa y fecha, lo que facilita el análisis de la ocupación y el comportamiento de las reservas.*/

select cus.id as id_customer, cus.name as name_customer, cus.age as age_customer, ffares.description, t.price_tripe as price_trip, t.trip_date as trip_date
from airport_tripbookingdetails as tdetail
inner join airport_customers as cus on tdetail.idcustomers = cus.id
inner join airport_flightfares as ffares on tdetail.idfares = ffares.id
inner join airport_tripbooking as tb on tdetail.idtripbooking = tb.id
inner join airport_trips as t on tb.idtrips=t.id;

select cus.id as id_customer, cus.name as name_customer, cus.age as age_customer, ffares.description, t.price_tripe as price_trip, t.trip_date as trip_date
from airport_tripbookingdetails as tdetail, airport_customers as cus, airport_flightfares as ffares, airport_tripbooking as tb, airport_trips as t
where tdetail.idcustomers = cus.id and tdetail.idfares = ffares.id and tdetail.idtripbooking = tb.id and tb.idtrips=t.id;

/*Búsqueda de Vuelos Disponibles:
Realizar consultas que permitan filtrar vuelos disponibles según criterios como ciudad de origen, ciudad de destino y fecha (salida y, en su caso, regreso), lo cual es esencial para la experiencia del cliente.*/

-- Búsqueda de Vuelos Disponibles (INNER JOIN)
SELECT DISTINCT 
    t.id AS trip_id, 
    t.trip_date, 
    t.price_tripe,
    orig_airp.name AS origin_airport, 
    orig_city.name AS origin_city,
    dest_airp.name AS destination_airport, 
    dest_city.name AS destination_city
FROM airport_trips t
INNER JOIN airport_flight_connections orig ON t.id = orig.id_trip
INNER JOIN airport_airports orig_airp ON orig.id_airport = orig_airp.id
INNER JOIN airport_cities orig_city ON orig_airp.idcity = orig_city.id
INNER JOIN airport_flight_connections dest ON t.id = dest.id_trip
INNER JOIN airport_airports dest_airp ON dest.id_airport = dest_airp.id
INNER JOIN airport_cities dest_city ON dest_airp.idcity = dest_city.id
WHERE orig_city.id = 'ORIG_CITY_ID'     -- Reemplazar por el ID de la ciudad de origen
  AND dest_city.id = 'DEST_CITY_ID'       -- Reemplazar por el ID de la ciudad destino
  AND t.trip_date = 'YYYY-MM-DD';         -- Reemplazar por la fecha de salida deseada

-- Búsqueda de Vuelos Disponibles (WHERE)
SELECT DISTINCT 
    t.id AS trip_id, 
    t.trip_date, 
    t.price_tripe,
    orig_airp.name AS origin_airport, 
    orig_city.name AS origin_city,
    dest_airp.name AS destination_airport, 
    dest_city.name AS destination_city
FROM airport_trips t, 
     airport_flight_connections orig, 
     airport_airports orig_airp, 
     airport_cities orig_city,
     airport_flight_connections dest, 
     airport_airports dest_airp, 
     airport_cities dest_city
WHERE t.id = orig.id_trip 
  AND orig.id_airport = orig_airp.id 
  AND orig_airp.idcity = orig_city.id 
  AND t.id = dest.id_trip 
  AND dest.id_airport = dest_airp.id 
  AND dest_airp.idcity = dest_city.id 
  AND orig_city.id = 'ORIG_CITY_ID'     -- Reemplazar por el ID de la ciudad de origen
  AND dest_city.id = 'DEST_CITY_ID'       -- Reemplazar por el ID de la ciudad destino
  AND t.trip_date = 'YYYY-MM-DD';         -- Reemplazar por la fecha de salida deseada

/*Consultas de Información General:
Además, se deben desarrollar consultas para mostrar información de clientes (incluyendo el tipo de documento), aeropuertos, tarifas de vuelo y otros datos maestros que soporten la operación de la aplicación.*/

-- Información de Clientes con Tipo de Documento (INNER JOIN)
SELECT 
    c.id AS customer_id, 
    c.name AS customer_name, 
    c.age, 
    dt.name AS document_type
FROM airport_customers c
INNER JOIN airport_documenttypes dt ON c.iddocument = dt.id;

-- Información de Clientes con Tipo de Documento (WHERE)
SELECT 
    c.id AS customer_id, 
    c.name AS customer_name, 
    c.age, 
    dt.name AS document_type
FROM airport_customers c, airport_documenttypes dt
WHERE c.iddocument = dt.id;

-- Información de Aeropuertos con Ciudad y País (INNER JOIN)
SELECT 
    a.id AS airport_id,
    a.name AS airport_name,
    ci.name AS city_name,
    co.name AS country_name
FROM airport_airports a
INNER JOIN airport_cities ci ON a.idcity = ci.id
INNER JOIN airport_countries co ON ci.idcountry = co.id;

-- Información de Aeropuertos con Ciudad y País (WHERE)
SELECT 
    a.id AS airport_id,
    a.name AS airport_name,
    ci.name AS city_name,
    co.name AS country_name
FROM airport_airports a, airport_cities ci, airport_countries co
WHERE a.idcity = ci.id 
  AND ci.idcountry = co.id;

-- Información de Tarifas de Vuelo
SELECT id AS fare_id, description, details, value
FROM airport_flightfares;