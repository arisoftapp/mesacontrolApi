const costos = require('../models/costos.model');

module.exports = function (app) {
    app.get('/costos/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        costos.getCostos(id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos " + err.message
                });
            } else{
                costos.getMateriales(id_orden, (err, mat) =>{
                    if (err){
                        res.json({
                            success: false,
                            message: "Ocurrió un error al obtener los datos " + err.message
                        });
                    } else {
                        res.json({
                            success: true,
                            costos: data,
                            materiales : mat
                        });
                    }
                });
            }
        });
    });

    app.put('/costos_tecnico', (req, res) => {
        const costosData = {
            id_orden : req.body.id_orden,
            mano_obra : req.body.mano_obra,
            gasolina_litros : req.body.gasolina_litros,
            tipo_gasolina : req.body.tipo_gasolina,
            gasolina : req.body.gasolina,
            importe_materiales : req.body.importe_materiales,
            total_tecnico: req.body.total
        };
        //console.log(costosData);
        const id_orden = req.body.id_orden;
        const materiales = req.body.materiales;
        var insert_script = ("INSERT INTO material (id_orden, descripcion, cantidad, precio_unitario, importe ) VALUES (");
        costos.updateCostosTecnico(costosData, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo. ' + err.message
                });
            } else {
                if (materiales.length > 0) {
                    costos.deleteMateriales(id_orden, (err, dta) => {
                        if (err) {
                            res.json({
                                success: false,
                                message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo. ' + err.message
                            });
                        } else {
                            for (i = 0; i < materiales.length; i++) {
                                insert_script = insert_script + id_orden + ",'" + materiales[i].descripcion + "'," + materiales[i].cantidad + "," + materiales[i].precio_unitario + "," + materiales[i].importe + ")";
                                if (i < materiales.length - 1) {
                                    insert_script += ",(";
                                } else {
                                    insert_script += ";";
                                }
                            }
                            //console.log(insert_script);
                            costos.insertMateriales(insert_script, (err, data) => {
                                if (err) {
                                    res.json({
                                        success: false,
                                        message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo. ' + err.message
                                    });
                                } else {
                                    res.json({
                                        success: true,
                                        message: "¡Se registraron los costos de la orden exitosamente!"
                                    });
                                }
                            });
                        }
                    });
                } else {
                    res.json({
                        success: true,
                        message: "¡Se registraron los costos de la orden exitosamente!"
                    });
                }
                
            }
        });
    });

    app.put('/precios_aseguradora', (req, res) => {
        const costosData = {
            id_orden: req.body.id_orden,
            precio_servicio: req.body.precio_servicio,
            corres: req.body.corres,
            kilometros: req.body.kilometros,
            cant_km: req.body.cant_km,
            precio_km: req.body.precio_km,
            litros_gasolina_ase: req.body.litros_gasolina_ase,
            tipo_gasolina: req.body.tipo_gasolina,
            precio_gasolina_ase: req.body.precio_gasolina_ase,
            material_ase: req.body.material_ase,
            total_ase: req.body.total_ase,
            otros_ase: req.body.otros_ase
        };
        //console.log(costosData);
        costos.updatePreciosAse(costosData, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo. ' + err.message
                });
            } else {
                res.json({
                    success: true,
                    message: "¡Se registraron los costos de la orden exitosamente!"
                });
            }
        });
    });

    app.put('/costos_excedentes', (req, res) => {
        const costosData = {
            id_orden: req.body.id_orden,
            mano_obra_exce: req.body.mano_obra_exce,
            material_exce: req.body.material_exce,
            total_exce: req.body.total_exce
        };
        //console.log(costosData);
        costos.updateCostosExce(costosData, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo. ' + err.message
                });
            } else {
                res.json({
                    success: true,
                    message: "¡Se registraron los costos de la orden exitosamente!"
                });
            }
        });
    });

}