let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let tecnicoModel = {};

tecnicoModel.getTecnicos = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT a.id_tecnico, a.nombre, a.ap_paterno, a.ap_materno, a.status, a.id_estado, a.servicios, a.id_municipio, b.nombre_municipio FROM tecnico AS a LEFT JOIN municipio AS b ON a.id_municipio = b.id_municipio WHERE id_tecnico NOT IN (0)", function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            } else {
                callback(null, rows);
            }
        });
    }
};

tecnicoModel.getTecnico = (id, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM tecnico WHERE id_tecnico = ` + id, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

tecnicoModel.getCelTecnico = (id, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT num_cel FROM tecnico WHERE id_tecnico = ` + id, function (error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};


tecnicoModel.insertTecnico = (tecnicoData, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO tecnico SET ?`, tecnicoData, (error, rows) => {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            } else {                  
                callback(null, rows);
            }
        }); 
    }
}

tecnicoModel.putTecnico = (tecnicoDta, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE tecnico SET 
        nombre = '${tecnicoDta.nombre}',
        ap_paterno = '${tecnicoDta.ap_paterno}',
        ap_materno = '${tecnicoDta.ap_materno}',
        id_estado = ${tecnicoDta.id_estado},
        id_municipio  = ${tecnicoDta.id_municipio},
        servicios  = '${tecnicoDta.servicios}',
        num_cel  = '${tecnicoDta.num_cel}',
        num_fijo = '${tecnicoDta.num_fijo}',
        datos_banco = '${tecnicoDta.datos_banco}'
        WHERE id_tecnico = ${tecnicoDta.id_tecnico}`, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

tecnicoModel.deleteTecnico = (id_tecnico, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM tecnico WHERE id_tecnico = ` + id_tecnico, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = tecnicoModel;