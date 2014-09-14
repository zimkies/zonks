class App.Views.ZonkAward extends Backbone.View

  className: 'award row'

  template: JST['templates/zonk_award']

  initialize: ->
    @award = @model
    @zonks = App.zonks

  render: ->
    @$el.html @template(@model.toParams())
    @
