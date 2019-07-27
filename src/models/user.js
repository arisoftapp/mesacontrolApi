var dbAdmin = require('../dbPipeso');

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
        dbAdmin.query(`SELECT username, password, CONCAT(nombre,  ' ', ap_paterno) AS name FROM tecnico WHERE username = ?`, [username], function(err, row) {
            if (err) {
                throw err;
            }
            else {
                callback(null, row);
            }
        });
    }
};



//Insert
userModel.insertUser = (userData, callback) => {

    if (dbAdmin) {
        dbAdmin.query('INSERT INTO usuario SET ?', userData,
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