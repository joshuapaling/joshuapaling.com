class JoshuaPaling.Views.OxGamesIndex extends Backbone.View

  template: JST['ox_games/index']

  initialize: ->
      @model.on('change', @render, this)

  events:
    'click .square': 'handleMove'
    'click .new-game': 'newGame'

  render: ->
    $(@el).html(@template({game: @model}))
    this

  handleMove: (event) ->
    @model.handleMove(event)

  newGame: (event) ->
    @model.newGame(event)