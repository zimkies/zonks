//= require_tree ./vendor

//= require namespace
//= require router
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views

App.router = new App.Router
Backbone.history.start()
