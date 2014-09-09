class App.Models.ZonkAward extends Backbone.Model

  # DUMMY save for nowj
  save: (attributes) ->
    @set(attributes)
    @trigger 'sync', @

