const tecnico = require('../models/tecnico');

module.exports = function (app) {
    app.get('/tecnicos', (req, res) => {
        tecnico.getTecnicos((err, data) => {
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

    app.get('/tecnico/:id_tecnico', (req, res) => {
        var id = req.params.id_tecnico;
        tecnico.getTecnico(id, (err, data) => {
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


    app.post('/tecnico', (req, res) => {
        const tecnicoData = {
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            id_estado : req.body.id_estado,
            id_municipio  : req.body.id_municipio,
            servicios  : req.body.servicios,
            num_cel  : req.body.num_cel,
            num_fijo : req.body.num_fijo,
            datos_banco : req.body.datos_banco,
            inicio_descanso: req.body.inicio_descanso,
            fin_descanso: req.body.fin_descanso
        }
        
        tecnico.insertTecnico(tecnicoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró al tecnico exitosamente!"
                });
            }
        });
    });

    app.put('/tecnico', (req, res) => {
        const tecnicoData = {
            id_tecnico : req.body.id_tecnico,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            id_estado : req.body.id_estado,
            id_municipio  : req.body.id_municipio,
            servicios : req.body.servicios,
            num_cel  : req.body.num_cel,
            num_fijo : req.body.num_fijo,
            datos_banco : req.body.datos_banco,
            inicio_descanso : req.body.inicio_descanso,
            fin_descanso : req.body.fin_descanso
        }
        
        tecnico.putTecnico(tecnicoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se editó al tecnico exitosamente!"
                });
            }
        });
    });

    app.delete('/tecnico/:id_tecnico', (req, res) => {
        var id_tecnico = req.params.id_tecnico;
        tecnico.deleteTecnico(id_tecnico, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err.message
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se eliminó al tecnico exitosamente!"
                });
            }
        });
    });


}