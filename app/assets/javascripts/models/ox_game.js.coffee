class JoshuaPaling.Models.OxGame extends Backbone.Model
  cross: 'X'
  naught: 'O'

  defaults:
    whos_turn: ''
    row1_col1: ''
    row1_col2: ''
    row1_col3: ''
    row2_col1: ''
    row2_col2: ''
    row2_col3: ''
    row3_col1: ''
    row3_col2: ''
    row3_col3: ''

  initialize: ->
    @set(whos_turn: @naught)

  handleMove: (event) ->
    if $(event.target).html()
      alert "you can't go there"
      return

    row = $(event.target).data('row')
    col = $(event.target).data('col')
    clickedField = 'row' + row + '_col' + col
    x_or_o = @get('whos_turn')
    @set(clickedField, x_or_o)

    if @get('whos_turn') == @cross
      @set(whos_turn: @naught)
    else
      @set(whos_turn: @cross)

  newGame: (event) ->
    @clear()
    @set(@defaults)
    @initialize()
