// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// import "@popperjs/core";
import "@hotwired/turbo-rails";
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import "trix";
import "@rails/actiontext";
import "controllers";
// import "./controllers";

document.addEventListener("turbo:load", (event) => {
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-RBK38KTC2X');
})
  import "@rails/request.js"
