
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
- `CALL SELECT_DEPARTAMENTO_RECORD();`
- `CALL SELECT_PUESTO_RECORD();`
- `CALL SELECT_EMPLEADO_RECORD();`

#### Procedimientos con parámetros (reemplaza el valor según corresponda)

- `CALL SELECT_PROVEEDORSERVICIOS_RECORD(1);`
- `CALL SELECT_SERVICIOSPROVEIDOS_RECORD(1);`
- `CALL SELECT_EVALUACIONDESEMPENO_RECORD(1);`
- `CALL SELECT_PARIENTE_RECORD(1);`
- `CALL SELECT_ANTICIPO_RECORD(1);`
- `CALL SELECT_PERMISO_RECORD(1);`
- `CALL SELECT_SEGUROMEDICO_RECORD(1);`
- `CALL SELECT_RENDICIONCUENTAS_RECORD(1);`
- `CALL SELECT_INCIDENCIAS_RECORD(1);`
- `CALL SELECT_CAPACITACIONES_RECORD(1);`
- `CALL SELECT_EVALUACIONCAPACITACIONES_RECORD(1);`
- `CALL SELECT_PROYECTOS_RECORD(1);`
- `CALL SELECT_ASIGNACIONESPROYECTO_RECORD(1);`
- `CALL SELECT_EVALUACIONESPROYECTOS_RECORD(1);`
- `CALL SELECT_DEPENDIENTES_RECORD(1);`
- `CALL SELECT_PLANCARRERA_RECORD(1);`
- `CALL SELECT_DOCUMENTOS_RECORD(1);`
- `CALL SELECT_NOMINA_RECORD(1);`
- `CALL SELECT_BONIFICACION_RECORD(1);`
- `CALL SELECT_DESCUENTO_RECORD(1);`
- `CALL SELECT_VACACIONES_RECORD(1);`
- `CALL SELECT_HORARIOS_RECORD(1);`
- `CALL SELECT_ASISTENCIA_RECORD(1);`
- `CALL SELECT_COMISIONES_RECORD(1);`
- `CALL SELECT_ANTIGUEDAD_RECORD(1);`
- `CALL SELECT_HISTORIALSALARIOS_RECORD(1);`
- `CALL SELECT_ESTADOPATRIMONIAL_RECORD(1);`

---

## ⚙️ Instalación y Configuración

1. **Clonar el repositorio:**
   ```bash
   git clone [[URL_DEL_REPOSITORIO]](https://github.com/arrAugusto/softtecnicalrh.git -b main
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
