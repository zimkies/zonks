class App.Models.ZonkAward extends Backbone.Model

  urlRoot: '/api/v1/awards/'

  validate: (attrs, options) ->
    if !attrs.name
      return "You have to specify at least one person to zonk"
    if !attrs.deed
      return "You need to tell us why you are zonking them!"

  toParams: ->
    _.extend({}, @attributes, {zonk: @zonk().toJSON()} )

  zonk: ->
    @zonks = App.zonks.findWhere(name: @get('zonk'))
