let dbAdmin = require('../dbPipeso');
let entidadModel = {};

entidadModel.getEntidad = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM entidad_fed`, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

entidadModel.getMunicipios = (id_entidad, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM municipio WHERE id_estado = ` + id_entidad + ` ORDER BY nombre_municipio ASC`, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

module.exports = entidadModel;