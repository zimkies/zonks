class App.Views.Zonks extends Backbone.View

  initialize: ->
    @collection = @zonks = App.zonks

  render: ->
    @zonks.map (zonk) =>
      @$el.append new App.Views.Zonk(model: zonk).render().$el

