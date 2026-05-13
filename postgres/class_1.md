Markdown

# 🚀 Laboratorio de Base de Datos: PostgreSQL en Podman (WSL2)

Este repositorio contiene la configuración y los comandos esenciales para la gestión de un entorno de base de datos PostgreSQL utilizando **Podman** sobre **Fedora (WSL2)**.

## 🛠️ Infraestructura y Almacenamiento

### Gestión de Volúmenes
Para evitar errores de permisos con el sistema de archivos NTFS de Windows (`Operation not permitted`), los datos se almacenan en un volumen nativo de WSL.

📊 Operaciones de Base de Datos (SQL)
Definición de Datos (DDL)

Creación de la tabla principal con automatismos de ID y fecha.
```sql
SQL

CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tecnologia TEXT,
    fecha_creacion DATE DEFAULT CURRENT_DATE
);
```
    SERIAL: Crea automáticamente una secuencia para gestionar el autoincremento del ID.
    PRIMARY KEY: Garantiza que el ID sea único y no nulo.
    DEFAULT CURRENT_DATE: Inserta la fecha actual del sistema automáticamente.

Manipulación de Datos (DML)

Inserción de Registros:
```sql
SQL

INSERT INTO proyectos (nombre, tecnologia) 
VALUES ('OSBox', 'Linux Diagnostics'), ('Pacman', 'HTML5/K8s');
```
Actualización de Datos:
```sql
SQL

UPDATE proyectos SET tecnologia = 'Kubernetes' WHERE nombre = 'Pacman';
```
Explicación: Modifica valores existentes filtrando por una condición específica (WHERE).

🔍 Comandos de Inspección (psql)

    \l: Lista todas las bases de datos en el servidor.
    \dt: Lista las tablas del esquema actual (por defecto public).
    \d: Muestra la descripción detallada de las tablas y secuencias.

Consulta de Secuencia:
```sql
SQL

SELECT * FROM proyectos_id_seq;
```
Explicación de log_cnt: Es un contador de optimización (caching) que reduce las escrituras en disco para mejorar el rendimiento del motor.
