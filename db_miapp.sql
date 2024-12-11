-- Crear la base de datos
CREATE DATABASE db_miapp;

-- Crear la tabla usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

-- Crear la tabla pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id),
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    fecha_pedido DATE NOT NULL
);

-- Insertar registros en la tabla usuarios
INSERT INTO usuarios (nombre, email, fecha_registro) VALUES
('Juan Perez', 'juan.perez@example.com', '2023-01-01'),
('Maria Lopez', 'maria.lopez@example.com', '2023-01-05'),
('Carlos Sanchez', 'carlos.sanchez@example.com', '2023-01-10'),
('Ana Gomez', 'ana.gomez@example.com', '2023-01-15'),
('Luis Fernandez', 'luis.fernandez@example.com', '2023-01-20'),
('Elena Martinez', 'elena.martinez@example.com', '2023-01-25'),
('Jose Ramirez', 'jose.ramirez@example.com', '2023-02-01'),
('Laura Torres', 'laura.torres@example.com', '2023-02-05'),
('Diego Rivera', 'diego.rivera@example.com', '2023-02-10'),
('Sofia Morales', 'sofia.morales@example.com', '2023-02-15');

-- Insertar registros en la tabla pedidos
INSERT INTO pedidos (id_usuario, producto, cantidad, fecha_pedido) VALUES
(1, 'Laptop', 1, '2023-02-01'),
(2, 'Smartphone', 2, '2023-02-02'),
(3, 'Tablet', 1, '2023-02-03'),
(4, 'Monitor', 2, '2023-02-04'),
(5, 'Teclado', 3, '2023-02-05'),
(6, 'Ratón', 1, '2023-02-06'),
(7, 'Impresora', 2, '2023-02-07'),
(8, 'Cámara', 1, '2023-02-08'),
(9, 'Auriculares', 2, '2023-02-09'),
(10, 'Micrófono', 1, '2023-02-10');


select * from usuarios;
select * from pedidos;

SELECT u.nombre, u.email, p.producto, p.cantidad, p.fecha_pedido
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.id_usuario
ORDER BY u.nombre, p.fecha_pedido
limit 5;

SELECT u.nombre, COUNT(p.id) AS numero_de_pedidos
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.id_usuario
GROUP BY u.nombre
ORDER BY numero_de_pedidos desc
limit 4;


SELECT u.nombre, u.email, COUNT(p.id) AS numero_de_pedidos
FROM usuarios u
LEFT JOIN pedidos p ON u.id = p.id_usuario
GROUP BY u.id
ORDER BY numero_de_pedidos DESC
LIMIT 3;
