class App.Collections.Zonks extends Backbone.Collection

  model: App.Models.Zonk

  localFetch: ->
    @add @constructor.locallyStoredZonks

  @locallyStoredZonks: [
      {
        name: 'Ninja Turtle'
        image: '/images/ninja_turtles.png'
        description: "Better Together"
      },
      {
        name: "Cap'n Crunch"
        image: '/images/captain_crunch.png'
        description: "Make it actually happen"
      },
      {
        name: "Sorcerer's Apprentice"
        image: '/images/mickey_mouse.png'
        description: "10x"
      },
      {
        name: 'J.Lo'
        image: '/images/jlo.png'
        description: "Be Real"
      },
      {
        name: 'Neil Armstrong'
        image: '/images/neil_armstrong.png'
        description: "Put a dent in the universe"
      },
      {
        name: 'Sherlock Holmes'
        image: '/images/sherlock_holmes.png'
        description: "Ask why"
      },
      {
        name: 'Dieter Rams Stick Figure'
        image: '/images/stick_figure.png'
        description: "Less, but better"
      },
      {
        name: 'Jimmy Fallon'
        image: '/images/jimmy_fallon.png'
        description: "Fun is contagious"
      },
      {
        name: 'Wile E. Coyote'
        image: '/images/coyote.png'
        description: "Everything is a prototype"
      },
      {
        name: 'Katniss Everdeen'
        image: '/images/katniss.png'
        description: "Act with courage"
      },
    ]
