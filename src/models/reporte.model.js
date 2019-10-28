let db = require('../dbMesaControl');
var dbAdmin = db.getConnection();
let reportsModel = {};

reportsModel.getR01 = (script, callback) => {
    if (dbAdmin) {
        dbAdmin.query(script, function (error, rows) {
            if (error) {
                console.log(error);
                callback(error);
            } else {
                callback(null, rows);
            }
        });
    }
}

module.exports = reportsModel;