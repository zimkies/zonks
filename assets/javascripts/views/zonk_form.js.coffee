class App.Views.ZonkForm extends Backbone.View

  className: 'zonk-form'

  template: JST['templates/zonk_form']

  initialize: ->
    @model = @zonkAward = new App.Models.ZonkAward
    @zonks = @collection

  toJSON: ->
    _.extend(@model.toJSON(), zonks: @collection.toJSON())

  render: ->
    @$el.html @template(@toJSON())
    @

  serializeData: ->
    name: @$("input.name").val()
    zonk: @$("input.zonk").val()
    description: @$("input.description").val()

  submit: ->
    @zonkAward.save(@serializeData())
