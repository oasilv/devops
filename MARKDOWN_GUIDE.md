Markdown# 📝 Guía Rápida de Markdown para IT

Esta guía contiene los ejemplos de formato más utilizados para documentar laboratorios de infraestructura y código.

## 1. Títulos (Jerarquía)
Se usan almohadillas `#` seguidas de un espacio.
# Título Nivel 1 (Nombre del Proyecto)
## Título Nivel 2 (Secciones principales)
### Título Nivel 3 (Subsecciones o tareas)

---

## 2. Formato de Texto
*   **Negrita**: `**Texto**` para resaltar términos técnicos.
*   *Cursiva*: `*Texto*` para énfasis.
*   ~~Tachado~~: `~~Texto~~` para correcciones o pasos obsoletos.
*   `Código en línea`: Usar la tilde invertida (\`) para comandos cortos o nombres de variables dentro de un párrafo.

---

## 3. Bloques de Código
Para bloques grandes, usa tres comillas invertidas y el nombre del lenguaje para activar el resaltado de sintaxis (Syntax Highlighting).

### SQL
```sql
SELECT * FROM proyectos WHERE tecnologia = 'Kubernetes';
```

### BASH
```bash
ShellBashpodman ps -a
```

---

## 4. Tablas y Alineación
La segunda fila define la estructura y la alineación de las celdas.

| Comando | Función | Estado
|:---|:---|:---
psql | Cliente SQL | OK
podman | Contenedores | OK
rsync | Backup | Pendiente

    :--- Izquierda (Default)

    :---: Centrado

    ---: Derecha

---

## 5. Listas y Checklists
Son ideales para el seguimiento de tus tareas de infraestructura, como el despliegue en **OpenShift** o tus rutinas de **baloncesto**.

**Lista de tareas (Checklist):**
- [x] Levantar Pod de Postgres en Fedora.
- [x] Configurar volumen `pg_data_lab` en WSL.
- [ ] Implementar script de backup con `rsync` hacia el disco D.

**Lista con viñetas (Unordered list):**
*   Red Hat Enterprise Linux.
*   Fedora.
*   OpenShift Container Platform.

---

## 6. Otros Elementos Útiles
Estos detalles le dan el toque final de profesionalismo a tu documentación técnica.

*   **Citas y Notas**: Se usan para resaltar advertencias o consejos importantes.
    > **Nota técnica**: En Postgres, el tipo `SERIAL` crea automáticamente una secuencia que puedes ver con el comando `\d`.

*   **Líneas Divisoras**: Usa tres guiones `---` en una línea sola para separar secciones temáticas (como separar comandos de SQL de comandos de Bash).

*   **Enlaces**: 
    `[Texto del enlace](URL)`
    Ejemplo: [Documentación de PostgreSQL](https://www.postgresql.org/docs/)

*   **Imágenes**: 
    `![Descripción](Ruta_de_la_imagen)`
    Ejemplo: `![Diagrama de Red](./img/infraestructura.png)`
