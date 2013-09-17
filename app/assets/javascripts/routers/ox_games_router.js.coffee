class JoshuaPaling.Routers.OxGames extends Backbone.Router
  routes:
    '': 'index'
    'new': 'new'

  initialize: ->
    @model = new JoshuaPaling.Models.OxGame

  index: ->
    view = new JoshuaPaling.Views.OxGamesIndex({model: @model})
    $('#backbone-container').html(view.render().el)

  new: ->
    alert "new o and x game"
