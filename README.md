
# 🌐 SoftTechnicalRH

### La solución integral para la gestión de Recursos Humanos

SoftTechnicalRH facilita el seguimiento de empleados, evaluaciones, permisos, y mucho más desde una sola plataforma centralizada.

---

## 📋 Descripción

**SoftTechnicalRH** es un sistema de gestión de recursos humanos diseñado para optimizar la administración de datos relacionados con el personal, evaluaciones de desempeño, permisos, proyectos y capacitaciones. Su arquitectura se basa en procedimientos almacenados en **MySQL**, lo que permite realizar consultas y actualizaciones de datos de manera rápida y eficiente.

---

## 🎯 ¿Por qué usar SoftTechnicalRH?

- **🚀 Agiliza la gestión:** Accede y organiza la información de recursos humanos rápidamente.
- **📈 Centraliza los datos:** Mantén toda la información de RRHH en un solo lugar.
- **🔄 Escalable:** Perfecto para empresas en crecimiento, con capacidad de expansión.

---

## 🧩 Procedimientos del Sistema

### Procedimientos almacenados

A continuación, se presenta un listado de procedimientos almacenados para la gestión de recursos humanos en SoftTechnicalRH. Estos procedimientos se clasifican en dos grupos: **procedimientos sin parámetros** y **procedimientos con parámetros**. 

#### Procedimientos sin parámetros
1. **Departamentos**: `CALL SELECT_DEPARTAMENTO_RECORD();`
2. **Puestos**: `CALL SELECT_PUESTO_RECORD();`
3. **Empleados**: `CALL SELECT_EMPLEADO_RECORD();`

#### Procedimientos con parámetros

Para utilizar estos procedimientos, reemplaza el valor de ejemplo con el que corresponda:

1. **Proveedores de Servicios**: `CALL SELECT_PROVEEDORSERVICIOS_RECORD(<ID_PROVEEDOR>);`
2. **Servicios Proveídos**: `CALL SELECT_SERVICIOSPROVEIDOS_RECORD(<ID_SERVICIO>);`
3. **Evaluación de Desempeño**: `CALL SELECT_EVALUACIONDESEMPENO_RECORD(<ID_EVALUACION>);`
4. *(... y más procedimientos según las necesidades de RRHH)*

---

## ⚙️ Instalación y Configuración

1. **Clonar el repositorio:**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   ```

2. **Configurar la base de datos en MySQL**:
   - Conéctate a MySQL.
   - Ejecuta el script de creación de la base de datos y los procedimientos almacenados incluidos en el proyecto.

3. **Ejecución**:
   - Ejecuta los procedimientos según las necesidades de tu gestión de RRHH.

---

## 💡 Notas adicionales

SoftTechnicalRH está diseñado para una fácil expansión. Puedes agregar o modificar procedimientos almacenados con mínimas adaptaciones en la estructura actual, lo que lo hace una solución flexible para las empresas en crecimiento.

---
