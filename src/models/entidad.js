let dbAdmin = require('../dbMesaControl');
let entidadModel = {};

entidadModel.getEntidad = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM entidad_fed WHERE id_entidad NOT IN (0)`, function(err, rows) {
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
        dbAdmin.query(`SELECT * FROM municipio WHERE id_entidad = ` + id_entidad + ` AND id_municipio NOT IN (0) ORDER BY nombre_municipio ASC`, function(err, rows) {
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