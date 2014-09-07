class App.Views.Page extends Backbone.View

  template: JST['templates/page']

  render: ->
    @$el.html @template({b: 4})
