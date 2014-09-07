class App.Views.Page extends Backbone.View

  template: JST['templates/page']

  initialize: -> alert 'in app view'

  render: ->
    @$el.html _.template(@template, {})
