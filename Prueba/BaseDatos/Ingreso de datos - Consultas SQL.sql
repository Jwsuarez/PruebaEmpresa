/*Instrucción para iniciar y usar la base de datos PruebaEmpresa*/
use pruebaempresa;


/*Datos de la tabla Productos*/
INSERT INTO productos VALUES (1, "Lapiz", 8, 600, 1000);
INSERT INTO productos VALUES (2, "Esfero", 16, 800, 1200);
INSERT INTO productos VALUES (3, "Vasos", 50, 500, 800);
INSERT INTO productos VALUES (4, "Detergente", 20, 2000, 3000);
INSERT INTO productos VALUES (5, "Bombas", 100, 200, 300);
INSERT INTO productos VALUES (6, "Cartuchera", 10, 1500, 2000);
INSERT INTO productos VALUES (7, "Cinta", 40, 700, 1000);
INSERT INTO productos VALUES (8, "Cepillo", 18, 1200, 1600);
INSERT INTO productos VALUES (9, "Cuadernos", 30, 2000, 4000);
INSERT INTO productos VALUES (10, "Borradores", 80, 300, 500);


/*Datos de la tabla FacturaCompra*/
INSERT INTO facturacompra VALUES (1, 12000, "2018-02-25");
INSERT INTO facturacompra VALUES (2, 16000, "2018-03-01");
INSERT INTO facturacompra VALUES (3, 30000, "2018-03-03");
INSERT INTO facturacompra VALUES (4, 60000, "2018-03-06");
INSERT INTO facturacompra VALUES (5, 90000, "2018-03-10");
INSERT INTO facturacompra VALUES (6, 30000, "2018-03-13");
INSERT INTO facturacompra VALUES (7, 35000, "2018-03-20");
INSERT INTO facturacompra VALUES (8, 24000, "2018-03-23");
INSERT INTO facturacompra VALUES (9, 100000, "2018-03-25");
INSERT INTO facturacompra VALUES (10, 30000, "2018-03-29");

/*Datos de la tabla Compra*/
INSERT INTO compra VALUES (1, 1, 20, 600);
INSERT INTO compra VALUES (2, 2, 20, 800);
INSERT INTO compra VALUES (3, 3, 60, 500);
INSERT INTO compra VALUES (4, 4, 30, 2000);
INSERT INTO compra VALUES (5, 5, 300, 300);
INSERT INTO compra VALUES (6, 6, 20, 1500);
INSERT INTO compra VALUES (7, 7, 50, 700);
INSERT INTO compra VALUES (8, 8, 20, 1200);
INSERT INTO compra VALUES (9, 9, 50, 2000);
INSERT INTO compra VALUES (10, 10, 100, 300);


/*Datos de la tabla FacturaVenta*/
INSERT INTO facturaventa VALUES (1, 6000, "2018-04-02");
INSERT INTO facturaventa VALUES (2, 6000, "2018-04-04");

INSERT INTO facturaventa VALUES (3, 2400, "2018-04-05");
INSERT INTO facturaventa VALUES (4, 1200, "2018-04-06");
INSERT INTO facturaventa VALUES (5, 1200, "2018-04-07");

INSERT INTO facturaventa VALUES (6, 4000, "2018-04-08");
INSERT INTO facturaventa VALUES (7, 4000, "2018-04-09");

INSERT INTO facturaventa VALUES (8, 12000, "2018-04-10");
INSERT INTO facturaventa VALUES (9, 12000, "2018-04-11");
INSERT INTO facturaventa VALUES (10, 6000, "2018-04-12");

INSERT INTO facturaventa VALUES (11, 6000, "2018-04-14");
INSERT INTO facturaventa VALUES (12, 12000, "2018-04-15");
INSERT INTO facturaventa VALUES (13, 3000, "2018-04-17");
INSERT INTO facturaventa VALUES (14, 9000, "2018-04-19");
INSERT INTO facturaventa VALUES (15, 10000, "2018-04-20");

INSERT INTO facturaventa VALUES (16, 10000, "2018-04-25");
INSERT INTO facturaventa VALUES (17, 5000, "2018-05-03");
INSERT INTO facturaventa VALUES (18, 5000, "2018-05-05");
INSERT INTO facturaventa VALUES (19, 3200, "2018-05-06");

INSERT INTO facturaventa VALUES (20, 40000, "2018-05-09");
INSERT INTO facturaventa VALUES (21, 30000, "2018-05-12");
INSERT INTO facturaventa VALUES (22, 10000, "2018-05-13");

INSERT INTO facturaventa VALUES (23, 4000, "2018-05-15");
INSERT INTO facturaventa VALUES (24, 2500, "2018-05-18");
INSERT INTO facturaventa VALUES (25, 3500, "2018-05-20");

/*Datos de la tabla Venta*/
INSERT INTO venta VALUES (1, 1, 6, 1000);
INSERT INTO venta VALUES (1, 2, 6, 1000);

INSERT INTO venta VALUES (2, 3, 2, 1200);
INSERT INTO venta VALUES (2, 4, 1, 1200);
INSERT INTO venta VALUES (2, 5, 1, 1200);

INSERT INTO venta VALUES (3, 6, 5, 800);
INSERT INTO venta VALUES (3, 7, 5, 800);

INSERT INTO venta VALUES (4, 8, 4, 3000);
INSERT INTO venta VALUES (4, 9, 4, 3000);
INSERT INTO venta VALUES (4, 10, 2, 3000);

INSERT INTO venta VALUES (5, 11, 20, 300);
INSERT INTO venta VALUES (5, 12, 40, 300);
INSERT INTO venta VALUES (5, 13, 10, 300);
INSERT INTO venta VALUES (5, 14, 30, 300);

INSERT INTO venta VALUES (6, 15, 5, 2000);
INSERT INTO venta VALUES (6, 16, 5, 2000);

INSERT INTO venta VALUES (7, 17, 5, 1000);
INSERT INTO venta VALUES (7, 18, 5, 1000);

INSERT INTO venta VALUES (8, 19, 2, 1600);

INSERT INTO venta VALUES (9, 20, 10, 4000);
INSERT INTO venta VALUES (9, 21, 6, 4000);
INSERT INTO venta VALUES (9, 22, 4, 4000);

INSERT INTO venta VALUES (10, 23, 8, 500);
INSERT INTO venta VALUES (10, 24, 5, 500);
INSERT INTO venta VALUES (10, 15, 7, 500);


/*Consultas*/
SELECT * FROM productos;

SELECT * FROM compra;
SELECT * FROM facturacompra;

SELECT * FROM venta;
SELECT * FROM facturaventa;


/*Consulta SQL - ejercicio*/
SELECT productos.idProductos, productos.nombre, productos.cantidad, facturaventa.fechaVenta
	FROM productos, facturaventa
	WHERE facturaventa.fechaVenta < '2018-04-03';


/**/
SELECT productos.idProductos, productos.nombre, productos.cantidad, facturaventa.fechaVenta,
    SUM(facturaventa.total) AS IngresoVenta
	
    FROM productos, facturaventa

	INNER JOIN venta ON venta.idProductos = facturaventa.idFacturaVenta

	WHERE facturaventa.fechaVenta < "2018-06-03";


/**/
SELECT productos.idProductos, productos.nombre, productos.cantidad, facturaventa.fechaVenta,
    SUM(facturaventa.total) AS IngresoVenta
	
    FROM productos, facturaventa

	INNER JOIN venta ON venta.idProductos = facturaventa.idFacturaVenta

	WHERE facturaventa.fechaVenta BETWEEN '2018-01-03' AND '2018-06-03';


/**/
SELECT productos.idProductos, productos.nombre, productos.cantidad,
    SUM(productos.precioVenta) AS IngresoVenta
	
    FROM productos, facturaventa

	WHERE facturaventa.fechaVenta BETWEEN '2018-01-03' AND '2018-06-03';

