let dbAdmin = require('../dbMesaControl');
let ordenModel = {};

ordenModel.getOrdenes = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, d.orden_status AS estado_orden FROM orden AS a
        INNER JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        INNER JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        INNER JOIN estado_orden AS d ON a.id_status = d.id_status`, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getOrden = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.*, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, d.orden_status AS estado_orden FROM orden AS a
        INNER JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        INNER JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        INNER JOIN estado_orden AS d ON a.id_status = d.id_status
        WHERE a.id_orden = ` + id_orden, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.insertOrden = (ordenData, callback) => {
    if (dbAdmin){
        dbAdmin.query(`INSERT INTO orden SET ? `, ordenData, (error, rows) => {
            if (error) {
                console.log(error);
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.updateOrden = (ordenData, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                nombre = ${ordenData.nombre},
                ap_paterno = ${ordenData.ap_paterno},
                ap_materno = ${ordenData.ap_materno},
                RFC = ${ordenData.RFC},
                cedula_prof = ${ordenData.cedula_prof},
                universidad = ${ordenData.universidad},
                especialidad_1 = ${ordenData.especialidad_1},
                especialidad_2 = ${ordenData.especialidad_2},
                tel_fijo = ${ordenData.tel_fijo},
                tel_cel = ${ordenData.tel_cel},
                tel_adicional = ${ordenData.tel_adicional},
                email = ${ordenData.email},
                id_consultorio = ${ordenData.id_consultorio},
                calle = ${ordenData.calle},
                no_ext = ${ordenData.no_ext},
                no_int = ${ordenData.no_int},
                estado_id = ${ordenData.estado_id},
                municipio_id = ${ordenData.municipio_id},
                ciudad = ${ordenData.ciudad},
                colonia = ${ordenData.colonia},
                url_receta = ${ordenData.url_receta},
                url_solic_analisis = ${ordenData.url_solic_analisis},
                url_constacia = ${ordenData.url_constacia},
                url_cert_med = ${ordenData.url_cert_med},
                url_fact = ${ordenData.url_fact},
                certificado = ${ordenData.certificado},
                url_sello = ${ordenData.url_sello},
                WHERE id_consultorio = ${ordenData.id_orden}`;
        dbAdmin.query(sql, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.updateArribo = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, arribo = '`+ time + `' WHERE id_orden = ` + id_orden ;
        dbAdmin.query(sql, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.updateFinalizado = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, fin = '`+ time + `' WHERE id_orden = ` + id_orden ;
        dbAdmin.query(sql, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.deleteOrden = (id_med, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM orden WHERE id_orden = ` + id_med, function (error, rows){
            if (error) {
                console.log(error);
                //callback(null,err.message)
            } else {                  
                callback(null, rows);
            }
        });
    }
}

module.exports = ordenModel;