class App.Views.ZonkAwards extends Backbone.View

  initialize: (options) ->
    @editable = if options.editable? then options.editable else false
    @awards = @collection
    window.awards = @awards
    @listenTo @collection, 'sync', @onSync
    @listenTo @collection, 'destroy', @onSync

  render: ->
    @$el.html("")
    @awards.map (zonk) =>
      @$el.append new App.Views.ZonkAward(model: zonk, editable: @editable).render().$el

  onSync: => @render()
