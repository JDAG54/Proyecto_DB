				/* Vistas */
USE proyecto;

		-- Vistas Generales --
-- Propina correspondiente a cada Mesero
CREATE VIEW propina_mesero AS
SELECT emp_nombre AS Nombre, 
	   sum(fac_propina) AS Propina
FROM empleado 
JOIN mesero 
	ON (emp_id = empleado_id_empleado) 
JOIN pedido 
	ON (ped_mes_id = empleado_id_empleado) 
JOIN factura 
	ON (fac_ped_id = ped_id) 
GROUP BY emp_nombre;

-- Consulta Factura Final
CREATE VIEW vista_factura_final AS
SELECT fac_ped_id AS Pedido,
	   fac_caj_id AS ID_Cajero,
       emp_nombre AS Cajero,
       fac_tipo_pag AS Tipo_Pago,
       fac_fecha AS Fecha,
       fac_propina AS Propina,
       Valor_total
FROM factura 
JOIN empleado
	ON (emp_id = fac_caj_id)
JOIN (SELECT ped_id AS num, 
	   sum(ite_precio * det_cant) AS Valor_Total 
FROM pedido 
JOIN detalle_pedido 
	ON (det_ped_id = ped_id) 
JOIN item 
	ON (ite_id = det_ite_id) 
GROUP BY ped_id) 
	AS precio
    ON (fac_ped_id = num);

		-- Vistas Mesero --
-- Consulta tabla Item
CREATE VIEW vista_mesero_item AS 
SELECT ite_nom AS Producto, 
	   ite_descrip AS Descripcion, 
       ite_precio AS Precio 
       FROM item;
                  
-- Consulta tabla Cliente
CREATE VIEW vista_mesero_cliente AS
SELECT cli_id AS Identificacion, 
	   cli_nombre AS Nombre, 
       cli_apellido AS Apellido 
       FROM cliente;
                   
-- Consulta tabla Factura
CREATE VIEW vista_mesero_factura AS 
SELECT emp_nombre AS Mesero, 
	   ped_num_mesa AS Mesa, 
       fac_ped_id AS Pedido, 
       fac_fecha AS Fecha, 
       fac_propina AS Propina 
       FROM factura 
       JOIN pedido 
			ON (fac_ped_id = ped_id) 
	   JOIN empleado 
			ON (emp_id = ped_mes_id);
            
-- Consulta tabla Reserva
CREATE VIEW vista_mesero_reserva AS
SELECT cli_nombre AS Cliente, 
	   res_num_per AS Personas, 
	   res_descripcion AS Descripcion, 
       res_fecha AS Fecha
       FROM reserva
       JOIN cliente 
			ON (cli_id = res_cli_id);
-- Pedidos Activos
CREATE VIEW vw_pedidos_activos AS
SELECT * FROM pedido WHERE ped_estado = 'Activo';

-- Mesas con Pedidos
CREATE VIEW vw_mesas_pedidos AS
SELECT ped_num_mesa FROM pedido WHERE ped_estado = 'Activo';
     
		-- Vistas Cajero --
-- Consulta Orden
CREATE VIEW vista_cajero_orden AS
SELECT DISTINCT orden.ord_id AS Orden, 
	   pro_id AS Identificacion,
       pro_nombre AS Nombre_Proveedor,
       pro_Apellido AS Apellido_Proveedor, 
       ord_entrega AS Fecha_Entrega,
       Pago
       FROM proveedor 
       JOIN orden
			ON (pro_id = ord_pro_id)
       JOIN detalle_orden 
			ON (det_ord_id = orden.ord_id)
	   JOIN (SELECT ord_id, sum(ing_precio * det_ord_cant) AS Pago 
			 FROM orden 
             JOIN detalle_orden 
				  ON (det_ord_id = ord_id) 
			 JOIN ingrediente 
				  ON (det_ord_ing_id = ing_nombre) 
			 GROUP BY ord_id) 
             AS pagos
             ON (pagos.ord_id = det_ord_id);

-- Consulta Item
CREATE VIEW vista_cajero_item AS
SELECT ite_nom AS Producto, 
	   ite_precio AS Precio, 
       ite_tipo AS Tipo 
       FROM item;

-- Consulta Pedido
CREATE VIEW vista_cajero_pedido AS
SELECT ped_id AS Num_Pedido, 
	   ped_num_mesa AS Mesa, 
       ped_cli_id AS ID_Cliente,
       emp_nombre AS Mesero
       FROM pedido 
       JOIN empleado
			ON (emp_id = ped_mes_id);

-- Pago Proveedores
CREATE VIEW vista_cajero_pago_proveedores AS
SELECT pro_nombre AS Nombre,
	   ord_id AS Orden, 
       pago AS Pago 
FROM proveedor 
JOIN orden 
	ON (pro_id = ord_pro_id) 
JOIN (SELECT det_ord_id, 
			sum(ing_precio * det_ord_cant) AS pago 
	  FROM detalle_orden 
      JOIN ingrediente 
		ON (det_ord_ing_id = ing_nombre) 
	  GROUP BY det_ord_id) 
AS costo 
	ON (costo.det_ord_id = ord_id);

		-- Vistas Cliente --
-- Consulta Item
CREATE VIEW vista_cliente_item AS
SELECT ite_nom AS Producto,
	   ite_descrip AS Descripcion,
       ite_precio AS Precio,
       ite_tipo AS Tipo
FROM item;

-- Consulta Pedido
CREATE VIEW vista_cliente_pedido AS
SELECT ped_id AS Pedido,
	   ite_nom AS Producto,
       ite_precio AS Precio,
       det_cant AS Cantidad
FROM pedido
JOIN detalle_pedido
	ON (det_ped_id = ped_id)
JOIN item
	ON (ite_id = det_ite_id)
ORDER BY Pedido;






