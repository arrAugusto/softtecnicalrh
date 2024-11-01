# Agregar la lista de procedimientos al contenido del README para actualizarlo con los procedimientos adicionales.

updated_readme_content = """
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

#### Procedimientos con parámetros

Para utilizar estos procedimientos, reemplaza el valor de ejemplo con el que corresponda:

- `CALL SELECT_PROVEEDORSERVICIOS_RECORD(<ID_PROVEEDOR>);`
- `CALL SELECT_SERVICIOSPROVEIDOS_RECORD(<ID_SERVICIO>);`
- `CALL SELECT_EVALUACIONDESEMPENO_RECORD(<ID_EVALUACION>);`
- `CALL SELECT_PARIENTE_RECORD(<ID_PARIENTE>);`
- `CALL SELECT_ANTICIPO_RECORD(<ID_ANTICIPO>);`
- `CALL SELECT_PERMISO_RECORD(<ID_PERMISO>);`
- `CALL SELECT_SEGUROMEDICO_RECORD(<ID_SEGURO>);`
- `CALL SELECT_RENDICIONCUENTAS_RECORD(<ID_RENDICION>);`
- `CALL SELECT_INCIDENCIAS_RECORD(<ID_INCIDENCIA>);`
- `CALL SELECT_CAPACITACIONES_RECORD(<ID_CAPACITACION>);`
- `CALL SELECT_EVALUACIONCAPACITACIONES_RECORD(<ID_EVALUACION_CAPACITACION>);`
- `CALL SELECT_PROYECTOS_RECORD(<ID_PROYECTO>);`
- `CALL SELECT_ASIGNACIONESPROYECTO_RECORD(<ID_ASIGNACION>);`
- `CALL SELECT_EVALUACIONESPROYECTOS_RECORD(<ID_EVALUACION_PROYECTO>);`
- `CALL SELECT_DEPENDIENTES_RECORD(<ID_DEPENDIENTE>);`
- `CALL SELECT_PLANCARRERA_RECORD(<ID_PLAN>);`
- `CALL SELECT_DOCUMENTOS_RECORD(<ID_DOCUMENTO>);`
- `CALL SELECT_NOMINA_RECORD(<ID_NOMINA>);`
- `CALL SELECT_BONIFICACION_RECORD(<ID_BONIFICACION>);`
- `CALL SELECT_DESCUENTO_RECORD(<ID_DESCUENTO>);`
- `CALL SELECT_VACACIONES_RECORD(<ID_VACACIONES>);`
- `CALL SELECT_HORARIOS_RECORD(<ID_HORARIO>);`
- `CALL SELECT_ASISTENCIA_RECORD(<ID_ASISTENCIA>);`
- `CALL SELECT_COMISIONES_RECORD(<ID_COMISION>);`
- `CALL SELECT_ANTIGUEDAD_RECORD(<ID_ANTIGUEDAD>);`
- `CALL SELECT_HISTORIALSALARIOS_RECORD(<ID_HISTORIAL>);`
- `CALL SELECT_ESTADOPATRIMONIAL_RECORD(<ID_ESTADO>);`

---

## ⚙️ Instalación y Configuración

1. **Clonar el repositorio:**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
