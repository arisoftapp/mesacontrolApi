const servicio = require('../models/servicio');

module.exports = function (app) {
    app.get('/servicios', (req, res) => {
        servicio.getServicios((err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos. " + err.message
                });
            } else{
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.get('/servicio/:id_servicio', (req, res) => {
        var id = req.params.id_servicio;
        servicio.getServicio(id, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos. " + err.message
                });
            } else{
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });


    app.post('/servicio', (req, res) => {
        const serdta = {
            nombre_servicio : req.body.nombre_servicio,
            descripcion_servicio : req.body.descripcion_servicio,
            erp : req.body.erp
        }
        
        servicio.insertServicio(serdta, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró el servicio exitosamente!"
                });
            }
        });
    });

    app.put('/servicio', (req, res) => {
        var id_Servicio = req.body.id_servicio;
        var nom_Servicio = req.body.nombre_servicio;
        var desc = req.body.descripcion_servicio;
        var erp = req.body.erp;
        servicio.updateServicio(id_Servicio, nom_Servicio, desc, erp, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se editó el servicio exitosamente!"
                });
            }
        });
    });

    app.delete('/servicio/:id_servicio', (req, res) => {
        var id_servicio = req.params.id_servicio;
        servicio.deleteServicio(id_servicio, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se eliminó el servicio exitosamente!"
                });
            }
        });
    });


}