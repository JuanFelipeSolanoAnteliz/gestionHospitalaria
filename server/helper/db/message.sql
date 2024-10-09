CREATE TABLE `especialidad` (
    `id` BIGINT NOT NULL,
    `nombre` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `hospitales` (
    `nit` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`nit`)
);

CREATE TABLE `doctores` (
    `id` INT NOT NULL,
    `nombre_completo` VARCHAR(100) NOT NULL,
    `genero` VARCHAR(10) NOT NULL,
    `especialidad_fk` INT NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `doctores_especialidad_fk_foreign` FOREIGN KEY(`especialidad_fk`) REFERENCES `especialidad`(`id`)
);

CREATE TABLE `pacientes` (
    `cedula` INT NOT NULL,
    `nombre` VARCHAR(255) NOT NULL,
    `apellido` VARCHAR(255) NOT NULL,
    `genero` VARCHAR(20) NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    `edad` INT NOT NULL,
    PRIMARY KEY(`cedula`)
);

CREATE TABLE `comunicacion_paci` (
    `paciente_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`paciente_fk`)
);

CREATE TABLE `comunicacion_hospital` (
    `hospital_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`hospital_fk`),
    UNIQUE `comunicacion_hospital_contacto_unique`(`contacto`)
);

CREATE TABLE `comunicacion_doctores` (
    `doctor_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(255) NOT NULL,
    CONSTRAINT `comunicacion_doctores_contacto_unique` UNIQUE(`contacto`),
    CONSTRAINT `comunicacion_doctores_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`)
);

CREATE TABLE `personal` (
    `hospital_fk` INT NOT NULL,
    `doctor_fk` INT NOT NULL,
    CONSTRAINT `personal_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`),
    CONSTRAINT `personal_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`)
);

CREATE TABLE `avisos` (
    `id` INT NOT NULL,
    `hospital_fk` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `descripcion` TEXT NOT NULL,
    `fecha` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `avisos_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`)
);

CREATE TABLE `historial_medico` (
    `id` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `observaciones` LONGTEXT NOT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `historial_medico_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`)
);

CREATE TABLE `cuentas` (
    `id` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `hospital_fk` INT NOT NULL,
    `precio` DOUBLE NOT NULL,
    `fecha` DATETIME NOT NULL,
    `motivo` TEXT NOT NULL,
    PRIMARY KEY(`id`),
    CONSTRAINT `cuentas_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`),
    CONSTRAINT `cuentas_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`)
);

CREATE TABLE `poblacion` (
    `doctor_fk` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    CONSTRAINT `poblacion_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`),
    CONSTRAINT `poblacion_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`)
);
