const express = require('express');
const cors = require('cors');
const server = express();
const jwt = require('jsonwebtoken');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const config = require('./config');
const upload = require('express-fileupload');

server.use(upload());

server.use(cors({ credentials: true, origin: true }));
//settings
const port = process.env.PORT || 3004;
server.set('port', process.env.PORT || 3004);
server.set('secret', config.secret);
//middleware
server.use(morgan('dev'));
//server.use(bodyParser.json());
server.use(bodyParser.json({limit: "50mb"}));
server.use(bodyParser.urlencoded({limit: "50mb", extended: true, parameterLimit:50000}));

server.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type,x-access-token');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    //console.log("Pasando por middleware cors")
    next();
});

// Rutas
require ('./routes/log')(server);
server.use('/static', express.static('evidencias'));
server.use('/files_p', express.static('evidencias/PDF'));
server.use('/files_x', express.static('evidencias/XML'));
server.use('/comp_pago', express.static('pagos'));
//server.use('/static', express.static(__dirname + '/evidencias'));

server.use(function (err, req, res, next) {  //Control de errores
    console.error(err)
    res.status(500).json({ message: 'an error occurred' })
});

//Middleware to check whether you're auth - Todas las rutas arriba estan desprotegidas
server.use(function (req, res, next) {
    // check header or url parameters or post parameters for token
    var token = req.body.token || req.query.token || req.headers['x-access-token'];
    // decode token
    if (token) {
        // verifies secret and checks exp
        jwt.verify(token, server.get('secret'), function (err, decoded) {
            if (err) {
                return res.json({ success: false, message: 'Falló la autenticación del token.' });
            } else {
                // if everything is good, save to request for use in other routes
                req.decoded = decoded;
                next();
            }
        });
    } else {
        // if there is no token
        // return an error
        return res.status(405).json({
            success: false,
            message: 'No token provided.'
        });

    }
});


//// Middleware token - Todas las rutas bajo esto estaran protegidas \\\\
require ('./routes/aseguradora')(server);
require ('./routes/tecnico')(server);
require ('./routes/servicio')(server);
require ('./routes/orden')(server);//RUTAS DE LAS ORDENES POR ASEGURADORA
require ('./routes/orden_interna.route')(server);
require ('./routes/user')(server);
require ('./routes/costos.route')(server);
require ('./routes/empresa')(server);
require ('./routes/entidad')(server);
require('./routes/reporte.route')(server);
require('./routes/encuesta.route')(server);
require('./routes/pago.route')(server);




server.listen(server.get('port'), () => {
    console.log("MesaControlWebService in the port 3004");
});