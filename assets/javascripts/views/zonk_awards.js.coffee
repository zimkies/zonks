class App.Views.ZonkAwards extends Backbone.View

  initialize: ->
    @awards = @collection
    window.awards = @awards
    @listenTo @collection, 'sync', @onSync
    @listenTo @collection, 'destroy', @onSync

  render: ->
    @$el.html("")
    @awards.map (zonk) =>
      @$el.append new App.Views.ZonkAward(model: zonk).render().$el

  onSync: => @render()
