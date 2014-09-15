class App.Views.ZonkAward extends Backbone.View

  className: 'award row'

  template: JST['templates/zonk_award']

  events:
    'click .destroy': "onClickDestroy"

  initialize: ->
    @award = @model
    @zonks = App.zonks

  render: ->
    @$el.html @template(@model.toParams())
    @

  onClickDestroy: (e) =>
    e.preventDefault?()
    if confirm "You sure you want to delete this zonk award?"
      @award.destroy()
