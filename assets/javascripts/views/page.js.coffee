class App.Views.Page extends Backbone.View

  template: JST['templates/page']

  initialize: ->
    @collection = @zonks = new App.Collections.Zonks(@locallyStoredZonks)

  render: ->
    @$el.html @template({b: 4})
    @zonks.map (zonk) ->
      @$('#zonks').append new App.Views.Zonk(model: zonk).render().$el

  locallyStoredZonks: [
      {
        name: 'superhuman'
        image: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTcEZAxkT6ze2NwfrzEsVyynPKIPnjzAp0no_qTulZdT9VwQ-7Tt6fpcQ'
        description: "This is the superhuman zonk"
      }
    ]
