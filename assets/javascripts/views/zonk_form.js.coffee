class App.Views.ZonkForm extends Backbone.View

  className: 'zonk-form'

  template: JST['templates/zonk_form']

  events:
    'submit form': 'onSubmit'

  initialize: ->
    @model = @zonkAward = new App.Models.ZonkAward
    @zonks = @collection

  toJSON: ->
    _.extend(@model.toJSON(), zonks: @collection.toJSON())

  render: ->
    @$el.html @template(@toJSON())
    @

  serializeData: ->
    name: @$("input[name='name']").val()
    zonk: @$("select[name='zonk']").val()
    deed: @$("textarea[name='deed']").val()

  onSubmit: (e) =>
    e.preventDefault?()
    @zonkAward.save(@serializeData())
