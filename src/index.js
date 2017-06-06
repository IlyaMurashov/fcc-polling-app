'use strict';

require('./index.html');

require('./public/css/main.css');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);