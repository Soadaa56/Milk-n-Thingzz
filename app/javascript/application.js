// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .
//= require controllers
//= require trix
//= require @rails/actiontext
//= require activestorage
//= require actiontext

// import "@popperjs/core";
import "@hotwired/turbo-rails";
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import "trix";
import "@rails/actiontext";
import "./controllers";

document.addEventListener("turbo:load", (event) => {
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-RBK38KTC2X');
})
// import "controllers";
  