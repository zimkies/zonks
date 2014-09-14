class App.Router extends Backbone.Router

  initialize: ->
    App.zonks = new App.Collections.Zonks
    App.zonks.localFetch()

  routes:
    "": "zonks"
    "awards": "awards"

  zonks: ->
    new App.Views.Page({el: $("#container")}).render()

  awards: ->
    new App.Views.AwardsPage({el: $("#container")}).render()
