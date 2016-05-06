'use strict';

var connect = require('connect');
var serveStatic = require('serve-static');

var app = connect();
app.use('/', serveStatic('.', {'index': ['index.html']})); 
app.listen(8080);

console.log('MyApp is ready at http://localhost:8080');
