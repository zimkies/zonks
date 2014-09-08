class App.Views.Zonk extends Backbone.View

  className: 'zonk col-sm-3 col-xs-6'

  template: JST['templates/zonk']

  initialize: ->
    @zonks = @model

  render: ->
    @$el.html @template(@model.toJSON())
    @
