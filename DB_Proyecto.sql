		/* Creación Base de Datos */

CREATE DATABASE proyecto;
USE proyecto;

		/* Manejo de Inventarios */
        
		-- Entidades Fuertes --

-- Tabla Proveedor
CREATE TABLE proveedor (
	pro_id			BIGINT NOT NULL,
    pro_nombre		VARCHAR(20) NOT NULL,
    pro_apellido	VARCHAR(20) NOT NULL,
    pro_email		VARCHAR(45),
    pro_direc		VARCHAR(45),
    pro_tel			BIGINT NOT NULL,
    PRIMARY KEY (pro_id)
);

-- Tabla Inventario
CREATE TABLE inventario (
	inv_nombre		VARCHAR(20) NOT NULL,
    inv_ultima_act	DATE NOT NULL,
    PRIMARY KEY (inv_nombre)
);

-- Tabla Item
CREATE TABLE item (
	ite_id			SMALLINT NOT NULL AUTO_INCREMENT,
    ite_nom			VARCHAR(45) NOT NULL,
    ite_descrip		VARCHAR(200) NOT NULL,
    ite_precio		INT NOT NULL,
    ite_tipo		ENUM('Comida', 'Bebida') NOT NULL,
    PRIMARY KEY (ite_id)
);

		-- Entidades Debiles --

-- Tabla Orden
CREATE TABLE orden(
	ord_id			INT AUTO_INCREMENT NOT NULL,
    ord_pro_id		BIGINT NOT NULL,
    ord_fecha		DATE NOT NULL,
    ord_entrega		DATE,
    PRIMARY KEY (ord_id),
    FOREIGN KEY (ord_pro_id) REFERENCES proveedor(pro_id)
);

-- Tabla Ingrediente
CREATE TABLE ingrediente(
	ing_nombre			VARCHAR(45) NOT NULL,
    ing_inv_nom			VARCHAR(20) NOT NULL,
    ing_cant_disponible	INT,
    ing_medicion 		ENUM ('Kg', 'L', 'Unidades', 'Botella') NOT NULL,
    ing_precio 			INT NOT NULL, 
    PRIMARY KEY (ing_nombre, ing_inv_nom),
    FOREIGN KEY (ing_inv_nom) REFERENCES inventario(inv_nombre)
);

-- Tabla Detalle Orden
CREATE TABLE detalle_orden (
	det_ord_id 		INT NOT NULL,
    det_ord_ing_id	VARCHAR(45) NOT NULL,
    det_ord_cant	INT NOT NULL,
    PRIMARY KEY (det_ord_id, det_ord_ing_id),
    FOREIGN KEY (det_ord_id) REFERENCES orden(ord_id) ON DELETE CASCADE,
    FOREIGN KEY (det_ord_ing_id) REFERENCES ingrediente(ing_nombre)
);

-- Table Requerimiento
CREATE TABLE requerimiento (
	req_ing_nom		VARCHAR(45) NOT NULL,
    req_ite_id		SMALLINT NOT NULL,
    req_cantidad	SMALLINT NOT NULL,
    PRIMARY KEY (req_ing_nom, req_ite_id),
    FOREIGN KEY (req_ing_nom) REFERENCES ingrediente(ing_nombre) ON DELETE CASCADE,
    FOREIGN KEY (req_ite_id) REFERENCES item(ite_id) ON DELETE CASCADE
);

		/* Gestión Clientes y Empleados */

		-- Entidades Fuertes --

-- Tabla Cliente
CREATE TABLE cliente (
	cli_id			BIGINT NOT NULL,
    cli_nombre		VARCHAR(20) NOT NULL,
    cli_apellido	VARCHAR(20) NOT NULL,
    cli_email		VARCHAR(45),
    cli_telefono	BIGINT NOT NULL,
    PRIMARY KEY (cli_id)
);

CREATE TABLE empleado (
    emp_id			BIGINT NOT NULL,  
    emp_nombre		VARCHAR(45) NOT NULL,        
    emp_apellido 	VARCHAR(45) NOT NULL,      
    emp_edad 		SMALLINT NOT NULL,                 
    emp_sexo 		ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,                   
    emp_telefono 	BIGINT NOT NULL,
    PRIMARY KEY (emp_id)
);

		-- Subclases Empleado --

-- Tabla Bartender
CREATE TABLE bartender (
    empleado_id_empleado BIGINT PRIMARY KEY,
    FOREIGN KEY (empleado_id_empleado) REFERENCES empleado(emp_id) ON DELETE CASCADE
);

-- Tabla Mesero
CREATE TABLE mesero (
    empleado_id_empleado BIGINT PRIMARY KEY,
    FOREIGN KEY (Empleado_id_empleado) REFERENCES Empleado(emp_id) ON DELETE CASCADE
);

-- Tabla Cocinero
CREATE TABLE cocinero (
    empleado_id_empleado BIGINT PRIMARY KEY,
    FOREIGN KEY (empleado_id_empleado) REFERENCES empleado(emp_id) ON DELETE CASCADE
);

-- Tabla Cajero
CREATE TABLE cajero (
    empleado_id_empleado BIGINT PRIMARY KEY,
    FOREIGN KEY (empleado_id_empleado) REFERENCES empleado(emp_id) ON DELETE CASCADE
);

		-- Entidades Debiles --
        
-- Tabla Reserva
CREATE TABLE reserva (
	res_id			INT NOT NULL,
    res_cli_id		BIGINT NOT NULL,
    res_num_per		SMALLINT NOT NULL,
    res_descripcion	VARCHAR(100) NOT NULL,
    res_fecha		DATE,
    PRIMARY KEY (res_id, res_cli_id),
    FOREIGN KEY (res_cli_id) REFERENCES cliente(cli_id)
);

-- Tabla Pago
CREATE TABLE Pago (
    pag_id 			INT AUTO_INCREMENT PRIMARY KEY,   
    pag_emp_id 		BIGINT NOT NULL,                 
    pag_fecha 		DATETIME NOT NULL,             
    pag_salario 	INT NOT NULL,                
    pag_estado 		TINYINT NOT NULL,             
    pag_metodo 		ENUM("Efectivo", "Tarjeta", "PSE", "Nequi") NOT NULL,                  
    FOREIGN KEY (pag_emp_id) REFERENCES empleado(emp_id) ON DELETE CASCADE
);

-- Tabla Pedido
CREATE TABLE pedido (
	ped_id			INT NOT NULL AUTO_INCREMENT,
    ped_num_mesa	TINYINT NOT NULL,
    ped_cli_id 		BIGINT NOT NULL,
    ped_mes_id		BIGINT NOT NULL,
    ped_estado		ENUM ('Activo', 'Cerrado'),
    PRIMARY KEY (ped_id),
    FOREIGN KEY (ped_cli_id) REFERENCES cliente(cli_id),
    FOREIGN KEY (ped_mes_id) REFERENCES mesero(empleado_id_empleado)
);

-- Tabla Detalle Pedido
CREATE TABLE detalle_pedido (
	det_ped_id 		INT NOT NULL,
    det_ite_id		SMALLINT NOT NULL,
    det_cant		SMALLINT NOT NULL,
    PRIMARY KEY (det_ped_id, det_ite_id),
    FOREIGN KEY (det_ped_id) REFERENCES pedido(ped_id) ON DELETE CASCADE,
    FOREIGN KEY (det_ite_id) REFERENCES item(ite_id)
);

-- Tabla Factura
CREATE TABLE factura (
	fac_ped_id		INT NOT NULL,
    fac_caj_id		BIGINT NOT NULL,
    fac_tipo_pag 	ENUM("Efectivo", "Tarjeta", "PSE", "Nequi") NOT NULL,
    fac_fecha		DATE NOT NULL,
    fac_propina		INT,
    PRIMARY KEY (fac_ped_id, fac_caj_id),
    FOREIGN KEY (fac_ped_id) REFERENCES pedido(ped_id) ON DELETE CASCADE,
    FOREIGN KEY (fac_caj_id) REFERENCES cajero(empleado_id_empleado)
);

CREATE TABLE usuario (
	usu_id 		VARCHAR(40),
    usu_pas 	VARCHAR(40),
    usu_rol		ENUM('Mesero', 'Cajero', 'Inventario', 'Cliente'),
    PRIMARY KEY (usu_id)
);

