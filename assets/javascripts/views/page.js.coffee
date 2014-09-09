class App.Views.Page extends Backbone.View

  template: JST['templates/page']

  initialize: ->
    @zonkAwards = new App.Collections.ZonkAwards([{name: "dummy", zonk: 'Zonk', deed: "ljlkjlkj"}])

  render: ->
    @$el.html @template()

    @zonksView = new App.Views.Zonks(el: @$("#zonks"))
    @zonkFormView = new App.Views.ZonkForm(
      el: @$("#zonk_award_form"),
      collection: @zonksView.collection
    )
    @zonkAwardsView =  new App.Views.ZonkAwards(
      el: @$("#zonk_awards")
      collection: @zonkAwards
    )

    @zonksView.render()
    @zonkFormView.render()
    @zonkAwardsView.render()

    @listenTo @zonkFormView.model, 'sync', @onZonkSaved

  onZonkSaved: (model) =>
    @zonkAwards.add model
    @render()
