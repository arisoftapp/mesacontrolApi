const orden = require('../models/orden');
const tecnico = require('../models/tecnico');
const reporte = require('../models/reporte.model');
const costos = require('../models/costos.model');

module.exports = function (app) {
    app.get('/reporte_r01/:id_status/:id_aseguradora/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        const id_status = req.params.id_status;
        const id_aseguradora = req.params.id_aseguradora;
        const id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;

        let script = `SELECT a.id_orden, a.expediente, a.asignada, a.folio_cierre, a.folio_recepcion, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario, 
        CONCAT(a.calle, " ", a.num_ext, ", ", a.col, ", ", b.nombre_municipio, ", ", c.nombre_entidad ) AS domicilio,
        d.nombre_servicio, e.mano_obra, e.importe_materiales, e.corres, e.kilometros, e.total FROM orden AS a
        LEFT JOIN municipio AS b ON a.id_municipio = b.id_municipio
        LEFT JOIN entidad_fed AS c ON a.id_estado = c.id_entidad
        LEFT JOIN servicio AS d ON a.id_servicio = d.id_servicio
        LEFT JOIN costo AS e ON a.id_orden = e.id_orden
        LEFT JOIN aseguradora AS f ON a.id_aseguradora = f.id_aseguradora WHERE a.id_tipo = 1`;
        let where = 0;
        if (id_status > 0){
            script += ' AND a.id_status = ' + id_status;
        }
        if (id_aseguradora > 0){
            script += ' AND a.id_aseguradora = ' + id_aseguradora;
        }
        if (id_tecnico > 0){
            script += ' AND a.id_tecnico = ' + id_tecnico;
        }

        if (fecha_opc > 0) {
            if (fecha_opc <= 2){
                script += " AND DATE(a.asignada) = '" + fecha + "'";
                where++;
            } else {
                script += " AND DATE(a.asignada) BETWEEN '" + fecha_inicio + "' AND '" + fecha_fin + "'";
                where++;
            }
        }
        script += ' ORDER BY a.asignada ASC;'
        console.log(script);
        reporte.getR01(script, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos"
                });
            } else {
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });

    app.get('/reporte_r02/:id_status/:id_tecnico/:fecha_opc/:fecha/:fecha_inicio/:fecha_fin', (req, res) => {
        const id_status = req.params.id_status;
        const id_aseguradora = req.params.id_aseguradora;
        const id_tecnico = req.params.id_tecnico;
        const fecha_opc = req.params.fecha_opc;
        const fecha = req.params.fecha;
        const fecha_inicio = req.params.fecha_inicio;
        const fecha_fin = req.params.fecha_fin;

        let script = `SELECT a.id_orden, a.expediente, a.asignada, a.folio_cierre, a.folio_recepcion, 
        CONCAT(a.benef_nombre," ",a.benef_paterno," ", a.benef_materno) AS nombre_beneficiario, 
        CONCAT(a.calle, " ", a.num_ext, ", ", a.col, ", ", b.nombre_municipio, ", ", c.nombre_entidad ) AS domicilio,
        d.nombre_servicio, e.mano_obra, e.importe_materiales, e.corres, e.kilometros, e.total FROM orden AS a
        LEFT JOIN municipio AS b ON a.id_municipio = b.id_municipio
        LEFT JOIN entidad_fed AS c ON a.id_estado = c.id_entidad
        LEFT JOIN servicio AS d ON a.id_servicio = d.id_servicio
        LEFT JOIN costo AS e ON a.id_orden = e.id_orden WHERE a.id_tipo = 1`;
        let where = 0;
        if (id_status > 0) {
            script += ' AND a.id_status = ' + id_status;
        }
        if (id_aseguradora > 0) {
            script += ' AND a.id_aseguradora = ' + id_aseguradora;
        }
        if (id_tecnico > 0) {
            script += ' AND a.id_tecnico = ' + id_tecnico;
        }

        if (fecha_opc > 0) {
            if (fecha_opc <= 2) {
                script += " AND DATE(a.asignada) = '" + fecha + "'";
                where++;
            } else {
                script += " AND DATE(a.asignada) BETWEEN '" + fecha_inicio + "' AND '" + fecha_fin + "'";
                where++;
            }
        }
        script += ' ORDER BY a.asignada ASC;'
        //console.log(script);
        reporte.getR01(script, (err, data) => {
            if (err) {
                res.json({
                    success: false,
                    message: "Ocurrió un error al obtener los datos. " + err.message
                });
            } else {
                res.json({
                    success: true,
                    data: data
                });
            }
        });
    });
}