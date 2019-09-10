let db = require('../dbMesaControl');
var dbAdmin = db.getConnection();

let userModel = {};

//Read
userModel.getUser = (callback) => {
    if (dbAdmin) {
        dbAdmin.query("SELECT * FROM usuario ", (err, rows) => {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};



userModel.getUserByUsername = (username, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.*, 
        b.nombre_empresa AS empresa,
        b.dominio FROM usuario AS a INNER JOIN empresa AS b ON a.id_empresa = b.id_empresa WHERE a.username = ?`, [username], function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        });
    }
};

userModel.getUserByAdminUsername = (username, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT username, password FROM empresa WHERE username = '` + username +`'`, function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        });
    }
};

userModel.getUserByAsistantUsername = (username, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT username, password, CONCAT(nombre,  ' ', ap_paterno) AS name FROM empleado WHERE username = ?`, [username], function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        });
    }
};

userModel.getUserByTecnicoUsername = (username, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT id_tecnico, username, password, CONCAT(nombre,  ' ', ap_paterno) AS name FROM tecnico WHERE username = ?`, [username], function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        });
    }
};

userModel.getUsersTecnicos = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT id_tecnico, nombre, ap_paterno, ap_materno, username, password FROM tecnico WHERE id_tecnico NOT IN (0)", function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

userModel.getUsersEmpleados = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query("SELECT id_empleado, nombre, ap_paterno, ap_materno, username, password FROM empleado WHERE id_empleado NOT IN (0)", function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};



//Insert
userModel.insertEmpleado = (userData, callback) => {
    if (dbAdmin) {
        dbAdmin.query('INSERT INTO empleado SET ?', userData,
            (err, result) => {
                if (err) {
                    throw err;
                }
                else {
                    callback(null, result);
                }
            }
        )
    }
};

userModel.putEmpleado = (tecnicoDta, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE empleado SET 
        nombre = '${tecnicoDta.nombre}',
        ap_paterno = '${tecnicoDta.ap_paterno}',
        ap_materno = '${tecnicoDta.ap_materno}',
        username = '${tecnicoDta.username}',
        password = '${tecnicoDta.password}'
        WHERE id_empleado = ${tecnicoDta.id_empleado}`, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

userModel.putTecnico = (tecnicoDta, callback) =>{
    if (dbAdmin){
        dbAdmin.query(`UPDATE tecnico SET 
        username = '${tecnicoDta.username}',
        password = '${tecnicoDta.password}'
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

//CHECK PASSWORD    
userModel.getPass = (ID, empresa, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT password FROM usuario WHERE id_empresa = `+ empresa +` AND id_user = `+ ID, function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        })
    }
};

module.exports = userModel;