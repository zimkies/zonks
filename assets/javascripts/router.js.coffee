class App.Router extends Backbone.Router

  initialize: ->
    App.zonks = new App.Collections.Zonks
    App.zonks.localFetch()

  routes:
    "": "zonks"
    "awards": "awards"
    "admin":  "admin"

  zonks: ->
    new App.Views.Page({el: $("#container")}).render()

  awards: ->
    new App.Views.AwardsPage({el: $("#container")}).render()

  admin: ->
    new App.Views.AdminPage({el: $("#container")}).render()
