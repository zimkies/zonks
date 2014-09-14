class App.Router extends Backbone.Router

  initialize: ->
    App.zonks = new App.Collections.Zonks
    App.zonks.localFetch()

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
