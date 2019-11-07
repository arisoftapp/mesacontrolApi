let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let reportsModel = {};

reportsModel.getR01 = (script, callback) => {
    if (dbAdmin) {
        dbAdmin.query(script, function (error, rows) {
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

module.exports = reportsModel;