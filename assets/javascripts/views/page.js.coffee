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
        name: 'Ninja Turtle'
        image: 'assets/ninja_turtles.png'
        description: "Better Together"
      },
      {
        name: "Cap'n Crunch"
        image: 'assets/captain_crunch.png'
        description: "Make it actually happen"
      },
      {
        name: "Sorcerer's Apprentice"
        image: 'assets/mickey_mouse.png'
        description: "10x"
      },
      {
        name: 'J.Lo'
        image: 'assets/jlo.png'
        description: "Be Real"
      },
      {
        name: 'Neil Armstrong'
        image: 'assets/neil_armstrong.png'
        description: "Put a dent in the universe"
      },
      {
        name: 'Sherlock Holmes'
        image: 'assets/sherlock_holmes.png'
        description: "Ask why"
      },
      {
        name: 'Dieter Rams Stick Figure'
        image: 'assets/stick_figure.png'
        description: "Less, but better"
      },
      {
        name: 'Jimmy Fallon'
        image: 'assets/jimmy_fallon.png'
        description: "Fun is contagious"
      },
      {
        name: 'Wile E. Coyote'
        image: 'assets/coyote.png'
        description: "Everything is a prototype"
      },
      {
        name: 'Katniss Everdeen'
        image: 'assets/katniss.png'
        description: "Act with courage"
      },
    ]
