//= require_tree ./vendor

//= require namespace
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views


app = new App.Views.Page({el: $("#container")})
app.render()


