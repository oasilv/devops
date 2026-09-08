# 🧜‍♂️ Guía de Uso Básico de Mermaid.js

Mermaid.js te permite generar diagramas y visualizaciones utilizando código y texto plano en sintaxis Markdown.

---

## 🛠️ Estructura General

Para que cualquier plataforma (GitHub, GitLab, VS Code, Azure DevOps) renderice un gráfico de Mermaid, debes envolver el código dentro de un bloque etiquetado con `mermaid`:

```mermaid
[Sintaxis del gráfico]
```

> *para añadir comentarios en mermaid usa el simbolo `%%`*

---

## 1. 🔀 Diagramas de Flujo (Flowchart)

Declara la dirección del diagrama al inicio:
* `TD` / `TB`: Arriba hacia abajo (Top-Down / Top-Bottom)
* `LR`: Izquierda a derecha (Left-Right)
* `RL`: Derecha a izquierda (Right-Left)

### Formas de Nodos y Conectores

```mermaid
flowchart LR
    A[Rectángulo] --> B(Esquinas Redondeadas)
    B --> C{Decisión / Rombo}
    C -- Opción 1 --> D((Círculo))
    C -- Opción 2 --> E[(Base de Datos)]
```

### Ejemplo

```mermaid
flowchart TD
    A[Inicio del Proceso] --> B{¿Validación OK?}
    B -- Sí --> C[Aprobar Solicitud]
    B -- No --> D[Rechazar Solicitud]
    C --> E[(Guardar en Base de Datos)]
```

---

## 2. 🔄 Diagramas de Secuencia (Sequence Diagram)

Ideales para modelar la interacción entre sistemas, microservicios o usuarios a lo largo del tiempo.

```mermaid
sequenceDiagram
    autonumber
    actor U as Usuario
    participant API as API Gateway
    participant DB as Base de Datos

    U->>API: GET /api/v1/recurso
    API->>DB: Consultar registros
    DB-->>API: Resultado (Data)
    API-->>U: Respuesta 200 OK
```

---

## 3. 🗄️ Diagramas Entidad-Relación (ER Diagram)

Para representar modelos de datos relacionales y cardinalidad entre tablas.

```mermaid
erDiagram
    USUARIO ||--o{ PEDIDO : realiza
    PEDIDO ||--|{ DETALLE : contiene

    USUARIO {
        int id PK
        string nombre
        string email
    }
    PEDIDO {
        int id PK
        int usuario_id FK
        date fecha
    }
```

---

## 4. 📐 Diagramas de Clases (Class Diagram)

Para diseño orientado a objetos y representación de clases o módulos de software.

```mermaid
classDiagram
    class Servidor {
        +String ip
        +String hostname
        +iniciar() void
    }
    class WebServer {
        +int puerto
        +desplegarApp()
    }
    Servidor <|-- WebServer
```

---

## 5. 📅 Diagramas de Gantt (Gantt Chart)

Para la planificación visual de cronogramas y tareas de proyectos.

```mermaid
gantt
    title Plan de Mantenimiento de Infraestructura
    dateFormat  YYYY-MM-DD
    section Fase 1: Diagnóstico
    Revisión de Nodos       :a1, 2026-10-01, 5d
    Auditoría de Logs       :a2, after a1, 3d
    section Fase 2: Ejecución
    Despliegue de Cambios   :2026-10-10, 4d
```

---

## 6. 🎨 Personalización de Estilos Básicos

Puedes modificar colores y bordes de nodos específicos usando la propiedad `style`:

```mermaid
graph LR
    A[Nodo Normal] --> B[Nodo de Alerta]

    style B fill:#f96,stroke:#333,stroke-width:2px
```

---

## 7. 🏗️ Subgráficos y Arquitecturas Complejas (Sub-Flowcharts)

Los subgráficos (`subgraph`) permiten agrupar nodos en cajas lógicas. Son fundamentales para representar capas de red, aislamiento de componentes o topologías físicas vs. virtuales (como un clúster *Virtual Tenant* sobre *Bare Metal*).

### 📌 Sintaxis Básica

Para definir un subgráfico usa la palabra clave `subgraph` seguida de un identificador y su título entre comillas. Cierra siempre la estructura con `end`.

```mermaid
flowchart TB
    subgraph BM [" Layer 1: Bare Metal Infrastructure "]
        direction LR
        BM_Node1[Physical Worker 1]
        BM_Node2[Physical Worker 2]
    end

    subgraph Tenant [" Layer 2: Virtualized OpenShift Cluster "]
        direction LR
        MasterVM[Master VM]
        WorkerVM[Worker VM]
    end

    BM_Node1 -->|Hypervisor / KubeVirt| MasterVM
    BM_Node2 -->|Hypervisor / KubeVirt| WorkerVM
```

---

### 📝 Ejemplo Avanzado: Topología Dedicada (Physical vs Tenant)

Representación de almacenamiento en passthrough directo desde discos locales físicos hacia nodos virtuales de almacenamiento ODF:

```mermaid
flowchart TB
    subgraph HostLayer [" 🖥️ Physical Bare Metal Layer "]
        direction LR
        subgraph Node1 ["Physical Node 01"]
            LSO1[Local Storage Operator]
            Disk1[(NVMe / Local Disk)]
        end
        subgraph Node2 ["Physical Node 02"]
            LSO2[Local Storage Operator]
            Disk2[(NVMe / Local Disk)]
        end
    end

    subgraph VirtualLayer [" ☁️ Tenant Cluster (12-VM Topology) "]
        direction LR
        subgraph StorageVMs ["Storage Role"]
            OCS_VM1[Storage VM 1]
            OCS_VM2[Storage VM 2]
        end
        subgraph WorkerVMs ["Worker Role"]
            App_VM1[Worker VM 1]
            App_VM2[Worker VM 2]
        end
    end

    %% Passthrough connections
    Disk1 ==>|Direct Passthrough| OCS_VM1
    Disk2 ==>|Direct Passthrough| OCS_VM2

    %% Ceph replication
    OCS_VM1 <===>|Native Ceph 3x Replication| OCS_VM2
```

---

### 💡 Reglas para Subgráficos
* **Identificadores Únicos:** Cada `subgraph` debe tener un ID interno (ej. `subgraph HostLayer`) y opcionalmente un título visible entre corchetes o comillas.
* **Direccionamiento Interno:** Puedes definir la orientación de un subgráfico específico mediante `direction LR` o `direction TB` sin afectar la dirección global del flujo principal.
* **Conexiones Inter-Subgráficos:** Puedes trazar líneas entre nodos individuales dentro de subgráficos distintos, o conectar directamente el borde de un `subgraph` con otro.
