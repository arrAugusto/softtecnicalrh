-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS softTecnicalRH;

-- Crear la base de datos
CREATE DATABASE softTecnicalRH;
USE softTecnicalRH;

-- Crear tablas en el orden correcto para evitar errores de clave foránea

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla Puesto
CREATE TABLE Puesto (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_puesto VARCHAR(50) NOT NULL,
    nivel_puesto TINYINT NOT NULL
);

-- Tabla Proveedor de Servicios
CREATE TABLE ProveedorServicios (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla Servicios Proveídos
CREATE TABLE ServiciosProveidos (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_proveedor) REFERENCES ProveedorServicios(id_proveedor)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    codigo_empleado VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    fecha_contratacion DATE,
    id_puesto INT,
    id_departamento INT,
    sueldo_base DECIMAL(10, 2) NOT NULL,
    bonificacion_base DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Tabla Nómina
CREATE TABLE Nomina (
    id_nomina INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_nomina DATE NOT NULL,
    sueldo_bruto DECIMAL(10, 2) NOT NULL,
    ISR DECIMAL(10, 2) DEFAULT 0,
    IGSS DECIMAL(10, 2) DEFAULT 0,
    sueldo_neto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Evaluación de Desempeño
CREATE TABLE EvaluacionDesempeno (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha DATE NOT NULL,
    puntuacion DECIMAL(5, 2) NOT NULL,
    comentarios TEXT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Pariente
CREATE TABLE Pariente (
    id_pariente INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre VARCHAR(50) NOT NULL,
    relacion VARCHAR(20) NOT NULL,
    telefono VARCHAR(15),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Bonificación
CREATE TABLE Bonificacion (
    id_bonificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Descuento
CREATE TABLE Descuento (
    id_descuento INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    tipo_descuento VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_aplicacion DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Anticipo
CREATE TABLE Anticipo (
    id_anticipo INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_anticipo DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Permiso
CREATE TABLE Permiso (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    tipo_permiso VARCHAR(20) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Vacaciones
CREATE TABLE Vacaciones (
    id_vacaciones INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Seguro Medico
CREATE TABLE SeguroMedico (
    id_seguro INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    tipo_seguro VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Rendición de Cuentas
CREATE TABLE RendicionCuentas (
    id_rendicion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    descripcion TEXT NOT NULL,
    fecha_rendicion DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Incidencias (Llamadas de Atención)
CREATE TABLE Incidencias (
    id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    motivo TEXT NOT NULL,
    fecha_incidencia DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Capacitaciones
CREATE TABLE Capacitaciones (
    id_capacitacion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre_capacitacion VARCHAR(100) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Evaluación de Capacitaciones
CREATE TABLE EvaluacionCapacitaciones (
    id_evaluacion_capacitacion INT AUTO_INCREMENT PRIMARY KEY,
    id_capacitacion INT,
    puntuacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (id_capacitacion) REFERENCES Capacitaciones(id_capacitacion)
);

-- Tabla Proyectos
CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre_proyecto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Asignaciones de Proyecto
CREATE TABLE AsignacionesProyecto (
    id_asignacion_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    id_proyecto INT,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

-- Tabla Evaluaciones de Proyectos
CREATE TABLE EvaluacionesProyectos (
    id_evaluacion_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto INT,
    puntuacion DECIMAL(5, 2),
    comentarios TEXT,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

-- Tabla Horarios
CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    dia_semana VARCHAR(15) NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Asistencia
CREATE TABLE Asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_asistencia DATE NOT NULL,
    estado_asistencia ENUM('Presente', 'Ausente') NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Comisiones
CREATE TABLE Comisiones (
    id_comision INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Dependientes
CREATE TABLE Dependientes (
    id_dependiente INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre VARCHAR(100) NOT NULL,
    relacion VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Plan de Carrera
CREATE TABLE PlanCarrera (
    id_plan_carrera INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    nombre_plan VARCHAR(100) NOT NULL,
    fecha_inicio DATE,
    objetivos TEXT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Antigüedad
CREATE TABLE Antiguedad (
    id_antiguedad INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    años_servicio INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Historial Salarios
CREATE TABLE HistorialSalarios (
    id_historial_salario INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_cambio DATE NOT NULL,
    sueldo_anterior DECIMAL(10, 2),
    sueldo_nuevo DECIMAL(10, 2),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Estado Patrimonial
CREATE TABLE EstadoPatrimonial (
    id_estado_patrimonial INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    patrimonio_inicial DECIMAL(15, 2),
    patrimonio_final DECIMAL(15, 2),
    fecha_reporte DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla Documentos
CREATE TABLE Documentos (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    tipo_documento VARCHAR(50) NOT NULL,
    fecha_emision DATE,
    fecha_expiracion DATE,
    id_servicio INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_servicio) REFERENCES ServiciosProveidos(id_servicio)
);



-- Eliminar procedimientos si ya existen
DROP PROCEDURE IF EXISTS INSERT_DEPARTAMENTO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PUESTO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PROVEEDORSERVICIOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_SERVICIOSPROVEIDOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_EMPLEADO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_NOMINA_RECORD;
DROP PROCEDURE IF EXISTS INSERT_EVALUACIONDESEMPENO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PARIENTE_RECORD;
DROP PROCEDURE IF EXISTS INSERT_BONIFICACION_RECORD;
DROP PROCEDURE IF EXISTS INSERT_DESCUENTO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_ANTICIPO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PERMISO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_VACACIONES_RECORD;
DROP PROCEDURE IF EXISTS INSERT_SEGUROMEDICO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_RENDICIONCUENTAS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_INCIDENCIAS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_CAPACITACIONES_RECORD;
DROP PROCEDURE IF EXISTS INSERT_EVALUACIONCAPACITACIONES_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PROYECTOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_ASIGNACIONESPROYECTO_RECORD;
DROP PROCEDURE IF EXISTS INSERT_EVALUACIONESPROYECTOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_HORARIOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_ASISTENCIA_RECORD;
DROP PROCEDURE IF EXISTS INSERT_COMISIONES_RECORD;
DROP PROCEDURE IF EXISTS INSERT_DEPENDIENTES_RECORD;
DROP PROCEDURE IF EXISTS INSERT_PLANCARRERA_RECORD;
DROP PROCEDURE IF EXISTS INSERT_ANTIGUEDAD_RECORD;
DROP PROCEDURE IF EXISTS INSERT_HISTORIALSALARIOS_RECORD;
DROP PROCEDURE IF EXISTS INSERT_ESTADOPATRIMONIAL_RECORD;
DROP PROCEDURE IF EXISTS INSERT_DOCUMENTOS_RECORD;

-- Ahora puedes proceder con la creación de cada procedimiento como antes, sin duplicados.

-- Procedimiento para insertar en la tabla Departamento
DELIMITER //
CREATE PROCEDURE INSERT_DEPARTAMENTO_RECORD (
    IN nombre VARCHAR(50),
    IN descripcion TEXT
)
BEGIN
    INSERT INTO Departamento (nombre_departamento, descripcion)
    VALUES (nombre, descripcion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Puesto
DELIMITER //
CREATE PROCEDURE INSERT_PUESTO_RECORD (
    IN nombre VARCHAR(50),
    IN nivel TINYINT
)
BEGIN
    INSERT INTO Puesto (nombre_puesto, nivel_puesto)
    VALUES (nombre, nivel);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla ProveedorServicios
DELIMITER //
CREATE PROCEDURE INSERT_PROVEEDORSERVICIOS_RECORD (
    IN nombre VARCHAR(100),
    IN descripcion TEXT
)
BEGIN
    INSERT INTO ProveedorServicios (nombre_proveedor, descripcion)
    VALUES (nombre, descripcion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla ServiciosProveidos
DELIMITER //
CREATE PROCEDURE INSERT_SERVICIOSPROVEIDOS_RECORD (
    IN id_proveedor INT,
    IN nombre VARCHAR(100),
    IN descripcion TEXT
)
BEGIN
    INSERT INTO ServiciosProveidos (id_proveedor, nombre_servicio, descripcion)
    VALUES (id_proveedor, nombre, descripcion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Empleado
DELIMITER //
CREATE PROCEDURE INSERT_EMPLEADO_RECORD (
    IN codigo VARCHAR(20),
    IN nombre VARCHAR(50),
    IN apellido VARCHAR(50),
    IN fecha_nacimiento DATE,
    IN fecha_contratacion DATE,
    IN id_puesto INT,
    IN id_departamento INT,
    IN sueldo_base DECIMAL(10,2),
    IN bonificacion_base DECIMAL(10,2)
)
BEGIN
    INSERT INTO Empleado (codigo_empleado, nombre, apellido, fecha_nacimiento, fecha_contratacion, id_puesto, id_departamento, sueldo_base, bonificacion_base)
    VALUES (codigo, nombre, apellido, fecha_nacimiento, fecha_contratacion, id_puesto, id_departamento, sueldo_base, bonificacion_base);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Nomina
DELIMITER //
CREATE PROCEDURE INSERT_NOMINA_RECORD (
    IN id_empleado INT,
    IN fecha_nomina DATE,
    IN sueldo_bruto DECIMAL(10,2),
    IN ISR DECIMAL(10,2),
    IN IGSS DECIMAL(10,2),
    IN sueldo_neto DECIMAL(10,2)
)
BEGIN
    INSERT INTO Nomina (id_empleado, fecha_nomina, sueldo_bruto, ISR, IGSS, sueldo_neto)
    VALUES (id_empleado, fecha_nomina, sueldo_bruto, ISR, IGSS, sueldo_neto);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla EvaluacionDesempeno
DELIMITER //
CREATE PROCEDURE INSERT_EVALUACIONDESEMPENO_RECORD (
    IN id_empleado INT,
    IN fecha DATE,
    IN puntuacion DECIMAL(5,2),
    IN comentarios TEXT
)
BEGIN
    INSERT INTO EvaluacionDesempeno (id_empleado, fecha, puntuacion, comentarios)
    VALUES (id_empleado, fecha, puntuacion, comentarios);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Pariente
DELIMITER //
CREATE PROCEDURE INSERT_PARIENTE_RECORD (
    IN id_empleado INT,
    IN nombre VARCHAR(50),
    IN relacion VARCHAR(20),
    IN telefono VARCHAR(15)
)
BEGIN
    INSERT INTO Pariente (id_empleado, nombre, relacion, telefono)
    VALUES (id_empleado, nombre, relacion, telefono);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Bonificacion
DELIMITER //
CREATE PROCEDURE INSERT_BONIFICACION_RECORD (
    IN id_empleado INT,
    IN monto DECIMAL(10,2),
    IN fecha_asignacion DATE
)
BEGIN
    INSERT INTO Bonificacion (id_empleado, monto, fecha_asignacion)
    VALUES (id_empleado, monto, fecha_asignacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Descuento
DELIMITER //
CREATE PROCEDURE INSERT_DESCUENTO_RECORD (
    IN id_empleado INT,
    IN tipo_descuento VARCHAR(50),
    IN monto DECIMAL(10,2),
    IN fecha_aplicacion DATE
)
BEGIN
    INSERT INTO Descuento (id_empleado, tipo_descuento, monto, fecha_aplicacion)
    VALUES (id_empleado, tipo_descuento, monto, fecha_aplicacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Anticipo
DELIMITER //
CREATE PROCEDURE INSERT_ANTICIPO_RECORD (
    IN id_empleado INT,
    IN monto DECIMAL(10,2),
    IN fecha_anticipo DATE
)
BEGIN
    INSERT INTO Anticipo (id_empleado, monto, fecha_anticipo)
    VALUES (id_empleado, monto, fecha_anticipo);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Permiso
DELIMITER //
CREATE PROCEDURE INSERT_PERMISO_RECORD (
    IN id_empleado INT,
    IN tipo_permiso VARCHAR(20),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    INSERT INTO Permiso (id_empleado, tipo_permiso, fecha_inicio, fecha_fin)
    VALUES (id_empleado, tipo_permiso, fecha_inicio, fecha_fin);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Vacaciones
DELIMITER //
CREATE PROCEDURE INSERT_VACACIONES_RECORD (
    IN id_empleado INT,
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    INSERT INTO Vacaciones (id_empleado, fecha_inicio, fecha_fin)
    VALUES (id_empleado, fecha_inicio, fecha_fin);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla SeguroMedico
DELIMITER //
CREATE PROCEDURE INSERT_SEGUROMEDICO_RECORD (
    IN id_empleado INT,
    IN tipo_seguro VARCHAR(50),
    IN monto DECIMAL(10,2),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    INSERT INTO SeguroMedico (id_empleado, tipo_seguro, monto, fecha_inicio, fecha_fin)
    VALUES (id_empleado, tipo_seguro, monto, fecha_inicio, fecha_fin);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla RendicionCuentas
DELIMITER //
CREATE PROCEDURE INSERT_RENDICIONCUENTAS_RECORD (
    IN id_empleado INT,
    IN descripcion TEXT,
    IN fecha_rendicion DATE
)
BEGIN
    INSERT INTO RendicionCuentas (id_empleado, descripcion, fecha_rendicion)
    VALUES (id_empleado, descripcion, fecha_rendicion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Incidencias
DELIMITER //
CREATE PROCEDURE INSERT_INCIDENCIAS_RECORD (
    IN id_empleado INT,
    IN motivo TEXT,
    IN fecha_incidencia DATE
)
BEGIN
    INSERT INTO Incidencias (id_empleado, motivo, fecha_incidencia)
    VALUES (id_empleado, motivo, fecha_incidencia);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Capacitaciones
DELIMITER //
CREATE PROCEDURE INSERT_CAPACITACIONES_RECORD (
    IN id_empleado INT,
    IN nombre_capacitacion VARCHAR(100),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    INSERT INTO Capacitaciones (id_empleado, nombre_capacitacion, fecha_inicio, fecha_fin)
    VALUES (id_empleado, nombre_capacitacion, fecha_inicio, fecha_fin);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla EvaluacionCapacitaciones
DELIMITER //
CREATE PROCEDURE INSERT_EVALUACIONCAPACITACIONES_RECORD (
    IN id_capacitacion INT,
    IN puntuacion DECIMAL(5,2),
    IN comentarios TEXT
)
BEGIN
    INSERT INTO EvaluacionCapacitaciones (id_capacitacion, puntuacion, comentarios)
    VALUES (id_capacitacion, puntuacion, comentarios);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Proyectos
DELIMITER //
CREATE PROCEDURE INSERT_PROYECTOS_RECORD (
    IN id_empleado INT,
    IN nombre_proyecto VARCHAR(100),
    IN descripcion TEXT,
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    INSERT INTO Proyectos (id_empleado, nombre_proyecto, descripcion, fecha_inicio, fecha_fin)
    VALUES (id_empleado, nombre_proyecto, descripcion, fecha_inicio, fecha_fin);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla AsignacionesProyecto
DELIMITER //
CREATE PROCEDURE INSERT_ASIGNACIONESPROYECTO_RECORD (
    IN id_empleado INT,
    IN id_proyecto INT,
    IN fecha_asignacion DATE
)
BEGIN
    INSERT INTO AsignacionesProyecto (id_empleado, id_proyecto, fecha_asignacion)
    VALUES (id_empleado, id_proyecto, fecha_asignacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla EvaluacionesProyectos
DELIMITER //
CREATE PROCEDURE INSERT_EVALUACIONESPROYECTOS_RECORD (
    IN id_proyecto INT,
    IN puntuacion DECIMAL(5,2),
    IN comentarios TEXT
)
BEGIN
    INSERT INTO EvaluacionesProyectos (id_proyecto, puntuacion, comentarios)
    VALUES (id_proyecto, puntuacion, comentarios);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Horarios
DELIMITER //
CREATE PROCEDURE INSERT_HORARIOS_RECORD (
    IN id_empleado INT,
    IN dia_semana VARCHAR(15),
    IN hora_entrada TIME,
    IN hora_salida TIME
)
BEGIN
    INSERT INTO Horarios (id_empleado, dia_semana, hora_entrada, hora_salida)
    VALUES (id_empleado, dia_semana, hora_entrada, hora_salida);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Asistencia
DELIMITER //
CREATE PROCEDURE INSERT_ASISTENCIA_RECORD (
    IN id_empleado INT,
    IN fecha_asistencia DATE,
    IN estado_asistencia ENUM('Presente', 'Ausente')
)
BEGIN
    INSERT INTO Asistencia (id_empleado, fecha_asistencia, estado_asistencia)
    VALUES (id_empleado, fecha_asistencia, estado_asistencia);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Comisiones
DELIMITER //
CREATE PROCEDURE INSERT_COMISIONES_RECORD (
    IN id_empleado INT,
    IN monto DECIMAL(10,2),
    IN fecha_asignacion DATE
)
BEGIN
    INSERT INTO Comisiones (id_empleado, monto, fecha_asignacion)
    VALUES (id_empleado, monto, fecha_asignacion);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Dependientes
DELIMITER //
CREATE PROCEDURE INSERT_DEPENDIENTES_RECORD (
    IN id_empleado INT,
    IN nombre VARCHAR(100),
    IN relacion VARCHAR(50),
    IN fecha_nacimiento DATE
)
BEGIN
    INSERT INTO Dependientes (id_empleado, nombre, relacion, fecha_nacimiento)
    VALUES (id_empleado, nombre, relacion, fecha_nacimiento);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla PlanCarrera
DELIMITER //
CREATE PROCEDURE INSERT_PLANCARRERA_RECORD (
    IN id_empleado INT,
    IN nombre_plan VARCHAR(100),
    IN fecha_inicio DATE,
    IN objetivos TEXT
)
BEGIN
    INSERT INTO PlanCarrera (id_empleado, nombre_plan, fecha_inicio, objetivos)
    VALUES (id_empleado, nombre_plan, fecha_inicio, objetivos);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Antiguedad
DELIMITER //
CREATE PROCEDURE INSERT_ANTIGUEDAD_RECORD (
    IN id_empleado INT,
    IN años_servicio INT
)
BEGIN
    INSERT INTO Antiguedad (id_empleado, años_servicio)
    VALUES (id_empleado, años_servicio);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla HistorialSalarios
DELIMITER //
CREATE PROCEDURE INSERT_HISTORIALSALARIOS_RECORD (
    IN id_empleado INT,
    IN fecha_cambio DATE,
    IN sueldo_anterior DECIMAL(10,2),
    IN sueldo_nuevo DECIMAL(10,2)
)
BEGIN
    INSERT INTO HistorialSalarios (id_empleado, fecha_cambio, sueldo_anterior, sueldo_nuevo)
    VALUES (id_empleado, fecha_cambio, sueldo_anterior, sueldo_nuevo);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla EstadoPatrimonial
DELIMITER //
CREATE PROCEDURE INSERT_ESTADOPATRIMONIAL_RECORD (
    IN id_empleado INT,
    IN patrimonio_inicial DECIMAL(15,2),
    IN patrimonio_final DECIMAL(15,2),
    IN fecha_reporte DATE
)
BEGIN
    INSERT INTO EstadoPatrimonial (id_empleado, patrimonio_inicial, patrimonio_final, fecha_reporte)
    VALUES (id_empleado, patrimonio_inicial, patrimonio_final, fecha_reporte);
END //
DELIMITER ;

-- Procedimiento para insertar en la tabla Documentos
DELIMITER //
CREATE PROCEDURE INSERT_DOCUMENTOS_RECORD (
    IN id_empleado INT,
    IN tipo_documento VARCHAR(50),
    IN fecha_emision DATE,
    IN fecha_expiracion DATE,
    IN id_servicio INT
)
BEGIN
    INSERT INTO Documentos (id_empleado, tipo_documento, fecha_emision, fecha_expiracion, id_servicio)
    VALUES (id_empleado, tipo_documento, fecha_emision, fecha_expiracion, id_servicio);
END //
DELIMITER ;

-- Insertar registros en la tabla Departamento
CALL INSERT_DEPARTAMENTO_RECORD('Recursos Humanos', 'Gestión de empleados y desarrollo organizacional.');
CALL INSERT_DEPARTAMENTO_RECORD('Finanzas', 'Control financiero y administración de recursos.');
CALL INSERT_DEPARTAMENTO_RECORD('Marketing', 'Promoción y gestión de la imagen corporativa.');
CALL INSERT_DEPARTAMENTO_RECORD('IT', 'Desarrollo de sistemas y soporte técnico.');
CALL INSERT_DEPARTAMENTO_RECORD('Ventas', 'Estrategias de ventas y relación con clientes.');
CALL INSERT_DEPARTAMENTO_RECORD('Operaciones', 'Gestión de operaciones diarias y eficiencia.');
CALL INSERT_DEPARTAMENTO_RECORD('Logística', 'Planificación y distribución de bienes.');
CALL INSERT_DEPARTAMENTO_RECORD('Compras', 'Adquisición de materiales y servicios.');
CALL INSERT_DEPARTAMENTO_RECORD('Legal', 'Asesoría y cumplimiento normativo.');
CALL INSERT_DEPARTAMENTO_RECORD('Calidad', 'Control de calidad de productos y servicios.');

-- Insertar registros en la tabla Puesto
CALL INSERT_PUESTO_RECORD('Gerente', 1);
CALL INSERT_PUESTO_RECORD('Analista', 2);
CALL INSERT_PUESTO_RECORD('Coordinador', 3);
CALL INSERT_PUESTO_RECORD('Asesor', 4);
CALL INSERT_PUESTO_RECORD('Desarrollador', 5);
CALL INSERT_PUESTO_RECORD('Soporte Técnico', 6);
CALL INSERT_PUESTO_RECORD('Ejecutivo de Ventas', 7);
CALL INSERT_PUESTO_RECORD('Auditor', 8);
CALL INSERT_PUESTO_RECORD('Consultor', 9);
CALL INSERT_PUESTO_RECORD('Especialista', 10);

-- Insertar registros en la tabla ProveedorServicios
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor A', 'Servicios de software.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor B', 'Servicios de transporte.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor C', 'Consultoría en finanzas.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor D', 'Marketing digital.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor E', 'Material de oficina.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor F', 'Servicios de seguridad.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor G', 'Suministros médicos.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor H', 'Servicios de mantenimiento.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor I', 'Asesoría legal.');
CALL INSERT_PROVEEDORSERVICIOS_RECORD('Proveedor J', 'Desarrollo de aplicaciones.');

-- Insertar registros en la tabla ServiciosProveidos
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(1, 'Software de gestión', 'Desarrollo de software a medida.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(2, 'Transporte', 'Logística y transporte.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(3, 'Asesoría fiscal', 'Consultoría en temas fiscales.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(4, 'Publicidad', 'Campañas de marketing digital.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(5, 'Suministros', 'Material de oficina y papelería.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(6, 'Seguridad física', 'Guardias y monitoreo.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(7, 'Suministros médicos', 'Provisión de equipo médico.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(8, 'Mantenimiento general', 'Servicios de mantenimiento.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(9, 'Consultoría legal', 'Servicios de asesoría legal.');
CALL INSERT_SERVICIOSPROVEIDOS_RECORD(10, 'Desarrollo de apps', 'Aplicaciones móviles personalizadas.');

-- Insertar registros en la tabla Empleado
CALL INSERT_EMPLEADO_RECORD('EMP001', 'Juan', 'Pérez', '1985-05-01', '2020-01-01', 1, 1, 15000, 1000);
CALL INSERT_EMPLEADO_RECORD('EMP002', 'Ana', 'García', '1990-08-15', '2019-04-15', 2, 2, 12000, 800);
CALL INSERT_EMPLEADO_RECORD('EMP003', 'Luis', 'Martínez', '1987-02-20', '2018-09-10', 3, 3, 13000, 900);
CALL INSERT_EMPLEADO_RECORD('EMP004', 'Sofía', 'Rodríguez', '1995-12-05', '2021-02-14', 4, 4, 11000, 700);
CALL INSERT_EMPLEADO_RECORD('EMP005', 'Carlos', 'López', '1982-03-18', '2017-07-25', 5, 5, 12500, 850);
CALL INSERT_EMPLEADO_RECORD('EMP006', 'Lucía', 'Gómez', '1991-11-11', '2020-05-03', 6, 6, 10500, 650);
CALL INSERT_EMPLEADO_RECORD('EMP007', 'Miguel', 'Hernández', '1989-06-21', '2019-11-20', 7, 7, 11800, 750);
CALL INSERT_EMPLEADO_RECORD('EMP008', 'Sara', 'Ruiz', '1993-01-30', '2021-08-15', 8, 8, 11300, 720);
CALL INSERT_EMPLEADO_RECORD('EMP009', 'Pedro', 'Torres', '1988-04-10', '2016-03-18', 9, 9, 12800, 800);
CALL INSERT_EMPLEADO_RECORD('EMP010', 'Elena', 'Jiménez', '1992-07-23', '2022-06-10', 10, 10, 11000, 700);

-- Insertar registros en la tabla Nomina
CALL INSERT_NOMINA_RECORD(1, '2023-10-15', 16000, 1500, 500, 14000);
CALL INSERT_NOMINA_RECORD(2, '2023-10-15', 12800, 1200, 400, 11200);
CALL INSERT_NOMINA_RECORD(3, '2023-10-15', 13900, 1300, 450, 12150);
CALL INSERT_NOMINA_RECORD(4, '2023-10-15', 11700, 1100, 350, 10250);
CALL INSERT_NOMINA_RECORD(5, '2023-10-15', 13350, 1250, 400, 11700);
CALL INSERT_NOMINA_RECORD(6, '2023-10-15', 11150, 1050, 320, 9800);
CALL INSERT_NOMINA_RECORD(7, '2023-10-15', 12550, 1150, 375, 11025);
CALL INSERT_NOMINA_RECORD(8, '2023-10-15', 12020, 1100, 355, 10565);
CALL INSERT_NOMINA_RECORD(9, '2023-10-15', 13520, 1250, 410, 11860);
CALL INSERT_NOMINA_RECORD(10, '2023-10-15', 11700, 1100, 350, 10250);

-- Insertar registros en la tabla EvaluacionDesempeno
CALL INSERT_EVALUACIONDESEMPENO_RECORD(1, '2023-09-01', 8.5, 'Buen desempeño en general.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(2, '2023-09-01', 7.8, 'Cumple con las expectativas.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(3, '2023-09-01', 9.0, 'Excede expectativas en varios aspectos.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(4, '2023-09-01', 8.0, 'Desempeño consistente y positivo.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(5, '2023-09-01', 7.5, 'Buen trabajo, con áreas a mejorar.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(6, '2023-09-01', 8.2, 'Rinde bien bajo presión.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(7, '2023-09-01', 8.8, 'Gran dedicación al trabajo.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(8, '2023-09-01', 7.7, 'Promedio en términos de rendimiento.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(9, '2023-09-01', 9.1, 'Resultados sobresalientes.');
CALL INSERT_EVALUACIONDESEMPENO_RECORD(10, '2023-09-01', 7.9, 'Trabajo satisfactorio en general.');

-- Insertar registros en la tabla Pariente
CALL INSERT_PARIENTE_RECORD(1, 'Pedro Pérez', 'Padre', '555-1111');
CALL INSERT_PARIENTE_RECORD(2, 'Marta García', 'Madre', '555-2222');
CALL INSERT_PARIENTE_RECORD(3, 'Luis Martínez', 'Hermano', '555-3333');
CALL INSERT_PARIENTE_RECORD(4, 'Carmen Rodríguez', 'Esposa', '555-4444');
CALL INSERT_PARIENTE_RECORD(5, 'Juan López', 'Padre', '555-5555');
CALL INSERT_PARIENTE_RECORD(6, 'Laura Gómez', 'Hermana', '555-6666');
CALL INSERT_PARIENTE_RECORD(7, 'Carlos Ruiz', 'Esposo', '555-7777');
CALL INSERT_PARIENTE_RECORD(8, 'María Torres', 'Hija', '555-8888');
CALL INSERT_PARIENTE_RECORD(9, 'Miguel Jiménez', 'Padre', '555-9999');
CALL INSERT_PARIENTE_RECORD(10, 'Lucía Fernández', 'Madre', '555-0000');

-- Insertar registros en la tabla Bonificacion
CALL INSERT_BONIFICACION_RECORD(1, 500, '2023-01-15');
CALL INSERT_BONIFICACION_RECORD(2, 750, '2023-02-15');
CALL INSERT_BONIFICACION_RECORD(3, 1000, '2023-03-15');
CALL INSERT_BONIFICACION_RECORD(4, 600, '2023-04-15');
CALL INSERT_BONIFICACION_RECORD(5, 900, '2023-05-15');
CALL INSERT_BONIFICACION_RECORD(6, 550, '2023-06-15');
CALL INSERT_BONIFICACION_RECORD(7, 850, '2023-07-15');
CALL INSERT_BONIFICACION_RECORD(8, 650, '2023-08-15');
CALL INSERT_BONIFICACION_RECORD(9, 750, '2023-09-15');
CALL INSERT_BONIFICACION_RECORD(10, 800, '2023-10-15');

-- Insertar registros en la tabla Descuento
CALL INSERT_DESCUENTO_RECORD(1, 'Seguro social', 150, '2023-01-15');
CALL INSERT_DESCUENTO_RECORD(2, 'Impuestos', 200, '2023-02-15');
CALL INSERT_DESCUENTO_RECORD(3, 'Seguro social', 180, '2023-03-15');
CALL INSERT_DESCUENTO_RECORD(4, 'Impuestos', 220, '2023-04-15');
CALL INSERT_DESCUENTO_RECORD(5, 'Seguro social', 160, '2023-05-15');
CALL INSERT_DESCUENTO_RECORD(6, 'Impuestos', 210, '2023-06-15');
CALL INSERT_DESCUENTO_RECORD(7, 'Seguro social', 170, '2023-07-15');
CALL INSERT_DESCUENTO_RECORD(8, 'Impuestos', 230, '2023-08-15');
CALL INSERT_DESCUENTO_RECORD(9, 'Seguro social', 190, '2023-09-15');
CALL INSERT_DESCUENTO_RECORD(10, 'Impuestos', 200, '2023-10-15');

-- Insertar registros en la tabla Anticipo
CALL INSERT_ANTICIPO_RECORD(1, 1000, '2023-02-10');
CALL INSERT_ANTICIPO_RECORD(2, 1500, '2023-03-12');
CALL INSERT_ANTICIPO_RECORD(3, 1200, '2023-04-20');
CALL INSERT_ANTICIPO_RECORD(4, 900, '2023-05-25');
CALL INSERT_ANTICIPO_RECORD(5, 1300, '2023-06-18');
CALL INSERT_ANTICIPO_RECORD(6, 800, '2023-07-05');
CALL INSERT_ANTICIPO_RECORD(7, 1100, '2023-08-22');
CALL INSERT_ANTICIPO_RECORD(8, 1400, '2023-09-15');
CALL INSERT_ANTICIPO_RECORD(9, 1600, '2023-10-05');
CALL INSERT_ANTICIPO_RECORD(10, 950, '2023-11-03');

-- Insertar registros en la tabla Permiso
CALL INSERT_PERMISO_RECORD(1, 'Enfermedad', '2023-02-01', '2023-02-05');
CALL INSERT_PERMISO_RECORD(2, 'Maternidad', '2023-03-10', '2023-06-10');
CALL INSERT_PERMISO_RECORD(3, 'Paternidad', '2023-04-15', '2023-04-20');
CALL INSERT_PERMISO_RECORD(4, 'Personal', '2023-05-01', '2023-05-03');
CALL INSERT_PERMISO_RECORD(5, 'Enfermedad', '2023-06-12', '2023-06-15');
CALL INSERT_PERMISO_RECORD(6, 'Personal', '2023-07-20', '2023-07-22');
CALL INSERT_PERMISO_RECORD(7, 'Enfermedad', '2023-08-15', '2023-08-18');
CALL INSERT_PERMISO_RECORD(8, 'Maternidad', '2023-09-01', '2023-12-01');
CALL INSERT_PERMISO_RECORD(9, 'Personal', '2023-10-05', '2023-10-07');
CALL INSERT_PERMISO_RECORD(10, 'Paternidad', '2023-11-01', '2023-11-05');

-- Insertar registros en la tabla Vacaciones
CALL INSERT_VACACIONES_RECORD(1, '2023-03-01', '2023-03-15');
CALL INSERT_VACACIONES_RECORD(2, '2023-04-10', '2023-04-24');
CALL INSERT_VACACIONES_RECORD(3, '2023-05-20', '2023-06-03');
CALL INSERT_VACACIONES_RECORD(4, '2023-07-01', '2023-07-15');
CALL INSERT_VACACIONES_RECORD(5, '2023-08-12', '2023-08-26');
CALL INSERT_VACACIONES_RECORD(6, '2023-09-20', '2023-10-04');
CALL INSERT_VACACIONES_RECORD(7, '2023-10-15', '2023-10-29');
CALL INSERT_VACACIONES_RECORD(8, '2023-11-01', '2023-11-15');
CALL INSERT_VACACIONES_RECORD(9, '2023-12-10', '2023-12-24');
CALL INSERT_VACACIONES_RECORD(10, '2024-01-05', '2024-01-19');

-- Insertar registros en la tabla SeguroMedico
CALL INSERT_SEGUROMEDICO_RECORD(1, 'Dental', 5000, '2023-01-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(2, 'Salud', 10000, '2023-02-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(3, 'Vida', 15000, '2023-03-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(4, 'Accidente', 7000, '2023-04-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(5, 'Dental', 5000, '2023-05-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(6, 'Salud', 12000, '2023-06-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(7, 'Vida', 16000, '2023-07-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(8, 'Accidente', 8000, '2023-08-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(9, 'Dental', 5500, '2023-09-01', '2023-12-31');
CALL INSERT_SEGUROMEDICO_RECORD(10, 'Salud', 11000, '2023-10-01', '2023-12-31');

-- Insertar registros en la tabla RendicionCuentas
CALL INSERT_RENDICIONCUENTAS_RECORD(1, 'Informe de gastos de viaje.', '2023-01-15');
CALL INSERT_RENDICIONCUENTAS_RECORD(2, 'Informe de compras en IT.', '2023-02-10');
CALL INSERT_RENDICIONCUENTAS_RECORD(3, 'Informe de actividades de ventas.', '2023-03-25');
CALL INSERT_RENDICIONCUENTAS_RECORD(4, 'Informe de auditoría interna.', '2023-04-20');
CALL INSERT_RENDICIONCUENTAS_RECORD(5, 'Informe de inventario.', '2023-05-15');
CALL INSERT_RENDICIONCUENTAS_RECORD(6, 'Informe de logística.', '2023-06-10');
CALL INSERT_RENDICIONCUENTAS_RECORD(7, 'Informe de marketing.', '2023-07-25');
CALL INSERT_RENDICIONCUENTAS_RECORD(8, 'Informe de finanzas.', '2023-08-15');
CALL INSERT_RENDICIONCUENTAS_RECORD(9, 'Informe de Recursos Humanos.', '2023-09-10');
CALL INSERT_RENDICIONCUENTAS_RECORD(10, 'Informe de operaciones.', '2023-10-05');

-- Insertar registros en la tabla Incidencias
CALL INSERT_INCIDENCIAS_RECORD(1, 'Retraso en entrega de informes.', '2023-02-01');
CALL INSERT_INCIDENCIAS_RECORD(2, 'Inasistencia sin justificación.', '2023-02-15');
CALL INSERT_INCIDENCIAS_RECORD(3, 'Retraso en proyectos.', '2023-03-01');
CALL INSERT_INCIDENCIAS_RECORD(4, 'Falta de comunicación con el equipo.', '2023-03-15');
CALL INSERT_INCIDENCIAS_RECORD(5, 'Incumplimiento de normas.', '2023-04-01');
CALL INSERT_INCIDENCIAS_RECORD(6, 'Errores en el proceso de auditoría.', '2023-04-15');
CALL INSERT_INCIDENCIAS_RECORD(7, 'Problemas de puntualidad.', '2023-05-01');
CALL INSERT_INCIDENCIAS_RECORD(8, 'Falta de documentación.', '2023-05-15');
CALL INSERT_INCIDENCIAS_RECORD(9, 'Desorganización en tareas.', '2023-06-01');
CALL INSERT_INCIDENCIAS_RECORD(10, 'No cumplir con expectativas de calidad.', '2023-06-15');

-- Insertar registros en la tabla Capacitaciones
CALL INSERT_CAPACITACIONES_RECORD(1, 'Excel Avanzado', '2023-01-10', '2023-01-15');
CALL INSERT_CAPACITACIONES_RECORD(2, 'Liderazgo', '2023-02-05', '2023-02-10');
CALL INSERT_CAPACITACIONES_RECORD(3, 'Gestión de Proyectos', '2023-03-01', '2023-03-05');
CALL INSERT_CAPACITACIONES_RECORD(4, 'Atención al Cliente', '2023-04-12', '2023-04-17');
CALL INSERT_CAPACITACIONES_RECORD(5, 'Redes Sociales', '2023-05-15', '2023-05-20');
CALL INSERT_CAPACITACIONES_RECORD(6, 'Contabilidad Básica', '2023-06-10', '2023-06-15');
CALL INSERT_CAPACITACIONES_RECORD(7, 'Negociación', '2023-07-01', '2023-07-05');
CALL INSERT_CAPACITACIONES_RECORD(8, 'Comunicación Efectiva', '2023-08-03', '2023-08-07');
CALL INSERT_CAPACITACIONES_RECORD(9, 'Trabajo en Equipo', '2023-09-05', '2023-09-10');
CALL INSERT_CAPACITACIONES_RECORD(10, 'Técnicas de Ventas', '2023-10-02', '2023-10-06');

-- Insertar registros en la tabla EvaluacionCapacitaciones
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(1, 85.5, 'Buen desempeño, alto potencial.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(2, 78.0, 'Necesita mejorar habilidades.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(3, 92.0, 'Excelente trabajo y participación.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(4, 81.5, 'Desempeño adecuado.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(5, 89.0, 'Muy buen aprovechamiento.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(6, 75.5, 'Debe trabajar en ciertos aspectos.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(7, 95.0, 'Destacado en todas las áreas.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(8, 82.5, 'Cumple con expectativas.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(9, 88.0, 'Actitud positiva, mejoras continuas.');
CALL INSERT_EVALUACIONCAPACITACIONES_RECORD(10, 90.0, 'Excelente adaptación y rendimiento.');


-- Insertar registros en la tabla Proyectos
CALL INSERT_PROYECTOS_RECORD(1, 'Proyecto Alpha', 'Optimización de procesos internos', '2023-02-01', '2023-06-30');
CALL INSERT_PROYECTOS_RECORD(2, 'Proyecto Beta', 'Desarrollo de una nueva aplicación', '2023-03-01', '2023-09-30');
CALL INSERT_PROYECTOS_RECORD(3, 'Proyecto Gamma', 'Implementación de CRM', '2023-04-01', '2023-08-31');
CALL INSERT_PROYECTOS_RECORD(4, 'Proyecto Delta', 'Automatización de ventas', '2023-05-01', '2023-12-31');
CALL INSERT_PROYECTOS_RECORD(5, 'Proyecto Epsilon', 'Campaña de marketing', '2023-06-01', '2023-10-15');
CALL INSERT_PROYECTOS_RECORD(6, 'Proyecto Zeta', 'Expansión de mercado', '2023-07-01', '2023-11-30');
CALL INSERT_PROYECTOS_RECORD(7, 'Proyecto Eta', 'Capacitación de personal', '2023-08-01', '2023-12-31');
CALL INSERT_PROYECTOS_RECORD(8, 'Proyecto Theta', 'Mejoras de infraestructura', '2023-09-01', '2024-03-31');
CALL INSERT_PROYECTOS_RECORD(9, 'Proyecto Iota', 'Desarrollo de software interno', '2023-10-01', '2024-04-30');
CALL INSERT_PROYECTOS_RECORD(10, 'Proyecto Kappa', 'Aseguramiento de calidad', '2023-11-01', '2024-05-31');

-- Insertar registros en la tabla AsignacionesProyecto
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(1, 1, '2023-02-05');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(2, 2, '2023-03-10');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(3, 3, '2023-04-15');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(4, 4, '2023-05-20');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(5, 5, '2023-06-25');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(6, 6, '2023-07-30');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(7, 7, '2023-08-05');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(8, 8, '2023-09-10');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(9, 9, '2023-10-15');
CALL INSERT_ASIGNACIONESPROYECTO_RECORD(10, 10, '2023-11-20');

-- Insertar registros en la tabla EvaluacionesProyectos
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(1, 89.5, 'Cumplió con los objetivos del proyecto.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(2, 78.0, 'Desempeño adecuado, puede mejorar.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(3, 92.0, 'Superó las expectativas establecidas.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(4, 85.5, 'Buen desempeño en la mayoría de los aspectos.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(5, 95.0, 'Excelente rendimiento y resultados.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(6, 82.5, 'Cumple con el desempeño esperado.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(7, 87.0, 'Desarrolló soluciones efectivas.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(8, 90.5, 'Superó los resultados de desempeño.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(9, 88.0, 'Realizó una buena labor en el proyecto.');
CALL INSERT_EVALUACIONESPROYECTOS_RECORD(10, 91.0, 'Mostró un excelente compromiso.');

-- Insertar registros en la tabla Horarios
CALL INSERT_HORARIOS_RECORD(1, 'Lunes', '08:00:00', '17:00:00');
CALL INSERT_HORARIOS_RECORD(2, 'Martes', '08:00:00', '17:00:00');
CALL INSERT_HORARIOS_RECORD(3, 'Miércoles', '08:00:00', '17:00:00');
CALL INSERT_HORARIOS_RECORD(4, 'Jueves', '08:00:00', '17:00:00');
CALL INSERT_HORARIOS_RECORD(5, 'Viernes', '08:00:00', '16:00:00');
CALL INSERT_HORARIOS_RECORD(6, 'Lunes', '09:00:00', '18:00:00');
CALL INSERT_HORARIOS_RECORD(7, 'Martes', '09:00:00', '18:00:00');
CALL INSERT_HORARIOS_RECORD(8, 'Miércoles', '09:00:00', '18:00:00');
CALL INSERT_HORARIOS_RECORD(9, 'Jueves', '09:00:00', '18:00:00');
CALL INSERT_HORARIOS_RECORD(10, 'Viernes', '09:00:00', '17:00:00');

-- Insertar registros en la tabla Asistencia
CALL INSERT_ASISTENCIA_RECORD(1, '2023-01-02', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(2, '2023-01-03', 'Ausente');
CALL INSERT_ASISTENCIA_RECORD(3, '2023-01-04', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(4, '2023-01-05', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(5, '2023-01-06', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(6, '2023-01-09', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(7, '2023-01-10', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(8, '2023-01-11', 'Ausente');
CALL INSERT_ASISTENCIA_RECORD(9, '2023-01-12', 'Presente');
CALL INSERT_ASISTENCIA_RECORD(10, '2023-01-13', 'Presente');

-- Insertar registros en la tabla Comisiones
CALL INSERT_COMISIONES_RECORD(1, 500, '2023-01-15');
CALL INSERT_COMISIONES_RECORD(2, 600, '2023-02-15');
CALL INSERT_COMISIONES_RECORD(3, 700, '2023-03-15');
CALL INSERT_COMISIONES_RECORD(4, 800, '2023-04-15');
CALL INSERT_COMISIONES_RECORD(5, 550, '2023-05-15');
CALL INSERT_COMISIONES_RECORD(6, 620, '2023-06-15');
CALL INSERT_COMISIONES_RECORD(7, 750, '2023-07-15');
CALL INSERT_COMISIONES_RECORD(8, 680, '2023-08-15');
CALL INSERT_COMISIONES_RECORD(9, 720, '2023-09-15');
CALL INSERT_COMISIONES_RECORD(10, 850, '2023-10-15');

-- Insertar registros en la tabla Dependientes
CALL INSERT_DEPENDIENTES_RECORD(1, 'Carlos Perez', 'Hijo', '2015-05-10');
CALL INSERT_DEPENDIENTES_RECORD(2, 'Ana Lopez', 'Hija', '2018-08-22');
CALL INSERT_DEPENDIENTES_RECORD(3, 'Maria Gonzalez', 'Esposa', '1985-03-15');
CALL INSERT_DEPENDIENTES_RECORD(4, 'Jose Ramirez', 'Hijo', '2012-07-14');
CALL INSERT_DEPENDIENTES_RECORD(5, 'Luis Fernandez', 'Hijo', '2010-10-05');
CALL INSERT_DEPENDIENTES_RECORD(6, 'Carla Martinez', 'Hija', '2016-12-20');
CALL INSERT_DEPENDIENTES_RECORD(7, 'Miguel Torres', 'Hijo', '2013-04-08');
CALL INSERT_DEPENDIENTES_RECORD(8, 'Lucia Suarez', 'Esposa', '1988-06-18');
CALL INSERT_DEPENDIENTES_RECORD(9, 'Mario Vargas', 'Hijo', '2011-01-25');
CALL INSERT_DEPENDIENTES_RECORD(10, 'Julia Ruiz', 'Hija', '2017-09-30');

-- Insertar registros en la tabla PlanCarrera
CALL INSERT_PLANCARRERA_RECORD(1, 'Liderazgo Ejecutivo', '2023-01-01', 'Desarrollar habilidades de liderazgo.');
CALL INSERT_PLANCARRERA_RECORD(2, 'Especialización en Marketing', '2023-02-01', 'Perfeccionar estrategias de mercado.');
CALL INSERT_PLANCARRERA_RECORD(3, 'Gestión Financiera', '2023-03-01', 'Manejo avanzado de finanzas corporativas.');
CALL INSERT_PLANCARRERA_RECORD(4, 'Recursos Humanos', '2023-04-01', 'Optimización de la gestión del talento.');
CALL INSERT_PLANCARRERA_RECORD(5, 'Innovación Tecnológica', '2023-05-01', 'Implementación de nuevas tecnologías.');
CALL INSERT_PLANCARRERA_RECORD(6, 'Desarrollo Comercial', '2023-06-01', 'Expansión de clientes y ventas.');
CALL INSERT_PLANCARRERA_RECORD(7, 'Atención al Cliente', '2023-07-01', 'Mejorar la experiencia del cliente.');
CALL INSERT_PLANCARRERA_RECORD(8, 'Optimización de Procesos', '2023-08-01', 'Eficiencia en procesos internos.');
CALL INSERT_PLANCARRERA_RECORD(9, 'Proyectos Internacionales', '2023-09-01', 'Gestión de proyectos en el extranjero.');
CALL INSERT_PLANCARRERA_RECORD(10, 'Seguridad Laboral', '2023-10-01', 'Normas de seguridad y prevención.');

-- Insertar registros en la tabla Antiguedad
CALL INSERT_ANTIGUEDAD_RECORD(1, 5);
CALL INSERT_ANTIGUEDAD_RECORD(2, 7);
CALL INSERT_ANTIGUEDAD_RECORD(3, 2);
CALL INSERT_ANTIGUEDAD_RECORD(4, 4);
CALL INSERT_ANTIGUEDAD_RECORD(5, 8);
CALL INSERT_ANTIGUEDAD_RECORD(6, 3);
CALL INSERT_ANTIGUEDAD_RECORD(7, 6);
CALL INSERT_ANTIGUEDAD_RECORD(8, 1);
CALL INSERT_ANTIGUEDAD_RECORD(9, 10);
CALL INSERT_ANTIGUEDAD_RECORD(10, 9);

-- Insertar registros en la tabla HistorialSalarios
CALL INSERT_HISTORIALSALARIOS_RECORD(1, '2022-01-01', 3000.00, 3200.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(2, '2022-02-01', 3200.00, 3400.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(3, '2022-03-01', 3400.00, 3600.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(4, '2022-04-01', 3600.00, 3800.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(5, '2022-05-01', 3800.00, 4000.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(6, '2022-06-01', 4000.00, 4200.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(7, '2022-07-01', 4200.00, 4400.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(8, '2022-08-01', 4400.00, 4600.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(9, '2022-09-01', 4600.00, 4800.00);
CALL INSERT_HISTORIALSALARIOS_RECORD(10, '2022-10-01', 4800.00, 5000.00);

-- Insertar registros en la tabla EstadoPatrimonial
CALL INSERT_ESTADOPATRIMONIAL_RECORD(1, 100000.00, 120000.00, '2023-01-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(2, 85000.00, 90000.00, '2023-02-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(3, 120000.00, 125000.00, '2023-03-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(4, 75000.00, 80000.00, '2023-04-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(5, 95000.00, 100000.00, '2023-05-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(6, 110000.00, 115000.00, '2023-06-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(7, 105000.00, 107000.00, '2023-07-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(8, 115000.00, 120000.00, '2023-08-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(9, 130000.00, 135000.00, '2023-09-15');
CALL INSERT_ESTADOPATRIMONIAL_RECORD(10, 140000.00, 145000.00, '2023-10-15');

-- Insertar registros en la tabla Documentos
CALL INSERT_DOCUMENTOS_RECORD(1, 'DPI', '2015-05-10', '2025-05-10', 1);
CALL INSERT_DOCUMENTOS_RECORD(2, 'Pasaporte', '2018-10-15', '2028-10-15', 2);
CALL INSERT_DOCUMENTOS_RECORD(3, 'Licencia', '2020-03-22', '2026-03-22', 3);
CALL INSERT_DOCUMENTOS_RECORD(4, 'DPI', '2017-07-18', '2027-07-18', 4);
CALL INSERT_DOCUMENTOS_RECORD(5, 'Pasaporte', '2019-12-05', '2029-12-05', 5);
CALL INSERT_DOCUMENTOS_RECORD(6, 'Licencia', '2021-02-10', '2027-02-10', 6);
CALL INSERT_DOCUMENTOS_RECORD(7, 'DPI', '2016-11-20', '2026-11-20', 7);
CALL INSERT_DOCUMENTOS_RECORD(8, 'Pasaporte', '2022-04-01', '2032-04-01', 8);
CALL INSERT_DOCUMENTOS_RECORD(9, 'Licencia', '2019-09-30', '2025-09-30', 9);
CALL INSERT_DOCUMENTOS_RECORD(10, 'DPI', '2018-06-25', '2028-06-25', 10);

-- Procedimiento para seleccionar todos los registros de la tabla Departamento
DROP PROCEDURE IF EXISTS SELECT_DEPARTAMENTO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_DEPARTAMENTO_RECORD ()
BEGIN
    SELECT * FROM Departamento;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Puesto
DROP PROCEDURE IF EXISTS SELECT_PUESTO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PUESTO_RECORD ()
BEGIN
    SELECT * FROM Puesto;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla ProveedorServicios
DROP PROCEDURE IF EXISTS SELECT_PROVEEDORSERVICIOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PROVEEDORSERVICIOS_RECORD ()
BEGIN
    SELECT * FROM ProveedorServicios;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla ServiciosProveidos
DROP PROCEDURE IF EXISTS SELECT_SERVICIOSPROVEIDOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_SERVICIOSPROVEIDOS_RECORD (IN id_proveedor INT)
BEGIN
    SELECT * FROM ServiciosProveidos
    WHERE id_proveedor = id_proveedor;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Empleado
DROP PROCEDURE IF EXISTS SELECT_EMPLEADO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_EMPLEADO_RECORD ()
BEGIN
    SELECT * FROM Empleado;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Nomina para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_NOMINA_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_NOMINA_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Nomina
    WHERE id_empleado = empleado_id
    ORDER BY fecha_nomina DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla EvaluacionDesempeno para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_EVALUACIONDESEMPENO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_EVALUACIONDESEMPENO_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM EvaluacionDesempeno
    WHERE id_empleado = empleado_id
    ORDER BY fecha DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Pariente para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_PARIENTE_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PARIENTE_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Pariente
    WHERE id_empleado = empleado_id;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Bonificacion para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_BONIFICACION_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_BONIFICACION_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Bonificacion
    WHERE id_empleado = empleado_id
    ORDER BY fecha_asignacion DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Descuento para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_DESCUENTO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_DESCUENTO_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Descuento
    WHERE id_empleado = empleado_id
    ORDER BY fecha_aplicacion DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Anticipo para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_ANTICIPO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_ANTICIPO_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Anticipo
    WHERE id_empleado = empleado_id
    ORDER BY fecha_anticipo DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Permiso para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_PERMISO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PERMISO_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Permiso
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Vacaciones para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_VACACIONES_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_VACACIONES_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Vacaciones
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla SeguroMedico para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_SEGUROMEDICO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_SEGUROMEDICO_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM SeguroMedico
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla RendicionCuentas para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_RENDICIONCUENTAS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_RENDICIONCUENTAS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM RendicionCuentas
    WHERE id_empleado = empleado_id
    ORDER BY fecha_rendicion DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Incidencias para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_INCIDENCIAS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_INCIDENCIAS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Incidencias
    WHERE id_empleado = empleado_id
    ORDER BY fecha_incidencia DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Capacitaciones para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_CAPACITACIONES_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_CAPACITACIONES_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Capacitaciones
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla EvaluacionCapacitaciones para una capacitación específica
DROP PROCEDURE IF EXISTS SELECT_EVALUACIONCAPACITACIONES_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_EVALUACIONCAPACITACIONES_RECORD (IN capacitacion_id INT)
BEGIN
    SELECT * FROM EvaluacionCapacitaciones
    WHERE id_capacitacion = capacitacion_id;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Proyectos para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_PROYECTOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PROYECTOS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Proyectos
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla AsignacionesProyecto para un proyecto específico
DROP PROCEDURE IF EXISTS SELECT_ASIGNACIONESPROYECTO_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_ASIGNACIONESPROYECTO_RECORD (IN proyecto_id INT)
BEGIN
    SELECT * FROM AsignacionesProyecto
    WHERE id_proyecto = proyecto_id
    ORDER BY fecha_asignacion DESC;
END //
DELIMITER ;


-- Procedimiento para seleccionar todos los registros de la tabla EvaluacionesProyectos para un proyecto específico
DROP PROCEDURE IF EXISTS SELECT_EVALUACIONESPROYECTOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_EVALUACIONESPROYECTOS_RECORD (IN proyecto_id INT)
BEGIN
    SELECT * FROM EvaluacionesProyectos
    WHERE id_proyecto = proyecto_id
    ORDER BY puntuacion DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Horarios para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_HORARIOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_HORARIOS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Horarios
    WHERE id_empleado = empleado_id
    ORDER BY dia_semana, hora_entrada;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Asistencia para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_ASISTENCIA_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_ASISTENCIA_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Asistencia
    WHERE id_empleado = empleado_id
    ORDER BY fecha_asistencia DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Comisiones para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_COMISIONES_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_COMISIONES_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Comisiones
    WHERE id_empleado = empleado_id
    ORDER BY fecha_asignacion DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Dependientes para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_DEPENDIENTES_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_DEPENDIENTES_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Dependientes
    WHERE id_empleado = empleado_id
    ORDER BY nombre;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla PlanCarrera para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_PLANCARRERA_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PLANCARRERA_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM PlanCarrera
    WHERE id_empleado = empleado_id
    ORDER BY fecha_inicio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Antiguedad para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_ANTIGUEDAD_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_ANTIGUEDAD_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Antiguedad
    WHERE id_empleado = empleado_id;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla HistorialSalarios para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_HISTORIALSALARIOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_HISTORIALSALARIOS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM HistorialSalarios
    WHERE id_empleado = empleado_id
    ORDER BY fecha_cambio DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla EstadoPatrimonial para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_ESTADOPATRIMONIAL_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_ESTADOPATRIMONIAL_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM EstadoPatrimonial
    WHERE id_empleado = empleado_id
    ORDER BY fecha_reporte DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla Documentos para un empleado específico
DROP PROCEDURE IF EXISTS SELECT_DOCUMENTOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_DOCUMENTOS_RECORD (IN empleado_id INT)
BEGIN
    SELECT * FROM Documentos
    WHERE id_empleado = empleado_id
    ORDER BY fecha_emision DESC;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla ProveedorServicios
DROP PROCEDURE IF EXISTS SELECT_PROVEEDORSERVICIOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_PROVEEDORSERVICIOS_RECORD (IN proveedor_id INT)
BEGIN
    SELECT * FROM ProveedorServicios
    WHERE id_proveedor = proveedor_id;
END //
DELIMITER ;

-- Procedimiento para seleccionar todos los registros de la tabla ServiciosProveidos para un proveedor específico
DROP PROCEDURE IF EXISTS SELECT_SERVICIOSPROVEIDOS_RECORD;
DELIMITER //
CREATE PROCEDURE SELECT_SERVICIOSPROVEIDOS_RECORD (IN proveedor_id INT)
BEGIN
    SELECT * FROM ServiciosProveidos
    WHERE id_proveedor = proveedor_id
    ORDER BY nombre_servicio;
END //
DELIMITER ;

