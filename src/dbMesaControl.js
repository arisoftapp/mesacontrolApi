var mysql = require ('mysql');

var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'mesacontrol_db'
});

module.exports = connection;