const express = require('express');
const app = express();

app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('view', './views');

const server = require('http').Server(app);
const io = require('socket.io')(server);

server.listen(3000)

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

const mongoose = require('mongoose');
mongoose.connect('mongodb+srv://minigame:949oDA3u0TsJSpkj@cluster0.cwvzs.mongodb.net/minigame?retryWrites=true&w=majority', {}, function(err) {
  if(err){
    console.log("monggo db",err);
  }
})

require('./controllers/game.js')(app);