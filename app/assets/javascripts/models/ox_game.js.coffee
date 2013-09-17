class JoshuaPaling.Models.OxGame extends Backbone.Model

  initialize: ->
    @cross = 'X'
    @naught = 'O'
    @lastMoveBy = @naught;

  handleMove: (event) ->
    if $(event.target).html()
      alert "you can't go there"
      return

    if @lastMoveBy == @naught
      player = @cross
    else
      player = @naught

    $(event.target).html(player)
    @lastMoveBy = player
