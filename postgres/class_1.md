🚀 Laboratorio de Base de Datos: PostgreSQL en Podman (WSL2)

Este repositorio contiene la configuración y los comandos esenciales para la gestión de un entorno de base de datos PostgreSQL utilizando Podman sobre Fedora (WSL2), con almacenamiento persistente en el sistema de archivos nativo y backups hacia el disco físico.
🛠️ Comandos de Infraestructura (Podman)
Gestión del Contenedor

    Acceso a la terminal de la base de datos:
    Bash

    psql -h localhost -p 5432 -U oasilv -d academia_devops

        Explicación: Conexión al motor de base de datos especificando host, puerto, usuario y nombre de la base de datos.

Gestión de Volúmenes y Persistencia

    Creación de volumen gestionado:
    Bash

    podman volume create pg_data_lab

        Explicación: Crea un volumen nativo en el sistema de archivos ext4 de WSL para evitar errores de permisos de NTFS (Operation not permitted) y mejorar el rendimiento de I/O de la base de datos.

📊 Comandos de Base de Datos (SQL)
Definición de Datos (DDL)

    Creación de Tabla con Automatismos:

SQL

    CREATE TABLE proyectos (
        id SERIAL PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        tecnologia TEXT,
        fecha_creacion DATE DEFAULT CURRENT_DATE
    );
    ```
    *   **`SERIAL`**: Crea automáticamente una secuencia (`sequence`) que gestiona el autoincremento del ID (1, 2, 3...).
    *   **`PRIMARY KEY`**: Restricción que garantiza que el ID sea único y no nulo.
    *   **`DEFAULT CURRENT_DATE`**: Función que inserta la fecha actual del sistema si no se especifica una manualmente.

### Manipulación de Datos (DML)
*   **Inserción de Registros**:
    
```sql
    INSERT INTO proyectos (nombre, tecnologia) VALUES ('OSBox', 'Linux Diagnostics');
    ```
    *   **Explicación**: Inserta datos en columnas específicas. El `id` y la `fecha_creacion` se llenan solos gracias a los automatismos definidos arriba.
*   **Actualización de Datos**:
    
```sql
    UPDATE proyectos SET tecnologia = 'Kubernetes' WHERE nombre = 'Pacman';
    ```
    *   **Explicación**: Modifica valores existentes filtrando por una condición específica (`WHERE`).

---

## 🔍 Comandos de Inspección (Meta-comandos de psql)

*   **`\l`**: Lista todas las bases de datos en el servidor, incluyendo el propietario y la codificación (UTF8).
*   **`\dt`**: Lista las tablas del esquema actual (por defecto `public`).
*   **`\d`**: Muestra la descripción detallada de las relaciones, incluyendo las **secuencias** generadas por el tipo `SERIAL`.
*   **`SELECT * FROM proyectos_id_seq;`**: Consulta el estado interno del contador de la tabla.
    *   **`last_value`**: El último número entregado.
    *   **`log_cnt`**: Contador de optimización (caching) que reduce las escrituras en disco para mejorar el rendimiento.

---

## 💾 Estrategia de Respaldo (Backup)

Para asegurar la portabilidad de los datos hacia el disco físico **D:** (NTFS), se utiliza `rsync` desde la ruta nativa de Podman en WSL:

```bash
sudo rsync -av --delete ~/.local/share/containers/storage/volumes/pg_data_lab/_data/ /mnt/d/backups/postgres-data/

    Ventaja: Mantiene una copia exacta y persistente fuera del disco virtual de WSL.

Concepto Clave: El Schema

En PostgreSQL, un Schema es una agrupación lógica dentro de una base de datos (como un "piso" en un edificio). Permite organizar tablas por módulos (ej. auditoria, ventas) y gestionar permisos de forma granular, facilitando arquitecturas multi-tenant en entornos de infraestructura.
