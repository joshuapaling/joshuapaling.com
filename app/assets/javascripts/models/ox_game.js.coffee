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
    game_over: false

  initialize: ->
    @set(whos_turn: @naught)

  handleMove: (event) ->
    if @get('game_over')
      return

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

    @checkGameOver()

  checkGameOver: ->
    @checkForWinner()
    if @get('winner')
      @set('game_over', true)
    else
      @checkAllSquaresFull()

  checkAllSquaresFull: ->
    for row in [1..3] by 1
      for col in [1..3] by 1
        rowX_colY = 'row' + row + '_col' + col
        if not @get(rowX_colY)
          return
    @set('game_over', true)

  checkForWinner: ->
    @checkRowsForWinner()
    @checkColsForWinner()
    @checkDiagonalsForWinner()

  checkRowsForWinner: ->
    for row in [1..3] by 1
      col1 = @get('row' + row + '_col1')
      col2 = @get('row' + row + '_col2')
      col3 = @get('row' + row + '_col3')
      if col1 != '' && col1 == col2 && col1 == col3
        return @set('winner', col1)

  checkColsForWinner: ->
    for col in [1..3] by 1
      row1 = @get('row1_col' + col)
      row2 = @get('row2_col' + col)
      row3 = @get('row3_col' + col)
      if row1 isnt '' && row1 is row2 && row1 is row3
        return @set('winner', row1)

  checkDiagonalsForWinner: ->
    center = @get('row2_col2')
    if center != ''
      if center is @get('row1_col1') and center is @get('row3_col3')
        return @set('winner', center)
      if center is @get('row1_col3') and center is @get('row3_col1')
        return @set('winner', center)

  newGame: (event) ->
    @clear()
    @set(@defaults)
    @initialize()
