const costos = require('../models/costos.model');

module.exports = function (app) {
    app.get('/costos/:id_orden', (req, res) => {
        var id_orden = req.params.id_orden;
        costos.getCostos(id_orden, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
                });
            } else{
                costos.getMateriales(id_orden, (err, mat) =>{
                    if (err){
                        res.json({
                            success: false,
                            message: "Ocurrió un error al obtener los datos"
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

    app.post('/costos', (req, res) => {
        const costosData = {
            id_orden : req.body.id_orden,
            mano_obra : req.body.mano_obra,
            corres : req.body.corres,
            kilometros : req.body.kilometros,
            importe_materiales : req.body.importe_materiales,
            total : req.body.total
        };
        const id_orden = req.body.id_orden;
        const materiales = req.body.materiales;
        var insert_script = ("INSERT INTO material (id_orden, descripcion, cantidad, precio_unitario, importe ) VALUES (");

        costos.deleteCostos(id_orden, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            } else {
                costos.insertCostos(costosData, (err,data) => {
                    if (err) {
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                        });
                    } else {
                        costos.deleteMateriales(id_orden, (err, dta) => {
                            if (err){
                                res.json({
                                    success: false,
                                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                                });
                            } else {
                                for (i = 0; i < materiales.length; i++) { 
                                    insert_script = insert_script + id_orden + ",'" + materiales[i].descripcion + "'," + materiales[i].cantidad + "," + materiales[i].precio_unitario + "," + materiales[i].importe + ")";
                                    if (i < materiales.length-1){
                                        insert_script += ",(";
                                    } else {
                                        insert_script += ";";
                                    }
                                }
                                console.log(insert_script);
                                costos.insertMateriales(insert_script, (err,data) => {
                                    if (err) {
                                        res.json({
                                            success: false,
                                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
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
                    }
                });
            }
        });
    });
}