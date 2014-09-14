class App.Views.Page extends Backbone.View

  template: JST['templates/page']

  render: ->
    @$el.html @template()
    @zonksView = new App.Views.Zonks(el: @$("#zonks"))
    @zonksView.render()
