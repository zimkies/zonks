class App.Views.Awards.Zonks extends Backbone.View

  initialize: ->
    @collection = @zonks = App.zonks

  render: ->
    @zonks.map (zonk) =>
      @$el.append new App.Views.Awards.Zonk(model: zonk).render().$el

