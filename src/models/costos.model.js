let db = require('../dbMesaControl');
var dbAdmin = db.getConnection();
let costosModel = {};

costosModel.getCostos = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM costo WHERE id_orden =  `+ id_orden, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

costosModel.deleteCostos = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`DELETE FROM costo WHERE id_orden =  `+ id_orden, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

costosModel.insertCostos = (costoData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`INSERT INTO costo SET ? `, costoData, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

costosModel.insertMateriales = (materialesData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(materialesData, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};


costosModel.getMateriales = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM material WHERE id_orden =  `+ id_orden, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

costosModel.deleteMateriales = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`DELETE FROM material WHERE id_orden =  `+ id_orden, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

module.exports = costosModel;