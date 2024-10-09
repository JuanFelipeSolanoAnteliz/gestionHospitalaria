-- Insertar datos en la tabla `especialidad`
INSERT INTO `especialidad` (id, nombre) VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Neurología');

-- Insertar datos en la tabla `hospitales`
INSERT INTO `hospitales` (nit, nombre, direccion) VALUES
(101, 'Hospital Central', 'Calle 1 #10-20'),
(102, 'Clínica de la Salud', 'Avenida 2 #30-40'),
(103, 'Hospital General', 'Carrera 3 #50-60');

-- Insertar datos en la tabla `pacientes`
INSERT INTO `pacientes` (cedula, nombre, apellido, genero, fecha_nacimiento, edad) VALUES
(12345678, 'Juan', 'Pérez', 'Masculino', '1985-05-15', 39),
(87654321, 'Ana', 'Gómez', 'Femenino', '1990-07-25', 34),
(11223344, 'Carlos', 'López', 'Masculino', '2000-10-10', 23);

-- Insertar datos en la tabla `doctores`
INSERT INTO `doctores` (id, nombre_completo, genero, especialidad_fk, fecha_nacimiento) VALUES
(1, 'Dr. Luis Martínez', 'Masculino', 1, '1975-02-20'),
(2, 'Dra. María Fernández', 'Femenino', 2, '1980-03-30'),
(3, 'Dr. Javier Torres', 'Masculino', 3, '1988-04-25');

-- Insertar datos en la tabla `comunicacion_paci`
INSERT INTO `comunicacion_paci` (paciente_fk, tipo, contacto) VALUES
(12345678, 'Teléfono', '3001234567'),
(87654321, 'Email', 'ana.gomez@example.com'),
(11223344, 'Teléfono', '3109876543');

-- Insertar datos en la tabla `comunicacion_hospital`
INSERT INTO `comunicacion_hospital` (hospital_fk, tipo, contacto) VALUES
(101, 'Teléfono', '6012345678'),
(102, 'Email', 'contacto@clinica.com'),
(103, 'Teléfono', '6012345679');

-- Insertar datos en la tabla `comunicacion_doctores`
INSERT INTO `comunicacion_doctores` (doctor_fk, tipo, contacto) VALUES
(1, 'Teléfono', '3201234567'),
(2, 'Email', 'maria.fernandez@example.com'),
(3, 'Teléfono', '3101234568');

-- Insertar datos en la tabla `personal`
INSERT INTO `personal` (hospital_fk, doctor_fk) VALUES
(101, 1),
(102, 2),
(103, 3);

-- Insertar datos en la tabla `avisos`
INSERT INTO `avisos` (id, hospital_fk, nombre, descripcion, fecha) VALUES
(1, 101, 'Vacunación', 'Campaña de vacunación para adultos', '2024-10-01 09:00:00'),
(2, 102, 'Consulta Gratuita', 'Consulta médica gratuita este fin de semana', '2024-10-05 10:00:00'),
(3, 103, 'Charla sobre Diabetes', 'Charla informativa sobre diabetes', '2024-10-10 14:00:00');

-- Insertar datos en la tabla `historial_medico`
INSERT INTO `historial_medico` (id, paciente_fk, observaciones) VALUES
(1, 12345678, 'Paciente con antecedentes de hipertensión.'),
(2, 87654321, 'Paciente con alergias a medicamentos.'),
(3, 11223344, 'Paciente saludable, sin antecedentes médicos.');

-- Insertar datos en la tabla `cuentas`
INSERT INTO `cuentas` (id, paciente_fk, hospital_fk, precio, fecha, motivo) VALUES
(1, 12345678, 101, 150.00, '2024-10-01 09:30:00', 'Consulta general'),
(2, 87654321, 102, 200.00, '2024-10-06 11:00:00', 'Exámenes médicos'),
(3, 11223344, 103, 250.00, '2024-10-12 15:30:00', 'Tratamiento especializado');

-- Insertar datos en la tabla `poblacion`
INSERT INTO `poblacion` (doctor_fk, paciente_fk) VALUES
(1, 12345678),
(2, 87654321),
(3, 11223344);
