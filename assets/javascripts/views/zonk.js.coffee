class App.Views.Zonk extends Backbone.View

  className: 'zonk'

  template: JST['templates/zonk']

  initialize: ->
    @zonks = @model

  render: ->
    @$el.html @template(@model.toJSON())
    @
