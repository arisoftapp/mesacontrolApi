let dbAdmin = require('../dbPipeso');
let aseguradoraModel = {};

aseguradoraModel.getAseguradoras = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM aseguradora WHERE id_aseguradora NOT IN (0)", function(err, rows) {
            if (err) {
                throw err;
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
        dbAdmin.query(`SELECT * FROM aseguradora WHERE id_aseguradora =  `+ id_aseguradora, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

aseguradoraModel.insertAseguradora = (nombre_aseguradora, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO aseguradora (nombre_aseguradora) VALUES ('` + nombre_aseguradora + `')`, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

aseguradoraModel.updateAseguradora = (id_aseguradora, nombre_aseguradora, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE aseguradora SET nombre_aseguradora = '`+ nombre_aseguradora +  `' WHERE id_aseguradora = ` + id_aseguradora, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
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
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = aseguradoraModel;