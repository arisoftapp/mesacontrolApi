let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let aseguradoraModel = {};

aseguradoraModel.getAseguradoras = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM aseguradora WHERE id_aseguradora NOT IN (0)", function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.getAseguradora = (id_aseguradora, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM aseguradora WHERE id_aseguradora =  `+ id_aseguradora, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.getPolizas = (id_aseguradora, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM poliza WHERE id_aseguradora =  `+ id_aseguradora, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.deletePolizas = (id_aseguradora, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`DELETE FROM poliza WHERE id_aseguradora =  `+ id_aseguradora, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.insertPolizas = (poliData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(poliData, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.insertAseguradora = (aseData, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO aseguradora SET ? `, aseData, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

aseguradoraModel.updateAseguradora = (aseData, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE aseguradora SET 
        nombre_aseguradora = '${aseData.nombre_aseguradora}',
        nombre_contacto = '${aseData.nombre_contacto}',
        telefono = '${aseData.telefono}',
        telefono_supervisor = '${aseData.telefono_supervisor}'
        WHERE id_aseguradora = ${aseData.id_aseguradora}`, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

aseguradoraModel.deleteAseguradora = (id_aseguradora, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM aseguradora WHERE id_aseguradora = ` + id_aseguradora, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = aseguradoraModel;