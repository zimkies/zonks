class App.Views.ZonkAward extends Backbone.View

  className: 'award'

  template: JST['templates/zonk_award']

  initialize: ->
    @award = @model

  render: ->
    @$el.html @template(@model.toJSON())
    @
