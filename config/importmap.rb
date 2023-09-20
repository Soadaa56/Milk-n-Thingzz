# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.5/dist/trix.esm.min.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.0.8/app/assets/javascripts/actiontext.js"
pin_all_from "app/javascript/controllers", under: "controllers"
