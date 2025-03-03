USE proyecto;
DROP ROLE IF EXISTS rol_mesero;
DROP ROLE IF EXISTS rol_cajero;
DROP ROLE IF EXISTS rol_cliente;
DROP ROLE IF EXISTS rol_inventario;
DROP USER IF EXISTS 'mes_camila'@'localhost';
DROP USER IF EXISTS 'mes_juan'@'localhost';
DROP USER IF EXISTS 'mes_santiago'@'localhost';
DROP USER IF EXISTS 'caj_laura'@'localhost';
DROP USER IF EXISTS 'julian_lagos'@'localhost';
DROP USER IF EXISTS 'trilogia'@'localhost';
DROP USER IF EXISTS 'bahia_18'@'localhost';

			/* Roles */
            
			/* Mesero */
            
-- Crear rol para meseros
CREATE ROLE rol_mesero;

	-- Permisos de Mesero--
-- Permiso Vista Item
GRANT SELECT ON vista_mesero_item TO rol_mesero;

-- Permiso Tabla Detalle Pedido
GRANT ALL PRIVILEGES ON detalle_pedido TO rol_mesero;

-- Permiso Tabla Pedido
GRANT ALL PRIVILEGES ON pedido TO rol_mesero;

-- Permiso Vista Clientes
GRANT SELECT ON vista_mesero_cliente TO rol_mesero;

-- Permiso Vista Factura
GRANT SELECT ON vista_mesero_factura TO rol_mesero;

-- Permiso Vista Reserva
GRANT SELECT ON vista_mesero_reserva TO rol_mesero;

-- Permiso Vista Propina Mesero
GRANT SELECT ON propina_mesero TO rol_mesero;

-- Permiso Vista Pedidos Activos
GRANT SELECT ON vw_pedidos_activos TO rol_mesero;

-- Permiso Vista Mesas con Pedido
GRANT SELECT ON vw_mesas_pedidos TO rol_mesero;

-- Permiso Vistas Detalle Pedido
GRANT SELECT ON vw_detalle_pedido TO rol_mesero;

-- Permiso Procedimiento de Ver Perfil
GRANT EXECUTE ON PROCEDURE sp_ver_perfil TO 'rol_mesero';

-- Permiso Procedimiento de Ver Menú
GRANT EXECUTE ON PROCEDURE sp_ver_menu TO 'rol_mesero';

-- Funcion de Existencia de Cliente
GRANT EXECUTE ON FUNCTION existeCliente TO 'rol_mesero';

-- Permiso Procedimiento de Insertar un Pedido
GRANT EXECUTE ON PROCEDURE sp_insertar_pedido_mes TO 'rol_mesero';

-- Permiso Procedimiento de Ver datos del Perfil
GRANT EXECUTE ON PROCEDURE sp_ver_perfil TO 'rol_mesero';

-- Permiso Procedimiento de Ver Pagos
GRANT EXECUTE ON PROCEDURE sp_ver_pago TO 'rol_mesero';

-- Permiso Procedimiento de Ver Reservas por Día
GRANT EXECUTE ON PROCEDURE sp_ver_reservas_dia TO 'rol_mesero';

-- Permiso Procedimiento de Ver Facturas
GRANT EXECUTE ON PROCEDURE sp_ver_factura TO 'rol_mesero';

-- Permiso de Ver las Mesas que tienen Pedidos
GRANT EXECUTE ON PROCEDURE sp_ver_mesas_pedido TO 'rol_mesero';

-- Permiso de cambiar de estado un pedido
GRANT EXECUTE ON PROCEDURE sp_cambiar_estado TO 'rol_mesero';

-- Permiso de Borrar un Pedido
GRANT EXECUTE ON PROCEDURE sp_borrar_pedido TO 'rol_mesero';

-- Permiso de Insertar un Detalle Pedido
GRANT EXECUTE ON PROCEDURE sp_insertar_detalle TO 'rol_mesero';

-- Permiso de Borrar un Detalle Pedido
GRANT EXECUTE ON PROCEDURE sp_borrar_detalle TO 'rol_mesero';

-- Permiso de Actualizar un Detalle Pedido
GRANT EXECUTE ON PROCEDURE sp_actualizar_detalle TO 'rol_mesero';

-- Permiso de Ver un Detalle Pedido
GRANT EXECUTE ON PROCEDURE sp_ver_detalle TO 'rol_mesero';

			/* Cajero */
            
-- Crear rol para cajeros
CREATE ROLE rol_cajero;

-- Permiso Tabla Proveedor
GRANT SELECT ON proveedor TO rol_cajero;

-- Permiso Vista Orden
GRANT SELECT ON vista_cajero_orden TO rol_cajero;

-- Permiso Vista Item
GRANT SELECT ON vista_cajero_item TO rol_cajero;

-- Permiso Tabla Detalle Pedido
GRANT SELECT ON detalle_pedido TO rol_cajero;

-- Permiso Vista Pedido
GRANT SELECT ON vista_cajero_pedido TO rol_cajero;

-- Permiso Tabla Cliente
GRANT ALL PRIVILEGES ON cliente TO rol_cajero;

-- Permiso Tabla Factura
GRANT ALL PRIVILEGES ON factura TO rol_cajero;

-- Permiso Tabla Empleado
GRANT SELECT ON empleado TO rol_cajero;

-- Permiso Tabla Pago
GRANT ALL PRIVILEGES ON pago TO rol_cajero;

-- Permiso Vista Pago Proveedores
GRANT SELECT ON vista_cajero_pago_proveedores TO rol_cajero;

-- Permiso Vista Propinas Mesero
GRANT SELECT ON propina_mesero TO rol_cajero;

-- Permiso Vista Factura Final
GRANT SELECT ON vista_factura_final TO rol_cajero;


			/* Cliente */
            
-- Crear rol para clientes
CREATE ROLE rol_cliente;

-- Permiso Vista Item
GRANT SELECT ON vista_cliente_item TO rol_cliente;

-- Permiso Vista Pedido
GRANT SELECT ON vista_cliente_pedido TO rol_cliente;

-- Permiso Tabla Cliente
GRANT INSERT, SELECT, UPDATE ON cliente TO rol_cliente;

-- Permiso Vista Factura Final
GRANT SELECT ON vista_factura_final TO rol_cliente;

-- Permiso Tabla Reserva
GRANT ALL PRIVILEGES ON reserva TO rol_cliente;

			/* Inventarios */
            
 -- Crear rol para inventarios
CREATE ROLE rol_inventario;

-- Permiso Tabla Proveedor
GRANT ALL PRIVILEGES ON proveedor TO rol_inventario;

-- Permiso Tabla Orden
GRANT ALL PRIVILEGES ON orden TO rol_inventario;

-- Permiso Tabla Detalle Orden
GRANT ALL PRIVILEGES ON detalle_orden TO rol_inventario;

-- Permiso Tabla Ingrediente
GRANT ALL PRIVILEGES ON ingrediente TO rol_inventario;

-- Permiso Tabla Requerimiento
GRANT ALL PRIVILEGES ON requerimiento TO rol_inventario;

-- Permiso Tabla Item
GRANT SELECT ON item TO rol_inventario;


			/* Usuarios */

			/* Mesero */
            
-- Usuario de Camila
CREATE USER 'mes_camila'@'localhost' IDENTIFIED BY '1056789012';
GRANT rol_mesero TO 'mes_camila'@'localhost';
SET DEFAULT ROLE rol_mesero TO 'mes_camila'@'localhost';

-- Usuario de Juan
CREATE USER 'mes_juan'@'localhost' IDENTIFIED BY '1067890123';
GRANT rol_mesero TO 'mes_juan'@'localhost';
SET DEFAULT ROLE rol_mesero TO 'mes_juan'@'localhost';


-- Usuario de Santiago
CREATE USER 'mes_santiago'@'localhost' IDENTIFIED BY '1078901234';
GRANT rol_mesero TO 'mes_santiago'@'localhost';
SET DEFAULT ROLE rol_mesero TO 'mes_santiago'@'localhost';

			/* Cajero */

-- Usuario de Laura
CREATE USER 'caj_laura'@'localhost' IDENTIFIED BY '1045678901';
GRANT rol_cajero TO 'caj_laura'@'localhost';
SET DEFAULT ROLE rol_cajero TO 'caj_laura'@'localhost';

			/* Cliente */

CREATE USER 'julian_lagos'@'localhost' IDENTIFIED BY 'cliente123';
GRANT rol_cliente TO 'julian_lagos'@'localhost';
SET DEFAULT ROLE rol_cliente TO 'julian_lagos'@'localhost';

			/* Inventario */
            
-- Usuario Restaurante
CREATE USER 'trilogia'@'localhost' IDENTIFIED BY 'trilogia123';
GRANT rol_inventario TO 'trilogia'@'localhost';
SET DEFAULT ROLE rol_inventario TO 'trilogia'@'localhost';

-- Usuario Bahía-18
CREATE USER 'bahia_18'@'localhost' IDENTIFIED BY 'bahia123';
GRANT rol_inventario TO 'bahia_18'@'localhost';
SET DEFAULT ROLE rol_inventario TO 'bahia_18'@'localhost';




           