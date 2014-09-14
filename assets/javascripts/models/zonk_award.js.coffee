class App.Models.ZonkAward extends Backbone.Model

  urlRoot: '/api/v1/awards/'

  toParams: ->
    _.extend({}, @attributes, {zonk: @zonk().toJSON()} )

  zonk: ->
    @zonks = App.zonks.findWhere(name: @get('zonk'))
