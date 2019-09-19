const orden = require('../models/orden');

module.exports = function (app) {
    app.get('/ordenes', (req, res) => {
        const decoded = req.decoded;
        //console.log(decoded);
        if (decoded.tipo == 3){
            orden.getOrdenesbyTecnico(decoded.id, (err, data) => {
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
            orden.getOrdenes((err, data) => {
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

    app.get('/all_ordenes', (req, res) => {
        const decoded = req.decoded;
        //console.log(decoded);
        if (decoded.tipo == 3){
            orden.getAllOrdenesbyTecnico(decoded.id, (err, data) => {
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
            orden.getAllOrdenes((err, data) => {
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

    app.get('/ordenes_buscar/:buscar', (req, res) => {
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

    app.get('/orden/:id_orden', (req, res) => {
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

    app.post('/orden', (req, res) => {
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
                const ordenData = {
                    id_orden : max,
                    expediente : req.body.expediente,
                    descripcion  : req.body.descripcion,
                    id_servicio : req.body.id_servicio,
                    id_aseguradora : req.body.id_aseguradora,
                    id_poliza : req.body.id_poliza,
                    benef_nombre : req.body.benef_nombre,
                    benef_paterno  : req.body.benef_paterno,
                    benef_materno  : req.body.benef_materno,
                    recibe_benef : req.body.recibe_benef,
                    recibe_nombre  : req.body.recibe_nombre,
                    recibe_materno  : req.body.recibe_paterno,
                    recibe_paterno  : req.body.recibe_materno,
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
                                message: 'Ya existe una orden con la aseguradora y expediente indicado'
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
        });

        
    });

    app.put('/status_orden/:fecha', (req, res) => {
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

    app.put('/cancelar_orden/', (req, res) => {
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

    app.put('/orden', (req, res) => {
        const ordenData = {
            id_orden : req.body.id_orden,
            id_status : req.body.id_status,
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
            recibe_benef : req.body.recibe_benef,
            recibe_nombre  : req.body.recibe_nombre,
            recibe_materno  : req.body.recibe_paterno,
            recibe_paterno  : req.body.recibe_materno,
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
                if (ordenData.asignada != "" && ordenData.id_status == 1  && ordenData.asignada != null && ordenData.asignada != "0000-00-00 00:00:00.000000"){
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
                    console.log('ORDEN NO ASIGNADA', ordenData);
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

    app.put('/orden_by_tecnico', (req, res) => {
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

    app.delete('/orden/:id_orden', (req, res) => {
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

    app.post('/upload_evidencia/:id_orden', (req, res) => {
        console.log(req.files.image);
       
        let images = req.files.image;
        let id_orden = req.params.id_orden;
        
        let imageData = 'INSERT INTO evidencia (id_orden, evidencia) VALUES (';
        if (images.length == undefined){
            var file = images;
            if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){
                console.log('Formato aceptado');
                file.mv('evidencias/'+ id_orden + '_' + file.name, function(err) {          
                    if (err) {
                        console.log(err);
                        return res.status(500).send(err);
                    }
                    imageData += id_orden + ",'" + id_orden + '_' + file.name + "');";
                    console.log(imageData);
                    orden.upload_evidencia(imageData, (err, data) => {
                        if (err) {
                            console.log(err);
                        } else {
                            res.json({
                                success: true,
                                message: "¡Se recibió el archivo de imagen! " + data
                            });
                        }
                    })
                });
            }
        } else {
            for (let i = 0; i <= req.files.image.length; i++){
                let imageData = 'INSERT INTO evidencia (id_orden, evidencia) VALUES (';
                var file = req.files.image[i];
                if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){           
                    file.mv('evidencias/'+ id_orden + '_' + file.name, function(err) {          
                        if (err) {
                            console.log(err);
                            return res.status(500).send(err);
                        } else {
                            imageData += id_orden + ",'" + id_orden + '_' + file.name[i] + "');";
                            console.log(imageData);
                            orden.upload_evidencia(imageData, (err, data) => {
                                if (err) {
                                    console.log(err);
                                }
                            });
                        }
                    });
                } else {
                    res.json({
                        success: false,
                        message: "¡Tipo de archivo no admitido! "
                    });
                }
            };
            res.json({
                success: true,
                message: "¡Se recibió el archivo de imagen!"
            });
        }
    });


    app.get('/evidencia/:id_orden', (req, res) => {
        let ord = req.params.id_orden;
        orden.getEvidencia(ord, (err, data) => {
            if (err) {
                res.json ({
                    success: false,
                    message: "No se pudo recuperar la evidencia de la orden: " + err
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