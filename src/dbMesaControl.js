var mysql = require ('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    //password : 'arisoft.2019',
    password : '',
    database : 'mesacontrol_db'
});

connection.on('error', function (err) {

    //-
    //- The server close the connection.
    //-
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
        console.log("/!\\ Cannot establish a connection with the database. /!\\ (" + err.code + ")");
        return reconnect(connection);
    }

    else if (err.code === "PROTOCOL_ENQUEUE_AFTER_QUIT") {
        console.log("/!\\ Cannot establish a connection with the database. /!\\ (" + err.code + ")");
        return reconnect(connection);
    }

    else if (err.code === "PROTOCOL_ENQUEUE_AFTER_FATAL_ERROR") {
        console.log("/!\\ Cannot establish a connection with the database. /!\\ (" + err.code + ")");
        return reconnect(connection);
    }

    else if (err.code === "PROTOCOL_ENQUEUE_HANDSHAKE_TWICE") {
        console.log("/!\\ Cannot establish a connection with the database. /!\\ (" + err.code + ")");
    }

    else {
        console.log("/!\\ Cannot establish a connection with the database. /!\\ (" + err.code + ")");
        return reconnect(connection);
    }

});


// Open a connection automatically at app startup.
//module.exports.getConnection();

// If you've saved this file as database.js, then get and use the
// connection as in the following example:
// var database = require(__dirname + "/database");
// var connection = database.getConnection();
// connection.query(query, function(err, results) { ....
module.exports = connection;