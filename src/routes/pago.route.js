const orden = require('../models/orden');
const pago = require('../models/pagos.model');
const tecnico = require('../models/tecnico');
const servicio = require('../models/servicio');
const costos = require('../models/costos.model');
const path = require('path');
const fs = require('fs');

module.exports = function (app) {
    app.get('/ordenesxpagar/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        var id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;
    
        let script = `SELECT a.id_orden, a.expediente, a.folio_cierre, a.id_status,
                e.nombre_servicio, c.nombre_aseguradora,
                d.orden_status AS estado_orden FROM orden AS a
                LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
                LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
                LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
                LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
                WHERE id_tipo = 1 AND a.id_status > 3 AND a.status_pago = 0`;
        if (id_tecnico > 0) {
            script += ' AND a.id_tecnico = ' + id_tecnico;
        }
        if (fecha_opc > 0) {
            if (fecha_opc <= 2) {
                script += " AND DATE(a.asignada) = '" + fecha + "'";
            } else {
                script += " AND DATE(a.asignada) BETWEEN '" + fecha_inicio + "' AND '" + fecha_fin + "'";
            }
        }
        script += ' ORDER BY a.asignada ASC;'
        //console.log(script);
        orden.getOrdenes(script, (err, data) => {
            if (err) {
                console.log(err);
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
                });
            } else {
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.get('/ordenes_costos/:busqueda', (req, res) => {
        const busqueda = req.params.busqueda;
        pago.getOrdenesCostos(busqueda, (err, data) => {
            if (err) {
                console.log(err);
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
                });
            } else {
                res.json({
                    success: true,
                    data: data
                });
            }
        });

    });
}