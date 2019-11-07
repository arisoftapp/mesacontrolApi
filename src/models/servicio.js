let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let servicioModel = {};

servicioModel.getServicios = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM servicio WHERE id_servicio NOT IN (0)", function(error, rows) {
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

servicioModel.getServicio = (id, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM servicio WHERE id_servicio = " + id, function(error, rows) {
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

servicioModel.insertServicio = (servdata, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO servicio SET ?`, servdata, (error, rows) => {
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


servicioModel.updateServicio = (id_servicio, nombre_servicio, desc, erp, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE servicio SET nombre_servicio = '`+ nombre_servicio +  `', erp = '` + erp +`', descripcion_servicio = '` + desc +  `'  WHERE id_servicio = ` + id_servicio, function (error, rows){
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

servicioModel.deleteServicio = (id_servicio, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM servicio WHERE id_servicio = ` + id_servicio, function (error, rows){
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

module.exports = servicioModel;