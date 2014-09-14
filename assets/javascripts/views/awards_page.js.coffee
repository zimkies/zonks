class App.Views.AwardsPage extends Backbone.View

  template: JST['templates/awards_page']

  initialize: ->
    @zonkAwards = new App.Collections.ZonkAwards
    @zonkAwards.fetch(success: @onZonksFetched)
    @listenTo @zonkAwards, 'sync', @onZonksFetched

  render: ->
    @$el.html @template()

    @zonkFormView = new App.Views.ZonkForm(
      el: @$("#zonk_award_form"),
      collection: App.zonks
    )
    @zonkAwardsView =  new App.Views.ZonkAwards(
      el: @$("#zonk_awards")
      collection: @zonkAwards
    )

    @zonkFormView.render()
    @zonkAwardsView.render()

    @listenTo @zonkFormView.model, 'sync', @onZonkSaved

  onZonkSaved: (model) =>
    @zonkAwards.add model
    @render()

  onZonksFetched: (collection) =>
    @render()
