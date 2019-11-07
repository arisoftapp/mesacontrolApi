let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let dateFormat = require('dateformat');
let empresaModel = {};

empresaModel.getEmpresas = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM empresa", function(error, rows) {
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

empresaModel.getEmpresa = (idEmpresa, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM empresa WHERE id_empresa = " + idEmpresa, function(error, rows) {
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

empresaModel.getUsers = (idempresa, callback) => {
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM usuario WHERE id_empresa = "+ idempresa, (error, rows) => {
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

empresaModel.insertEmpresa = (empresa, callback) => {
    if (dbAdmin) {
        dbAdmin.query("INSERT INTO empresa SET ? ", [empresa], (error, rows) => {
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
module.exports = empresaModel;
