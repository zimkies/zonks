class App.Views.ZonkAward extends Backbone.View

  className: 'award row'

  template: JST['templates/zonk_award']

  events:
    'click .destroy': "onClickDestroy"

  initialize: (options) ->
    @editable = if options.editable? then options.editable else false
    @award = @model
    @zonks = App.zonks

  render: ->
    @$el.html @template(@toParams())
    @

  toParams: ->
    $.extend(@model.toParams(),
      editable: @editable
    )

  onClickDestroy: (e) =>
    e.preventDefault?()
    if confirm "You sure you want to delete this zonk award?"
      @award.destroy()
