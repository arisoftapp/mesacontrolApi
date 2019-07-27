const tecnico = require('../models/tecnico');

module.exports = function (app) {
    app.get('/tecnicos', (req, res) => {
        tecnico.getTecnicos((err, data) => {
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

    app.get('/tecnico/:id_tecnico', (req, res) => {
        var id = req.params.id_tecnico;
        tecnico.getTecnico(id, (err, data) => {
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


    app.post('/tecnico', (req, res) => {
        const tecnicoData = {
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno
        }
        
        tecnico.insertTecnico(tecnicoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
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
            ap_materno : req.body.ap_materno
        }
        
        tecnico.putTecnico(tecnicoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
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
                    message: err
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