🌐 SoftTechnicalRH
La solución integral para la gestión de Recursos Humanos.
Facilita el seguimiento de empleados, evaluaciones y más desde una sola plataforma.

📋 Descripción
SoftTechnicalRH es un sistema de gestión de recursos humanos diseñado para optimizar la administración de datos relacionados con el personal, evaluaciones de desempeño, permisos, proyectos y capacitaciones. Su estructura se basa en procedimientos almacenados en MySQL para facilitar consultas y actualizaciones eficientes.

🎯 ¿Por qué usar SoftTechnicalRH?
🚀 Agiliza la gestión: Accede y organiza la información de forma rápida y eficiente.
📈 Centraliza los datos: Toda la información de RRHH en un solo lugar.
🔄 Escalable: Perfecto para empresas en crecimiento, con capacidad para expandirse.
🧩 Procedimientos del sistema
📝 Procedimientos sin parámetros
Departamentos: CALL SELECT_DEPARTAMENTO_RECORD();
Puestos: CALL SELECT_PUESTO_RECORD();
Empleados: CALL SELECT_EMPLEADO_RECORD();
📌 Procedimientos con parámetros
Para utilizar estos procedimientos, reemplaza el valor de ejemplo con el que corresponda:

Proveedores de Servicios: CALL SELECT_PROVEEDORSERVICIOS_RECORD(1);
Servicios Proveídos: CALL SELECT_SERVICIOSPROVEIDOS_RECORD(1);
Evaluación de Desempeño: CALL SELECT_EVALUACIONDESEMPENO_RECORD(1);
(... y más procedimientos según las necesidades de RRHH)

⚙️ Instalación y Configuración
📂 Clonar el repositorio:

bash
Copiar código
git clone [URL_DEL_REPOSITORIO]
🔌 Conectar a MySQL y ejecutar el script de creación de base de datos y los procedimientos almacenados.

💾 Ejecutar procedimientos según las necesidades de tu gestión de RRHH.

💡 Notas adicionales
Este sistema está diseñado para una fácil expansión. Agregar o modificar procedimientos es posible con mínimas adaptaciones en la estructura actual.

