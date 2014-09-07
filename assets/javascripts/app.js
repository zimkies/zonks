//= require_tree ./vendor

//= require namespace
//= require_tree ./templates
//= require_tree ./views
//= require_tree ./models

app = new App.Views.Page({el: $("#container")})
app.render()


