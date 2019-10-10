const aseguradora = require('../models/aseguradora');

module.exports = function (app) {
    app.get('/aseguradoras', (req, res) => {
        aseguradora.getAseguradoras((err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
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
                    message: "Ocurrió un error al obtener los datos"
                });
            } else{
                aseguradora.getPolizas(id_aseguradora, (err, dta) =>{
                    if (err){
                        res.json({
                            success: false,
                            message: "Ocurrió un error al obtener los datos"
                        });

                    } else {
                        res.json({
                            success: true,
                            ase: data,
                            pol: dta
                        });
                        //console.log(dta);
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
                    message: "Ocurrió un error al obtener los datos"
                });

            } else {
                res.json({
                    success: true,
                    data: dta
                });
                console.log(dta);
            }
        });
    });



    app.post('/aseguradora', (req, res) => {
        const ase_data = {
            nombre_aseguradora : req.body.nombre_aseguradora,
            nombre_contacto : req.body.nombre_contacto,
            telefono : req.body.telefono
        };
        const polizas = req.body.polizas;
        const insert_script = ("INSERT INTO poliza (id_aseguradora, id_poliza, poliza_nombre, poliza_valor ) VALUES (");

        aseguradora.insertAseguradora(ase_data, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                var id = data.insertId;
                for (i = 1; i < polizas.length; i++) { 
                    insert_script = insert_script + id + "," + i + "," + polizas[i].poliza_nombre + "," + polizas[1].poliza_valor + "," + polizas[i].poliza_cancelacion + ")";
                    if (i <= polizas.length){
                        insert_script += ",";
                    } else {
                        insert_script += ";";
                    }
                }
                aseguradora.insertPolizas(insert_script, (err, dta) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err
                        });
                    }else{
                        res.json({
                            success: true,
                            message: "¡Se registró la aseguradora exitosamente!"
                        });
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
            telefono : req.body.telefono
        };
        const id_aseguradora = req.body.id_aseguradora;
        const polizas = req.body.polizas;
        console.log(polizas[0]);
        aseguradora.updateAseguradora(ase_data, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                aseguradora.deletePolizas(id_aseguradora, (err, datadel) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                        });
                    }else{
                        var insert_script = ("INSERT INTO poliza (id_aseguradora, id_poliza, poliza_nombre, poliza_valor, poliza_cancelacion, poliza_costo ) VALUES (");
                        for (i = 0; i < polizas.length; i++) { 
                            console.log(polizas[i].poliza_nombre);
                            let index = i+1;
                            insert_script = insert_script + id_aseguradora + "," + index + ",'" + polizas[i].poliza_nombre + "','" + polizas[i].poliza_valor + "','" + polizas[i].poliza_cancelacion + "','" + polizas[i].poliza_costo + "')";
                            if (i < polizas.length-1){
                                insert_script += ",(";
                            } else {
                                insert_script += ";";
                            }
                        }
                        //console.log(insert_script);
                        aseguradora.insertPolizas(insert_script, (err, dta) => {
                            if (err){
                                res.json({
                                    success: false,
                                    message: 'Se presentó un error al intentar guardar los datos de las pólizas.' + err
                                });
                            }else{
                                res.json({
                                    success: true,
                                    message: "¡Se editó la aseguradora exitosamente!"
                                });
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
                    message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                });
            }else{
                aseguradora.deletePolizas(id_aseguradora, (err, datadel) => {
                    if (err){
                        res.json({
                            success: false,
                            message: 'Se presentó un error al intentar guardar los datos. Inténtelo de nuevo.' + err
                        });
                    } else{
                        res.json({
                            success: true,
                            message: "¡Se eliminó la aseguradora exitosamente!"
                        });
                    }
                });
            }
        });
    });


}