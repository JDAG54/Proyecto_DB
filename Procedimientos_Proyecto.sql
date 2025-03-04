use proyecto;
		/* Procedimientos */
DROP PROCEDURE IF EXISTS sp_ver_menu;
DROP PROCEDURE IF EXISTS sp_insertar_pedido_mes;
DROP PROCEDURE IF EXISTS sp_ver_perfil;
DROP PROCEDURE IF EXISTS sp_ver_pago;
DROP PROCEDURE IF EXISTS sp_ver_reservas_dia;
DROP PROCEDURE IF EXISTS sp_ver_mesas_pedido;
DROP PROCEDURE IF EXISTS sp_cambiar_estado;
DROP PROCEDURE IF EXISTS sp_borrar_pedido;
DROP PROCEDURE IF EXISTS sp_insertar_detalle;
DROP PROCEDURE IF EXISTS sp_borrar_detalle;
DROP PROCEDURE IF EXISTS sp_actualizar_detalle;
DROP PROCEDURE IF EXISTS sp_ver_detalle;
DROP FUNCTION IF EXISTS existeCliente;
DROP PROCEDURE IF EXISTS sp_ver_factura;


		-- Mesero --

-- Ver el Menú
DELIMITER $$
CREATE PROCEDURE sp_ver_menu ()
BEGIN
	SELECT * FROM vista_mesero_item;
END $$
DELIMITER ;


-- Comprobar la existencia de un cliente
DELIMITER $$

CREATE FUNCTION existeCliente(p_id_cliente INT)
RETURNS TINYINT
DETERMINISTIC
BEGIN
    DECLARE existe TINYINT DEFAULT 0;
    SELECT COUNT(*) INTO existe
    FROM cliente
    WHERE cli_id = p_id_cliente;
    RETURN IF(existe > 0, 1, 0);
END$$
DELIMITER ;

-- Insertar un Pedido
DELIMITER $$
CREATE PROCEDURE sp_insertar_pedido_mes (
	IN mesa 	TINYINT,
    IN cliente_id 	BIGINT,
    IN mes_id 	BIGINT
    )
BEGIN
	INSERT INTO pedido (ped_num_mesa, ped_cli_id, ped_mes_id, ped_estado) 
    VALUES (mesa, cliente_id, mes_id, 'Activo');
END $$
DELIMITER ;

-- Ver datos del perfil
DELIMITER $$
CREATE PROCEDURE sp_ver_perfil (
	IN identificacion BIGINT
    )
BEGIN
	SELECT * FROM empleado WHERE emp_id = identificacion;
END $$
DELIMITER ;

-- Ver pagos
DELIMITER $$
CREATE PROCEDURE sp_ver_pago (
	IN identificacion BIGINT
)
BEGIN
	SELECT * FROM pago WHERE pag_emp_id = identificacion;
END $$
DELIMITER ;


-- Ver Reservas por día
DELIMITER $$
CREATE PROCEDURE sp_ver_reservas_dia (
	IN dia DATE
)
BEGIN
	SELECT * FROM vista_mesero_reserva WHERE Fecha = dia;
END $$
DELIMITER ; 

-- Ver Facturas
DELIMITER $$
CREATE PROCEDURE sp_ver_factura (
	IN identificacion BIGINT
)
BEGIN
	DECLARE nombre VARCHAR(45);
    SELECT emp_nombre into nombre FROM empleado WHERE emp_id = identificacion;
    SELECT * FROM vista_mesero_factura WHERE mesero = nombre;
END $$
DELIMITER ;

-- Ver mesas que tienen pedidos
DELIMITER $$
CREATE PROCEDURE sp_ver_mesas_pedido ()
BEGIN
	SELECT * FROM vw_mesas_pedidos;
END $$
DELIMITER ;


-- Cambiar el estado de un pedido
DELIMITER $$
CREATE PROCEDURE sp_cambiar_estado (
	IN mesa TINYINT
)
BEGIN
	DECLARE num_pedido INT;
    SELECT ped_id INTO num_pedido FROM pedido WHERE ped_num_mesa = mesa AND ped_estado = 'Activo';
    UPDATE pedido SET ped_estado = 'Cerrado' WHERE ped_id = num_pedido;
END $$
DELIMITER ; 


-- Borrar el Pedido
DELIMITER $$
CREATE PROCEDURE sp_borrar_pedido (
	IN num_mesa TINYINT
)
BEGIN
	DECLARE num_pedido INT;
    SELECT ped_id INTO num_pedido FROM pedido WHERE ped_num_mesa = num_mesa AND ped_estado = 'Activo'; 
	DELETE FROM pedido WHERE ped_id = num_pedido;
END $$
DELIMITER ;

-- Buscar Id Pedido Activo
DELIMITER $$
CREATE FUNCTION fn_buscar_id_pedido_activo(
    num_mesa TINYINT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE num_pedido INT;
    SELECT ped_id INTO num_pedido 
    FROM pedido 
    WHERE ped_num_mesa = num_mesa 
    AND ped_estado = 'Activo' 
    LIMIT 1;
	RETURN num_pedido;
END $$

DELIMITER ;

-- Insertar Detalle Pedido
DELIMITER $$
CREATE PROCEDURE sp_insertar_detalle (
	IN pedido 	INT,
    IN item		SMALLINT,
    IN cantidad	SMALLINT
)
BEGIN
	INSERT INTO detalle_pedido (det_ped_id, det_ite_id, det_cant) 
    VALUES (pedido, item, cantidad);
END $$
DELIMITER ;

-- Borrar un Detalle Pedido
DELIMITER $$
CREATE PROCEDURE sp_borrar_detalle (
	IN pedido 	INT,
    IN item 	SMALLINT
)
BEGIN
	DELETE FROM detalle_pedido WHERE det_ped_id = pedido AND det_ite_id = item;
END $$
DELIMITER ;

-- Actualizar un detalle pedido
DELIMITER $$
CREATE PROCEDURE sp_actualizar_detalle (
	IN pedido 	INT,
    IN item 	SMALLINT,
    IN cantidad	SMALLINT
)
BEGIN
	UPDATE detalle_pedido SET det_cant = cantidad WHERE det_ped_id = pedido AND det_ite_id = item; 
END $$
DELIMITER ;

-- Ver un Detalle Pedido
DELIMITER $$
CREATE PROCEDURE sp_ver_detalle (
	IN pedido INT
)
BEGIN
	SELECT * FROM vw_detalle_pedido WHERE det_ped_id = pedido;
END $$
DELIMITER ;

-- Funcion Obtener el ID del item
DELIMITER $$

CREATE FUNCTION fn_buscar_id_item(
    nombre_item VARCHAR(45)
) RETURNS SMALLINT
DETERMINISTIC
BEGIN
    DECLARE id_item SMALLINT;

    SELECT ite_id INTO id_item
    FROM item
    WHERE ite_nom = nombre_item
    LIMIT 1; -- Por si hay nombres duplicados, aunque lo ideal es que no los haya

    RETURN id_item;
END $$

DELIMITER ;

-- Insertar un Cliente
DELIMITER $$
CREATE PROCEDURE sp_insertar_cliente(
    IN p_cli_id BIGINT,
    IN p_cli_nombre VARCHAR(20),
    IN p_cli_apellido VARCHAR(20),
    IN p_cli_email VARCHAR(45),
    IN p_cli_telefono BIGINT
)
BEGIN
    INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_email, cli_telefono)
    VALUES (p_cli_id, p_cli_nombre, p_cli_apellido, p_cli_email, p_cli_telefono);
END $$
DELIMITER ;


