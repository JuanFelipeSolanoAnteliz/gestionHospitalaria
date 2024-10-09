CREATE TABLE `doctores`(
    `id` INT NOT NULL,
    `nombre_completo` VARCHAR(100) NOT NULL,
    `genero` VARCHAR(10) NOT NULL,
    `especialidad_fk` INT NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `personal`(
    `hospital_fk` INT NOT NULL,
    `doctor_fk` INT NOT NULL
);
CREATE TABLE `comunicacion_hospital`(
    `hospital_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`hospital_fk`)
);
ALTER TABLE
    `comunicacion_hospital` ADD UNIQUE `comunicacion_hospital_contacto_unique`(`contacto`);

CREATE TABLE `avisos`(
    `id` INT NOT NULL,
    `hospital_fk` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `descripcion` TEXT NOT NULL,
    `fecha` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `hospitales`(
    `nit` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`nit`)
);
CREATE TABLE `comunicacion_paci`(
    `paciente_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`paciente_fk`)
);
CREATE TABLE `comunicacion_doctores`(
    `doctor_fk` INT NOT NULL,
    `tipo` ENUM('') NOT NULL,
    `contacto` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `comunicacion_doctores` ADD UNIQUE `comunicacion_doctores_contacto_unique`(`contacto`);
CREATE TABLE `cuentas`(
    `id` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `hospital_fk` INT NOT NULL,
    `precio` DOUBLE NOT NULL,
    `fecha` DATETIME NOT NULL,
    `motivo` TEXT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `especialidad`(
    `id` BIGINT NOT NULL,
    `nombre` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `historial_medico`(
    `id` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `observaciones` LONGTEXT NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `poblacion`(
    `doctor_fk` INT NOT NULL,
    `paciente_fk` INT NOT NULL
);
CREATE TABLE `pacientes`(
    `cedula` INT NOT NULL,
    `nombre` VARCHAR(255) NOT NULL,
    `apellido` VARCHAR(255) NOT NULL,
    `genero` VARCHAR(20) NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    `edad` INT NOT NULL,
    PRIMARY KEY(`cedula`)
);

ALTER TABLE
    `personal` ADD CONSTRAINT `personal_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`);
ALTER TABLE
    `hospitales` ADD CONSTRAINT `hospitales_nit_foreign` FOREIGN KEY(`nit`) REFERENCES `comunicacion_hospital`(`hospital_fk`);
ALTER TABLE
    `pacientes` ADD CONSTRAINT `pacientes_cedula_foreign` FOREIGN KEY(`cedula`) REFERENCES `comunicacion_paci`(`paciente_fk`);
ALTER TABLE
    `cuentas` ADD CONSTRAINT `cuentas_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`);
ALTER TABLE
    `avisos` ADD CONSTRAINT `avisos_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`);
ALTER TABLE
    `personal` ADD CONSTRAINT `personal_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`);
ALTER TABLE
    `doctores` ADD CONSTRAINT `doctores_especialidad_fk_foreign` FOREIGN KEY(`especialidad_fk`) REFERENCES `especialidad`(`id`);
ALTER TABLE
    `poblacion` ADD CONSTRAINT `poblacion_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`);
ALTER TABLE
    `comunicacion_doctores` ADD CONSTRAINT `comunicacion_doctores_doctor_fk_foreign` FOREIGN KEY(`doctor_fk`) REFERENCES `doctores`(`id`);
ALTER TABLE
    `cuentas` ADD CONSTRAINT `cuentas_hospital_fk_foreign` FOREIGN KEY(`hospital_fk`) REFERENCES `hospitales`(`nit`);
ALTER TABLE
    `historial_medico` ADD CONSTRAINT `historial_medico_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`);
ALTER TABLE
    `poblacion` ADD CONSTRAINT `poblacion_paciente_fk_foreign` FOREIGN KEY(`paciente_fk`) REFERENCES `pacientes`(`cedula`);