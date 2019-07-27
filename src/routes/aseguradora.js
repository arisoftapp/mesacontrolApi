const aseguradora = require('../models/aseguradora');

module.exports = function (app) {
    app.get('/aseguradoras', (req, res) => {
        aseguradora.getAseguradoras((err, data) => {
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

    app.get('/aseguradora/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.getAseguradora(id_aseguradora, (err, data) => {
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

    app.post('/aseguradora', (req, res) => {
        var nom_ase = req.body.nombre_aseguradora;
        aseguradora.insertAseguradora(nom_ase, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró la aseguradora exitosamente!"
                });
            }
        });
    });

    app.put('/aseguradora', (req, res) => {
        var id_aseguradora = req.body.id_aseguradora;
        var nom_aseguradora = req.body.nombre_aseguradora;
        aseguradora.updateAseguradora(id_aseguradora, nom_aseguradora, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se editó la aseguradora exitosamente!"
                });
            }
        });
    });

    app.delete('/aseguradora/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.deleteAseguradora(id_aseguradora, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se eliminó la aseguradora exitosamente!"
                });
            }
        });
    });


}