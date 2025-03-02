use proyecto;

		/* Poblamiento de Datos */
        
-- Tabla Proveedores
INSERT INTO proveedor (pro_id, pro_nombre, pro_apellido, pro_email, pro_direc, pro_tel) VALUES
(1012345678, 'Carlos', 'Hernández', 'carlos.hernandez@proveedores.co', 'Cra 10 #25-30, Bogotá', 3209876543),
(1023456789, 'Luisa', 'Ramírez', 'luisa.ramirez@proveedores.co', 'Cl 45 #12-50, Medellín', 3148765432),
(1034567890, 'Andrés', 'López', 'andres.lopez@proveedores.co', 'Av. Ciudad de Cali #23-60, Cali', 3123456789),
(1045678901, 'Diana', 'Gómez', 'diana.gomez@proveedores.co', 'Cl 15 #5-20, Barranquilla', 3009876543),
(1056789012, 'Camila', 'Martínez', 'camila.martinez@proveedores.co', 'Cra 7 #18-40, Cartagena', 3158765432);

-- Tabla Inventarios
INSERT INTO inventario (inv_nombre, inv_ultima_act) VALUES 
("Trilogia", '2025-01-15'),
('Bahía 18', '2025-02-09');

-- Tabla Items
INSERT INTO item (ite_id, ite_nom, ite_descrip, ite_precio, ite_tipo) VALUES
(1, 'Burger De la Casa', 'Pan trilogía, 180 gr de carne, vegetales frescos, queso mozarela, bacon, chicharrón, topping de Nuggets', 23000, 'Comida'),
(2, 'Burger Española', 'Pan trilogía, 180 gr carne, vegetales frescos, carnes maduradas, queso paipa, queso mozzarella', 23000, 'Comida'),
(3, 'Burger Americana', 'Pan, 180 gr de carne, queso cheddar, vegetales frescos, bacon, salsas', 16000, 'Comida'),
(4, 'Burger Colombiana', 'Pan, 180 gr de carne, queso mozzarella, plátano maduro, chicharrón, hogao, queso paipa, vegetales frescos, huevo', 24000, 'Comida'),
(5, 'Burger Italiana', 'Pan, 180 gr de carne, queso mozzarella, tomate Cherry glaseado, albahaca, rúgula, queso búfala, cebolla morada', 23000, 'Comida'),
(6, 'Burger Mexicana', 'Pan, 180 gr de carne, salsa de totopos, queso mozzarella, esquites, aguacate, jalapeños, pico de gallo, rúgula', 23000, 'Comida'),
(7, 'Burger Argentina', 'Pan, 180 gr de carne, queso paipa, vegetales frescos, chorizo de cerdo, chimichurri', 23000, 'Comida'),
(8, 'Burger de Pollo', 'Pan, 160 gr de pechuga apanada, vegetales frescos, Salsa Alioli, queso mozzarella, queso cheddar', 17000, 'Comida'),
(9, 'Burger Mixta', 'Pan, 180 gr de carne de res, 160 gr de pechuga apanada, vegetales frescos, alioli, salsa de totopos, queso mozzarella, queso paipa', 23000, 'Comida'),
(10, 'Burger Mini', 'Pan, 80 gr de carne, bacon, queso mozzarella', 10000, 'Comida'),
(11, 'Perro De la Casa', 'Pan, salchicha americana, cebolla, salsa de totopos, queso mozzarella, aguacate, nachos', 18000, 'Comida'),
(12, 'Perro Americano', 'Pan, salchicha, queso mozzarella, bacon, champiñón, alioli', 16000, 'Comida'),
(13, 'Salchipapas De la Casa', 'Salchicha americana, carne en cubos, chip de plátano, Nuggets, papa francesa, queso', 17000, 'Comida'),
(14, 'Salchipapas Mexicana', 'Salchicha americana, papa francesa, aguacate, pico de gallo, totopos, tajín y salsa de nachos, queso', 17000, 'Comida'),
(15, 'Choripapa', 'Chorizo de cerdo, papa criolla, plátano maduro, chicharrón, ají, chimichurri, queso fundido', 19000, 'Comida'),
(16, 'Papa Espiral Trilogía', 'Tres espirales de papa con tres toppings a elegir', 8000, 'Comida'),
(17, 'Cajita Feliz', 'Mini Burger, Papa Francesa, Helado', 18000, 'Comida'),
(18, 'Picada De la Casa', 'Carne de res, pollo, cerdo, chorizo artesanal, chip de plátano, papa criolla, papa francesa, ají, chimichurri', 28000, 'Comida'),
(19, 'Fetuccini Tres Quesos', '160 gr de fetuccini en salsa de tres quesos, acompañado de pan y papa francesa', 36000, 'Comida'),
(20, 'Fetuccini Carbonara', '160 gr de fetuccini en salsa carbonara, queso rallado, porción de pan', 38000, 'Comida'),
(21, 'Fetuccini Boloñesa', '160 gr de fetuccini en salsa con carne molida, queso rallado y porción de pan', 40000, 'Comida'),
(22, 'Churrasco Argentino', '400 gr de carne a la parrilla, chimichurri argentino, puré de papa, ensalada de la casa', 38000, 'Comida'),
(23, 'Baby Beef', '400 gr de baby beef a la parrilla, chimichurri, puré de papa, ensalada de la casa', 38000, 'Comida'),
(24, 'Ribeye', '400 gr de ribeye de primera parrillado, chimichurri, puré de papa, ensalada', 40000, 'Comida'),
(25, 'New York', '400 gr de carne seleccionada, chimichurri, puré de papa, ensalada de la casa', 38000, 'Comida'),
(26, 'Chuletón Parrillado', '400 gr de chuletón parrillado, puré de papa, ensalada de la casa, acompañado de salsas de la casa', 35000, 'Comida'),
(27, 'Costillas', '400 gr de costilla, puré de papa, ensalada de la casa, acompañado de salsas', 35000, 'Comida'),
(28, 'Lomo de Cerdo', '350 gr de lomo de cerdo, puré de papa, ensalada de la casa, acompañado de salsas', 35000, 'Comida'),
(29, 'Pechuga de Pollo', '350 gr de pechuga parrillada, puré de papa, ensalada, acompañado de salsas', 31000, 'Comida'),
(30, 'Pechuga Rellena', '350 gr de pechuga parrillada, rellena de espinaca, queso, bacon, puré de papa, ensalada de la casa y salsas', 35000, 'Comida'),
(31, 'Salmón', '300 gr de salmón a la parrilla, puré de papa, ensalada de la casa', 45000, 'Comida'),
(32, 'Mojarra', '400 gr de mojarra en papillote, puré de papa, ensalada de la casa', 35000, 'Comida'),
(33, 'Trucha Gratinada', '450 gr de trucha gratinada, acompañado de puré de papa y ensalada', 36000, 'Comida'),
(34, 'Trucha a la Plancha', '450 gr de trucha, puré de papa, ensalada de la casa', 35000, 'Comida'),
(35, 'Pollo Apanado', '150 gr de Nuggets, acompañado de papa francesa', 31000, 'Comida'),
(36, 'Chicharrones', '180 gr de panceta crocante acompañado de papa criolla', 28000, 'Comida'),
(37, 'Empanadas de la Casa', 'Empanadas (x3) acompañadas de hogao de la casa', 28000, 'Comida'),
(38, 'Chip de Plátano', '50 gr de chips de plátano, acompañado de hogao de la casa', 28000, 'Comida'),
(39, 'Picada de la Casa', 'Carne de res, pollo, cerdo, chorizo artesanal, chip de platano, papa francesa, ají, chimichurri', 28000, 'Comida'),
(40, 'Mojito Tropical', 'Ron blanco, hierbabuena, jugo de maracuyá, limón, soda y azúcar', 18000, 'Bebida'),
(41, 'Sunset Margarita', 'Tequila, licor de naranja, jugo de toronja, jugo de limón y granadina', 20000, 'Bebida'),
(42, 'Piña Colada', 'Ron blanco, crema de coco, jugo de piña, hielo y leche condensada', 22000, 'Bebida'),
(43, 'Cuba Libre Especial', 'Ron añejo, cola, limón, angostura y hielo', 19000, 'Bebida'),
(44, 'Caipirinha Frutos Rojos', 'Cachaça, fresas, moras, azúcar y jugo de limón', 21000, 'Bebida'),
(45, 'Gin Tonic de la Casa', 'Ginebra premium, agua tónica, rodajas de pepino y romero', 23000, 'Bebida'),
(46, 'Martini de Lulo', 'Vodka, licor de lulo, azúcar y jugo de limón', 25000, 'Bebida'),
(47, 'Blue Lagoon', 'Vodka, licor de curazao azul, jugo de limón y soda', 20000, 'Bebida'),
(48, 'Gaseosa', 'Productos coca-cola y postobon', 5000, 'Bebida'),
(49, 'Limonada Natural', '', 7000, 'Bebida'),
(50, 'Cerezada', '', 9000, 'Bebida'),
(51, 'Limonada de Coco', '', 10000, 'Bebida'),
(52, 'Cerveza', 'Productos nacionales e importados', 6000, 'Bebida');


-- Tabla Ingredientes
INSERT INTO ingrediente (ing_nombre, ing_inv_nom, ing_cant_disponible, ing_medicion, ing_precio) VALUES
('Carne de res', 'Trilogia', 50, 'Kg', 10000),
('Pollo', 'Trilogia', 60, 'Kg', 8000),
('Cerdo', 'Trilogia', null, 'Kg', 9000),
('Chorizo artesanal', 'Trilogia', 30, 'Unidades', 5000),
('Plátano maduro', 'Trilogia', 45, 'Unidades', 2000),
('Papa criolla', 'Trilogia', 80, 'Unidades', 1500),
('Papa francesa', 'Trilogia', 100, 'Unidades', 1200),
('Queso mozzarella', 'Trilogia', 70, 'Kg', 7000),
('Queso paipa', 'Trilogia', 50, 'Kg', 6000),
('Queso cheddar', 'Trilogia', 60, 'Kg', 6500),
('Hogao', 'Trilogia', 30, 'L', 3000),
('Chimichurri', 'Trilogia', 40, 'L', 3500),
('Salsa alioli', 'Trilogia', 50, 'L', 4000),
('Salsa de totopos', 'Trilogia', 35, 'L', 2500),
('Aguacate', 'Trilogia', 25, 'Unidades', 3000),
('Cebolla morada', 'Trilogia', 55, 'Unidades', 1000),
('Champiñones', 'Trilogia', 40, 'Unidades', 2000),
('Tomate cherry', 'Trilogia', 30, 'Unidades', 2500),
('Rúgula', 'Trilogia', 20, 'Unidades', 1500),
('Espinaca', 'Trilogia', 25, 'Unidades', 1800),
('Ron blanco', 'Bahía 18', 15, 'Botella', 12000),
('Ron añejo', 'Bahía 18', 10, 'Botella', 15000),
('Tequila', 'Bahía 18', 12, 'Botella', 10000),
('Vodka', 'Bahía 18', 18, 'Botella', 9000),
('Ginebra', 'Bahía 18', 14, 'Botella', 11000),
('Licor de naranja', 'Bahía 18', 20, 'Botella', 8000),
('Curazao azul', 'Bahía 18', 10, 'Botella', 7000),
('Jugo de limón', 'Bahía 18', 25, 'L', 2000),
('Hierbabuena', 'Bahía 18', 30, 'Unidades', 1000),
('Azúcar', 'Bahía 18', 40, 'Kg', 1500);

-- Tabla Orden
INSERT INTO orden (ord_pro_id, ord_fecha, ord_entrega) VALUES
(1012345678, '2025-02-01', '2025-02-05'),
(1023456789, '2025-02-03', '2025-02-07'),
(1034567890, '2025-02-05', '2025-02-10'),
(1045678901, '2025-02-07', NULL),  
(1056789012, '2025-02-09', '2025-02-14'),
(1012345678, '2025-02-10', '2025-02-15'),
(1023456789, '2025-02-12', NULL), 
(1034567890, '2025-02-14', '2025-02-19'),
(1045678901, '2025-02-16', '2025-02-21'),
(1056789012, '2025-02-18', NULL);

-- Tabla Detalle Orden
INSERT INTO detalle_orden (det_ord_id, det_ord_ing_id, det_ord_cant) VALUES
(1, 'Carne de res', 10),
(1, 'Papa criolla', 20),
(2, 'Pollo', 15),
(2, 'Queso mozzarella', 5),
(3, 'Chorizo artesanal', 12),
(3, 'Plátano maduro', 18),
(4, 'Queso cheddar', 8),
(5, 'Hogao', 5),
(5, 'Chimichurri', 7),
(6, 'Salsa alioli', 10),
(6, 'Aguacate', 6),
(7, 'Cebolla morada', 12),
(7, 'Champiñones', 8),
(8, 'Tequila', 4),
(8, 'Ron blanco', 6),
(9, 'Ginebra', 5),
(9, 'Jugo de limón', 10),
(10, 'Azúcar', 8);

-- Tabla Requerimiento
INSERT INTO requerimiento (req_ing_nom, req_ite_id, req_cantidad) VALUES
('Carne de res', 1, 180),
('Queso mozzarella', 1, 50),
('Carne de res', 2, 180),
('Queso paipa', 2, 50),
('Chorizo artesanal', 7, 1),
('Chimichurri', 7, 10),
('Papa criolla', 15, 10),
('Hierbabuena', 40, 5);


 

-- Tabla Cliente
INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_email, cli_telefono) VALUES
(1052348547, "Mayté", "Aponte", "maponte@gmail.com", 3176589087),
(1001564784, "Julián", "Lagos", "jlagos@gmail.com", 3228535693),
(1002970777, "John", "Díaz", "jdiaz@gmail.com", 3134486048),
(1001578932, "David", "Pérez", "dperez@gmail.com", 3122458899), 
(6668374533, "Christopher", "Bumpstead", "cbum@gmail.com", 3009884567), 
(1000000000, "Cristian", "Caicedo", "ccaicedo@gmail.com", 3229947511),
(1052399404, "María", "Goméz", "mgomez@gmail.com", 3195436960);

-- Tabla Empleados
INSERT INTO empleado (emp_id, emp_nombre, emp_apellido, emp_edad, emp_sexo, emp_telefono) VALUES
(1012345678, 'Andrés', 'Gómez', 32, 'Masculino', 3209876543),
(1023456789, 'María', 'Ramírez', 28, 'Femenino', 3148765432),
(1034567890, 'Julián', 'López', 25, 'Masculino', 3123456789),
(1045678901, 'Laura', 'Hernández', 30, 'Femenino', 3009876543),
(1056789012, 'Camila', 'Martínez', 27, 'Femenino', 3158765432),
(1067890123, 'Juan', 'Pérez', 35, 'Masculino', 3224567890),
(1078901234, 'Santiago', 'Torres', 40, 'Masculino', 3017654321);

-- Tabla Bartender
INSERT INTO bartender (empleado_id_empleado) VALUES 
(1034567890);

-- Tabla Mesero
INSERT INTO mesero (empleado_id_empleado) VALUES
(1067890123),
(1078901234),
(1056789012);

-- Tabla Cocinero
INSERT INTO cocinero (empleado_id_empleado) VALUES
(1012345678),
(1023456789);

-- Tabla Cajero
INSERT INTO cajero (empleado_id_empleado) VALUES
(1045678901);

-- Tabla Reserva
INSERT INTO reserva (res_id, res_cli_id, res_num_per, res_descripcion, res_fecha) VALUES
(1, 1052348547, 4, 'Reserva para cena familiar', '2025-03-15'),
(2, 1001564784, 2, 'Cena romántica con decoración especial', '2025-03-20'),
(3, 1002970777, 6, 'Reserva para cumpleaños', '2025-03-25');

-- Tabla Pago
INSERT INTO Pago (pag_emp_id, pag_fecha, pag_salario, pag_estado, pag_metodo) VALUES
-- Cocineros
(1012345678, '2025-03-01 14:00:00', 2800000, 1, 'Nequi'),
(1023456789, '2025-03-01 14:15:00', 2700000, 1, 'PSE'),

-- Bartender
(1034567890, '2025-03-01 14:30:00', 2500000, 1, 'Tarjeta'),

-- Cajero
(1045678901, '2025-03-01 14:45:00', 2600000, 1, 'Efectivo'),

-- Meseros
(1056789012, '2025-03-01 15:00:00', 2300000, 1, 'Nequi'),
(1067890123, '2025-03-01 15:15:00', 2400000, 1, 'PSE'),
(1078901234, '2025-03-01 15:30:00', 2500000, 1, 'Tarjeta');

-- Tabla Pedido
INSERT INTO pedido (ped_id, ped_num_mesa, ped_cli_id, ped_mes_id, ped_estado) VALUES
(1, 5, 1052348547, 1056789012, 'Activo'),
(2, 9, 1001564784, 1067890123, 'Activo'),  
(3, 3, 1002970777, 1078901234, 'Activo'),  
(4, 7, 1001578932, 1056789012, 'Activo'),  
(5, 2, 6668374533, 1067890123, 'Activo'), 
(6, 8, 1000000000, 1078901234, 'Activo'),  
(7, 4, 1052399404, 1056789012, 'Activo'); 

-- Tabla Detalle Pedido
INSERT INTO detalle_pedido (det_ped_id, det_ite_id, det_cant) VALUES
(1, 1, 2),
(1, 40, 1),
(1, 48, 2),
(2, 3, 1),
(2, 8, 1),
(2, 52, 3),
(3, 4, 1),
(3, 15, 1),
(3, 49, 2),
(4, 5, 2),
(4, 19, 1),
(4, 41, 1),
(5, 6, 1),
(5, 22, 1),
(5, 45, 2),
(6, 7, 1),
(6, 27, 1),
(6, 50, 2),
(7, 10, 3),
(7, 37, 1),
(7, 51, 2);

-- Tabla Factura
INSERT INTO factura (fac_ped_id, fac_caj_id, fac_tipo_pag, fac_fecha, fac_propina) VALUES
(1, 1045678901, 'Efectivo', '2023-10-05', 2000),
(2, 1045678901, 'Tarjeta', '2023-10-05', NULL),
(3, 1045678901, 'PSE', '2023-10-15', 1500),
(4, 1045678901, 'Nequi', '2023-10-20', 1000),
(5, 1045678901, 'Efectivo', '2023-10-25', NULL),
(6, 1045678901, 'Tarjeta', '2023-10-28', 3000),
(7, 1045678901, 'Efectivo', '2023-10-30', 2500);




