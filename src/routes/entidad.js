const entidad = require('../models/entidad');

module.exports = function (app) {
    app.get('/entidad', (req, res) => {
        entidad.getEntidad((err, data) => {
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

    app.get('/municipios/:id_entidad', (req, res) => {
        var id_entidad = req.params.id_entidad;
        entidad.getMunicipios(id_entidad, (err, data) => {
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
}