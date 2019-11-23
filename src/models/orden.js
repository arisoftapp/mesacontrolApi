let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let ordenModel = {};

ordenModel.getOrdenes = (script, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(script, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            } else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getAllOrdenes = (callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_tipo, a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        a.entre_calle1, a.entre_calle2, a.col,
        a.benef_nombre, a.benef_paterno, a.benef_materno, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio ORDER BY a.id_status ASC`, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};


ordenModel.getOrdenesbyTecnico = (id_tecnico, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        a.recibe_benef, a.servicio_vial, a.benef_nombre, a.benef_paterno, a.benef_materno, a.descripcion,
        b.nombre, b.ap_paterno, b.ap_materno, c.nombre_aseguradora, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno,
        d.orden_status AS estado_orden FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status WHERE a.id_tecnico = ` + id_tecnico +` AND id_tipo = 1 ORDER BY a.id_status ASC`, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getAllOrdenesbyTecnico = (id_tecnico, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`SELECT a.id_tipo, a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        a.recibe_benef, a.servicio_vial, a.benef_nombre, a.benef_paterno, a.benef_materno, a.descripcion,
        b.nombre, b.ap_paterno, b.ap_materno, c.nombre_aseguradora, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno, 
        d.orden_status AS estado_orden FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status WHERE a.id_tecnico = ` + id_tecnico +` ORDER BY a.id_status ASC`, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
};

ordenModel.getCostoPoliza = (id_orden, callback) => {
    if (dbAdmin) {
        const query = `SELECT a.id_orden, h.poliza_costo FROM orden AS a
        LEFT JOIN poliza AS h ON a.id_aseguradora = h.id_aseguradora AND a.id_poliza = h.id_poliza
        WHERE a.id_orden = ` + id_orden;
        dbAdmin.query(query, function (error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
}

ordenModel.getLayoutData = (id_orden, callback) => {
    if (dbAdmin){
        const query = `SELECT a.id_orden, a.expediente, a.folio_cierre, a.servicio_vial, DATE_FORMAT(fin, "%H:%i") AS fin,
        a.vehiculo_ubicacion, a.vehiculo_tipo, a.vehiculo_color, a.vehiculo_placa, DATE_FORMAT(arribo, "%H:%i") AS arribo,
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        e.nombre_servicio, a.calle, IFNULL(a.num_ext, 'S/N') AS num_ext, IFNULL(a.col, '') AS col, h.poliza_costo, f.nombre_entidad, m.nombre_municipio,
        e.erp, i.corres, i.gasolina, i.gasolina_litros, i.tipo_gasolina, i.kilometros, i.cant_km FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN entidad_fed AS f ON a.id_estado = f.id_entidad
        LEFT JOIN municipio AS m ON a.id_municipio = m.id_municipio
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
        LEFT JOIN poliza AS h ON a.id_aseguradora = h.id_aseguradora AND a.id_poliza = h.id_poliza
        LEFT JOIN costo AS i ON a.id_orden = i.id_orden
        WHERE a.id_orden = ` + id_orden;
        dbAdmin.query(query, function (error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            }
            else {
                callback(null, rows);
            }
        });
    }
}
ordenModel.getOrdenesBuscar = (buscar, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const query = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        a.benef_nombre, a.benef_paterno, a.benef_materno, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno, a.entre_calle1, a.entre_calle2, a.col,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
        WHERE id_tipo = 1 AND (expediente LIKE '%` + buscar + `%' OR benef_nombre LIKE '%` + buscar + `%' OR benef_paterno LIKE '%` + buscar + `%' OR benef_materno LIKE '%` + buscar + `%')`;
        //console.log(query);
        dbAdmin.query(query, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
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
        const query = `SELECT a.id_orden, a.expediente, a.id_status, a.levantamiento, a.asignada, a.id_tecnico, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario,
        a.benef_nombre, a.benef_paterno, a.benef_materno, e.nombre_servicio, a.calle, a.num_int, a.num_ext,
        a.recibe_nombre, a.recibe_paterno, a.recibe_materno, a.entre_calle1, a.entre_calle2, a.col,
        CONCAT(b.nombre," ",b.ap_paterno," ", b.ap_materno) AS nombre_tecnico, c.nombre_aseguradora, a.descripcion,
        d.orden_status AS estado_orden, a.recibe_benef, a.servicio_vial FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio 
        WHERE id_tipo = 1 AND (expediente LIKE '%` + buscar + `%' OR benef_nombre LIKE '%` + buscar + `%' OR benef_paterno LIKE '%` + buscar + `%' OR benef_materno LIKE '%` + buscar + `%') AND a.id_tecnico = ` + id_tecnico;
        //console.log(query);
        dbAdmin.query(query, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
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
        c.nombre_aseguradora, d.orden_status AS estado_orden, e.nombre_servicio, f.nombre_entidad, g.nombre_municipio, IFNULL(h.poliza_nombre,"") AS poliza_nombre, IFNULL(i.nombre_supervisor,"") AS nombre_supervisor, IFNULL(h.poliza_valor,"") AS poliza_valor, h.poliza_costo FROM orden AS a
        LEFT JOIN tecnico AS b ON a.id_tecnico = b.id_tecnico
        LEFT JOIN aseguradora AS c ON a.id_aseguradora = c.id_aseguradora
        LEFT JOIN estado_orden AS d ON a.id_status = d.id_status
        LEFT JOIN servicio AS e ON a.id_servicio = e.id_servicio
        LEFT JOIN entidad_fed AS f ON a.id_estado = f.id_entidad
        LEFT JOIN municipio AS g ON a.id_municipio = g.id_municipio
        LEFT JOIN poliza AS h ON a.id_aseguradora = h.id_aseguradora AND a.id_poliza = h.id_poliza
        LEFT JOIN supervisor AS i ON a.id_aseguradora = i.id_aseguradora AND a.id_supervisor= i.id_supervisor
        WHERE a.id_orden = ` + id_orden, function(error, rows) {
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
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
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
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
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
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
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error)
                }
            } else {                  
                callback(null, rows);
            }
        });
    }
}

ordenModel.updateFolioFact = (ordenData, callback) => {
    if ( dbAdmin ) {
        const sql = `UPDATE orden SET 
               folio_factura = '${ordenData.folio_factura}'
               WHERE id_orden = ${ordenData.id_orden}`;
        dbAdmin.query(sql, function (error, rows) {
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

ordenModel.updateOrden = (ordenData, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                expediente = '${ordenData.expediente}',
                descripcion  = '${ordenData.descripcion}',
                id_servicio = ${ordenData.id_servicio},
                id_aseguradora = ${ordenData.id_aseguradora},
                id_poliza = ${ordenData.id_poliza},
                id_supervisor = ${ordenData.id_supervisor},
                folio_cierre = '${ordenData.folio_cierre}',
                ejecutivo_cab = '${ordenData.ejecutivo_cab}',
                folio_factura = '${ordenData.folio_factura}',
                folio_recepcion = '${ordenData.folio_recepcion}',
                observaciones = '${ordenData.observaciones}',
                benef_nombre = '${ordenData.benef_nombre}',
                benef_paterno  = '${ordenData.benef_paterno}',
                benef_materno  = '${ordenData.benef_materno}',
                benef_tel  = '${ordenData.benef_tel}',
                recibe_benef  = '${ordenData.recibe_benef}',
                recibe_nombre  = '${ordenData.recibe_nombre}',
                recibe_materno  = '${ordenData.recibe_materno}',
                recibe_paterno  = '${ordenData.recibe_paterno}',
                recibe_tel  = '${ordenData.recibe_tel}',
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
                servicio_vial  = '${ordenData.servicio_vial}',
                vehiculo_tipo  = '${ordenData.vehiculo_tipo}',
                vehiculo_color  = '${ordenData.vehiculo_color}',
                vehiculo_placa  = '${ordenData.vehiculo_placa}',
                vehiculo_ubicacion  = '${ordenData.vehiculo_ubicacion}',
                vehiculo_combustible  = '${ordenData.vehiculo_combustible}',
                vehiculo_litros = '${ordenData.vehiculo_litros}'
                WHERE id_orden = ${ordenData.id_orden}`;
        dbAdmin.query(sql, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    console.log(error.message);
                    callback(error);
                }
            } else {  
                //console.log(rows);                
                callback(null, rows);
            }
        });
    }
}

ordenModel.updateOrdenbyTecnico = (ordenData, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                observaciones = '${ordenData.observaciones}',
                vehiculo_placa = '${ordenData.vehiculo_placa}'
                WHERE id_orden = ${ordenData.id_orden}`;
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

ordenModel.updateProgramada = (id_orden, id_status, callback) => {
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + ` WHERE id_orden = ` + id_orden ;
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

ordenModel.updateArribo = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, arribo = '`+ time + `' WHERE id_orden = ` + id_orden ;
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

ordenModel.cancelarOrden = (id_orden, id_status, dateTime, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, cancelada = '`+ dateTime +`' WHERE id_orden = ` + id_orden;
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

ordenModel.updateFinalizado = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, fin = '`+ time + `' WHERE id_orden = ` + id_orden ;
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

ordenModel.updateFacturado = (id_orden, id_status, time, callback) =>{
    if (dbAdmin){
        const sql = `UPDATE orden SET 
                id_status = ` + id_status + `, facturado = '`+ time + `' WHERE id_orden = ` + id_orden ;
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

ordenModel.deleteOrden = (id_orden, callback) => {
    if (dbAdmin){
        const orden = `DELETE FROM orden WHERE id_orden = ` + id_orden;
        const evi = `DELETE FROM evidencia WHERE id_orden = ` + id_orden;
        const costo = `DELETE FROM costo WHERE id_orden = ` + id_orden;
        dbAdmin.query(orden, function (error, rows){
            if (error) {
                if (error.fatal) {
                    throw (error);
                } else {
                    callback(error);
                }
            } else {   
                dbAdmin.query(evi, function (error, rows) {
                    if (error) {
                        if (error.fatal) {
                            throw (error);
                        } else {
                            callback(error);
                        }
                    } else { 
                        dbAdmin.query(costo, function (error, rows) {
                            if (error) {
                                if (error.fatal) {
                                    throw (error);
                                } else {
                                    callback(error);
                                }
                            } else {                                                  
                                callback(null, rows);
                            }
                        })
                    }
                })
            }
        });
    }
};

ordenModel.deleteEvidencia = (id, callback) => {
    if (dbAdmin) {
        const evi = `DELETE FROM evidencia WHERE id_evidencia = ` + id;
        dbAdmin.query(evi, function (error, rows) {
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
};

ordenModel.upload_evidencia = (imageData, callback) => {
    if (dbAdmin){
        dbAdmin.query(imageData, function (error, rows){
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

ordenModel.upload_pdf= (id_orden, imageData, callback) => {
    if (dbAdmin){
        dbAdmin.query(`UPDATE orden SET 
        url_pdf = '` + imageData + `' WHERE id_orden = ` + id_orden , function (error, rows){
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

ordenModel.upload_xml= (id_orden, imageData, callback) => {
    if (dbAdmin){
        dbAdmin.query(`UPDATE orden SET 
        url_xml = '` + imageData + `' WHERE id_orden = ` + id_orden , function (error, rows){
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

ordenModel.getEvidencia = (id_orden, callback) => {
    if (dbAdmin){
        dbAdmin.query(`SELECT * FROM evidencia WHERE id_orden = ` + id_orden, function(error, rows) {
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

ordenModel.updateStatus = (id_orden, nuevo, callback) => {
    if (dbAdmin) {
        dbAdmin.query(`UPDATE orden SET 
        id_status = '` + nuevo + `' WHERE id_orden = ` + id_orden, function (error, rows) {
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

module.exports = ordenModel;