class App.Views.Awards.Zonk extends Backbone.View

  className: 'zonk col-sm-1 col-xs-2'

  template: JST['templates/awards/zonk']

  initialize: ->
    @zonks = @model

  render: ->
    @$el.html @template(@model.toJSON())
    @
