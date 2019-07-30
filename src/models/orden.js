let dbAdmin = require('../dbMesaControl');
let ordenModel = {};

ordenModel.getOrdenes = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, a.id_status, a.levantamiento, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, d.orden_status AS estado_orden FROM orden AS a
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
                expediente = '${ordenData.expediente}',
                descripcion  = '${ordenData.descripcion}',
                id_servicio = ${ordenData.id_servicio},
                id_aseguradora = ${ordenData.id_aseguradora},
                benef_nombre = '${ordenData.benef_nombre}',
                benef_paterno  = '${ordenData.benef_paterno}',
                benef_materno  = '${ordenData.benef_materno}',
                recibe_nombre  = '${ordenData.recibe_nombre}',
                recibe_materno  = '${ordenData.recibe_materno}',
                recibe_paterno  = '${ordenData.recibe_paterno}',
                id_tecnico  = ${ordenData.id_tecnico},
                calle  = '${ordenData.calle}',
                num_ext  = '${ordenData.num_ext}',
                num_int  = '${ordenData.num_int}',
                col  = '${ordenData.col}',
                ciudad  = '${ordenData.ciudad}',
                estado  = '${ordenData.estado}',
                entre_calle1  = '${ordenData.entre_calle1}',
                entre_calle2  = '${ordenData.entre_calle2}',
                referencia  = '${ordenData.referencia}',
                vehiculo_tipo  = '${ordenData.vehiculo_tipo}',
                vehiculo_color  = '${ordenData.vehiculo_color}',
                vehiculo_placa  = '${ordenData.vehiculo_placa}',
                vehiculo_ubicacion  = '${ordenData.vehiculo_ubicacion}',
                vehiculo_combustible  = '${ordenData.vehiculo_combustible}',
                vehiculo_litros = '${ordenData.vehiculo_litros}'
                WHERE id_orden = ${ordenData.id_orden}`;
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