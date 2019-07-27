const paciente = require('../models/paciente');

module.exports = function (app) {
    app.get('/pacientes', (req, res) => {
        paciente.getPacientes((err, data) => {
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

    app.get('/paciente/:id_paciente', (req, res) => {
        var id_pac = req.params.id_paciente;
        paciente.getPaciente(id_pac, (err, data) => {
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

    app.post('/paciente', (req, res) => {
        const pacienteData = {
            id_paciente : req.body.id_paciente,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            fecha_nac : req.body.fecha_nac,
            sexo: req.body.sexo,
            RFC : req.body.RFC,
            tel_fijo : req.body.tel_fijo,
            tel_cel : req.body.tel_cel,
            tel_alter : req.body.tel_alter,
            email : req.body.email,
            calle : req.body.calle,
            no_ext : req.body.no_ext,
            no_int : req.body.no_int,
            id_edo : req.body.id_edo,
            id_mun : req.body.id_mun,
            ciudad : req.body.ciudad,
            colonia : req.body.colonia,
            datos_fact : req.body.datos_fact,
            tipo_sangre : req.body.tipo_sangre,
            alergias : req.body.alergias,
            cronicas : req.body.cronicas,
            anotacion : req.body.anotacion
        };

        if (!pacienteData.datos_fact){
            const FacturacionData = {
                id_paciente,
                persona_fisica : req.body.fact_persona,
                razon_soc : req.body.fact_razonsoc,
                rfc : req.body.fact_rfc,
                cp : req.body.fact_cp,
                calle : req.body.fact_calle,
                no_ext : req.body.fact_ext,
                no_int : req.body.fact_int,
                id_edo : req.body.fact_idedo,
                id_mun : req.body.fact_idmun,
                colonia : req.body.fact_colonia,
                email : req.body.fact_email
            }
            paciente.insertPaciente(pacienteData, (err, data) => {
                if (err){
                    res.json({
                        success: false,
                        message: err
                    });
                }else{
                    FacturacionData.id_paciente = data.insertId;
                    console.log(FacturacionData.id_paciente);
                }
            });
        } else {
            paciente.insertPaciente(pacienteData, (err, data) => {
                if (err){
                    res.json({
                        success: false,
                        message: err
                    });
                }else{
                    res.json({
                        success: true,
                        message: "¡Registro exitoso!"
                    });
                }
            });
        }
    });

    app.put('/paciente', (req, res) => {
        const pacienteData = {
            id_paciente : req.body.id_paciente,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            fecha_nac : req.body.fecha_nac,
            sexo: req.body.sexo,
            RFC : req.body.RFC,
            tel_fijo : req.body.tel_fijo,
            tel_cel : req.body.tel_cel,
            tel_alter : req.body.tel_alter,
            email : req.body.email,
            id_consultorio : req.body.id_consultorio,
            calle : req.body.calle ,
            no_ext : req.body.no_ext,
            no_int : req.body.no_int,
            id_edo : req.body.id_edo,
            id_mun : req.body.id_mun,
            ciudad : req.body.ciudad,
            colonia : req.body.colonia,
            datos_fact : req.body.datos_fact,
            tipo_sangre : req.body.tipo_sangre,
            alergias : req.body.alergias,
            cronicas : req.body.cronicas,
            anotacion : req.body.anotacion
        };
        paciente.updatePaciente(pacienteData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se Guardaron los cambios exitosamente!"
                });
            }
        });
    });

    app.delete('/paciente/:id_paciente', (req, res) => {
        var id_pac = req.params.id_paciente;
        paciente.deletePaciente(id_pac, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se ha eliminado el registro exitosamente!"
                });
            }
        });
    });
}