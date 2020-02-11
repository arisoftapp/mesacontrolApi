const encuesta = require('../models/encuesta.model');

module.exports = function (app) {
    app.get('/encuesta/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        encuesta.getEncuesta(id_orden, (err, data) => {
            if (err ) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos " + err.message
                });
            } else {
                res.json({
                    success: true,
                    encuesta: data
                });
                  
            }
        });
    });

    app.put('/encuesta', (req, res) => {
        const encuestaData = {
            id_orden: req.body.id_orden,
            p1: req.body.p1,
            p2: req.body.p2,
            p3: req.body.p3,
            p4: req.body.p4,
            p5: req.body.p5,
            firma: req.body.firma,
            ruta_pdf: req.body.ruta_pdf
        };
        console.log(encuestaData);
        encuesta.getEncuesta(req.body.id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos " + err.message
                });
            } else {
                if (data.length > 0) {
                    encuesta.updateEncuesta(encuestaData, (err, data) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: "Ocurrió un error al obtener los datos " + err.message
                            });
                        } else {
                            res.json({
                                success: true,
                                encuesta: data
                            });

                        }
                    });
                } else {
                    encuesta.insertEncuesta(encuestaData, (err, data) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: "Ocurrió un error al obtener los datos " + err.message
                            });
                        } else {
                            res.json({
                                success: true,
                                encuesta: data
                            });

                        }
                    });
                }
            }
        });
    });

   

}