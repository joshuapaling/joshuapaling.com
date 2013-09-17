class JoshuaPaling.Views.OxGamesIndex extends Backbone.View

  template: JST['ox_games/index']

  events:
    'click .square': 'handleMove'

  render: ->
    $(@el).html(@template)
    this

  handleMove: (event) ->
    @model.handleMove(event)