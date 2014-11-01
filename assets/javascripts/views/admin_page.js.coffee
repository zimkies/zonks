class App.Views.AdminPage extends Backbone.View

  template: JST['templates/admin_page']

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
      editable: true
    )

    @zonkFormView.render()
    @zonkAwardsView.render()

    @listenTo @zonkFormView.model, 'sync', @onZonkSaved

  onZonkSaved: (model) =>
    @zonkAwards.add model, at: 0
    @render()

  onZonksFetched: (collection) =>
    @render()
