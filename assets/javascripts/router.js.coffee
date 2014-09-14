class App.Router extends Backbone.Router

  routes:
    "": "zonks"
    "awards": "awards"
    "awards/new": "newAward"

  zonks: ->
    new App.Views.Page({el: $("#container")}).render()

  awards: ->
    new App.Views.Page({el: $("#container")}).render()

  newAward: ->
    new App.Views.Page({el: $("#container")}).render()
