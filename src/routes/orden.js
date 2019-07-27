const orden = require('../models/orden');

module.exports = function (app) {
    app.get('/ordenes', (req, res) => {
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
    });

    app.get('/orden/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
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
        const ordenData = {
            id_orden : req.body.id_orden,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            fecha_nac : req.body.fecha_nac,
            RFC : req.body.RFC,
            cedula_prof : req.body.cedula_prof,
            universidad : req.body.universidad,
            especialidad_1 : req.body.especialidad_1,
            especialidad_2 : req.body.especialidad_2,
            tel_fijo : req.body.tel_fijo,
            tel_cel : req.body.tel_cel,
            tel_adicional : req.body.tel_adicional,
            email : req.body.email,
            id_consultorio : req.body.id_consultorio,
            calle : req.body.calle,
            no_ext : req.body.no_ext,
            no_int : req.body.no_int,
            id_estado : req.body.estado_id,
            id_municipio : req.body.municipio_id,
            ciudad : req.body.ciudad,
            colonia : req.body.colonia,
            url_receta : req.body.url_receta,
            url_solic_analisis : req.body.url_solic_analisis,
            url_constacia : req.body.url_constacia,
            url_cert_med : req.body.url_cert_med,
            url_fact : req.body.url_fact,
            certificado : req.body.certificado,
            url_sello : req.body.url_sello
        };
        orden.insertOrden(ordenData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Registro exitoso!"
                });
            }
        });
    });

    app.put('/orden', (req, res) => {
        const ordenData = {
            id_orden : req.body.id_orden,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            RFC : req.body.RFC,
            cedula_prof : req.body.cedula_prof,
            universidad : req.body.universidad,
            especialidad_1 : req.body.especialidad_1,
            especialidad_2 : req.body.especialidad_2,
            tel_fijo : req.body.tel_fijo,
            tel_cel : req.body.tel_cel,
            tel_adicional : req.body.tel_adicional,
            email : req.body.email,
            id_consultorio : req.body.id_consultorio,
            calle : req.body.calle,
            no_ext : req.body.no_ext,
            no_int : req.body.no_int,
            estado_id : req.body.estado_id,
            municipio_id : req.body.municipio_id,
            ciudad : req.body.ciudad,
            colonia : req.body.colonia,
            url_receta : req.body.url_receta,
            url_solic_analisis : req.body.url_solic_analisis,
            url_constacia : req.body.url_constacia,
            url_cert_med : req.body.url_cert_med,
            url_fact : req.body.url_fact,
            certificado : req.body.certificado,
            url_sello : req.body.url_sello
        };
        orden.updateOrden(ordenData, (err, data) => {
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


}