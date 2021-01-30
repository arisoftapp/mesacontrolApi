const aseguradora = require('../models/aseguradora');

module.exports = function (app) {
    app.get('/aseguradoras', (req, res) => {
        aseguradora.getAseguradoras((err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos" + err.message
                });
            } else{
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.get('/aseguradora/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.getAseguradora(id_aseguradora, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos" + err.message
                });
            } else{
                aseguradora.getPolizas(id_aseguradora, (err, dta) =>{
                    if (err){
                        res.json({
                            success: false,
                            message: "Ocurrió un error al obtener los datos" + err.message
                        });

                    } else {
                        aseguradora.getSupervisores(id_aseguradora, (err, sup) => {
                            if (err) {
                                res.json({
                                    success: true,
                                    ase: data,
                                    pol: dta,
                                    superv: []
                                });

                            } else {
                                res.json({
                                    success: true,
                                    ase: data,
                                    pol: dta,
                                    superv: sup
                                });
                            }
                        });
                    }
                });
            }
        });
    });

    app.get('/polizas/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.getPolizas(id_aseguradora, (err, dta) =>{
            if (err){
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos" + err.message
                });

            } else {
                res.json({
                    success: true,
                    data: dta
                });
                //console.log(dta);
            }
        });
    });

    app.get('/supervisores/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.getSupervisores(id_aseguradora, (err, dta) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos" + err.message
                });
            } else {
                res.json({
                    success: true,
                    data: dta
                });
                //console.log(dta);
            }
        });
    });



    app.post('/aseguradora', (req, res) => {
        const ase_data = {
            nombre_aseguradora : req.body.nombre_aseguradora,
            nombre_contacto : req.body.nombre_contacto,
            telefono : req.body.telefono,
            telefono_supervisor : req.body.telefono_supervisor
        };
        const polizas = req.body.polizas;
        const supervisores = req.body.supervisores;
        var insert_script = ("INSERT INTO poliza (id_aseguradora, id_poliza, poliza_nombre, poliza_valor, poliza_cancelacion, poliza_costo ) VALUES (");

        aseguradora.insertAseguradora(ase_data, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                });
            }else{
                var id = data.insertId;
                for (i = 0; i < polizas.length; i++) { 
                    let index = i + 1;
                    insert_script = insert_script + id + "," + index + ",'" + polizas[i].poliza_nombre + "','" + polizas[i].poliza_valor + "','" + polizas[i].poliza_cancelacion + "','" + polizas[i].poliza_costo + "')";
                    if (i < polizas.length - 1) {
                        insert_script += ",(";
                    } else {
                        insert_script += ";";
                    }
                }
                aseguradora.insertData(insert_script, (err, dta) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err.message
                        });
                    }else{
                        if (supervisores.length > 0){
                            insert_script = ("INSERT INTO supervisor (id_aseguradora, id_supervisor, nombre_supervisor, telefono) VALUES (");
                            for (i = 0; i < supervisores.length; i++) {
                                //console.log(supervisores[i].poliza_nombre);
                                let index = i + 1;
                                insert_script = insert_script + id_aseguradora + "," + index + ",'" + supervisores[i].nombre_supervisor + "','" + supervisores[i].telefono + "'";
                                if (i < supervisores.length - 1) {
                                    insert_script += "),(";
                                } else {
                                    insert_script += ");";
                                }
                            }
                            //console.log(insert_script);
                            aseguradora.insertData(insert_script, (err, dta) => {
                                if (err) {
                                    res.json({
                                        success: false,
                                        message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err.message
                                    });
                                } else {
                                    res.json({
                                        success: true,
                                        message: "¡Se guardó la aseguradora exitosamente!"
                                    });
                                }
                            });
                        } else {
                            res.json({
                                success: true,
                                message: "¡Se guardó la aseguradora exitosamente!"
                            });
                        }
                    }
                });

            }
        });
    });

    app.put('/aseguradora', (req, res) => {
        const ase_data = {
            id_aseguradora : req.body.id_aseguradora,
            nombre_aseguradora : req.body.nombre_aseguradora,
            nombre_contacto : req.body.nombre_contacto,
            telefono : req.body.telefono,
            telefono_supervisor : req.body.telefono_supervisor
        };
        const id_aseguradora = req.body.id_aseguradora;
        const polizas = req.body.polizas;
        const supervisores = req.body.supervisores;
        //console.log(polizas[0]);
        aseguradora.updateAseguradora(ase_data, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                });
            }else{
                aseguradora.deletePolizas(id_aseguradora, (err, datadel) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                        });
                    }else{
                        var insert_script = ("INSERT INTO poliza (id_aseguradora, id_poliza, poliza_nombre, poliza_valor, poliza_cancelacion, poliza_costo ) VALUES (");
                        for (i = 0; i < polizas.length; i++) { 
                            //console.log(polizas[i].poliza_nombre);
                            let index = i+1;
                            insert_script = insert_script + id_aseguradora + "," + index + ",'" + polizas[i].poliza_nombre + "'," + polizas[i].poliza_valor + "," + polizas[i].poliza_cancelacion + "," + polizas[i].poliza_costo + "";
                            if (i < polizas.length-1){
                                insert_script += "),(";
                            } else {
                                insert_script += ");";
                            }
                        }
                        //console.log(insert_script);
                        aseguradora.insertData(insert_script, (err, dta) => {
                            if (err){
                                res.json({
                                    success: false,
                                    message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err.message
                                });
                            }else{
                                aseguradora.deleteSupervisores(id_aseguradora, (err, datadel) => {
                                    if (err) {
                                        res.json({
                                            success: false,
                                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err.message
                                        });
                                    } else {
                                        if (supervisores.length > 0){
                                            var insert_script = ("INSERT INTO supervisor (id_aseguradora, id_supervisor, nombre_supervisor, telefono) VALUES (");
                                            for (i = 0; i < supervisores.length; i++) {
                                                let index = i + 1;
                                                insert_script = insert_script + id_aseguradora + "," + index + ",'" + supervisores[i].nombre_supervisor + "','" + supervisores[i].telefono + "'";
                                                if (i < supervisores.length - 1) {
                                                    insert_script += "),(";
                                                } else {
                                                    insert_script += ");";
                                                }
                                            }
                                            //console.log(insert_script);
                                            aseguradora.insertData(insert_script, (err, dta) => {
                                                if (err) {
                                                    res.json({
                                                        success: false,
                                                        message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err.message
                                                    });
                                                } else {
                                                    res.json({
                                                        success: true,
                                                        message: "¡Se editó la aseguradora exitosamente!"
                                                    });
                                                }
                                            });
                                        } else {
                                            res.json({
                                                success: true,
                                                message: "¡Se editó la aseguradora exitosamente!"
                                            });
                                        }
                                    }
                                })
                            }
                        });
                    }

                });
            }
        });
    });

    app.delete('/aseguradora/:id_aseguradora', (req, res) => {
        var id_aseguradora = req.params.id_aseguradora;
        aseguradora.deleteAseguradora(id_aseguradora, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar eliminar los datos. ' + err.message
                });
            }else{
                aseguradora.deletePolizas(id_aseguradora, (err, datadel) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar eliminar los datos. Inténtelo de nuevo.' + err.message
                        });
                    } else{
                        aseguradora.deleteSupervisores(id_aseguradora, (err, datadel) => {
                            if (err) {
                                res.json({
                                    success: false,
                                    message: 'Se presentó un error al intentar eliminar los datos. Inténtelo de nuevo.' + err.message
                                });
                            } else {
                                res.json({
                                    success: true,
                                    message: "¡Se eliminó la aseguradora exitosamente!"
                                });
                            }
                        });
                    }
                });
            }
        });
    });


}