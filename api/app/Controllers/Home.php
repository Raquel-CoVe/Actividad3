<?php

namespace App\Controllers;

use CodeIgniter\Controller;

class Home extends BaseController
{
    protected $db;

    public function index(): string
    {
        return view('welcome_message');
    } 

    public function clase()
{
    $this->db = \Config\Database::connect();

    // Consulta 1:
    $query_datosTablas = $this->db->query(
        'SELECT u.nombre, u.email, p.producto, p.cantidad, p.fecha_pedido
        FROM usuarios u
        LEFT JOIN pedidos p ON u.id = p.id_usuario
        ORDER BY u.nombre, p.fecha_pedido
        LIMIT 5'
    );

    $datosTablas = $query_datosTablas->getResultArray();

    // Consulta 2:
    $query_numeroPedidos = $this->db->query(
        'SELECT u.nombre, COUNT(p.id) AS numero_de_pedidos
        FROM usuarios u
        LEFT JOIN pedidos p ON u.id = p.id_usuario
        GROUP BY u.nombre
        ORDER BY numero_de_pedidos DESC
        LIMIT 4'
    );

    $numeroPedidos = $query_numeroPedidos->getResultArray();

    // Consulta 3:
    $query_masPedidos = $this->db->query(
        'SELECT u.nombre, u.email, COUNT(p.id) AS numero_de_pedidos
        FROM usuarios u
        LEFT JOIN pedidos p ON u.id = p.id_usuario
        GROUP BY u.id
        ORDER BY numero_de_pedidos DESC
        LIMIT 3'
    );

    $datosTablas = $query_datosTablas->getResultArray();
    $numeroPedidos = $query_numeroPedidos->getResultArray();
    $masPedidos = $query_masPedidos->getResultArray();
    return $this->response->setJSON($masPedidos);
}
}
