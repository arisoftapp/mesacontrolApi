let dbAdmin = require('../dbPipeso');
let pacienteModel = {};

pacienteModel.getPacientes = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM paciente`, function(error, rows) {
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

pacienteModel.getPaciente = (id_paciente, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT paciente.*, IFNULL(b.razon_soc, '') AS fact_razonsoc, IFNULL(b.rfc, '') AS fact_rfc, IFNULL(b.cp, '') AS fact_cp, 
        IFNULL(b.calle, '') AS fact_calle, IFNULL(b.no_ext, '') AS fact_ext, IFNULL(b.no_int, '') AS fact_int, 
        IFNULL(b.id_edo, '') AS fact_idedo, IFNULL(b.id_mun, '') AS fact_idmun, IFNULL(b.colonia, '') AS fact_colonia, 
        IFNULL(b.email, '') AS fact_email FROM paciente LEFT JOIN fact_paciente AS b ON paciente.id_paciente = b.id_paciente 
        WHERE paciente.id_paciente = ` + id_paciente, function(error, rows) {
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

pacienteModel.insertPaciente = (pacienteData, callback) => {
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO paciente SET ? `, pacienteData, (error, rows) => {
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

pacienteModel.updatePaciente = (pacienteData, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE paciente SET 
                nombre = '${pacienteData.nombre}',
                ap_paterno = '${pacienteData.ap_paterno}',
                ap_materno = '${pacienteData.ap_materno}',
                fecha_nac = '${pacienteData.fecha_nac}',
                sexo = '${pacienteData.sexo}',
                RFC = '${pacienteData.RFC}',
                tel_fijo = '${pacienteData.tel_fijo}',
                tel_cel = '${pacienteData.tel_cel}',
                tel_alter = '${pacienteData.tel_alter}',
                email = '${pacienteData.email}',
                calle = '${pacienteData.calle}',
                no_ext = '${pacienteData.no_ext}',
                no_int = '${pacienteData.no_int}',
                id_edo = ${pacienteData.id_edo},
                id_mun = ${pacienteData.id_mun},
                ciudad = '${pacienteData.ciudad}',
                colonia = '${pacienteData.colonia}'
                WHERE id_paciente = ${pacienteData.id_paciente}`;
        dbAdmin.query(sql, function (error, rows){
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

pacienteModel.deletePaciente = (id_pac, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM paciente WHERE id_paciente = ` + id_pac, function (error, rows){
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

module.exports = pacienteModel;