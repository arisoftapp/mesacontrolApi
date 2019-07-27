let dbAdmin = require('../dbPipeso');
let servicioModel = {};

servicioModel.getServicios = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM servicio WHERE id_servicio NOT IN (0)", function(err, rows) {
            if (err) {
                throw err;
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
        dbAdmin.query("SELECT * FROM servicio WHERE id_servicio = " + id, function(err, rows) {
            if (err) {
                throw err;
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
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        }); 
    }
}


servicioModel.updateServicio = (id_servicio, nombre_servicio, desc, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE servicio SET nombre_servicio = '`+ nombre_servicio +  `', descripcion_servicio = ' ` + desc +  `'  WHERE id_servicio = ` + id_servicio, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
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
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = servicioModel;