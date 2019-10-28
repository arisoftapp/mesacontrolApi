const orden = require('../models/orden_interna.model');

module.exports = function (app) {
    app.get('/ordenes_internas/:id_status/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        const decoded = req.decoded;
        const id_status = req.params.id_status;
        const id_aseguradora = req.params.id_aseguradora;
        var id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;
        //console.log(decoded);
        if (decoded.tipo == 3) {
            id_tecnico = decoded.id;
        }
        let script = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        e.nombre_servicio, a.calle, a.num_int, a.num_ext, a.recibe_nombre, a.recibe_paterno, a.recibe_materno,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio WHERE id_tipo = 2`;
        if (id_status > 0) {
            if (decoded.tipo == 3) {
                script += ' AND a.id_status < ' + '5';
            } else {
                script += ' AND a.id_status = ' + id_status;
            }
        }
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
        script += ' ORDER BY a.id_status ASC, a.asignada ASC;'
        console.log(script);
        orden.getOrdenes(script, (err, data) => {
            if (err) {
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

    app.get('/ordenes_internas_buscar/:buscar', (req, res) => {
        var buscar = req.params.buscar;
        const decoded = req.decoded;
        //console.log(decoded);
        if (decoded.tipo == 3){ 
            orden.getOrdenesBuscarbyTecnico(buscar, decoded.id, (err, data) => {
                if (err) {
                    res.json({
                        success: false,
                        message: "Ocurrió un error al obtener los datos"
                    });
                } else{
                    res.json({
                        success: true,
                        data: data
                    });
                }
            });
        } else {
            orden.getOrdenesBuscar(buscar, (err, data) => {
                if (err) {
                    res.json({
                        success: false,
                        message: "Ocurrió un error al obtener los datos"
                    });
                } else{
                    res.json({
                        success: true,
                        data: data
                    });
                }
            });
        }        
    });

    app.get('/orden_interna/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        //console.log(req.params);
        orden.getOrden(id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
                });
            } else{
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.post('/orden_interna', (req, res) => {
        let max;
        orden.getMaxId( (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            } else {
                max = data[0].mayor + 1;
                console.log(max);
                orden.getMaxExpInt((err,data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err
                        });
                    } else {
                        let expediente = Number(data[0].mayor) + 1;
                        const ordenData = {
                            id_tipo : 2,
                            id_orden : max,
                            expediente : expediente,
                            descripcion  : req.body.descripcion,
                            id_servicio : req.body.id_servicio,
                            id_aseguradora : 0,
                            recibe_benef : req.body.recibe_benef,
                            recibe_nombre  : req.body.recibe_nombre,
                            recibe_materno  : req.body.recibe_paterno,
                            recibe_paterno  : req.body.recibe_materno,
                            recibe_tel: req.body.recibe_tel,
                            id_tecnico  : req.body.id_tecnico,
                            asignada : req.body.asignada,
                            calle  : req.body.calle,
                            num_ext  : req.body.num_ext,
                            num_int  : req.body.num_int,
                            col  : req.body.col,
                            id_municipio  : req.body.id_municipio,
                            id_estado  : req.body.id_estado,
                            entre_calle1  : req.body.entre_calle1,
                            entre_calle2  : req.body.entre_calle2,
                            referencia  : req.body.referencia,
                            servicio_vial : req.body.servicio_vial,
                            vehiculo_tipo  : req.body.vehiculo_tipo,
                            vehiculo_color  : req.body.vehiculo_color,
                            vehiculo_placa  : req.body.vehiculo_placa,
                            vehiculo_ubicacion  : req.body.vehiculo_ubicacion,
                            vehiculo_combustible  : req.body.vehiculo_combustible,
                            vehiculo_litros : req.body.vehiculo_litros,
                        };
                        orden.insertOrden(ordenData, (err, data) => {
                            if (err){
                                if (err.errno == 1062){
                                    res.json({
                                        success: false,
                                        message: 'Error interno. Ya existe una orden con la aseguradora y expediente indicado'
                                    });
                                } else{
                                    res.json({
                                        success: false,
                                        message: err
                                    });
                                }
                                //console.log(res);
                            } else {
                                if (ordenData.asignada != "" && ordenData.asignada != null){
                                    console.log('ORDEN ASIGNADA');
                                    orden.updateProgramada(max, '2', (err, data) => {
                                        if (err){
                                            res.json({
                                                success: false,
                                                message: err
                                            });
                                        }else{
                                            res.json({
                                                success: true,
                                                message: "¡Se Guardaron los cambios exitosamente!"
                                            });
                                        }
                                    });
                                } else {
                                    console.log('ORDEN NO ASIGNADA');
                                    res.json({
                                        success: true,
                                        message: "¡Se Guardaron los cambios exitosamente!"
                                    });
                                }
                            }
                        });
                    }
                })
                
                
                
            } 
        });

        
    });

    app.put('/status_orden_interna/:fecha', (req, res) => {
        var id_empleado = req.decoded.tipo;
        if (id_empleado == '1' || id_empleado == '3' || id_empleado !== null){
            var id_orden = req.body.id_orden;
            var id_status = req.body.id_status;
            var today = new Date();
            var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date+' '+time;
            if (id_status == '1'){
                orden.updateProgramada(id_orden, '2', (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
            } else if (id_status == '2'){
                let fecha = req.params.fecha;
                orden.updateArribo(id_orden, '3', fecha, (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
            } else if (id_status == '3'){
                orden.updateFinalizado(id_orden, '4', dateTime, (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
            } else if (id_status == '4'){
                orden.updateFacturado(id_orden, '5', dateTime, (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
            } 
        } else {
            res.json({
                success: false,
                message: 'No tiene permisos para modificar esta orden.'
            });
        }
    });

    app.put('/cancelar_orden_interna/', (req, res) => {
        var id_orden = req.body.id_orden;
        var id_status = req.body.id_status;
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date+' '+time;
        orden.cancelarOrden(id_orden, id_status, dateTime, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });
    });

    app.put('/orden_interna', (req, res) => {
        const ordenData = {
            id_orden : req.body.id_orden,
            expediente : req.body.expediente,
            descripcion  : req.body.descripcion,
            id_servicio : req.body.id_servicio,
            id_aseguradora : req.body.id_aseguradora,
            id_poliza : req.body.id_poliza,
            folio_cierre : req.body.folio_cierre,
            observaciones : req.body.observaciones,
            benef_nombre : req.body.benef_nombre,
            benef_paterno  : req.body.benef_paterno,
            benef_materno  : req.body.benef_materno,
            benef_tel: req.body.benef_tel,
            recibe_benef : req.body.recibe_benef,
            recibe_nombre  : req.body.recibe_nombre,
            recibe_materno  : req.body.recibe_paterno,
            recibe_paterno  : req.body.recibe_materno,
            recibe_tel: req.body.recibe_tel,
            id_tecnico  : req.body.id_tecnico,
            asignada : req.body.asignada,
            calle  : req.body.calle,
            num_ext  : req.body.num_ext,
            num_int  : req.body.num_int,
            col  : req.body.col,
            id_municipio  : req.body.id_municipio,
            id_estado  : req.body.id_estado,
            entre_calle1  : req.body.entre_calle1,
            entre_calle2  : req.body.entre_calle2,
            referencia  : req.body.referencia,
            servicio_vial : req.body.servicio_vial,
            vehiculo_tipo  : req.body.vehiculo_tipo,
            vehiculo_color  : req.body.vehiculo_color,
            vehiculo_placa  : req.body.vehiculo_placa,
            vehiculo_ubicacion  : req.body.vehiculo_ubicacion,
            vehiculo_combustible  : req.body.vehiculo_combustible,
            vehiculo_litros : req.body.vehiculo_litros,
        };

        orden.updateOrden(ordenData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                if (ordenData.asignada != "" && ordenData.id_status == 1 && ordenData.asignada != null && ordenData.asignada != "0000-00-00 00:00:00.000000"){
                    console.log('ORDEN ASIGNADA');
                    orden.updateProgramada(ordenData.id_orden, '2', (err, data) => {
                        if (err){
                            res.json({
                                success: false,
                                message: err
                            });
                        }else{
                            res.json({
                                success: true,
                                message: "¡Se Guardaron los cambios exitosamente!"
                            });
                        }
                    });
                } else {
                    console.log('ORDEN NO ASIGNADA');
                    orden.updateProgramada(ordenData.id_orden, '1', (err, data) => {
                        if (err){
                            res.json({
                                success: false,
                                message: err
                            });
                        }else{
                            res.json({
                                success: true,
                                message: "¡Se Guardaron los cambios exitosamente!"
                            });
                        }
                    });
                }
            }
        });
    });

    app.put('/orden_interna_by_tecnico', (req, res) => {
        const ordenData = {
            id_orden : req.body.id_orden,
            observaciones : req.body.observaciones,
        };
        orden.updateOrdenbyTecnico(ordenData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });
        /*
        console.log(req.body);
        /*orden.updateOrden(ordenData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                orden.insertEvidencia(req.body.id_orden, )
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });*/
    });

    app.delete('/orden_interna/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        orden.deleteOrden(id_orden, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se ha eliminado el registro exitosamente!"
                });
            }
        });
    });
}