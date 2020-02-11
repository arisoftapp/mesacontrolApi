let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let encuestaModel = {};

encuestaModel.getEncuesta = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM encuesta WHERE id_orden =  ` + id_orden, function (error, rows) {
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



encuestaModel.insertEncuesta = (encuestaData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`INSERT INTO encuesta SET ? `, encuestaData, function (error, rows) {
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

encuestaModel.updateEncuesta = (encuestaData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const sql = `UPDATE encuesta SET 
            p1 = '${encuestaData.p1}',
            p2 = '${encuestaData.p2}',
            p3 = ${encuestaData.p3},
            p4 = '${encuestaData.p4}',
            p5 = '${encuestaData.p5}',
            firma = '${encuestaData.firma}',
            ruta_pdf = '${encuestaData.ruta_pdf}'
            WHERE id_orden = ${encuestaData.id_orden}`;
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


module.exports = encuestaModel;