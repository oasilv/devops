# DevOps Learning Journey 🚀

Este repositorio centraliza todos los recursos, manifiestos y ejercicios de mi entrenamiento en cultura y herramientas DevOps. El objetivo es mantener un historial de aprendizaje organizado y aplicar prácticas de GitOps e Infraestructura como Código (IaC).

## 📂 Estructura del Repositorio

* **/apps**: Código fuente y configuraciones de aplicaciones de práctica.
    * `osbox/`: Herramientas de diagnóstico Linux en contenedores.
    * `pacman/`: Aplicación web del juego Pacman para pruebas de despliegue.
* **/kubernetes**: Manifiestos YAML (Deployments, Services, Ingress).
* **/exercises**: Ejercicios prácticos de CI/CD, automatización y scripting.
* **/docs**: Notas teóricas y diagramas de arquitectura.

devops-learning/
├── apps/
│   ├── osbox/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── configmap.yaml
│   └── pacman/
│       ├── pacman-deployment.yaml
│       └── pacman-service.yaml
├── kubernetes/
│   └── cluster-wide/       # Solo cosas globales (RBAC, Namespaces, Cuotas)
├── README.md
└── .gitignore

## 🛠️ Tecnologías en Foco
* **Git:** Control de versiones y flujo de trabajo colaborativo.
* **Docker:** Creación y optimización de imágenes.
* **Kubernetes/OpenShift:** Orquestación y gestión de cargas de trabajo.
* **CI/CD:** Automatización de despliegues (GitHub Actions, Jenkins, etc.).

## 🚀 Proyectos Destacados

### 1. OSBox
Contenedor especializado en diagnóstico de sistemas Linux. Incluye utilidades de red, monitoreo de procesos y herramientas de depuración.

### 2. Pacman App
Un clásico utilizado para probar estrategias de despliegue (Canary, Blue-Green) y escalado automático dentro del clúster.

---
*Mantenido con fines de aprendizaje y experimentación constante.*
