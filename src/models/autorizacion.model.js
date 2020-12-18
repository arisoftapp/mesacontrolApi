let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let autorizacionModel = {};

autorizacionModel.getAutorizacion = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM autorizacion WHERE id_orden =  ` + id_orden, function (error, rows) {
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



autorizacionModel.insertAutorizacion = (autorizacionData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`INSERT INTO autorizacion SET ? `, autorizacionData, function (error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    console.log(error);
                    callback(error, null);
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

autorizacionModel.updateAutorizacion = (autorizacionData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const sql = `UPDATE autorizacion SET 
            firma = '${autorizacionData.firma}',
            ruta_pdf = '${autorizacionData.ruta_pdf}'
            WHERE id_orden = ${autorizacionData.id_orden}`;
        dbAdmin.query(sql, function (error, rows) {
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
};


module.exports = autorizacionModel;