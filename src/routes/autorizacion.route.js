const autorizacion = require('../models/autorizacion.model');

module.exports = function (app) {
    app.get('/autorizacion/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        autorizacion.getAutorizacion(id_orden, (err, data) => {
            if (err ) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos " + err.message
                });
            } else {
                res.json({
                    success: true,
                    autorizacion: data
                });
                  
            }
        });
    });

    app.put('/autorizacion', (req, res) => {
        const autorizacionData = {
            id_orden: req.body.id_orden,
            firma: req.body.firma,
            ruta_pdf: req.body.ruta_pdf
        };
        autorizacion.getAutorizacion(req.body.id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos " + err.message
                });
            } else {
                if (data.length > 0) {
                    autorizacion.updateAutorizacion(autorizacionData, (err, data) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: "Ocurrió un error al obtener los datos " + err.message
                            });
                        } else {
                            res.json({
                                success: true,
                                autorizacion: data
                            });

                        }
                    });
                } else {
                    autorizacion.insertAutorizacion(autorizacionData, (err, data) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: "Ocurrió un error al obtener los datos " + err.message
                            });
                        } else {
                            res.json({
                                success: true,
                                autorizacion: data
                            });

                        }
                    });
                }
            }
        });
    });

   

}