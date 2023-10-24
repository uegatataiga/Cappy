// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"
require("./slick")

import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}


window.$ = window.jQuery = require('jquery');

$(document).on('turbolinks:load',function() {
  $('.sliders').slick({
      arrows: false,  //ボタン非表示
      autoplay: true, //自動再生
      autoplaySpeed: 2500, //再生スピード
  });
});


Rails.start()
Turbolinks.start()
ActiveStorage.start()

