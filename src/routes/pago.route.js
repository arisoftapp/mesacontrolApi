const orden = require('../models/orden');
const pago = require('../models/pagos.model');
const tecnico = require('../models/tecnico');
const servicio = require('../models/servicio');
const costos = require('../models/costos.model');
const path = require('path');
const fs = require('fs');

module.exports = function (app) {

    app.get('/pagos/:status/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        const status = req.params.status;
        const id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;
        let where = 0;
        let script = `SELECT DISTINCT a.*, CONCAT(c.nombre," ",c.ap_paterno," ", c.ap_materno) AS nombre_tecnico FROM pago AS a
        INNER JOIN orden AS b ON b.id_doc_pago =  a.id_pago
        INNER JOIN tecnico AS c ON b.id_tecnico = c.id_tecnico`;
        if (status > 0) {
            script += ' WHERE status = ' + status;
            where += 1;
        }
        if (id_tecnico > 0) {
            if (where > 0) {
                script += ' AND a.id_tecnico = ' + id_tecnico;
            } else {
                script += ' WHERE a.id_tecnico = ' + id_tecnico;
            }
            
        }
        if (fecha_opc > 0) {
            if (fecha_opc <= 2) {
                if (where > 0) {
                    script += " AND DATE(a.asignada) = '" + fecha + "'";
                } else {
                    script += " WHERE DATE(a.asignada) = '" + fecha + "'";
                }
            } else {
                if (where > 0) {
                    script += " AND DATE(a.asignada) BETWEEN '" + fecha_inicio + "' AND '" + fecha_fin + "'";
                } else {
                    script += " WHERE DATE(a.asignada) BETWEEN '" + fecha_inicio + "' AND '" + fecha_fin + "'";
                }
            }
        }
       
        //console.log(script);
        pago.getPagos(script, (err, data) => {
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

    app.get('/pago/:id_pago', (req, res) => {
        const id_pago = req.params.id_pago;
        let script = `SELECT a.*, a.total AS total_pago, f.forma_pago AS f_pago, b.id_orden, b.expediente, b.folio_cierre, b.asignada, c.*, 
        e.nombre_servicio, CONCAT(d.nombre," ",d.ap_paterno," ", d.ap_materno) AS nombre_tecnico FROM pago AS a 
        INNER JOIN orden AS b ON a.id_pago = b.id_doc_pago 
        INNER JOIN costo AS c ON b.id_orden = c.id_orden 
        INNER JOIN tecnico AS d ON d.id_tecnico = b.id_tecnico
        LEFT JOIN servicio AS e ON b.id_servicio = e.id_servicio 
        LEFT JOIN forma_pago AS f ON a.forma_pago = f.id_pago
        WHERE a.id_pago = ` + id_pago;

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


    app.get('/ordenesxpagar/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        var id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;
    
        let script = `SELECT a.id_orden, a.expediente, a.asignada, a.folio_cierre, a.id_status,
                e.nombre_servicio, c.nombre_aseguradora, f.*,
                d.orden_status AS estado_orden FROM orden AS a
                LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
                LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
                LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
                LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
                LEFT JOIN costo AS f ON a.id_orden = f.id_orden
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
        } else{
            script += " AND DATE(a.asignada) >= '2019-01-01 00:00:00'";
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

    app.post('/pago/:ordenes', (req, res) => {
        const busqueda = req.params.ordenes;
        const pago_data = {
            fecha_registro: req.body.fecha_registro,
            total: req.body.total,
            comentarios: req.body.comentarios
        };
        pago.insertPago(pago_data, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                });
            } else {
                var id = data.insertId;
                pago.updateIdPago(id, busqueda, (err, dta) => {
                    if (err) {
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos del pago.' + err.message
                        });
                    } else {
                        res.json({
                            success: true,
                            data: data
                        });
                    }
                });
            }
        });
    });

    app.put('/documento_pagado/', (req, res) => {
        const id_pago = req.body.id_pago;
        const pago_data = {
            id_pago: req.body[0].id_pago,
            folio: req.body[0].folio,
            fecha_pago: req.body[0].fecha_pago,
            forma_pago: req.body[0].forma_pago,
            total: req.body[0].total,
            comentarios: req.body[0].comentarios
        };
        console.log(req.body[0]);
        pago.updatePago(pago_data, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                });
            } else {
                var id = data.insertId;
                pago.updateOrdenesPagadas(id_pago, (err, dta) => {
                    if (err) {
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar actualizar las ordenes del pago' + err.message
                        });
                    } else {
                        res.json({
                            success: true,
                            data: data
                        });
                    }
                });
            }
        });
    });

    app.post('/upload_comprobante/:id_pago', (req, res) => {
        let images = req.files.image;
        let id_pago = req.params.id_pago;

        let imageData = "UPDATE pago SET url_comprobante ='";
        if (images.length == undefined) {
            var file = images;
            if (file.mimetype == "image/jpeg" || file.mimetype == "image/png" || file.mimetype == "image/gif") {
                //console.log('Formato aceptado');
                try {
                    //file.mv('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/pagos/' + id_pago + '_' + file.name, function (err) {
                    file.mv('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/pagos/' + id_pago + '_' + file.name, function (err) {
                        if (err) {
                            throw (err);
                        }
                        imageData +=  id_pago + '_' + file.name + "' WHERE id_pago = " + id_pago;
                        //console.log(imageData);
                        pago.getPagos(imageData, (err, data) => {
                            if (err) {
                                throw (err);
                            } else {
                                res.json({
                                    success: true,
                                    message: "¡Se recibió el archivo de imagen!"
                                });
                            }
                        })
                    });
                } catch (error) {
                    res.json({
                        success: false,
                        message: error.code + " " + error.message
                    });
                }

            }
        }
    });
}