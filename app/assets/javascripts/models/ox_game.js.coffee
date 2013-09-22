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
    winner: ''

  initialize: ->
    @set(whos_turn: @naught)

  handleMove: (event) ->
    if @get('winner')
      return # can't go after the game has been won

    if $(event.target).html()
      return # can't go in the same place twice

    row = $(event.target).data('row')
    col = $(event.target).data('col')
    clickedField = 'row' + row + '_col' + col
    x_or_o = @get('whos_turn')
    @set(clickedField, x_or_o)

    if @get('whos_turn') == @cross
      @set(whos_turn: @naught)
    else
      @set(whos_turn: @cross)

    @checkForWinner()

  checkForWinner: ->
    winner = @checkRowsForWinner()
    if not winner
      winner = @checkColsForWinner()
    if not winner
      winner = @checkDiagonalsForWinner()
    if winner
      @set('winner', winner)

  checkRowsForWinner: ->
    for row in [1..3] by 1
      col1 = @get('row' + row + '_col1')
      col2 = @get('row' + row + '_col2')
      col3 = @get('row' + row + '_col3')
      if col1 != '' && col1 == col2 && col1 == col3
        return col1

  checkColsForWinner: ->
    for col in [1..3] by 1
      row1 = @get('row1_col' + col)
      row2 = @get('row2_col' + col)
      row3 = @get('row3_col' + col)
      if row1 isnt '' && row1 is row2 && row1 is row3
        return row1

  checkDiagonalsForWinner: ->
    center = @get('row2_col2')
    if center != ''
      if center is @get('row1_col1') and center is @get('row3_col3')
        return center
      if center is @get('row1_col3') and center is @get('row3_col1')
        return center

  newGame: (event) ->
    @clear()
    @set(@defaults)
    @initialize()
