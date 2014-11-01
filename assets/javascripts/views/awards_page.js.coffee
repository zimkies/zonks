class App.Views.AwardsPage extends Backbone.View

  template: JST['templates/awards_page']

  initialize: ->
    @zonkAwards = new App.Collections.ZonkAwards
    @zonkAwards.fetch(success: @onZonksFetched)
    @listenTo @zonkAwards, 'sync', @onZonksFetched

  render: ->
    @$el.html @template()

    @zonksView = new App.Views.Awards.Zonks(
      el: @$("#zonks"),
      collection: App.zonks
    )
    @zonkAwardsView =  new App.Views.ZonkAwards(
      el: @$("#zonk_awards")
      collection: @zonkAwards
      editable: false
    )

    @zonksView.render()
    @zonkAwardsView.render()

  onZonksFetched: (collection) =>
    @render()
