const express = require('express')
const logger = require('morgan');
const https = require('https')
const http = require('http')
const helmet = require('helmet')

const cookieParser = require("cookie-parser");
const session = require('express-session')

const port = 5000
const app = express()

app.disable('x-powered-by')


const router = express.Router();

// app.set('trust proxy', 1) // trust first proxy

// parsing the incoming data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//serving public file
app.use(express.static(__dirname));


const oneDay = 1000 * 60 * 60 * 24;

const bcxpr = {
    // genid: function (req) {
    //     return genuuid()
    // },
    secret: 'uK@m3Lo0cing| -| uH!',
resave: false,
    saveUninitialized: true,
        name: 'we@reS3CurE',
            cookie: {
    maxAge: oneDay
},
}

//username and password
const myusername = 'admin'
const mypassword = 'uK@m3Lo0cing|-|uH!'

// a variable to save a session
// var session;


// cookie parser middleware
app.use(cookieParser());

app.use(session(bcxpr))

app.use(logger('dev'))
app.use(helmet())

const api = require("./api")

app.use('/API', api)

app.listen(port, function (err) {
    if (err) console.log("Error in server setup")
    console.log("Server listening on Port", port);
})


// app.get('/', function (req, res) {
//     res.send('Hello, This is Brainschild API')
// })

// app.post('/', function(req, res){
//     res.send('Hello, This is Brainschild API POST');
//  });
