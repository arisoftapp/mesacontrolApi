let db = require('../dbMesaControl');
let dbAdmin = require('../dbMesaControl');
let costosModel = {};

costosModel.getCostos = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM costo WHERE id_orden =  `+ id_orden, function(error, rows) {
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

costosModel.deleteCostos = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`DELETE FROM costo WHERE id_orden =  `+ id_orden, function(error, rows) {
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

costosModel.insertCostos = (costoData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`INSERT INTO costo SET ? `, costoData, function(error, rows) {
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

costosModel.updateCostosTecnico = (costoData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const sql = `UPDATE costo SET 
            mano_obra = '${costoData.mano_obra}',
            tipo_gasolina = '${costoData.tipo_gasolina}',
            gasolina_litros = ${costoData.gasolina_litros},
            gasolina = '${costoData.gasolina}',
            importe_materiales = '${costoData.importe_materiales}',
            total_tecnico = '${costoData.total_tecnico}'
            WHERE id_orden = ${costoData.id_orden}`;
        dbAdmin.query(sql, function (error, rows) {
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

costosModel.updatePreciosAse = (costoData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const sql = `UPDATE costo SET 
            precio_servicio = '${costoData.precio_servicio}',
            corres = '${costoData.corres}',
            kilometros = '${costoData.kilometros}',
            cant_km = '${costoData.cant_km}',
            precio_km = '${costoData.precio_km}',
            tipo_gasolina = '${costoData.tipo_gasolina}',
            litros_gasolina_ase = ${costoData.litros_gasolina_ase},
            precio_gasolina_ase = '${costoData.precio_gasolina_ase}',
            material_ase = '${costoData.material_ase}',
            total_ase = '${costoData.total_ase}',
            otros_ase = '${costoData.otros_ase}'
            WHERE id_orden = ${costoData.id_orden}`;
        dbAdmin.query(sql, function (error, rows) {
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

costosModel.updateCostosExce = (costoData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        const sql = `UPDATE costo SET 
            mano_obra_exce = '${costoData.mano_obra_exce}',
            material_exce = '${costoData.material_exce}',
            total_exce = '${costoData.total_exce}'
            WHERE id_orden = ${costoData.id_orden}`;
        dbAdmin.query(sql, function (error, rows) {
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

costosModel.insertMateriales = (materialesData, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(materialesData, function(error, rows) {
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


costosModel.getMateriales = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`SELECT * FROM material WHERE id_orden =  `+ id_orden, function(error, rows) {
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

costosModel.deleteMateriales = (id_orden, callback) => {
    //console.log(idEmpresa);
    if (dbAdmin) {
        dbAdmin.query(`DELETE FROM material WHERE id_orden =  `+ id_orden, function(error, rows) {
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

module.exports = costosModel;