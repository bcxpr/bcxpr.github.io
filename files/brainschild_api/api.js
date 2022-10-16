var express = require('express');
var router = express.Router();

// router.get('/', function(req, res){
//    res.send('Hello, This is Brainschild API GET');
// });

//username and password
const myusername = 'admin'
const mypassword = 'uK@m3Lo0cing|-|uH!'

// a variable to save a session
var session;

router.post('/', function(req, res){
   res.send('Hello, This is Brainschild API POST');
});

router.get('/',(req,res) => {
   session=req.session;
   if(session.userid){
       res.send("Welcome User <a href=\'/logout'>click to logout</a>");
   }else
   res.sendFile('views/index.html',{root:__dirname})
});

router.post('/user',(req,res) => {
   if(req.body.username == myusername && req.body.password == mypassword){
       session=req.session;
       session.userid=req.body.username;
       console.log(req.session)
       res.send(`Hey there, welcome <a href=\'/logout'>click to logout</a>`);
   }
   else{
       res.send('Invalid username or password');
   }
})

//export this router to use in our index.js
module.exports = router;