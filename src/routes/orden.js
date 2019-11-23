const orden = require('../models/orden');
const tecnico = require('../models/tecnico');
const servicio = require('../models/servicio');
const costos = require('../models/costos.model');
const path = require('path');
const accountSid = 'ACe4f8ba482da90602871dd463b0900ed1';
const authToken = 'd0c1bbde9c3ccb8a590428942233c0c5';
const client = require('twilio')(accountSid, authToken); 
const fs = require('fs');

module.exports = function (app) {
    app.get('/ordenes/:id_status/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        const decoded = req.decoded;
        const id_status = req.params.id_status;
        const id_aseguradora = req.params.id_aseguradora;
        var id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;
        //console.log(decoded);
        if (decoded.tipo == 3){
            id_tecnico = decoded.id;
        } 
        let script = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        a.benef_nombre, a.benef_paterno, a.benef_materno, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno, a.entre_calle1, a.entre_calle2, a.col,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
        WHERE id_tipo = 1`;
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
        //console.log(script);
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

    app.get('/layout/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        //console.log(req.params);
        orden.getLayoutData(id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos. " + err.message
                });
            } else {
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
                    message: err.message
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
                    id_supervisor : req.body.id_supervisor,
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
                                message: err.code
                            });
                        }
                        //console.log(res);
                    } else {
                        if (ordenData.asignada !== "" && ordenData.asignada !== null && ordenData.asignada !== "0000-00-00 00:00:00.000000"){
                            console.log('ORDEN ASIGNADA');
                            orden.updateProgramada(max, '2', (err, data) => {
                                if (err){
                                    res.json({
                                        success: false,
                                        message: err.message
                                    });
                                }else{
                                    res.json({
                                        success: true,
                                        message: "¡Se Guardaron los cambios exitosamente!"
                                    });
                                    sendNotification(ordenData);
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

    function sendNotification(orden) {
        tecnico.getTecnico(orden.id_tecnico, (err, data) => {
            if (!err) {
                if (data[0]){
                    const celular = data[0].num_cel;
                    if (celular.length == 10){
                        var fecha = new Date(orden.asignada);
                        let year = fecha.getFullYear();
                        let mes = fecha.getMonth() + 1;
                        let dia = fecha.getDate();
                        let hora = fecha.getHours();
                        let min = fecha.getMinutes();
                        const string = (year + '-' + mes + '-' + dia + ' ' + hora + ':' + min + ' UTC');
                        var today = new Date(string).toLocaleString("en-US", { timeZone: "America/Hermosillo" });
                        let message = 'Se te ha asignado la orden con folio *' + orden.expediente + '*, con fecha programada para el día *' + today + '* (fecha y hora local de Hermosillo). Para conocer más detalles de la orden ingresa a: http://www.arisoft.com.mx/mesadecontrol/';
                        let para = 'whatsapp:+521'+celular;
                        client.messages.create({
                            body: message,
                            from: 'whatsapp:+14155238886',
                            to: para
                        }).then(message => console.log(message.sid)).done();
                    }       
                }         
            }
        });
    }

    app.put('/arribo_tecnico/:id_orden', (req, res) => {
        const id_orden = req.params.id_orden;
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date + ' ' + time;
        orden.updateArribo(id_orden, '3', dateTime, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: err.code + " " + err.message
                });
            } else {
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });
    })

    app.put('/status_orden/:fecha', (req, res) => {
        var id_empleado = req.decoded.tipo;
        if (id_empleado == '1' || id_empleado == '3' || id_empleado !== null){
            var id_orden = req.body.id_orden;
            var id_status = req.body.id_status;
            const _orden = {
                id_orden : id_orden,
                asignada: req.body.asignada,
                id_tecnico : req.body.id_tecnico
            }
            var today = new Date();
            var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date+' '+time;
            if (id_status == '1'){
                orden.updateProgramada(id_orden, '2', (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err.code + " " + err.message
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                        sendNotification(_orden);
                    }
                });
            } else if (id_status == '2'){
                let fecha = req.params.fecha;
                orden.updateArribo(id_orden, '3', fecha, (err, data) => {
                    if (err){
                        res.json({
                            success: false,
                            message: err.code + " " + err.message
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
            } else if (id_status == '3'){
                makeCostos(id_orden);
                orden.updateFinalizado(id_orden, '4', dateTime, (err, data) => {
                    if (err) {
                        res.json({
                            success: false,
                            message: err.code + " " + err.message
                        });
                    } else {
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
                            message: err.code + " " + err.message
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

    function makeCostos(id_orden) {
        var es_foraneo = true;
        var corre = 300;
        orden.getOrden(id_orden, (error, data) => {
            if (!error){
                const municipio = data[0].id_municipio;
                //console.log(municipio);
                if ( municipio == 1890) {
                    es_foraneo = false;
                    corre = 0;
                }
                var precio_ser = 0;
                orden.getCostoPoliza(id_orden, (err, dta) => {
                    if (!err){
                        precio_ser = dta[0].poliza_costo;
                        const costosData = {
                            id_orden: id_orden,
                            precio_servicio: precio_ser,
                            mano_obra: 0,
                            corres: corre,
                            kilometros: 0,
                            cant_km: 0,
                            precio_km: 0,
                            tipo_gasolina: 0,
                            gasolina_litros: 0,
                            gasolina: 0,
                            importe_materiales: 0,
                            total_ase: corre + precio_ser
                        };
                        costos.insertCostos(costosData, (err, data) => {
                            if (err) {
                                console.log(err);
                                return false;
                            } else {
                                return true;
                            }
                        });
                    } 
                })
            } else {
                return false;
                console.log(error);
            }
        });
    };

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
                    message: err.code + " " + err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });
    });

    app.put('/update_status/:orden/:status', (req, res) => {
        var id_empleado = req.decoded.tipo;
        //console.log(id_empleado);
        if (id_empleado == '1' || id_empleado !== null) {
            var id_orden = req.params.orden;
            var id_status = req.params.status;
                orden.updateStatus(id_orden, id_status, (err, data) => {
                    if (err) {
                        res.json({
                            success: false,
                            message: err.code + " " + err.message
                        });
                    } else {
                        res.json({
                            success: true,
                            message: "¡Se Guardaron los cambios exitosamente!"
                        });
                    }
                });
        } else {
            res.json({
                success: false,
                message: 'El usuario no cuenta con los permisos para realizar esta acción.'
            });
        }
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
            id_supervisor : req.body.id_supervisor,
            folio_cierre : req.body.folio_cierre,
            folio_factura : req.body.folio_factura,
            folio_recepcion : req.body.folio_recepcion,
            ejecutivo_cab : req.body.ejecutivo_cab,
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
                    message: err.code + " " + err.message
                });
            }else{
                if (ordenData.id_status === 1 || ordenData.id_status === 2) {
                    if (ordenData.asignada !== ""  && ordenData.asignada !== null && ordenData.asignada !== "0000-00-00 00:00:00.000000"){
                        console.log('ORDEN ASIGNADA');
                        orden.updateProgramada(ordenData.id_orden, '2', (err, data) => {
                            if (err){
                                res.json({
                                    success: false,
                                    message: err.code + " " + err.message
                                });
                            }else{
                                res.json({
                                    success: true,
                                    message: "¡Se Guardaron los cambios exitosamente!"
                                });
                                sendNotification(ordenData);
                            }
                        });
                    } else {
                        console.log('ORDEN NO ASIGNADA', ordenData);
                        orden.updateProgramada(ordenData.id_orden, '1', (err, data) => {
                            if (err){
                                res.json({
                                    success: false,
                                    message: err.code + " " + err.message
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
                        success: true,
                        message: "¡Se Guardaron los cambios exitosamente!"
                    });
                }
            }
        });
    });

    app.put('/orden_by_tecnico', (req, res) => {
        const ordenData = {
            id_orden : req.body.id_orden,
            vehiculo_placa : req.body.vehiculo_placa,
            observaciones : req.body.observaciones,
        };
        orden.updateOrdenbyTecnico(ordenData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.code + " " + err.message
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
                    message: err.code + " " + err.message
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
        //console.log(req.files.image);
        let images = req.files.image;
        let id_orden = req.params.id_orden;
       
        let imageData = 'INSERT INTO evidencia (id_orden, evidencia) VALUES (';
        if (images.length == undefined){
            var file = images;
            if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){
                //console.log('Formato aceptado');
                try {
                    //file.mv('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/evidencias/' + id_orden + '_' + file.name, function (err) {
                    file.mv('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/evidencias/' + id_orden + '_' + file.name, function (err) {
                        if (err) {
                            throw (err);
                        }
                        imageData += id_orden + ",'" + id_orden + '_' + file.name + "');";
                        //console.log(imageData);
                        orden.upload_evidencia(imageData, (err, data) => {
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
        } else {
            for (let i = 0; i < images.length; i++){
                var file = images[i];
                if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){ 
                    try {
                        //file.mv('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/evidencias/' + id_orden + '_' + file.name, function (err) {
                        file.mv('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/evidencias/' + id_orden + '_' + file.name, function (err) {
                            if (err) {
                                throw (err);
                            } else {
                                imageData += id_orden + ",'" + id_orden + '_' + file.name + "'";
                                if (i < images.length - 1) {
                                    imageData += "),("
                                } else {
                                    imageData += ");"
                                }
                                //console.log(imageData);
                            }
                        });
                        orden.upload_evidencia(imageData, (err, data) => {
                            if (err) {
                                throw (err);
                            } else {
                                res.json({
                                    success: true,
                                    message: "¡Se recibió el archivo de imagen!"
                                });
                            }
                        });
                    } catch (e) {
                        res.json({
                            success: false,
                            message: "¡Error al almacenar el archivo! " + e.message
                        });
                    };
                } else {
                    res.json({
                        success: false,
                        message: "¡Tipo de archivo no admitido!"
                    });
                }
            };
            //console.log(imageData);
        }
    });

    app.post('/upload_facturacion/:id_orden/:factura', (req, res) => {
        let factura = req.params.factura;
        let id_orden = req.params.id_orden;
        if (req.files.pdf){
            //console.log(req.files.pdf);
            const file = req.files.pdf;
            try {
                //file.mv('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/evidencias/PDF/' + id_orden + '_' + file.name, function (err) {
                file.mv('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/evidencias/PDF/' + id_orden + '_' + file.name, function (err) {
                    if (err) {
                        //console.log(err);
                        throw (err);
                    }
                    let imageData = id_orden + '_' + file.name;
                    //console.log(imageData);
                    orden.upload_pdf(id_orden, imageData, (err, data) => {
                        if (err) {
                            throw (err);
                        } else {
                            if (factura) {
                                const factData = {
                                    id_orden: id_orden,
                                    folio_factura: path.parse(file.name).name
                                }
                                orden.updateFolioFact(factData, (err, data) => {
                                    if (err) {
                                        throw (err);
                                    } else {
                                        if (!req.files.xml && req.files.xml == null) {
                                            res.json({
                                                success: true,
                                                message: "¡Se recibió el archivo de imagen!"
                                            });
                                        }
                                    }
                                })
                            }
                        }
                    });
                });
            } catch (error) {
                res.json({
                    success: false,
                    message: "Error al agregar factura al servidor. " + error.message
                });
            }
            
        };
        if (req.files.xml){
            //console.log(req.files.xml);
            const xml = req.files.xml;
            try {
                //xml.mv('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/evidencias/XML/' + id_orden + '_' + xml.name, function (err) {
                xml.mv('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/evidencias/XML/' + id_orden + '_' + xml.name, function (err) {
                    if (err) {
                        throw (err);
                    }
                    let xmlData = id_orden + '_' + xml.name;
                    //console.log(xmlData);
                    orden.upload_xml(id_orden, xmlData, (err, data) => {
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
                    message: "Error al agregar XML al servidor. " + error.message
                });
            }
        }
    });


    app.get('/evidencia/:id_orden', (req, res) => {
        let ord = req.params.id_orden;
        orden.getEvidencia(ord, (err, data) => {
            if (err) {
                res.json ({
                    success: false,
                    message: "No se pudo recuperar la evidencia de la orden: " + err.message
                });
            } else {
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.delete('/evidencia/:id_evidencia/:evidencia', (req, res) => {
        const decoded = req.decoded;
        const id = req.params.id_evidencia;
        const evidencia = req.params.evidencia;
        if (decoded.tipo == 1) {
            orden.deleteEvidencia(id, (err, data) => {
                if (err) {
                    res.json({
                        success: false,
                        message: "Error al eliminar la evidencia: " + err.message
                    });
                } else {
                    //fs.unlink('C:/Users/Frank Crow-Belloso/Desktop/Arisoft/mesacontrolapi/evidencias/' + evidencia, (err) => {
                    fs.unlink('C:/Users/Administrator.VM3327892/Desktop/API_REST/mesacontrolapi/evidencias/' + evidencia, (err) => {
                        if (err) throw err;
                        res.json({
                            success: true,
                            data: 'Se eliminó la evidencia indicada.'
                        });
                        console.log(evidencia + ' was deleted');
                    });
                }
            })
        }
    });

    app.delete('/orden/:id_orden', (req, res) => {
        const decoded = req.decoded;
        const id = req.params.id_orden;
        if (decoded.tipo == 1) {
            orden.deleteOrden(id, (err, data) => {
                if (err) {
                    res.json({
                        success: false,
                        message: "Error al eliminar la orden: " + err.message
                    });
                } else {
                    res.json({
                        success: true,
                        data: 'Se eliminó la orden indicada.'
                    });
                }
            })
        }
    });
}