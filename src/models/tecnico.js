let dbAdmin = require('../dbMesaControl');
let tecnicoModel = {};

tecnicoModel.getTecnicos = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM tecnico WHERE id_tecnico NOT IN (0)", function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

tecnicoModel.getTecnico = (id, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT id_tecnico, nombre, ap_paterno, ap_materno, status FROM tecnico WHERE id_tecnico = " + id, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};


tecnicoModel.insertTecnico = (tecnicoData, callback) =>{

    if (dbAdmin){
        dbAdmin.query(`INSERT INTO tecnico SET ?`, tecnicoData, (error, rows) => {
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        }); 
    }
}

tecnicoModel.putTecnico = (tecnicoDta, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE tecnico SET 
        nombre = '${tecnicoDta.nombre}',
        ap_paterno = '${tecnicoDta.ap_paterno}',
        ap_materno = '${tecnicoDta.ap_materno}'
        WHERE id_tecnico = ${tecnicoDta.id_tecnico}`, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

tecnicoModel.deleteTecnico = (id_tecnico, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM tecnico WHERE id_tecnico = ` + id_tecnico, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = tecnicoModel;