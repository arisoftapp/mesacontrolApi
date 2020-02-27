let dbAdmin = require('../dbMesaControl');
let pagosModel = {};

pagosModel.getPagos = (script, callback) => {
    if (dbAdmin) {
        dbAdmin.query(script, function (error, rows) {
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

pagosModel.getOrdenesCostos = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, a.expediente, a.folio_cierre, b.*,
        CONCAT(c.nombre," ",c.ap_paterno," ", c.ap_materno) AS nombre_tecnico FROM orden AS a
        LEFT JOIN costo AS b ON a.id_orden = b.id_orden
        LEFT JOIN tecnico AS c ON a.id_tecnico = c.id_tecnico WHERE a.id_orden in (` + id_orden + ');', function (error, rows) {
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

pagosModel.insertPago = (aseData, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`INSERT INTO pago SET ? `, aseData, function (error, rows) {
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



pagosModel.updateIdPago = (id, busqueda, callback) => {
    if (dbAdmin) {
        const sql = `UPDATE orden SET 
               id_doc_pago = '${id}',
               status_pago = 1
               WHERE id_orden in (` + busqueda + ');';
        dbAdmin.query(sql, function (error, rows) {
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


module.exports = pagosModel;