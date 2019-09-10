let db = require('../dbMesaControl');
var dbAdmin = db.getConnection();
let ordenModel = {};

ordenModel.getOrdenes = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        a.benef_nombre, a.benef_paterno, a.benef_materno, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio ORDER BY a.id_status ASC`, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getOrdenesbyTecnico = (id_tecnico, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        a.recibe_benef, a.servicio_vial, a.benef_nombre, a.benef_paterno, a.benef_materno, a.descripcion,
        b.nombre, b.ap_paterno, b.ap_materno, c.nombre_aseguradora, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno,
        d.orden_status AS estado_orden FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status WHERE a.id_tecnico = ` + id_tecnico +` ORDER BY a.id_status ASC`, function(err, rows) {
            if (err) {
                throw err;
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getOrdenesBuscar = (buscar, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const query = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.id_tecnico, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, d.orden_status AS estado_orden FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status WHERE expediente LIKE '%` + buscar + `%' OR benef_nombre LIKE '%` + buscar + `%' OR benef_paterno LIKE '%` + buscar + `%' OR benef_materno LIKE '%` + buscar + `%'`;
        //console.log(query);
        dbAdmin.query(query, function(err, rows) {
            if (err) {
                console.log(err);
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getOrdenesBuscarbyTecnico = (buscar, id_tecnico, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const query = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.id_tecnico, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, d.orden_status AS estado_orden FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status WHERE (expediente LIKE '%` + buscar + `%' OR benef_nombre LIKE '%` + buscar + `%' OR benef_paterno LIKE '%` + buscar + `%' OR benef_materno LIKE '%` + buscar + `%') AND a.id_tecnico = ` + id_tecnico;
        //console.log(query);
        dbAdmin.query(query, function(err, rows) {
            if (err) {
                console.log(err);
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
        dbAdmin.query(`SELECT a.*, CONCAT(a.benef_nombre, " ", a.benef_paterno, " ", a.benef_materno) AS nombre_beneficiario, CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, 
        c.nombre_aseguradora, d.orden_status AS estado_orden, e.nombre_servicio, f.nombre_entidad, g.nombre_municipio, IFNULL(h.poliza_nombre,"") AS poliza_nombre, IFNULL(h.poliza_valor,"") AS poliza_valor FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio
        LEFT JOIN entidad_fed AS f ON a.id_estado = f.id_entidad
        LEFT JOIN municipio AS g ON a.id_municipio = g.id_municipio
        LEFT JOIN poliza AS h ON a.id_aseguradora = h.id_aseguradora AND a.id_poliza = h.id_poliza
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
                //console.log(error);
                callback(error);
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.insertEvidencia = (id_orden, ordenData, callback) => {
    if (dbAdmin){
        dbAdmin.query(`DELETE FROM evidencia WHERE id_orden = ` + id_orden + `;
                    INSERT INTO evidencia SET ? `, ordenData, (error, rows) => {
            if (error) {
                //console.log(error);
                callback(error);
            } else {                  
                callback(null, rows);
            }
        });
    }
} 

ordenModel.getMaxId = (callback) => {
    if (dbAdmin){
        dbAdmin.query(`SELECT MAX(id_orden) AS 'mayor' FROM orden `, (error, rows) => {
            if (error) {
                //console.log(error);
                callback(error);
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
                id_poliza = ${ordenData.id_poliza},
                folio_cierre = '${ordenData.folio_cierre}',
                observaciones = '${ordenData.observaciones}',
                benef_nombre = '${ordenData.benef_nombre}',
                benef_paterno  = '${ordenData.benef_paterno}',
                benef_materno  = '${ordenData.benef_materno}',
                recibe_nombre  = '${ordenData.recibe_nombre}',
                recibe_materno  = '${ordenData.recibe_materno}',
                recibe_paterno  = '${ordenData.recibe_paterno}',
                id_tecnico  = ${ordenData.id_tecnico},
                asignada  = '${ordenData.asignada}',
                calle  = '${ordenData.calle}',
                num_ext  = '${ordenData.num_ext}',
                num_int  = '${ordenData.num_int}',
                col  = '${ordenData.col}',
                id_municipio  = ${ordenData.id_municipio},
                id_estado  = ${ordenData.id_estado},
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

ordenModel.updateOrdenbyTecnico = (ordenData, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                observaciones = '${ordenData.observaciones}'
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

ordenModel.updateProgramada = (id_orden, id_status, callback) => {
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + ` WHERE id_orden = ` + id_orden ;
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

ordenModel.cancelarOrden = (id_orden, id_status, dateTime, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, cancelada = '`+ dateTime +`' WHERE id_orden = ` + id_orden;
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

ordenModel.updateFacturado = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, facturado = '`+ time + `' WHERE id_orden = ` + id_orden ;
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