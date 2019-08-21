const user = require('../models/user');

module.exports = function (app) {

    app.get('/user/:username', (req, res) => {
        var username = req.params.username;
        user.getUserByUsername(username, (err, data) => {
            res.json({user: data});
        });
    });

    app.get('/iduser/:id', (req, res) => {
        var id = req.params.id;
        var empresa = req.decoded.idEmpresa;
        user.getUserById(id,empresa, (err, data) => {
            res.json({user: data});
        });
    });

    app.get('/user/dispositivos/:username', (req, res) => {
        var usuario = req.params.username;
        user.getDeviceID(usuario, (err, data) => {
            res.json({dispositivo: data});
        });
    });

    app.get('/users_tecnicos', (req, res) => {
        var id = req.params.id;
        user.getUsersTecnicos( (err, data) => {
            res.json({
                success: true,
                data: data
            });
        });
    });

    app.get('/users_empleados', (req, res) => {
        var id = req.params.id;
        user.getUsersEmpleados( (err, data) => {
            res.json({
                success: true,
                data: data
            });
        });
    });

    app.post('/empleado', (req, res) => {
        const empleadoData = {
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            username : req.body.username,
            password : req.body.password
        }
        
        user.insertEmpleado(empleadoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró al tecnico exitosamente!"
                });
            }
        });
    });

    app.put('/empleado', (req, res) => {
        const empleadoData = {
            id_empleado : req.body.id_empleado,
            nombre : req.body.nombre,
            ap_paterno : req.body.ap_paterno,
            ap_materno : req.body.ap_materno,
            username : req.body.username,
            password : req.body.password
        }
        
        user.putEmpleado(empleadoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró al tecnico exitosamente!"
                });
            }
        });
    });

    app.put('/admin_tecnico', (req, res) => {
        const tecnicoData = {
            id_tecnico : req.body.id_tecnico,
            username : req.body.username,
            password : req.body.password
        }
        
        user.putTecnico(tecnicoData, (err, data) => {
            if (err){
                res.json({
                    success: false,
                    message: err
                });
            }else{
                res.json({
                    success: true,
                    message: "¡Se registró al tecnico exitosamente!"
                });
            }
        });
    });



    //VALIDAR CONTRASEÑA
    app.post('/checkpass', (req, res) => {
        var idEmpresa = req.decoded.idEmpresa;
        var idUser = req.decoded.idUsuario;
        user.getPass(idUser, idEmpresa, (err, data) => {
            if (err){
                res.status(500).send({message: 'Error al comprobar usuario'});
            }else{
                var array = data[0];
                if (!array || array.length <= 0 ) {
                    //res.json({ success: false, message: 'Authentication failed. User not found.' });
                    res.json({ 
                        success: false,
                        message: 'El usuario indicado no existe',
                    });
                } else if (data) {
                    if (data[0].password != req.body.Password) {
                        res.json({ 
                            success: false,
                            message: 'La contraseña indicada no es correcta',
                        });
                    } else{
                        res.json({ 
                            success: true,
                            message: 'La contraseña indicada es correcta',
                        });
                    }
                }
            }
        });
    });

}