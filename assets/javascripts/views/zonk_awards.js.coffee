class App.Views.ZonkAwards extends Backbone.View

  initialize: ->
    @awards = @collection

  render: ->
    @awards.map (zonk) =>
      @$el.append new App.Views.ZonkAward(model: zonk).render().$el
